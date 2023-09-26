page 50101 "Phone Role Center_LDR"
{
    Caption = '', comment = 'ESP="YourLanguageText"';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(PhoneRolePage; PhoneRolePage_LDR)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        area(Embedding)
        {
            action(Customers)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customers', comment = 'ESP="Clientes"';
                RunObject = Page "Customer List";
            }
            action(Items)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Items', comment = 'ESP="Productos"';
                RunObject = Page "Item List";
            }
        }
    }
}