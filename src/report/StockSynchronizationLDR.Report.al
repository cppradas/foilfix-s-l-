report 50103 "StockSynchronization_LDR"
{
    ApplicationArea = All;
    Caption = 'Synchronize SGA stock', comment = 'ESP="Cargar ajustes SGA"';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    UseRequestPage = false;


    dataset
    {
        dataitem("Stock Synchronization_LDR"; "Stock Synchronization_LDR")
        {

        }
    }
    trigger OnInitReport()
    var
        ExcelFunctions: Codeunit "Excel Functions_LDR";
    begin
        ExcelFunctions."Load SGA Settings"();
    end;
}