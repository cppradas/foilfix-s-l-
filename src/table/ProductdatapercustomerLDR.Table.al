table 50102 "Product Data Per Customer_LDR"
{
    Access = Public;
    Caption = 'Product Data Per Customer', comment = 'ESP="Datos de productos por cliente"';
    DataClassification = CustomerContent;
    DrillDownPageId = "Product Data Per Customer_LDR";
    LookupPageId = "Product Data Per Customer_LDR";

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.', comment = 'ESP="Nº de producto"';
            TableRelation = Item."No.";
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.', comment = 'ESP="Nº de cliente"';
            TableRelation = Customer."No.";
        }
        field(3; "Boxes per pallet"; Integer)
        {
            Caption = 'Boxes per pallet', comment = 'ESP="Cajas por palet"';

        }
        field(4; "Pallet Type"; Enum "Pallet Type_LDR")
        {
            Caption = 'Pallet Type', comment = 'ESP="Tipo de palet"';

        }
        field(5; "Single Label"; Boolean)
        {
            Caption = 'Single Label', comment = 'ESP="Etiqueta individual"';

        }
        field(6; "Box Label"; Boolean)
        {
            Caption = 'Box Label', comment = 'ESP="Etiqueta de caja"';
        }
        field(7; "Pack Label"; Boolean)
        {
            Caption = 'Pack Label', comment = 'ESP="Etiqueta de pack"';
        }
    }

    keys
    {
        key(Key1; "Item No.", "Customer No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Item No.", "Customer No.") { }
        fieldgroup(Brick; "Item No.", "Customer No.") { }
    }

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}