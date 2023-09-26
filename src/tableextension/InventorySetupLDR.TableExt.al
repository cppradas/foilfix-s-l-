tableextension 50108 "Inventory Setup_LDR" extends "Inventory Setup"
{
    fields
    {
        field(50100; "Journal Template Name SGA_LDR"; Code[10])
        {
            Caption = 'Journal Template Name SGA', comment = 'ESP="Libro ajustes SGA"';
            DataClassification = CustomerContent;
            TableRelation = "Item Journal Template".Name;
        }
        field(50101; "Journal Batch Name SGA_LDR"; Code[10])
        {
            Caption = 'Journal Batch Name SGA', comment = 'ESP="Sección ajustes SGA"';
            DataClassification = CustomerContent;
            TableRelation = "Item Journal Batch".Name where("Journal Template Name" = field("Journal Template Name SGA_LDR"));
        }
        field(50102; "Document No. SGA_LDR"; Text[10])
        {
            Caption = 'Document No. SGA', comment = 'ESP="Nº documento ajustes SGA"';
            DataClassification = CustomerContent;
        }
        field(50103; "Post SGA Adjmt._LDR"; Boolean)
        {
            Caption = 'Post SGA Adjmt.', comment = 'ESP="Registrar ajustes SGA"';
            DataClassification = CustomerContent;
        }
        field(50104; "Industry orders report_LDR"; Code[20])
        {
            Caption = 'Industry orders report', comment = 'ESP="Informe órdenes industria"';
            DataClassification = CustomerContent;
        }
        field(50105; "Hospitality orders report_LDR"; Code[20])
        {
            Caption = 'Hospitality orders report', comment = 'ESP="Informe órdenes hostelería"';
            DataClassification = CustomerContent;
        }
    }
}