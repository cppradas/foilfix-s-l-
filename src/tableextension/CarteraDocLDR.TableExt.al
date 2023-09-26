tableextension 50101 "Cartera Doc_LDR" extends "Cartera Doc."
{
    fields
    {
        field(50100; "Reception date_LDR"; Date)
        {
            Caption = 'Reception date', comment = 'ESP="Fecha recepción"';
            DataClassification = CustomerContent;
            Editable = true;
            trigger OnValidate()
            begin
                Rec.Modify();
            end;
        }
    }
}