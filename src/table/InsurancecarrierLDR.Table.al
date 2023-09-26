table 50100 "Insurance carrier_LDR"
{
    Access = Public;
    Caption = 'Insurance carrier', Comment = 'ESP="Aseguradoras"';
    DataClassification = CustomerContent;
    DrillDownPageId = "Insurance carrier_LDR";
    LookupPageId = "Insurance carrier_LDR";

    fields
    {
        field(1; "Insurance carrier code"; Code[20])
        {
            Caption = 'Insurance carrier code', Comment = 'ESP="Código aseguradora"';
            NotBlank = true;
        }
        field(2; Description_LDR; Text[100])
        {
            Caption = 'Description', Comment = 'ESP="Descripción"';
        }
        field(3; "Text to print"; Text[100])
        {
            Caption = 'Text to print', Comment = 'ESP="Texto a imprimir"';
        }
    }

    keys
    {
        key(Key1; "Insurance carrier code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Insurance carrier code") { }
        fieldgroup(Brick; "Insurance carrier code") { }
    }

}