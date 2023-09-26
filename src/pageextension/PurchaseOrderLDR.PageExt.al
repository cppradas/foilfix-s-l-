pageextension 50111 "Purchase Order_LDR" extends "Purchase Order"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addfirst("O&rder")
        {
            action("Send to SGA_LDR")
            {
                ApplicationArea = All;
                Caption = 'Purchase exportation SGA', comment = 'ESP="Exportación compras SGA"';
                Image = Excel;
                Promoted = true;
                PromotedCategory = Category8;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ExcelFunctions: Codeunit "Excel Functions_LDR";
                begin
                    if Rec.Status = Rec.Status::Released then
                        ExcelFunctions.ExportPurchaseOrderSGA_LDR(Rec);
                end;
            }
        }
    }
}