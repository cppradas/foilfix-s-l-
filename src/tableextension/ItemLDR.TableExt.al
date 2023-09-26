tableextension 50100 "Item_LDR" extends Item
{
    fields
    {
        field(50100; Wide_LDR; Decimal)
        {
            Caption = 'Wide', comment = 'ESP="Ancho"';
            DataClassification = CustomerContent;
        }
        field(50101; Long_LDR; Decimal)
        {
            Caption = 'Long', comment = 'ESP="Largo"';
            DataClassification = CustomerContent;
        }
        field(50102; Micronage_LDR; Decimal)
        {
            Caption = 'Micronage', comment = 'ESP="Micraje"';
            DataClassification = CustomerContent;
        }
        field(50103; "Units per box_LDR"; Integer)
        {
            Caption = 'Units per box', comment = 'ESP="Unidades por caja"';
            DataClassification = CustomerContent;
        }
        field(50104; DUN_LDR; Code[14])
        {
            Caption = 'DUN', comment = 'ESP="DUN"';
            DataClassification = CustomerContent;
        }
        field(50105; Brand_LDR; Code[20])
        {
            Caption = 'Brand', comment = 'ESP="Marca"';
            DataClassification = CustomerContent;
        }
        field(50106; Finish_LDR; Enum Finish_LDR)
        {
            Caption = 'Brand', comment = 'ESP="Marca"';
            DataClassification = CustomerContent;
        }
    }
}