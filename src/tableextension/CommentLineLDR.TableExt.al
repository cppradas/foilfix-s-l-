tableextension 50103 "Comment Line_LDR" extends "Comment Line"
{
    fields
    {
        field(50100; "Print on Invoice_LDR"; Boolean)
        {
            Caption = 'Print on invoice', comment = 'ESP="Imprimir en factura"';
            DataClassification = CustomerContent;
        }
    }
}