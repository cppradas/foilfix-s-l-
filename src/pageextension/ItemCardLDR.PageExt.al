pageextension 50100 "Item Card_LDR" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field(Wide_LDR; Rec.Wide_LDR)
            {
                ApplicationArea = All;
            }
            field(Long_LDR; Rec.Long_LDR)
            {
                ApplicationArea = All;
            }
            field(Micronage_LDR; Rec.Micronage_LDR)
            {
                ApplicationArea = All;
            }
            field("Units per box_LDR"; Rec."Units per box_LDR")
            {
                ApplicationArea = All;
            }
            field(DUN_LDR; Rec.DUN_LDR)
            {
                ApplicationArea = All;
            }
            field(Brand_LDR; Rec.Brand_LDR)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addlast(Approval)
        {
            action(ProductDataPerCustomer_LDR)
            {
                ApplicationArea = All;
                Caption = 'Product data per customer', comment = 'ESP="Datos de producto por cliente"';
                Image = EntriesList;

                trigger OnAction()
                var
                    ProductDataPerCustomerTable: Record "Product Data Per Customer_LDR";
                begin
                    ProductDataPerCustomerTable.Reset();
                    ProductDataPerCustomerTable.SetRange("Item No.", Rec."No.");
                    if not ProductDataPerCustomerTable.IsEmpty() then
                        Page.Run(Page::"Product Data Per Customer_LDR", ProductDataPerCustomerTable);
                end;
            }
        }
    }
}