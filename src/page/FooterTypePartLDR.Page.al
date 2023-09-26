page 50107 "FooterTypePart_LDR"
{
    Caption = 'Footer', comment = 'ESP="Pie página"';
    PageType = ListPart;
    SourceTable = FooterReport_LDR;
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(LanguageCode_LDR; Rec.LanguageCode_LDR)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Language field.', Comment = 'ESP="Lenguaje"';
                }
                field(FooterType_LDR; Rec.FooterType_LDR)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Footer type field.', Comment = 'ESP="Tipo pie página"';
                }
                field(Description; DescriptionFooter)
                {
                    ApplicationArea = All;
                    Caption = 'Description', comment = 'ESP="Descripción"';
                    ToolTip = 'Specifies the value of the Description field.', Comment = 'ESP="Descripción"';

                    trigger OnValidate()
                    begin
                        Rec.SetFooterDescription(DescriptionFooter);
                    end;
                }
            }
        }
    }
    var
        DescriptionFooter: Text;

    trigger OnAfterGetRecord()
    begin
        DescriptionFooter := Rec.GetFooterDescription();
    end;

    trigger OnNewRecord(BelowRec: Boolean)
    begin
        Clear(DescriptionFooter);
    end;
}