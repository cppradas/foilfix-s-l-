pageextension 50107 "Item List_LDR" extends "Item List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast("Assembly/Production")
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