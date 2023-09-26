/// <summary>
/// Page FactBoxCertificateSetup_LDR (ID 51007).
/// </summary>
page 50104 "FactBoxCertificateSetup_LDR"
{
    ApplicationArea = All;
    Caption = 'Certificate', comment = 'ESP="Certificado"';
    PageType = CardPart;
    SourceTable = ReportsSetup_LDR;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            field(Certificate_LDR; Rec.Certificate_LDR)
            {
                ApplicationArea = all;
                ShowCaption = false;
                ToolTip = 'Specifies the value of the Logo field.', comment = 'ESP="Certificado"';
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
                Caption = 'Upload certificate', comment = 'ESP="Subir certificado"';
                Image = Certificate;
                ToolTip = 'Upload certificate', comment = 'ESP="Subir certificado"';

                trigger OnAction()
                begin
                    Rec.UploadCertificateImage();
                end;
            }
            action(ClearCertificate)
            {
                ApplicationArea = all;
                Caption = 'Delete certificate', comment = 'ESP="Eliminar certificado"';
                Image = Delete;
                ToolTip = 'Delete certificate', comment = 'ESP="Eliminar certificado"';

                trigger OnAction()
                begin
                    Rec.DeleteCertificate();
                end;
            }
        }
    }
}