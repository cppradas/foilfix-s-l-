pageextension 50113 "Purchase Order List_LDR" extends "Purchase Order List"
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
                PromotedCategory = Category6;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ExcelFunctions: Codeunit "Excel Functions_LDR";
                    ConfirmLbl: Label 'All sales order lines will be exported to SGA. Do you want to continue?', comment = 'ESP="Se van a exportar todas las líneas de pedidos de compra a SGA ¿Desea continuar?"';
                begin
                    if Confirm(ConfirmLbl) then
                        ExcelFunctions.ExportPurchaseOrdersSGA_LDR();
                end;
            }
        }
    }
}