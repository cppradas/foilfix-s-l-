pageextension 50102 "Receivables Cartera Docs_LDR" extends "Receivables Cartera Docs"
{
    layout
    {
        addafter(Accepted)
        {
            field("Reception date_LDR"; Rec."Reception date_LDR")
            {
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                end;
            }
        }
    }
}