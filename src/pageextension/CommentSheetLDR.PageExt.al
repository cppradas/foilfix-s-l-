pageextension 50104 "Comment Sheet_LDR" extends "Comment Sheet"
{
    layout
    {
        addlast(Control1)
        {
            field("Print on Invoice_LDR"; Rec."Print on Invoice_LDR")
            {
                ApplicationArea = All;
            }
        }
    }
}