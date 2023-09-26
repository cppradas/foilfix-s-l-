page 50102 "Insurance carrier_LDR"
{
    ApplicationArea = All;
    Caption = 'Insurance carrier', Comment = 'ESP="Aseguradoras"';
    PageType = List;
    SourceTable = "Insurance carrier_LDR";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Insurance carrier code"; Rec."Insurance carrier code")
                {

                }
                field(Description_LDR; Rec.Description_LDR)
                {

                }
                field("Text to print"; Rec."Text to print")
                {

                }
            }
        }
    }
}