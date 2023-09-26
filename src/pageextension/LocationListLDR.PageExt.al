pageextension 50114 "Location List_LDR" extends "Location List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast("&Location")
        {
            action("Load SGA Settings_LDR")
            {
                ApplicationArea = All;
                Caption = 'Load SGA Settings', comment = 'ESP="Cargar ajustes SGA"';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ExcelFunctions: Codeunit "Excel Functions_LDR";
                begin
                    ExcelFunctions."Load SGA Settings"();
                end;
            }

        }
    }
}