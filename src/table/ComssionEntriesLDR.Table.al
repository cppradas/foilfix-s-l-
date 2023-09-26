table 50101 "Comssion Entries_LDR"
{
    Access = Public;
    Caption = 'Insurance carrier', Comment = 'ESP="Aseguradoras"';
    DataClassification = CustomerContent;
    //DrillDownPageId = "Insurance carrier_LDR";
    //LookupPageId = "Insurance carrier_LDR";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.', comment = 'ESP="Nº mov"';
        }
        field(2; "Document No_LDR"; Code[20])
        {
            Caption = 'Document No.', comment = 'ESP="Nº documento"';
        }
        field(3; "Posting Date_LDR"; Date)
        {
            Caption = 'Posting Date', comment = 'ESP="Fecha registro"';
        }
        field(4; "Salesperson Code_LDR"; Code[20])
        {
            Caption = 'Salesperson Code', comment = 'ESP="Cód. vendedor"';
            TableRelation = "Salesperson/Purchaser".Code;
        }
        field(5; "Amount_LDR"; Decimal)
        {
            Caption = 'Amount', comment = 'ESP="Importe"';
        }
        field(6; "Comission perc_LDR"; Decimal)
        {
            Caption = 'Comission %', comment = 'ESP="% Comisión"';
        }
        field(7; "Pending Invoice_LDR"; Boolean)
        {
            Caption = 'Pending Invoice', comment = 'ESP="Factura pendiente"';
        }
        field(8; "Status_LDR"; Boolean)
        {
            Caption = 'Status', comment = 'ESP="Estado"';
        }
        field(9; "Liquidation Doc No_LDR"; Code[20])
        {
            Caption = 'Liquidation Doc No', comment = 'ESP="Nº documennto liq."';
        }
        field(10; "Posted Doc No_LDR"; Code[20])
        {
            Caption = 'Posted Doc No', comment = 'ESP="Nº documennto registrado"';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.") { }
        fieldgroup(Brick; "Entry No.") { }
    }

}