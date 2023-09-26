pageextension 50109 "Sales Order_LDR" extends "Sales Order"
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
                Caption = 'Sales exportation SGA', comment = 'ESP="Exportación ventas SGA"';
                Image = Excel;
                Promoted = true;
                PromotedCategory = Category8;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ExcelFunctions: Codeunit "Excel Functions_LDR";
                begin
                    if Rec.Status = Rec.Status::Released then
                        ExcelFunctions.ExportSalesOrderSGA_LDR(Rec);
                end;
            }
        }
    }
}