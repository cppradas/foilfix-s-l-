pageextension 50112 "Sales Order List_LDR" extends "Sales Order List"
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
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ExcelFunctions: Codeunit "Excel Functions_LDR";
                    ConfirmLbl: Label 'All sales order lines will be exported to SGA. Do you want to continue?', comment = 'ESP="Se van a exportar todas las líneas de pedidos de venta a SGA ¿Desea continuar?"';
                begin
                    if Confirm(ConfirmLbl) then
                        ExcelFunctions.ExportSalesOrdersSGA_LDR();
                end;
            }
        }
    }
}