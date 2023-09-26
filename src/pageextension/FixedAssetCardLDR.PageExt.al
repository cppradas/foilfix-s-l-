pageextension 50101 "Fixed Asset Card_LDR" extends "Fixed Asset Card"
{
    layout
    {
        addafter(Description)
        {
            field("Description 2_LDR"; Rec."Description 2")
            {
                ApplicationArea = All;
            }
        }
    }
}