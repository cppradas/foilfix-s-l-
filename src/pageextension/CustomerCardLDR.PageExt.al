pageextension 50103 "Customer Card_LDR" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Insurance Carrier_LDR"; Rec."Insurance Carrier_LDR")
            {
                ApplicationArea = All;
            }
            field("Reference per pallet_LDR"; Rec."Reference per pallet_LDR")
            {
                ApplicationArea = All;
            }
            field("Observations expedition_LDR"; Rec."Observations expedition_LDR")
            {
                ApplicationArea = All;
                MultiLine = true;
            }
            field("Valued Sales Shipment_LDR"; Rec."Valued Sales Shipment_LDR")
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
                    ProductDataPerCustomerTable.SetRange("Customer No.", Rec."No.");
                    if not ProductDataPerCustomerTable.IsEmpty() then
                        Page.Run(Page::"Product Data Per Customer_LDR", ProductDataPerCustomerTable);
                end;
            }
        }
    }
}