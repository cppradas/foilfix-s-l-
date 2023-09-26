pageextension 50108 "Company Information_LDR" extends "Company Information"
{
    layout
    {
        addlast(General)
        {
            group(Documents_Texts_LDR)
            {
                Caption = 'Documents texts', comment = 'ESP="Textos documentos"';
                field(gblLegalText_LDR; gblLegalText)
                {
                    ApplicationArea = All;
                    Caption = 'Legal Text 1', comment = 'ESP="Texto legal 1"';
                    MultiLine = true;
                    trigger OnValidate()
                    begin
                        Rec.Set_Legal_Text_LDR(gblLegalText);
                    end;
                }
                field(gblLegalText2_LDR; gblLegalText2)
                {
                    ApplicationArea = All;
                    Caption = 'Legal Text 2', comment = 'ESP="Texto legal 2"';
                    MultiLine = true;
                    trigger OnValidate()
                    begin
                        Rec.Set_Legal_Text2_LDR(gblLegalText2);
                    end;
                }
                field(gblLegalText3_LDR; gblLegalText3)
                {
                    ApplicationArea = All;
                    Caption = 'Legal Text 3', comment = 'ESP="Texto legal 3"';
                    MultiLine = true;
                    trigger OnValidate()
                    begin
                        Rec.Set_Legal_Text3_LDR(gblLegalText3);
                    end;
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        gblLegalText := Rec.Get_Legal_Text_LDR();
        gblLegalText2 := Rec.Get_Legal_Text2_LDR();
        gblLegalText3 := Rec.Get_Legal_Text3_LDR();
    end;

    var
        gblLegalText: Text;
        gblLegalText2: Text;
        gblLegalText3: Text;
}