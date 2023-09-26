tableextension 50105 "Sales Shipment Line_LDR" extends "Sales Shipment Line"
{
    fields
    {
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
}