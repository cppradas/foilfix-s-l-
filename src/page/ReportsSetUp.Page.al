/// <summary>
/// Page LDR_ReportsSetUp (ID 51006).
/// </summary>
page 50105 "ReportsSetUp_LDR"
{
    ApplicationArea = All;
    Caption = 'Reports setup', comment = 'ESP="Configuración informes"';
    PageType = Card;
    SourceTable = ReportsSetup_LDR;
    UsageCategory = Administration;
    layout
    {
        area(Content)
        {
            field(ShowPictureHeader_LDR; Rec.ShowPictureHeader_LDR)
            {

                ToolTip = 'Specifies the value of the Show information picture in header field.', Comment = 'ESP="Mostrar información de logo en cabecera"';
            }
            field(ShowCertificate; Rec.ShowCertificate)
            {

                ToolTip = 'Specifies the value of the Show Certificate field.', Comment = 'ESP="Mostrar certificado"';
            }
            field(ShowDiscount; Rec.ShowDiscount)
            {

                ToolTip = 'This field indicate if discount column in reports will be displayed or not. In case it is Automatic, it will show or not column discount depending if some line have discount in the report.', Comment = 'ESP="Depende del valor, muestra o no la columna de descuentos en los informes. En automático la muestra o no dependiendo de si alguna línea de la factura tiene descuento."';
            }
            field(ColourReport_LDR; Rec.ColourReport_LDR)
            {

                ToolTip = 'Specifies the value of the Report colour field.', Comment = 'ESP="Color informe"';
            }
            part(Footer; FooterTypePart_LDR)
            {

                Caption = 'Footer', comment = 'ESP="Pie de página"';
            }
        }
        area(FactBoxes)
        {
            part(HeaderInformationPicture; FactBoxInfoPicturetSetup_LDR)
            {
                ApplicationArea = all;
                SubPageLink = PK = field(PK);
            }
            part(Certificate; "FactBoxCertificateSetup_LDR")
            {
                ApplicationArea = all;
                SubPageLink = PK = field(PK);
            }
        }
    }
}