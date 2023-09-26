codeunit 50102 "Excel Functions_LDR"
{
    Access = Public;
    trigger OnRun()
    begin

    end;

    procedure ExportSalesOrderSGA_LDR(var SalesHeader: Record "Sales Header")
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        SalesLine: Record "Sales Line";
        SalesLine2: Record "Sales Line";
        QuantityDec: Decimal;
        CelloFixLbl: Label 'CELLOFIX', comment = 'ESP="CELLOFIX"';
        CustomerLbl: Label 'Customer', comment = 'ESP="Cliente"';
        DateLbl: Label 'Date', comment = 'ESP="Fecha"';
        DocumentNoLbl: Label 'No.', comment = 'ESP="Pedido"';
        ErrorLbl: Label 'No lines pending to be sent to SGA have been found in the order', comment = 'ESP="No se han encontrado líneas pendientes de enviar a SGA en el pedido"';
        //ExcelFileNameLbl: Label 'SalesOrder_%1', Comment = 'PedidoDeVenta_%1';
        HULbl: Label 'HU', comment = 'ESP="HU"';
        LineLbl: Label 'Line', comment = 'ESP="Línea"';
        LotLbl: Label 'Lot', comment = 'ESP="Lote"';
        ObservationsLbl: Label 'Observations', comment = 'ESP="Observaciones"';
        OwnerLbl: Label 'Owner', comment = 'ESP="Propietario"';
        QuantityLbl: Label 'Quantity', comment = 'ESP="Cantidad"';
        ReferenceLbl: Label 'Reference', comment = 'ESP="Referencia"';
        RefxpaletLbl: Label 'Refxpalet', comment = 'ESP="Refxpalet"';
        SalesOrderLbl: Label 'Sales Order', comment = 'ESP="Pedido de venta"';
        ShippingAgentLbl: Label 'Shipping agent', comment = 'ESP="Transportista"';
    begin
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        //Añadimos textos cabecera
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(DocumentNoLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(OwnerLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustomerLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(DateLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(ShippingAgentLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(LineLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(ReferenceLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(QuantityLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(LotLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(HULbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(RefxpaletLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(ObservationsLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

        //Obtenemos las lineas 
        SalesLine.Reset();
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetRange("Send to SGA_LDR", false);
        SalesLine.SetFilter("Qty. to Ship", '<>%1', 0);
        if SalesLine.FindSet() then
            repeat
                QuantityDec := 0;
                //Añadimos las lienas al excel
                TempExcelBuffer.NewRow();
                TempExcelBuffer.AddColumn(SalesHeader."No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(CelloFixLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(SalesHeader."Bill-to Customer No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(SalesLine."Planned Delivery Date", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(SalesLine."Shipping Agent Code", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(SalesLine."Line No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(SalesLine."No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                //Obtenemos la cantidad pendiente en unidades base
                QuantityDec := SalesLine."Qty. to Ship" * SalesLine."Qty. per Unit of Measure";
                TempExcelBuffer.AddColumn(QuantityDec, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn('', false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn('', false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(SalesLine."Reference per pallet_LDR", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(SalesLine."Observations Expedition_LDR", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

                if SalesLine2.Get(SalesLine."Document Type", SalesLine."Document No.", SalesLine."Line No.") then begin
                    SalesLine2."Send to SGA_LDR" := true;
                    SalesLine2."Shipment Date_LDR" := WorkDate();
                    SalesLine2."Shipment time_LDR" := Time();
                    SalesLine2.Modify();
                end;


            until SalesLine.Next() = 0
        else
            Error(ErrorLbl);
        //Creamos y guardamos el excel
        TempExcelBuffer.CreateNewBook(SalesOrderLbl);
        TempExcelBuffer.WriteSheet(SalesOrderLbl, CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(StrSubstNo('Pedido de venta ', SalesHeader."No."));
        TempExcelBuffer.OpenExcel();
    end;

    procedure ExportSalesOrdersSGA_LDR()
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        SalesLine2: Record "Sales Line";
        QuantityDec: Decimal;
        CelloFixLbl: Label 'CELLOFIX', comment = 'ESP="CELLOFIX"';
        CustomerLbl: Label 'Customer', comment = 'ESP="Cliente"';
        DateLbl: Label 'Date', comment = 'ESP="Fecha"';
        DocumentNoLbl: Label 'No.', comment = 'ESP="Pedido"';
        ErrorLbl: Label 'No lines pending to be sent to SGA have been found in the order', comment = 'ESP="No se han encontrado líneas pendientes de enviar a SGA en el pedido"';
        //ExcelFileNameLbl: Label 'Sales exportation SGA', Comment = 'Exportación ventas SGA';
        HULbl: Label 'HU', comment = 'ESP="HU"';
        LineLbl: Label 'Line', comment = 'ESP="Línea"';
        LotLbl: Label 'Lot', comment = 'ESP="Lote"';
        ObservationsLbl: Label 'Observations', comment = 'ESP="Observaciones"';
        OwnerLbl: Label 'Owner', comment = 'ESP="Propietario"';
        QuantityLbl: Label 'Quantity', comment = 'ESP="Cantidad"';
        ReferenceLbl: Label 'Reference', comment = 'ESP="Referencia"';
        RefxpaletLbl: Label 'Refxpalet', comment = 'ESP="Refxpalet"';
        SalesOrderLbl: Label 'Sales Order', comment = 'ESP="Pedido de venta"';
        ShippingAgentLbl: Label 'Shipping agent', comment = 'ESP="Transportista"';
    begin
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();

        //Añadimos textos cabecera
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(DocumentNoLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(OwnerLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustomerLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(DateLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(ShippingAgentLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(LineLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(ReferenceLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(QuantityLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(LotLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(HULbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(RefxpaletLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(ObservationsLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

        //Obtenemos las lineas 
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetRange("Send to SGA_LDR", false);
        SalesLine.SetFilter("Qty. to Ship", '<>%1', 0);
        if SalesLine.FindSet() then
            repeat
                if SalesHeader.Get(SalesHeader."Document Type"::Order, SalesLine."Document No.") then
                    if SalesHeader.Status = SalesHeader.Status::Released then begin
                        QuantityDec := 0;
                        //Añadimos las lineas al excel
                        TempExcelBuffer.NewRow();
                        TempExcelBuffer.AddColumn(SalesLine."Document No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn(CelloFixLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn(SalesLine."Bill-to Customer No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn(SalesLine."Planned Delivery Date", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn(SalesLine."Shipping Agent Code", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn(SalesLine."Line No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn(SalesLine."No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        //Obtenemos la cantidad pendiente en unidades base
                        QuantityDec := SalesLine."Qty. to Ship" * SalesLine."Qty. per Unit of Measure";
                        TempExcelBuffer.AddColumn(QuantityDec, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn('', false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn('', false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn(SalesLine."Reference per pallet_LDR", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn(SalesLine."Observations Expedition_LDR", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

                        if SalesLine2.Get(SalesLine."Document Type", SalesLine."Document No.", SalesLine."Line No.") then begin
                            SalesLine2."Send to SGA_LDR" := true;
                            SalesLine2."Shipment Date_LDR" := WorkDate();
                            SalesLine2."Shipment time_LDR" := Time();
                            SalesLine2.Modify();
                        end;
                    end;
            until SalesLine.Next() = 0
        else
            Error(ErrorLbl);
        //Creamos y guardamos el excel
        TempExcelBuffer.CreateNewBook(SalesOrderLbl);
        TempExcelBuffer.WriteSheet(SalesOrderLbl, CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename('Exportación ventas SGA');
        TempExcelBuffer.OpenExcel();
    end;

    procedure ExportPurchaseOrderSGA_LDR(var PurchaseHeader: Record "Purchase Header")
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        PurchaseLine: Record "Purchase Line";
        PurchaseLine2: Record "Purchase Line";
        QuantityDec: Decimal;
        CelloFixLbl: Label 'CELLOFIX', comment = 'ESP="CELLOFIX"';
        DateLbl: Label 'Date', comment = 'ESP="Fecha"';
        DocumentNoLbl: Label 'No.', comment = 'ESP="Pedido"';
        ErrorLbl: Label 'No lines pending to be sent to SGA have been found in the order', comment = 'ESP="No se han encontrado líneas pendientes de enviar a SGA en el pedido"';
        //ExcelFileNameLbl: Label 'PurechaseOrder_%1', Comment = 'PedidoDeCompra_%1';
        LineLbl: Label 'Line', comment = 'ESP="Línea"';
        OwnerLbl: Label 'Owner', comment = 'ESP="Propietario"';
        PurchaseOrderLbl: Label 'Purchase Order', comment = 'ESP="Pedido de venta"';
        QuantityLbl: Label 'Quantity', comment = 'ESP="Cantidad"';
        ReferenceLbl: Label 'Reference', comment = 'ESP="Referencia"';
        VendorLbl: Label 'Vendor', comment = 'ESP="Proveedor"';
    begin
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        //Añadimos textos cabecera
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(DocumentNoLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(OwnerLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(VendorLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(DateLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(LineLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(ReferenceLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(QuantityLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

        //Obtenemos las lineas
        PurchaseLine.Reset();
        PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Order);
        PurchaseLine.SetRange(Type, PurchaseLine.Type::Item);
        PurchaseLine.SetRange("Send to SGA_LDR", false);
        PurchaseLine.SetFilter("Qty. to Receive", '<>%1', 0);
        if PurchaseLine.FindSet() then
            repeat
                QuantityDec := 0;
                TempExcelBuffer.NewRow();
                TempExcelBuffer.AddColumn(PurchaseHeader."No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(CelloFixLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(PurchaseHeader."Pay-to Vendor No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(PurchaseLine."Planned Receipt Date", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(PurchaseLine."Line No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(PurchaseLine."No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                //Obtenemos la cantidad pendiente en unidades base
                QuantityDec := PurchaseLine."Qty. to Receive" * PurchaseLine."Qty. per Unit of Measure";
                TempExcelBuffer.AddColumn(QuantityDec, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

                if PurchaseLine2.Get(PurchaseLine."Document Type", PurchaseLine."Document No.", PurchaseLine."Line No.") then begin
                    PurchaseLine2."Send to SGA_LDR" := true;
                    PurchaseLine2."Shipment Date_LDR" := WorkDate();
                    PurchaseLine2."Shipment time_LDR" := Time();
                    PurchaseLine2.Modify();
                end;
            until PurchaseLine.Next() = 0
        else
            Error(ErrorLbl);
        //Creamos y guardamos el excel
        TempExcelBuffer.CreateNewBook(PurchaseOrderLbl);
        TempExcelBuffer.WriteSheet(PurchaseOrderLbl, CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(StrSubstNo('Pedido de compra ', PurchaseHeader."No."));
        TempExcelBuffer.OpenExcel();
    end;

    procedure ExportPurchaseOrdersSGA_LDR()
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        PurchaseLine2: Record "Purchase Line";
        QuantityDec: Decimal;
        CelloFixLbl: Label 'CELLOFIX', comment = 'ESP="CELLOFIX"';
        DateLbl: Label 'Date', comment = 'ESP="Fecha"';
        DocumentNoLbl: Label 'No.', comment = 'ESP="Pedido"';
        ErrorLbl: Label 'No lines pending to be sent to SGA have been found in the order', comment = 'ESP="No se han encontrado líneas pendientes de enviar a SGA en el pedido"';
        //ExcelFileNameLbl: Label 'Purchase exportation SGA', comment = 'ESP="Exportación compras SGA"';
        LineLbl: Label 'Line', comment = 'ESP="Línea"';
        OwnerLbl: Label 'Owner', comment = 'ESP="Propietario"';
        PurchaseOrderLbl: Label 'Purchase Order', comment = 'ESP="Pedido de venta"';
        QuantityLbl: Label 'Quantity', comment = 'ESP="Cantidad"';
        ReferenceLbl: Label 'Reference', comment = 'ESP="Referencia"';
        VendorLbl: Label 'Vendor', comment = 'ESP="Proveedor"';
    begin
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        //Añadimos textos cabecera
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(DocumentNoLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(OwnerLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(VendorLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(DateLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(LineLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(ReferenceLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(QuantityLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

        //Obtenemos las lineas
        PurchaseLine.Reset();
        PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Order);
        PurchaseLine.SetRange(Type, PurchaseLine.Type::Item);
        PurchaseLine.SetRange("Send to SGA_LDR", false);
        PurchaseLine.SetFilter("Qty. to Receive", '<>%1', 0);
        if PurchaseLine.FindSet() then
            repeat
                if PurchaseHeader.Get(PurchaseHeader."Document Type"::Order, PurchaseLine."Document No.") then
                    if PurchaseHeader.Status = PurchaseHeader.Status::Released then begin
                        QuantityDec := 0;
                        TempExcelBuffer.NewRow();
                        TempExcelBuffer.AddColumn(PurchaseLine."Document No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn(CelloFixLbl, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn(PurchaseLine."Pay-to Vendor No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn(PurchaseLine."Planned Receipt Date", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn(PurchaseLine."Line No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn(PurchaseLine."No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        //Obtenemos la cantidad pendiente en unidades base
                        QuantityDec := PurchaseLine."Qty. to Receive" * PurchaseLine."Qty. per Unit of Measure";
                        TempExcelBuffer.AddColumn(QuantityDec, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

                        if PurchaseLine2.Get(PurchaseLine."Document Type", PurchaseLine."Document No.", PurchaseLine."Line No.") then begin
                            PurchaseLine2."Send to SGA_LDR" := true;
                            PurchaseLine2."Shipment Date_LDR" := WorkDate();
                            PurchaseLine2."Shipment time_LDR" := Time();
                            PurchaseLine2.Modify();
                        end;
                    end;
            until PurchaseLine.Next() = 0
        else
            Error(ErrorLbl);
        //Creamos y guardamos el excel
        TempExcelBuffer.CreateNewBook(PurchaseOrderLbl);
        TempExcelBuffer.WriteSheet(PurchaseOrderLbl, CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename('Exportación compras SGA');
        TempExcelBuffer.OpenExcel();
    end;

    procedure "Load SGA Settings"()
    var
        ExcelBuffer: Record "Excel Buffer";
        StockSynchronizationTable: Record "Stock Synchronization_LDR";
        ReadInstream: InStream;
        CurrentRow: Integer;
        LastRow: Integer;
        ImportExcelLbl: Label 'Import Excel', comment = 'ESP="Importar Excel"';
        ImportRecordsLbl: Label '%1 new records have been created', comment = 'ESP="Se han importado %1 registros"';
        FileName: Text;
        SheetName: Text;
    begin
        Clear(ExcelBuffer);
        Clear(RecordsCreated);
        StockSynchronizationTable.DeleteAll();

        if UploadIntoStream(ImportExcelLbl, '', '', FileName, ReadInstream) then
            if FileName <> '' then begin
                SheetName := ExcelBuffer.SelectSheetsNameStream(ReadInstream);
                if SheetName <> '' then begin
                    ExcelBuffer.LockTable();
                    ExcelBuffer.OpenBookStream(ReadInstream, SheetName);
                    ExcelBuffer.ReadSheet();
                    //GetLastRowNo(LastRow, TempExcelBuffer);
                    Clear(LastRow);
                    if ExcelBuffer.FindLast() then
                        LastRow := ExcelBuffer."Row No.";
                    for CurrentRow := 2 to LastRow do
                        InsertStockSync(CurrentRow);
                    Message(ImportRecordsLbl, RecordsCreated);
                    StockSynchronizationTable.Reset();
                    Page.Run(Page::"Stock Synchronization_LDR", StockSynchronizationTable);
                end;
            end;
    end;

    /*local procedure GetLastRowNo(LastRow: Integer; TempExcelBuffer: Record "Excel Buffer" temporary)
    begin
        Clear(LastRow);
        if TempExcelBuffer.FindLast() then
            LastRow := TempExcelBuffer."Row No.";
    end;*/

    procedure InsertStockSync(CurrentRow: Integer)
    var
        Item: Record Item;
        ItemLedgerEntry: Record "Item Ledger Entry";
        Location: Record Location;
        StockSync: Record "Stock Synchronization_LDR";
        itemcode: Code[20];
        BaseQtyErr: Label 'The calculated base quantity is negative', comment = 'ESP="La cantidad base calculada es negativa"';
        InventoryErr: Label 'The product is not inventory type', comment = 'ESP="El producto no es de tipo inventario"';
        LocationErr: Label 'The warehouse does not exist in Business central', comment = 'ESP="El almacén no existe en Business central"';
        LotErr: Label 'The product does not have Lot tracking', comment = 'ESP="El producto no tiene seguimiento por lote"';
        ReferenceErr: Label 'The reference does not exist in Business central', comment = 'ESP="La referencia no existe en Business central"';
    begin
        StockSync.Init();

        StockSync.Adjust_LDR := true;

        itemcode := GetValueFromCell(CurrentRow, 1);

        if Item.Get(itemcode) then
            StockSync.Validate(Reference_LDR, GetValueFromCell(CurrentRow, 1))
        else begin
            StockSync.Error_LDR := true;
            StockSync.Observations_LDR := ReferenceErr;
        end;

        if Item."Item Tracking Code" = '' then begin
            StockSync.Error_LDR := true;
            StockSync.Observations_LDR := LotErr;
        end;

        if Item.Type <> Item.Type::Inventory then begin
            StockSync.Error_LDR := true;
            StockSync.Observations_LDR := InventoryErr;
        end;

        if Location.Get(GetValueFromCell(CurrentRow, 2)) then
            StockSync.Validate(Location_LDR, GetValueFromCell(CurrentRow, 2))
        else begin
            StockSync.Error_LDR := true;
            StockSync.Observations_LDR := LocationErr;
        end;

        StockSync.Validate("Lot No_LDR", GetValueFromCell(CurrentRow, 3));
        Evaluate(StockSync.Inventory_LDR, GetValueFromCell(CurrentRow, 4));
        if GetValueFromCell(CurrentRow, 5) = '' then
            StockSync.Validate("Conversion factor_LDR", 1)
        else
            Evaluate(StockSync."Conversion factor_LDR", GetValueFromCell(CurrentRow, 5));
        if StockSync."Conversion factor_LDR" = 0 then
            StockSync."Conversion factor_LDR" := 1;
        StockSync.Validate(Description_LDR, Item.Description);
        StockSync."Quantity Base_LDR" := StockSync."Conversion factor_LDR" * StockSync.Inventory_LDR;
        if StockSync."Quantity Base_LDR" < 0 then begin
            StockSync.Error_LDR := true;
            StockSync.Observations_LDR := BaseQtyErr;
        end;

        //Existencias
        ItemLedgerEntry.Reset();
        ItemLedgerEntry.SetRange("Location Code", StockSync.Location_LDR);
        ItemLedgerEntry.SetRange("Item No.", StockSync.Reference_LDR);
        ItemLedgerEntry.SetRange("Lot No.", StockSync."Lot No_LDR");
        if ItemLedgerEntry.FindFirst() then
            StockSync.Validate(Stock_LDR, ItemLedgerEntry."Remaining Quantity");

        //Validaciones para el tipo de ajuste
        if StockSync.Inventory_LDR = StockSync.Stock_LDR then begin
            StockSync."Entry Type_LDR" := StockSync."Entry Type_LDR"::" ";
            StockSync."Quantity to adjust_LDR" := 0;
        end;

        if StockSync.Inventory_LDR > StockSync.Stock_LDR then begin
            StockSync."Entry Type_LDR" := StockSync."Entry Type_LDR"::"Positive Adjmt.";
            StockSync."Quantity to adjust_LDR" := StockSync.Inventory_LDR - StockSync.Stock_LDR;
        end;

        if StockSync.Inventory_LDR < StockSync.Stock_LDR then begin
            StockSync."Entry Type_LDR" := StockSync."Entry Type_LDR"::"Negative Adjmt.";
            StockSync."Quantity to adjust_LDR" := StockSync.Stock_LDR - StockSync.Inventory_LDR;
        end;

        if StockSync.Insert(true) then
            RecordsCreated += 1;
    end;

    local procedure GetValueFromCell(RowNo: Integer; ColumnNo: Integer): Text
    var
        AuxExcelBuffer: Record "Excel Buffer";
    begin
        if AuxExcelBuffer.Get(RowNo, ColumnNo) then
            exit(AuxExcelBuffer."Cell Value as Text");
    end;

    var
        RecordsCreated: Integer;
}