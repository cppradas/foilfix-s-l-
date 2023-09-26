tableextension 50106 "Company Information_LDR" extends "Company Information"
{
    fields
    {
        field(50100; "Legal Text_LDR"; Blob)
        {
            Caption = 'Legal Text 1', comment = 'ESP="Texto legal 1"';
            DataClassification = CustomerContent;
        }
        field(50101; "Legal Text2_LDR"; Blob)
        {
            Caption = 'Legal Text 2', comment = 'ESP="Texto legal 2"';
            DataClassification = CustomerContent;
        }
        field(50102; "Legal Text3_LDR"; Blob)
        {
            Caption = 'Legal Text 3', comment = 'ESP="Texto registro mercantil"';
            DataClassification = CustomerContent;
        }
    }
    procedure Set_Legal_Text_LDR(New_Legal_Text_LDR: Text)
    var
        OutStream: OutStream;
    begin
        Clear("Legal Text_LDR");
        "Legal Text_LDR".CreateOutStream(OutStream, TextEncoding::UTF8);
        OutStream.WriteText(New_Legal_Text_LDR);
        Modify();
    end;

    procedure Get_Legal_Text_LDR(): Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        CalcFields("Legal Text_LDR");
        "Legal Text_LDR".CreateInStream(InStream, TextEncoding::UTF8);
        exit(TypeHelper.ReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator()));
    end;

    procedure Set_Legal_Text2_LDR(New_Legal_Text_2_LDR: Text)
    var
        OutStream: OutStream;
    begin
        Clear("Legal Text2_LDR");
        "Legal Text2_LDR".CreateOutStream(OutStream, TextEncoding::UTF8);
        OutStream.WriteText(New_Legal_Text_2_LDR);
        Modify();
    end;

    procedure Get_Legal_Text2_LDR(): Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        CalcFields("Legal Text2_LDR");
        "Legal Text2_LDR".CreateInStream(InStream, TextEncoding::UTF8);
        exit(TypeHelper.ReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator()));
    end;

    procedure Set_Legal_Text3_LDR(New_Legal_Text_3_LDR: Text)
    var
        OutStream: OutStream;
    begin
        Clear("Legal Text3_LDR");
        "Legal Text3_LDR".CreateOutStream(OutStream, TextEncoding::UTF8);
        OutStream.WriteText(New_Legal_Text_3_LDR);
        Modify();
    end;

    procedure Get_Legal_Text3_LDR(): Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        CalcFields("Legal Text3_LDR");
        "Legal Text3_LDR".CreateInStream(InStream, TextEncoding::UTF8);
        exit(TypeHelper.ReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator()));
    end;
}