tableextension 50102 "Customer_LDR" extends Customer
{
    fields
    {
        field(50100; "Insurance Carrier_LDR"; Code[20])
        {
            Caption = 'Insurance carrier', comment = 'ESP="Aseguradora"';
            DataClassification = CustomerContent;
            TableRelation = "Insurance carrier_LDR";
        }
        field(50101; "Reference per pallet_LDR"; Boolean)
        {
            Caption = 'Reference per pallet', comment = 'ESP="Referencia por palet"';
            DataClassification = CustomerContent;
        }
        field(50102; "Observations expedition_LDR"; Text[100])
        {
            Caption = 'Observations expedition', comment = 'ESP="Observaciones expedición"';
            DataClassification = CustomerContent;
        }
        field(50103; "Valued Sales Shipment_LDR"; Boolean)
        {
            Caption = 'Valued Sales Shipment', comment = 'ESP="Albarán valorado"';
            DataClassification = CustomerContent;
        }
    }
}