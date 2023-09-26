page 50108 "Stock Synchronization_LDR"
{
    ApplicationArea = All;
    Caption = 'Stock Synchronization', comment = 'ESP="Sincronización de existencias con SGA"';
    PageType = List;
    SourceTable = "Stock Synchronization_LDR";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Reference_LDR; Rec.Reference_LDR)
                {

                }
                field(Location_LDR; Rec.Location_LDR)
                {

                }
                field("Lot No_LDR"; Rec."Lot No_LDR")
                {

                }
                field(Inventory_LDR; Rec.Inventory_LDR)
                {

                }
                field("Conversion factor_LDR"; Rec."Conversion factor_LDR")
                {

                }
                field(Description_LDR; Rec.Description_LDR)
                {

                }
                field("Quantity Base_LDR"; Rec."Quantity Base_LDR")
                {

                }
                field(Stock_LDR; Rec.Stock_LDR)
                {

                }
                field("Entry Type_LDR"; Rec."Entry Type_LDR")
                {

                }
                field("Quantity to adjust_LDR"; Rec."Quantity to adjust_LDR")
                {

                }
                field(Error_LDR; Rec.Error_LDR)
                {

                }
                field(Observations_LDR; Rec.Observations_LDR)
                {

                }
                field(Adjust_LDR; Rec.Adjust_LDR)
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Register settings_LDR")
            {
                ApplicationArea = All;
                Caption = 'Register settings', comment = 'ESP="Registrar ajustes"';
                Image = Post;
                trigger OnAction()
                var
                    InventorySetup: Record "Inventory Setup";
                    ItemJournalLine: Record "Item Journal Line";
                    WarningJournalMsg: Label 'The settings journal contains data, the current data will be deleted before the new data is loaded. Do you want to continue?'
                    , comment = 'ESP="El diario de ajustes contiene datos, se borrarán los actuales antes de cargar los nuevos ¿Desea continuar?"';
                begin
                    if InventorySetup.Get() then;
                    ItemJournalLine.Reset();
                    ItemJournalLine.SetRange("Journal Template Name", InventorySetup."Journal Template Name SGA_LDR");
                    ItemJournalLine.SetRange("Journal Batch Name", InventorySetup."Journal Batch Name SGA_LDR");
                    if not ItemJournalLine.IsEmpty then begin
                        if Confirm(WarningJournalMsg) then begin
                            ItemJournalLine.DeleteAll();
                            Rec.CreateItemJournalLine();
                        end;
                    end else
                        Rec.CreateItemJournalLine();
                end;
            }
        }
    }
}