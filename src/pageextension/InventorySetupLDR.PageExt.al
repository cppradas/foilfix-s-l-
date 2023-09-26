pageextension 50115 "InventorySetup_LDR" extends "Inventory Setup"
{
    layout
    {
        addafter(Numbering)
        {
            group(SGA_LDR)
            {
                Caption = 'SGA Setup', comment = 'ESP="Configuración SGA"';
                field("Journal Template Name SGA_LDR"; Rec."Journal Template Name SGA_LDR")
                {
                    ApplicationArea = All;
                }
                field("Journal Batch Name SGA_LDR"; Rec."Journal Batch Name SGA_LDR")
                {
                    ApplicationArea = All;
                }
                field("Document No. SGA_LDR"; Rec."Document No. SGA_LDR")
                {
                    ApplicationArea = All;
                }
                field("Post SGA Adjmt._LDR"; Rec."Post SGA Adjmt._LDR")
                {
                    ApplicationArea = All;
                }
                field("Industry orders report_LDR"; Rec."Industry orders report_LDR")
                {
                    ApplicationArea = All;
                }
                field("Hospitality orders report_LDR"; Rec."Hospitality orders report_LDR")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}