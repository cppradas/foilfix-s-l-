table 50105 "Stock Synchronization_LDR"
{
    Access = Public;
    Caption = 'Stock synchronization', comment = 'ESP="Sincronización de existencias"';
    DataClassification = CustomerContent;
    DrillDownPageId = "Stock Synchronization_LDR";
    LookupPageId = "Stock Synchronization_LDR";

    fields
    {
        field(1; Reference_LDR; Code[20])
        {
            Caption = 'Reference', comment = 'ESP="Referencia"';
            NotBlank = true;
            TableRelation = Item."No.";
        }
        field(2; Location_LDR; Code[20])
        {
            Caption = 'Location', comment = 'ESP="Almacén"';
            TableRelation = Location.Code;
        }
        field(3; "Lot No_LDR"; Code[20])
        {
            Caption = 'Lot No.', comment = 'ESP="Lote"';
        }
        field(4; "Inventory_LDR"; Decimal)
        {
            Caption = 'Inventory', comment = 'ESP="Inventario"';
        }
        field(5; "Conversion factor_LDR"; Decimal)
        {
            Caption = 'Conversion factor', comment = 'ESP="Factor de conversión"';
        }
        field(6; "Description_LDR"; Text[100])
        {
            Caption = 'Description', comment = 'ESP="Descripción"';
        }
        field(7; "Quantity Base_LDR"; Decimal)
        {
            Caption = 'Quantity Base', comment = 'ESP="Cantidad base"';
        }
        field(8; Stock_LDR; Decimal)
        {
            Caption = 'Stock', comment = 'ESP="Existencias"';
        }
        field(9; "Entry Type_LDR"; Enum "Entry Type SGA_LDR")
        {
            Caption = 'Entry Type', comment = 'ESP="Tipo de ajuste"';
        }
        field(10; "Quantity to adjust_LDR"; Decimal)
        {
            Caption = 'Quantity to adjust', comment = 'ESP="Cantidad a ajustar"';
        }
        field(11; Error_LDR; Boolean)
        {
            Caption = 'Error', comment = 'ESP="Error"';
        }
        field(12; Observations_LDR; Text[100])
        {
            Caption = 'Observations', comment = 'ESP="Observaciones"';
        }
        field(13; Adjust_LDR; Boolean)
        {
            Caption = 'Adjust', comment = 'ESP="Ajustar"';
        }
    }

    keys
    {
        key(Key1; Reference_LDR, Location_LDR, "Lot No_LDR")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Reference_LDR, Location_LDR, "Lot No_LDR") { }
        fieldgroup(Brick; Reference_LDR, Location_LDR, "Lot No_LDR") { }
    }
    procedure CreateItemJournalLine()
    var
        InventorySetup: Record "Inventory Setup";
        ItemJournalBatch: Record "Item Journal Batch";
        PostBatch: Codeunit "Item Jnl.-Post Batch";
        ItemJnlManagement: Codeunit ItemJnlManagement;
    begin
        if InventorySetup.Get() then;

        StockSynchronization.Reset();
        StockSynchronization.SetRange(Error_LDR, false);
        StockSynchronization.SetRange(Adjust_LDR, true);
        StockSynchronization.SetFilter("Entry Type_LDR", '<>%1', StockSynchronization."Entry Type_LDR"::" ");
        if StockSynchronization.FindSet() then
            repeat
                ItemJournalLine.Init();
                ItemJournalLine.Validate("Journal Template Name", InventorySetup."Journal Template Name SGA_LDR");
                ItemJournalLine.Validate("Journal Batch Name", InventorySetup."Journal Batch Name SGA_LDR");
                ItemJournalLine.Validate("Document No.", InventorySetup."Document No. SGA_LDR");
                ItemJournalLine.Validate("Posting Date", WorkDate());
                if StockSynchronization."Entry Type_LDR" = StockSynchronization."Entry Type_LDR"::"Positive Adjmt." then
                    ItemJournalLine.Validate("Entry Type", ItemJournalLine."Entry Type"::"Positive Adjmt.")
                else
                    ItemJournalLine.Validate("Entry Type", ItemJournalLine."Entry Type"::"Negative Adjmt.");
                ItemJournalLine.Validate("Item No.", StockSynchronization.Reference_LDR);
                ItemJournalLine.Validate(Description, StockSynchronization.Description_LDR);
                ItemJournalLine.Validate("Location Code", StockSynchronization.Location_LDR);
                ItemJournalLine.Validate(Quantity, StockSynchronization."Quantity to adjust_LDR");
                ItemJournalLine.Insert(true);
                CreateItemTrackingLines();
            until StockSynchronization.Next() = 0;

        if InventorySetup."Post SGA Adjmt._LDR" = true then begin
            ItemJournalLine.Reset();
            ItemJournalLine.SetRange("Journal Template Name", InventorySetup."Journal Template Name SGA_LDR");
            ItemJournalLine.SetRange("Journal Batch Name", InventorySetup."Journal Batch Name SGA_LDR");
            if ItemJournalLine.FindSet() then
                PostBatch.Run(ItemJournalLine);
        end else
            if Confirm(OpenJournalLbl) then begin
                ItemJournalBatch.Reset();
                ItemJournalBatch.SetRange("Journal Template Name", InventorySetup."Journal Template Name SGA_LDR");
                ItemJournalBatch.SetRange(Name, InventorySetup."Journal Batch Name SGA_LDR");
                if ItemJournalBatch.FindFirst() then
                    ItemJnlManagement.TemplateSelectionFromBatch(ItemJournalBatch);
            end;
    end;

    local procedure CreateItemTrackingLines()
    var
        //Item: Record Item;
        CreateReservEntry: Codeunit "Create Reserv. Entry";
    begin
        ReservationEntry."Lot No." := StockSynchronization."Lot No_LDR";
        ReservationEntry.Quantity := ItemJournalLine.Quantity;

        CreateReservEntry.CreateReservEntryFor(
        DATABASE::"Item Journal Line",
        ItemJournalLine."Entry Type".AsInteger(),
        ItemJournalLine."Journal Template Name",
        ItemJournalLine."Journal Batch Name",
        ItemJournalLine."Order Line No.",
        ItemJournalLine."Line No.",
        ItemJournalLine."Qty. per Unit of Measure",
        Abs(ItemJournalLine.Quantity),
        Abs(ItemJournalLine."Quantity (Base)"),
        ReservationEntry);

        CreateReservEntry.SetNewTrackingFromItemJnlLine(ItemJournalLine);

        CreateReservEntry.CreateEntry(
        ItemJournalLine."Item No.",
        ItemJournalLine."Variant Code",
        ItemJournalLine."Location Code",
        ItemJournalLine.Description,
        0D,
        0D,
        0,
        ReservationEntry."Reservation Status"::Surplus);
    end;

    var
        ItemJournalLine: Record "Item Journal Line";
        ReservationEntry: Record "Reservation Entry";
        StockSynchronization: Record "Stock Synchronization_LDR";
        OpenJournalLbl: Label 'Adjustments journal generated, must be recorded manually. Do you want to open the journal page?', comment = 'ESP="Diario de ajustes generado, deberá ser registrado manualmente. ¿Desea abrir la página del diario?"';
}