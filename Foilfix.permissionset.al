permissionset 50100 Foilfix_LDR
{
    Access = Public;
    Assignable = true;
    Permissions = codeunit PlannerIntegration_LDR = X,
        query ProductionOrders_LDR = X,
        tabledata "Insurance carrier_LDR" = RIMD,
        table "Insurance carrier_LDR" = X,
        tabledata "Comssion Entries_LDR" = RIMD,
        table "Comssion Entries_LDR" = X,
        report "Custom Sales - Order Conf_LDR" = X,
        codeunit "Sub reports_LDR" = X,
        page "Insurance carrier_LDR" = X,
        page "Phone Role Center_LDR" = X,
        page PhoneRolePage_LDR = X,
        tabledata "Product data per customer_LDR" = RIMD,
        table "Product data per customer_LDR" = X,
        report "Custom Sales - Shipment_LDR" = X,
        codeunit CodeunitEvents_LDR = X,
        tabledata FooterReport_LDR = RIMD,
        tabledata ReportsSetup_LDR = RIMD,
        table FooterReport_LDR = X,
        table ReportsSetup_LDR = X,
        report "Sales Invoice Pedro_LDR" = X,
        codeunit "Excel Functions_LDR" = X,
        page FactBoxCertificateSetup_LDR = X,
        page FactBoxInfoPicturetSetup_LDR = X,
        page "Product Data Per Customer_LDR" = X,
        page ReportsSetUp_LDR = X,
        tabledata "Stock Synchronization_LDR" = RIMD,
        table "Stock Synchronization_LDR" = X,
        page FooterTypePart_LDR = X;
}