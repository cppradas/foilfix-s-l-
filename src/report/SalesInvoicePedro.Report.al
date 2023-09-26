report 50102 "Sales Invoice Pedro_LDR"
{
    ApplicationArea = All;
    Caption = 'Sales - Invoice', Comment = 'ESP="Factura Venta"';
    DefaultRenderingLayout = SalesInvoice;
    EnableHyperlinks = true;
    Permissions = tabledata "Sales Shipment Buffer" = rimd;
    PreviewMode = PrintLayout;
    UsageCategory = Documents;

    dataset
    {
        dataitem(Header; "Sales Invoice Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.";
            RequestFilterHeading = 'Posted Sales Invoice', comment = 'ESP="Factura venta registrada';
            /**************************Fixed Header*************************/
            column(ShowInformationPictureHeader; ShowInformationPictureHeader)
            {
            }
            column(ShowCertificate; ShowCertificate)
            {
            }
            column(CompanyInfoName; CompanyInfo.Name)
            {
            }
            column(CompanyInfoVAT; CompanyInfo."VAT Registration No.")
            {
            }
            column(CompanyHomePage; CompanyInfo."Home Page")
            {
            }
            column(CompanyEMail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }
            /**************************Header*********************/
            column(DocumentNo_Lbl; DocumentNo_Lbl)
            {
            }
            column(DocumentNo; "No.")
            {
            }
            column(DocDateCaption; DocDateCaptionLbl)
            {
            }
            column(DocDateHeader; Format(Header."Document Date", 0, 1))
            {
            }
            column(Page_Lbl; PageLbl)
            {
            }
            //////////////Customer
            column(CustomerCaption_Lbl; CustomerCaption_Lbl)
            {
            }
            column(CustomerVatRegistration_Lbl; CustomerVatRegistration_Lbl)
            {
            }
            column(CustomerVatRegistration; Cust."VAT Registration No.")
            {
            }
            column(CustomerAddress1; CustAddr[1])
            {
            }
            column(CustomerAddress2; CustAddr[2])
            {
            }
            column(CustomerAddress3; CustAddr[3])
            {
            }
            column(CustomerAddress4; CustAddr[4])
            {
            }
            column(CustomerAddress5; CustAddr[5])
            {
            }
            column(CustomerAddress6; CustAddr[6])
            {
            }
            column(CustomerAddress7; CustAddr[7])
            {
            }
            column(CustomerAddress8; CustAddr[8])
            {
            }
            column(ShipToAddress_Lbl; ShiptoAddress_Lbl)
            {
            }
            column(ShowShippingAddr; 'true'/*ShowShippingAddr*/)
            {
            }
            column(ShipToAddress1; ShipToAddr[1])
            {
            }
            column(ShipToAddress2; ShipToAddr[2])
            {
            }
            column(ShipToAddress3; ShipToAddr[3])
            {
            }
            column(ShipToAddress4; ShipToAddr[4])
            {
            }
            column(ShipToAddress5; ShipToAddr[5])
            {
            }
            column(ShipToAddress6; ShipToAddr[6])
            {
            }
            column(ShipToAddress7; ShipToAddr[7])
            {
            }
            column(ShipToAddress8; ShipToAddr[8])
            {
            }
            column(Note_Lbl; Note_Lbl)
            {
            }
            column(WorkDescription; GetWorkDescription())
            {
            }
            /**************************Set up*********************/
            column(ColourReport; ColourReport)
            {
            }
            column(Discount; Discount)
            {
            }
            /***********************Payments**********************/
            column(PaymentMethod_Lbl; PaymentMethod_Lbl)
            {
            }
            column(PaymentMethod; PaymentMethod.Description)
            {
            }
            column(PaymentTerms; PaymentTerms.Description)
            {
            }
            column(Bank_Lbl; Bank_Lbl)
            {
            }
            column(Bank; CompanyInfo."Bank Name")
            {
            }
            column(PaymentsDueDate_Lbl; PaymentsDueDate_Lbl)
            {
            }
            column(PaymentsDueDate; PaymentsDueDate)
            {
            }
            column(IBAN_Lbl; CompanyInfo.FieldCaption(IBAN))
            {
            }
            column(IBAN; CompanyInfo.IBAN)
            {
            }
            /*************footer**********************/
            column(RegistrationText; RegistrationText)
            {
            }
            column(FooterText; FooterText)
            {
            }
            dataitem(Images; Integer)
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                column(CompanyInfoPicture; CompanyInfo.Picture)
                {
                }
                column(ReportsSetupLogo; LDR_ReportsSetup.Certificate_LDR)
                {
                }
                column(PictureInformation; LDR_ReportsSetup.PictureInformation_LDR)
                {
                }
                trigger OnPostDataItem()
                begin
                    Clear(CompanyInfo.Picture);
                    Clear(LDR_ReportsSetup.Certificate_LDR);
                    Clear(LDR_ReportsSetup.PictureInformation_LDR)
                end;
            }
            dataitem(Line; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = Header;
                DataItemTableView = sorting("Document No.", "Line No.");
                column(LineNo_Line; "Line No.")
                {
                }
                column(ItemNo_Line_Lbl; FieldCaption("No."))
                {
                }
                column(ItemNo_Line; "No.")
                {
                }
                column(Description_Line_Lbl; FieldCaption(Description))
                {
                }
                column(Description_Line; Description)
                {
                }
                column(Quantity_Line_Lbl; Quantity_Line_Lbl)
                {
                }
                column(Quantity_Line; FormattedQuantity)
                {
                }
                column(UnitPrice_Lbl; UnitPrice_Lbl)
                {
                }
                column(UnitPrice; FormattedUnitPrice)
                {
                    AutoFormatExpression = GetCurrencyCode();
                    AutoFormatType = 2;
                }
                column(Discount_Lbl; Discount_Lbl)
                {
                }
                column(LineDiscountPercentText_Line; LineDiscountPctText)
                {
                }
                column(LineAmount_Line_Lbl; LineAmount_Line_Lbl)
                {
                }
                column(LineAmount_Line; FormattedLineAmount)
                {
                    AutoFormatExpression = GetCurrencyCode();
                    AutoFormatType = 1;
                }
                trigger OnAfterGetRecord()      //LINE
                begin
                    if Type = Type::"G/L Account" then
                        "No." := '';

                    if "Line Discount %" <> 0 then begin
                        LineDiscountPctText := Format(Round("Line Discount %", 0.1));
                        if LDR_ReportsSetup.ShowDiscount <> LDR_ReportsSetup.ShowDiscount::Never then
                            Discount := true;
                    end else
                        LineDiscountPctText := '';

                    VATAmountLine.Init();
                    VATAmountLine."VAT Identifier" := "VAT Identifier";
                    VATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
                    VATAmountLine."Tax Group Code" := "Tax Group Code";
                    VATAmountLine."VAT %" := "VAT %";
                    VATAmountLine."EC %" := "EC %";
                    VATAmountLine."VAT Base" := Amount;
                    VATAmountLine."Amount Including VAT" := "Amount Including VAT";
                    VATAmountLine."Line Amount" := "Line Amount";
                    if "Allow Invoice Disc." then
                        VATAmountLine."Inv. Disc. Base Amount" := "Line Amount";
                    VATAmountLine."Invoice Discount Amount" := "Inv. Discount Amount";
                    VATAmountLine."VAT Clause Code" := "VAT Clause Code";
                    VATAmountLine.InsertLine();

                    TotalSubTotal += "Line Amount";
                    TotalInvDiscAmount -= "Inv. Discount Amount";
                    //TotalAmount += Amount;
                    TotalAmountVAT += "Amount Including VAT" - Amount;
                    TotalAmountInclVAT += "Amount Including VAT";
                    TotalPercVAT := "VAT %";

                    FormatDocument.SetSalesInvoiceLine(Line, FormattedQuantity, FormattedUnitPrice, FormattedVATPct, FormattedLineAmount);
                end;

                trigger OnPreDataItem()
                begin
                    if LDR_ReportsSetup.ShowDiscount = LDR_ReportsSetup.ShowDiscount::Always then
                        Discount := true
                    else
                        Discount := false;
                    VATAmountLine.DeleteAll();
                end;

                trigger OnPostDataItem()
                begin
                    //if TotalSubTotal <> 0 then
                    //DiscountPercentage := 100 * (TotalInvDiscAmount / TotalSubTotal);
                end;
            }
            dataitem(VATAmountLine; "VAT Amount Line")
            {
                DataItemTableView = sorting("VAT Identifier", "VAT Calculation Type", "Tax Group Code", "Use Tax", Positive);
                UseTemporary = true;
                column(AmountIncludingVAT_VAT; "Amount Including VAT")
                {
                    AutoFormatExpression = Line.GetCurrencyCode();
                    AutoFormatType = 1;
                }
                column(VATAmount_VatAmountLine; "VAT Amount")
                {
                    AutoFormatExpression = Header."Currency Code";
                    AutoFormatType = 1;
                }
                column(VATBase_VatAmountLine; "VAT Base")
                {
                    AutoFormatExpression = Line.GetCurrencyCode();
                    AutoFormatType = 1;
                }
                column(VATPct_VatAmountLine; "VAT %")
                {
                    DecimalPlaces = 0 : 5;
                }
            }
            dataitem(Totals; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                column(Subtotal_Lbl; Subtotal_Lbl)
                {
                }
                column(TotalSubTotal; Format(TotalSubTotal) + ' ' + CurrencySymbol)
                {
                }
                column(InvoiceDiscountAmount_Lbl; InvoiceDiscountAmount_Lbl)
                {
                }
                column(TotalInvoiceDiscountAmount; Format(TotalInvDiscAmount) + ' ' + CurrencySymbol)
                {
                }
                column(TotalExcludingVATText; TotalExclVAT_Lbl)
                {
                }
                column(TotalSubTotalMinusInvoiceDiscount; Format(TotalSubTotal) + ' ' + CurrencySymbol)
                {
                }
                column(TotalPercVAT_Lbl; TotalPercVAT_Lbl)
                {
                }
                column(TotalPercVAT; Format(TotalPercVAT) + ' %')
                {
                }
                column(TotalVATAmount_Lbl; TotalVATAmount_Lbl)
                {
                }
                column(TotalVATAmount; Format(TotalAmountVAT) + ' ' + CurrencySymbol)
                {
                }
                column(TotalIncludingVATText; TotalInclVAT_Lbl)
                {
                }
                column(TotalAmountIncludingVAT; Format(TotalAmountInclVAT) + ' ' + CurrencySymbol)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                PaymentMethodDesc := PaymentMethod.Description;

                if not IsReportInPreviewMode() then
                    CODEUNIT.Run(Codeunit::"Sales Inv.-Printed", Header);

                CurrReport.Language := LanguageCodeunit.GetLanguageIdOrDefault(Header."Language Code");

                if not LDR_FooterReport.Get(Header."Language Code", LDR_FooterReport.FooterType_LDR::RegistrationText) then
                    if not LDR_FooterReport.Get('ESP', LDR_FooterReport.FooterType_LDR::RegistrationText) then
                        Clear(LDR_FooterReport);
                RegistrationText := LDR_FooterReport.GetFooterDescription();
                if not LDR_FooterReport.Get(Header."Language Code", LDR_FooterReport.FooterType_LDR::Footer) then
                    if not LDR_FooterReport.Get('ESP', LDR_FooterReport.FooterType_LDR::Footer) then
                        Clear(LDR_FooterReport);
                FooterText := LDR_FooterReport.GetFooterDescription();


                FormatAddressFields(Header);
                FormatDocumentFields(Header);
                if not Cust.Get("Bill-to Customer No.") then
                    Clear(Cust);
                PaymentsDueDates(Cust."No.", Header."No.");
                TotalsCurrencySymbol(Header."Currency Code");

                CalcFields("Amount Including VAT");

                TotalSubTotal := 0;
                TotalInvDiscAmount := 0;
                //TotalAmount := 0;
                TotalAmountVAT := 0;
                TotalAmountInclVAT := 0;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options', comment = 'ESP="Opciones"';
                    field(LogInteraction; LogInteractionBool)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies that interactions with the contact are logged.', comment = 'ESP="Especifica que se registran las interacciones con el contacto."';
                    }
                }
            }
        }
        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := true;
        end;

        trigger OnOpenPage()
        begin
            InitLogInteraction();
            LogInteractionEnable := LogInteractionBool;
        end;
    }

    rendering
    {
        layout(SalesInvoice)
        {
            LayoutFile = './src/report/SalesInvoicePedro.Report.rdl';
            Type = RDLC;
        }
    }

    trigger OnInitReport()
    begin
        CompanyInfo.SetAutoCalcFields(Picture);
        CompanyInfo.Get();
        CompanyInfo.VerifyAndSetPaymentInfo();
        LDR_ReportsSetup.GetInstance();
    end;

    trigger OnPostReport()
    begin
        if LogInteractionBool and not IsReportInPreviewMode() then
            if Header.FindSet() then
                repeat
                    if Header."Bill-to Contact No." <> '' then
                        SegManagement.LogDocument(
                          4, Header."No.", 0, 0, DATABASE::Contact, Header."Bill-to Contact No.", Header."Salesperson Code",
                          Header."Campaign No.", Header."Posting Description", '')
                    else
                        SegManagement.LogDocument(
                          4, Header."No.", 0, 0, DATABASE::Customer, Header."Bill-to Customer No.", Header."Salesperson Code",
                          Header."Campaign No.", Header."Posting Description", '');
                until Header.Next() = 0;
    end;

    trigger OnPreReport()
    begin
        if Header.GetFilters = '' then
            Error(NoFilterSetErr);

        if LDR_ReportsSetup.ColourReport_LDR <> '' then
            ColourReport := LDR_ReportsSetup.ColourReport_LDR;

        if LDR_ReportsSetup.ShowPictureHeader_LDR then
            ShowInformationPictureHeader := true
        else
            ShowInformationPictureHeader := false;

        if LDR_ReportsSetup.ShowCertificate then
            ShowCertificate := true
        else
            ShowCertificate := false;
    end;

    var
        CompanyInfo: Record "Company Information";
        Currency: Record Currency;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        Cust: Record Customer;
        LDR_FooterReport: Record FooterReport_LDR;
        PaymentMethod: Record "Payment Method";
        PaymentTerms: Record "Payment Terms";
        LDR_ReportsSetup: Record ReportsSetup_LDR;
        ShipmentMethod: Record "Shipment Method";
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        LanguageCodeunit: Codeunit Language;
        SegManagement: Codeunit SegManagement;
        /****************Lines****************/
        Discount: Boolean;
        LogInteractionBool: Boolean;
        [InDataSet]
        LogInteractionEnable: Boolean;
        ShowCertificate: Boolean;
        /*****************Header*************/
        ShowInformationPictureHeader: Boolean;
        ShowShippingAddr: Boolean;
        //DiscountPercentage: Decimal;
        //TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        TotalAmountVAT: Decimal;
        TotalInvDiscAmount: Decimal;
        TotalPercVAT: Decimal;
        TotalSubTotal: Decimal;
        Bank_Lbl: Label 'Bank', comment = 'ESP="Banco"';
        CustomerCaption_Lbl: Label 'Client', comment = 'ESP="Cliente"';
        CustomerVatRegistration_Lbl: Label 'VAT: ', comment = 'ESP="CIF: "';
        Discount_Lbl: Label '% Disc', comment = 'ESP="Dto %"';
        DocDateCaptionLbl: Label 'Invoice Date', comment = 'ESP="Fecha Factura"';
        DocumentNo_Lbl: Label 'Invoice No.', comment = 'ESP="Nº Factura"';
        InvoiceDiscountAmount_Lbl: Label 'Invoice Discount', comment = 'ESP="Dto Factura"';
        LineAmount_Line_Lbl: Label 'Amount', comment = 'ESP="Importe"';
        NoFilterSetErr: Label 'You must specify one or more filters to avoid accidently printing all documents.';
        /**********************************/
        Note_Lbl: Label 'Note: ', comment = 'ESP="Nota:"';
        PageLbl: Label 'Page', comment = 'ESP="Página"';
        /**************Payments***********/
        PaymentMethod_Lbl: Label 'Payments method', comment = 'ESP="Forma de pago"';
        PaymentsDueDate_Lbl: Label 'Payments due date', comment = 'ESP="Vencimientos"';
        Quantity_Line_Lbl: Label 'Qty', comment = 'ESP="Cant."';
        ShiptoAddress_Lbl: Label 'Shipping address', comment = 'ESP="Dirección envío"';
        Subtotal_Lbl: Label 'Subtotal', comment = 'ESP="Subtotal"';
        TotalExclVAT_Lbl: Label 'Base', comment = 'ESP="Base"';
        TotalInclVAT_Lbl: Label 'Total', comment = 'ESP="Total"';
        TotalPercVAT_Lbl: Label 'VAT %', comment = 'ESP="IVA %"';
        TotalVATAmount_Lbl: Label 'VAT Amount', comment = 'ESP="Importe IVA"';
        UnitPrice_Lbl: Label 'Price', comment = 'ESP="Precio"';
        ColourReport: Text;
        /**************Totals****************/
        CurrencySymbol: Text;
        FooterText: Text;
        FormattedLineAmount: Text;
        FormattedQuantity: Text;
        FormattedUnitPrice: Text;
        FormattedVATPct: Text;
        LineDiscountPctText: Text;
        PaymentMethodDesc: Text;
        PaymentsDueDate: Text;
        RegistrationText: Text;
        CompanyAddr: array[8] of Text[100];
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        PaymentsDueDateTB: TextBuilder;

    local procedure InitLogInteraction()
    begin
        LogInteractionBool := SegManagement.FindInteractTmplCode(4) <> '';
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody());
    end;

    local procedure FormatAddressFields(var SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
        FormatAddr.Company(CompanyAddr, CompanyInfo);
        FormatAddr.SalesInvBillTo(CustAddr, SalesInvoiceHeader);
        ShowShippingAddr := FormatAddr.SalesInvShipTo(ShipToAddr, CustAddr, SalesInvoiceHeader);
    end;

    local procedure FormatDocumentFields(SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
        FormatDocument.SetPaymentTerms(PaymentTerms, SalesInvoiceHeader."Payment Terms Code", Header."Language Code");
        FormatDocument.SetPaymentMethod(PaymentMethod, SalesInvoiceHeader."Payment Method Code", Header."Language Code");
        FormatDocument.SetShipmentMethod(ShipmentMethod, SalesInvoiceHeader."Shipment Method Code", Header."Language Code");
    end;

    local procedure PaymentsDueDates(CustomerNo: Code[20]; DocumentNo: Code[20])
    begin
        CustLedgerEntry.Reset();
        CustLedgerEntry.SetCurrentKey("Document No.", "Customer No.");
        CustLedgerEntry.SetRange("Document No.", DocumentNo);
        CustLedgerEntry.SetRange("Customer No.", CustomerNo);
        CustLedgerEntry.SetRange("Document Type", CustLedgerEntry."Document Type"::Bill);
        CustLedgerEntry.SetLoadFields(Amount, "Due Date");
        if CustLedgerEntry.FindSet() then
            repeat
                CustLedgerEntry.CalcFields(Amount);
                PaymentsDueDateTB.Append(Format(CustLedgerEntry."Due Date") + ' - ' + Format(CustLedgerEntry.Amount) + '  ');
            until CustLedgerEntry.Next() = 0;
        PaymentsDueDate := PaymentsDueDateTB.ToText();
    end;

    local procedure TotalsCurrencySymbol(pCurrencySymbol: Code[20])
    begin
        if pCurrencySymbol = '' then
            pCurrencySymbol := 'EUR';
        CurrencySymbol := Currency.ResolveCurrencySymbol(pCurrencySymbol);
    end;
}

