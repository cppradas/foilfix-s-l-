tableextension 50107 "Purchase Line_LDR" extends "Purchase Line"
{
    fields
    {
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
    }
}