codeunit 50101 CodeunitEvents_LDR
{
    Access = Public;
    Permissions = tabledata "Sales Shipment Line" = RMID;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Undo Sales Shipment Line", 'OnAfterNewSalesShptLineInsert', '', false, false)]
    local procedure C5815_OnAfterNewSalesShptLineInsert(var NewSalesShipmentLine: Record "Sales Shipment Line"; OldSalesShipmentLine: Record "Sales Shipment Line")
    begin
        NewSalesShipmentLine.LineAmount_LDR := -OldSalesShipmentLine.LineAmount_LDR;
        NewSalesShipmentLine.UnitPrice_LDR := -OldSalesShipmentLine.UnitPrice_LDR;
        NewSalesShipmentLine.LineDiscAmount_LDR := -OldSalesShipmentLine.LineDiscAmount_LDR;
        NewSalesShipmentLine.Modify();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesShptLineInsert', '', false, false)]
    local procedure c80_OnAfterSalesShptLineInsert(var SalesShipmentLine: Record "Sales Shipment Line"; SalesLine: Record "Sales Line"; ItemShptLedEntryNo: Integer; WhseShip: Boolean; WhseReceive: Boolean; CommitIsSuppressed: Boolean; SalesInvoiceHeader: Record "Sales Invoice Header")
    var
        Currency: Record Currency;
        regLinVta: Record "Sales Line";
    begin
        GetCurrency(Currency, SalesInvoiceHeader."Currency Code");
        regLinVta.Get(SalesLine."Document Type", SalesLine."Document No.", SalesLine."Line No.");

        SalesShipmentLine.LineAmount_LDR := regLinVta."Line Amount";
        SalesShipmentLine.UnitPrice_LDR := regLinVta."Unit Price";
        if regLinVta.Quantity <> 0 then begin
            SalesShipmentLine.LineDiscAmount_LDR := Round(regLinVta."Line Discount Amount" / regLinVta.Quantity * regLinVta."Qty. to Ship", Currency."Amount Rounding Precision");
            SalesShipmentLine.LineAmount_LDR := Round(regLinVta."Line Amount" / regLinVta.Quantity * regLinVta."Qty. to Ship", Currency."Amount Rounding Precision");
            SalesShipmentLine.UnitPrice_LDR := Round(regLinVta."Unit Price" / regLinVta.Quantity * regLinVta."Qty. to Ship", Currency."Amount Rounding Precision");
        end
        else begin
            SalesShipmentLine.LineAmount_LDR := 0;
            SalesShipmentLine.UnitPrice_LDR := 0;
        end;

        SalesShipmentLine.Modify();
    end;

    procedure GetCurrency(var Currency: Record Currency; CurrencyCode: Code[10])
    var
    begin
        if CurrencyCode = '' then
            Currency.InitRoundingPrecision()
        else begin
            Currency.Get(CurrencyCode);
            Currency.TestField("Amount Rounding Precision");
        end;
    end;
}