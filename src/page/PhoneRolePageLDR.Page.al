page 50100 "PhoneRolePage_LDR"
{
    Caption = 'Activities', comment = 'ESP="Actividades"';
    PageType = CardPart;
    RefreshOnActivate = true;
    ShowFilter = false;
    SourceTable = "Activities Cue";

    layout
    {
        area(Content)
        {
            cuegroup("Ongoing Sales")
            {
                Caption = 'Ongoing Sales', comment = 'ESP="Ventas en curso"';
                ;
                field("Ongoing Sales Quotes"; Rec."Ongoing Sales Quotes")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Quotes', comment = 'ESP="Ofertas venta"';
                    DrillDownPageID = "Sales Quotes";
                }
                field("Ongoing Sales Orders"; Rec."Ongoing Sales Orders")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Orders', comment = 'ESP="Pedidos venta"';
                    DrillDownPageID = "Sales Order List";
                }
                field("Ongoing Sales Invoices"; Rec."Ongoing Sales Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Invoices', comment = 'ESP="Facturas venta"';
                    DrillDownPageID = "Sales Invoice List";
                }
            }
        }
    }
}