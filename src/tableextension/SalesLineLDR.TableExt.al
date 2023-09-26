tableextension 50104 "Sales Line_LDR" extends "Sales Line"
{
    fields
    {
        field(50100; "Reference per pallet_LDR"; Boolean)
        {
            Caption = 'Reference per pallet', comment = 'ESP="Referencia por palet"';
            DataClassification = CustomerContent;
        }
        field(50101; "Observations Expedition_LDR"; Text[100])
        {
            Caption = 'Observations Expedition', comment = 'ESP="Observaciones expedición"';
            DataClassification = CustomerContent;
        }
        field(50102; "Comission perc_LDR"; Decimal)
        {
            Caption = 'Comission %', comment = 'ESP="% Comisión"';
            DataClassification = CustomerContent;
        }
        field(50103; "Send to SGA_LDR"; Boolean)
        {
            Caption = 'Send to SGA', comment = 'ESP="Enviado a SGA"';
            DataClassification = CustomerContent;
        }
        field(50104; "Shipment Date_LDR"; Date)
        {
            Caption = 'Shipment Date', comment = 'ESP="Fecha envío"';
            DataClassification = CustomerContent;
        }
        field(50105; "Shipment time_LDR"; Time)
        {
            Caption = 'Shipment time', comment = 'ESP="Hora de envío"';
            DataClassification = CustomerContent;
        }
        field(50147; LineDiscAmount_LDR; Decimal)
        {
            Caption = 'Line disc amount', comment = 'ESP="Importe descuento línea"';
            DataClassification = CustomerContent;
        }
        field(50148; UnitPrice_LDR; Decimal)
        {
            Caption = 'Unit price', comment = 'ESP="Precio unitario"';
            DataClassification = CustomerContent;
        }
        field(50149; LineAmount_LDR; Decimal)
        {
            Caption = 'Line amount', comment = 'ESP="Importe linea"';
            DataClassification = CustomerContent;
        }
    }
    trigger OnBeforeInsert()
    var
        Customer: Record Customer;
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.Reset();
        SalesHeader.SetRange("No.", Rec."Document No.");
        if SalesHeader.FindFirst() then begin
            Customer.Reset();
            Customer.SetRange("No.", SalesHeader."Sell-to Customer No.");
            if Customer.FindFirst() then
                Rec."Reference per pallet_LDR" := Customer."Reference per pallet_LDR";
        end;
    end;
}