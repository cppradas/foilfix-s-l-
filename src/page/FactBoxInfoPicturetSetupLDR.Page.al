/// <summary>
/// Page FactBoxInfoPicturetSetup_LDR (ID 51008).
/// </summary>
page 50106 "FactBoxInfoPicturetSetup_LDR"
{
    ApplicationArea = All;
    Caption = 'Header information', comment = 'ESP="Información cabecera"';
    PageType = CardPart;
    SourceTable = ReportsSetup_LDR;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            field(HeaderInformation_LDR; Rec.PictureInformation_LDR)
            {
                ShowCaption = false;
                ToolTip = 'Specifies the value of the Header information field.', Comment = 'ESP="Información cabecera"';
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(UploadImage)
            {
                ApplicationArea = all;
                Caption = 'Upload header information', comment = 'ESP="Subir información cabecera"';
                Image = Certificate;
                ToolTip = 'Upload header information', comment = 'ESP="Subir información cabecera"';

                trigger OnAction()
                begin
                    Rec.UploadHeaderInformationImagen();
                end;
            }
            action(ClearInformation)
            {
                ApplicationArea = all;
                Caption = 'Delete header information', comment = 'ESP="Eliminar información cabecera"';
                Image = Delete;
                ToolTip = 'Delete header information', comment = 'ESP="Eliminar información cabecera"';

                trigger OnAction()
                begin
                    Rec.DeleteHeaderImage();
                end;
            }
        }
    }
}