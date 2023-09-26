enum 50103 "ShowOptions_LDR"
{
    Access = Public;
    Extensible = true;

    value(0; Automatic)
    {
        Caption = 'Automatic', comment = 'ESP="Automático"';
    }
    value(1; Always)
    {
        Caption = 'Always', comment = 'ESP="Siempre"';
    }
    value(2; Never)
    {
        Caption = 'Never', comment = 'ESP="Nunca"';
    }
}