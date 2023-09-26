/// <summary>
/// Table LDR_ReportsSetup (ID 51003).
/// </summary>
table 50103 "ReportsSetup_LDR"
{
    Access = Public;
    Caption = 'Reports set up', comment = 'ESP="Configuración informes"';
    DataClassification = CustomerContent;

    fields
    {
        field(1; PK; Code[10])
        {
            Caption = 'PK', comment = 'ESP="PK"';
            NotBlank = true;
        }
        field(2; ColourReport_LDR; Code[20])
        {
            Caption = 'Report colour', comment = 'ESP="Color informe"';
        }
        field(3; Certificate_LDR; MediaSet)
        {
            Caption = 'Certificate', comment = 'ESP="Certificado"';
        }
        field(4; PictureInformation_LDR; MediaSet)
        {
            Caption = 'Header information', comment = 'ESP="Información cabecera"';
        }
        field(5; ShowPictureHeader_LDR; Boolean)
        {
            Caption = 'Show information picture in header', comment = 'ESP="Mostrar información de logo en cabecera"';
        }
        field(6; ShowCertificate; Boolean)
        {
            Caption = 'Show Certificate', comment = 'ESP="Mostrar certificado"';
        }
        field(7; ShowDiscount; Enum ShowOptions_LDR)
        {
            Caption = 'Show discounts in lines', comment = 'ESP="Mostrar descuentos en línea"';
        }
    }
    keys
    {
        key(Key1; PK)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; PK) { }
        fieldgroup(Brick; PK) { }
    }

    internal procedure GetInstance()
    begin
        if HasBeenRead then
            exit;

        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert(true);
        end;

        HasBeenRead := true;
    end;

    /// <summary>
    /// UploadHeaderInformationImagen.
    /// </summary>
    procedure UploadHeaderInformationImagen()
    var
        InStr: InStream;
        FileName: Text;
    begin
        if UploadIntoStream(UploadLbl, '', '', FileName, InStr) then begin
            Clear(Rec.PictureInformation_LDR);
            Rec.PictureInformation_LDR.ImportStream(InStr, FileName);
            Rec.Modify(true);
        end;
    end;

    /// <summary>
    /// UploadCertificateImage.
    /// </summary>
    procedure UploadCertificateImage()
    var
        InStr: InStream;
        FileName: Text;
    begin
        if UploadIntoStream(UploadLbl, '', '', FileName, InStr) then begin
            Clear(Rec.Certificate_LDR);
            Rec.Certificate_LDR.ImportStream(InStr, FileName);
            Rec.Modify(true);
        end;
    end;

    /// <summary>
    /// DeleteHeaderImage.
    /// </summary>
    procedure DeleteHeaderImage()
    begin
        Clear(Rec.PictureInformation_LDR);
        Rec.Modify(true);
    end;

    /// <summary>
    /// DeleteCertificate.
    /// </summary>
    procedure DeleteCertificate()
    begin
        Clear(Rec.Certificate_LDR);
        Rec.Modify(true);
    end;

    var
        HasBeenRead: Boolean;
        UploadLbl: Label 'Select imagen to upload', comment = 'ESP="Seleccionar imagen a subir"';
}