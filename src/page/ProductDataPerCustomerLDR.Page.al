page 50103 "Product Data Per Customer_LDR"
{
    ApplicationArea = All;
    Caption = 'Product Data Per Customer', Comment = 'ESP="Datos de productos por cliente"';
    PageType = List;
    SourceTable = "Product Data Per Customer_LDR";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.")
                {

                }
                field("Customer No."; Rec."Customer No.")
                {

                }
                field("Boxes per pallet"; Rec."Boxes per pallet")
                {

                }
                field("Pallet Type"; Rec."Pallet Type")
                {

                }
                field("Single Label"; Rec."Single Label")
                {

                }
                field("Box Label"; Rec."Box Label")
                {

                }
                field("Pack Label"; Rec."Pack Label")
                {

                }
            }
        }
    }
}