/// <summary>
/// Table LDR_FooterReport (ID 51004).
/// </summary>
table 50104 "FooterReport_LDR"
{
    Access = Public;
    Caption = 'Footer reports', comment = 'ESP="Pie de pagina reports"';
    DataClassification = CustomerContent;

    fields
    {
        field(1; LanguageCode_LDR; Code[20])
        {
            Caption = 'Language', comment = 'ESP="Lenguaje"';
            TableRelation = Language;
        }
        field(2; FooterType_LDR; Enum FooterType_LDR)
        {
            Caption = 'Footer type', comment = 'ESP="Tipo pie página"';
        }
        field(3; DescriptionFooter_LDR; Blob)
        {
            Caption = 'Description', comment = 'ESP="Descripción"';
        }
    }

    keys
    {
        key(PK; LanguageCode_LDR, FooterType_LDR)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; LanguageCode_LDR, FooterType_LDR) { }
        fieldgroup(Brick; LanguageCode_LDR, FooterType_LDR) { }
    }

    /// <summary>
    /// SetFooterDescription.
    /// </summary>
    /// <param name="pDescription">Text.</param>
    procedure SetFooterDescription(pDescription: Text)
    var
        OutStream: OutStream;
    begin
        Clear(DescriptionFooter_LDR);
        Rec.DescriptionFooter_LDR.CreateOutStream(OutStream, TextEncoding::UTF8);
        OutStream.WriteText(pDescription)
    end;

    /// <summary>
    /// GetFooterDescription.
    /// </summary>
    /// <returns>Return value of type Text.</returns>
    procedure GetFooterDescription(): Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        Rec.CalcFields(DescriptionFooter_LDR);
        Rec.DescriptionFooter_LDR.CreateInStream(InStream, TextEncoding::UTF8);
        exit(TypeHelper.ReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator()));
    end;
}