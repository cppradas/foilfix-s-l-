report 50101 "Custom Sales - Shipment_LDR"
{
    ApplicationArea = All;
    Caption = 'Sales - Shipment', comment = 'ESP="Ventas - Albarán"';
    DefaultLayout = RDLC;
    PreviewMode = PrintLayout;
    RDLCLayout = '.\src\report\layout\CustomSalesShipment.rdlc';
    UsageCategory = Documents;

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Posted Sales Shipment', comment = 'ESP="Histórico albaranes venta"';
            column(Barcode; EncodedText) { }
            column(No_SalesShptHeader; "No.") { }
            column(PageCaption; PageCaptionCapLbl) { }
            //+ Campos albaran
            column(ValuedSalesShipment; ValuedSalesShipment) { }
            column(CustVatRegNo; CustVatRegNo) { }
            column(Posting_Date; "Posting Date") { }
            column(Bill_to_Name; "Bill-to Name") { }
            column(Bill_to_Address; "Bill-to Address") { }
            column(Bill_to_Address_2; "Bill-to Address 2") { }
            column(Bill_to_City; "Bill-to City") { }
            column(Bill_to_Post_Code; "Bill-to Post Code") { }
            column(Bill_to_County; "Bill-to County") { }
            column(Bill_to_Country_Region_Code; "Bill-to Country/Region Code") { }
            column(VAT_Registration_No_; "VAT Registration No.") { }
            column(Ship_to_Name; "Ship-to Name") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(Ship_to_Address_2; "Ship-to Address 2") { }
            column(Ship_to_City; "Ship-to City") { }
            column(Ship_to_County; "Ship-to County") { }
            column(Ship_to_Country_Region_Code; "Ship-to Country/Region Code") { }
            column(Ship_to_Post_Code; "Ship-to Post Code") { }
            column(Sell_to_Phone_No_; "Sell-to Phone No.") { }
            column(Order_No_; "Order No.") { }
            column(External_Document_No_; "External Document No.") { }
            column(Shipment_Date; "Shipment Date") { }
            column(Your_Reference; "Your Reference") { }
            column(Salesperson_Code; "Salesperson Code") { }

            //- Campos albaran
            column(SiteAddress; SiteAddress) { }
            column(SiteCity; SiteCity) { }
            column(SiteCountry; SiteCountry) { }
            column(SiteCounty; SiteCounty) { }
            column(SitePhoneNo; SitePhoneNo) { }
            column(SitePostCode; SitePostCode) { }
            column(ProcessPlantPicture; TenantMedia.Content) { }
            //+ Campos empresa
            column(CompanyInfoPicture; CustomCompanyInfo.Picture) { }
            column(CompanyInfoLegalText; CustomCompanyInfo."Legal Text_LDR") { }
            column(CompanyInfoLegalText2; CustomCompanyInfo."Legal Text2_LDR") { }
            column(CompanyInfoLegalText3; CustomCompanyInfo."Legal Text3_LDR") { }
            column(CompanyInfoAddres; CustomCompanyInfo.Address) { }
            column(CompanyInfoAddres2; CustomCompanyInfo."Address 2") { }
            column(CompanyInfoCity; CustomCompanyInfo.City) { }
            column(CompanyInfoCounty; CustomCompanyInfo.County) { }
            column(CompanyInfoPostCode; CustomCompanyInfo."Post Code") { }
            column(CompanyInfoVATRegNo; CustomCompanyInfo."VAT Registration No.") { }
            column(CustomCompanyInfoPhoneNo; CustomCompanyInfo."Phone No.") { }
            column(CompanyInfoName; CustomCompanyInfo.Name) { }
            column(CompanyInfoMail; CustomCompanyInfo."E-Mail") { }
            //- Campos empresa
            //+ Labels
            column(AccordingCustomerLbl; AccordingCustomerLbl) { }
            column(AccordingAgencyLbl; AccordingAgencyLbl) { }
            column(BundlesLbl; BundlesLbl) { }
            column(VehicleTemperatureLbl; VehicleTemperatureLbl) { }
            column(CustomerLbl; CustomerLbl) { }
            column(PortsLbl; PortsLbl) { }
            column(AbsenceBodiesLbl; AbsenceBodiesLbl) { }
            column(AbsenceMoldsLbl; AbsenceMoldsLbl) { }
            column(AbsenceOdorsLbl; AbsenceOdorsLbl) { }
            column(AbsencePestsLbl; AbsencePestsLbl) { }
            column(BeforeLoadingLbl; BeforeLoadingLbl) { }
            column(CLbl; CLbl) { }
            column(ILbl; ILbl) { }
            column(PalletsInfoLbl; PalletsInfoLbl) { }
            column(WeightLbl; WeightLbl) { }
            column(HygienicConditionLbl; HygienicConditionLbl) { }
            column(MerchandiseCompatibilityLbl; MerchandiseCompatibilityLbl) { }
            column(ProductTemperatureLbl; ProductTemperatureLbl) { }
            column(ResponsibleSignatureLbl; ResponsibleSignatureLbl) { }
            column(ShipmentControlLbl; ShipmentControlLbl) { }
            column(UnfavorableHumidityLbl; UnfavorableHumidityLbl) { }
            column(ProcessPlantLbl; ProcessPlantLbl) { }
            column(VATRegNoLbl; VATRegNoLbl) { }
            column(RegisteredOfficeLbl; RegisteredOfficeLbl) { }
            column(InvoiceNoLbl; InvoiceNoLbl) { }
            column(DateLbl; DateLbl) { }
            column(YourOrderLbl; YourOrderLbl) { }
            column(ShipmentAddressLbl; ShipmentAddressLbl) { }
            column(InvoiceLbl; InvoiceLbl) { }
            column(CodLineLbl; CodLineLbl) { }
            column(DescriptionLineLbl; DescriptionLineLbl) { }
            column(QuantityLineLbl; QuantityLineLbl) { }
            column(UnitOfMeasureLineLbl; UnitOfMeasureLineLbl) { }
            column(PriceLineLbl; PriceLineLbl) { }
            column(DiscountPercentLineLbl; DiscountPercentLineLbl) { }
            column(DiscountAmountLineLbl; DiscountAmountLineLbl) { }
            column(TotalLbl; TotalLbl) { }
            column(GrossTotalLbl; GrossTotalLbl) { }
            column(DiscountsLbl; DiscountsLbl) { }
            column(BaseLbl; BaseLbl) { }
            column(FeeLbl; FeeLbl) { }
            column(RecLbl; RecLbl) { }
            column(IVALbl; IVALbl) { }
            column(AmountLbl; AmountLbl) { }
            column(TotalInvoiceLbl; TotalInvoiceLbl) { }
            column(ObservationLbl; ObservationLbl) { }
            column(PaymentMethodLbl; PaymentMethodLbl) { }
            column(ShipmentLbl; ShipmentLbl) { }
            column(LotLbl; LotLbl) { }
            column(BoxesLbl; BoxesLbl) { }
            column(QtyLbl; QtyLbl) { }
            column(CityLbl; CityLbl) { }
            column(ItemLbl; ItemLbl) { }
            column(CopyLbl; CopyLbl) { }
            column(FromLbl; FromLbl) { }
            column(PageLbl; PageLbl) { }
            column(UnitLbl; UnitLbl) { }
            column(EMailLbl; EMailLbl) { }
            column(InvNoLbl; InvNoLbl) { }
            column(PhoneLbl; PhoneLbl) { }
            column(PriceLbl; PriceLbl) { }
            column(UnitsLbl; UnitsLbl) { }
            column(BillToLbl; BillToLbl) { }
            column(CountyLbl; CountyLbl) { }
            column(JobNo2Lbl; JobNo2Lbl) { }
            column(PalletLbl; PalletLbl) { }
            column(ShipToLbl; ShipToLbl) { }
            column(ThanksLbl; ThanksLbl) { }
            column(VATAmtLbl; VATAmtLbl) { }
            column(AddressLbl; AddressLbl) { }
            column(ClosingLbl; ClosingLbl) { }
            column(ExpDateLbl; ExpDateLbl) { }
            column(LoadDateLbl; LoadDateLbl) { }
            column(LocationLbl; LocationLbl) { }
            column(Address2Lbl; Address2Lbl) { }
            column(DestinytLbl; DestinytLbl) { }
            column(BilledToLbl; BilledToLbl) { }
            column(GreetingLbl; GreetingLbl) { }
            column(PricePerLbl; PricePerLbl) { }
            column(QuantityLbl; QuantityLbl) { }
            column(REAmountLbl; REAmountLbl) { }
            column(AgencyIdLbl; AgencyIdLbl) { }
            column(CountryLbl; CountryLbl) { }
            column(AccordingLbl; AccordingLbl) { }
            column(AgencyRegistrationLbl; AgencyRegistrationLbl) { }
            column(DescriptionLbl; DescriptionLbl) { }
            column(ExtRefOrderLbl; ExtRefOrderLbl) { }
            column(OrderNoLbl; OrderNoLbl) { }
            column(PackQuantityLbl; PackQuantityLbl) { }
            column(REPercentLbl; REPercentLbl) { }
            column(ReturnedPackagingLbl; ReturnedPackagingLbl) { }
            column(ReturnedPalletLbl; ReturnedPalletLbl) { }
            column(ShipmentNoLbl; ShipmentNoLbl) { }
            column(ShipmentTLbl; ShipmentTLbl) { }
            column(VatPercentLbl; VatPercentLbl) { }
            column(TemperatureLbl; TemperatureLbl) { }
            column(TransportLbl; TransportLbl) { }
            column(ACLbl; ACLbl) { }
            //- Labels            
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = sorting(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfo3Picture; CompanyInfo3.Picture)
                    {
                    }
                    column(SalesShptCopyText; StrSubstNo(Text002Lbl, CopyText))
                    {
                    }
                    column(ShipToAddr1; ShipToAddr[1])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(ShipToAddr2; ShipToAddr[2])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(ShipToAddr3; ShipToAddr[3])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(ShipToAddr4; ShipToAddr[4])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(ShipToAddr5; ShipToAddr[5])
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(ShipToAddr6; ShipToAddr[6])
                    {
                    }
                    column(CompanyInfoHomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(CompanyInfoEmail; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfoFaxNo; CompanyInfo."Fax No.")
                    {
                    }
                    column(CompanyInfoVATRegtnNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyBankAccount.Name)
                    {
                    }
                    column(CompanyInfoBankAccountNo; CompanyBankAccount."Bank Account No.")
                    {
                    }
                    column(SelltoCustNo_SalesShptHeader; "Sales Shipment Header"."Sell-to Customer No.")
                    {
                    }
                    column(DocDate_SalesShptHeader; Format("Sales Shipment Header"."Document Date"))
                    {
                    }
                    column(SalesPersonText; SalesPersonText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(YourRef_SalesShptHeader; "Sales Shipment Header"."Your Reference")
                    {
                    }
                    column(ShipToAddr7; ShipToAddr[7])
                    {
                    }
                    column(ShipToAddr8; ShipToAddr[8])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(ShptDate_SalesShptHeader; Format("Sales Shipment Header"."Shipment Date"))
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(ItemTrackingAppendixCaption; ItemTrackingAppendixCaptionLbl)
                    {
                    }
                    column(PhoneNoCaption; PhoneNoCaptionLbl)
                    {
                    }
                    column(VATRegNoCaption; VATRegNoCaptionLbl)
                    {
                    }
                    column(GiroNoCaption; GiroNoCaptionLbl)
                    {
                    }
                    column(BankNameCaption; BankNameCaptionLbl)
                    {
                    }
                    column(BankAccNoCaption; BankAccNoCaptionLbl)
                    {
                    }
                    column(ShipmentNoCaption; ShipmentNoCaptionLbl)
                    {
                    }
                    column(ShipmentDateCaption; ShipmentDateCaptionLbl)
                    {
                    }
                    column(HomePageCaption; HomePageCaptionLbl)
                    {
                    }
                    column(EmailCaption; EmailCaptionLbl)
                    {
                    }
                    column(DocumentDateCaption; DocumentDateCaptionLbl)
                    {
                    }
                    column(SelltoCustNo_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Sell-to Customer No."))
                    {
                    }
                    column(OrderNoCaption_SalesShptHeader; OurDocumentNoLbl)
                    {
                    }
                    column(OrderNo_SalesShptHeader; "Sales Shipment Header"."Order No.")
                    {
                    }
                    column(ExternalDocumentNoCaption_SalesShptHeader; PurchaseOrderNoLbl)
                    {
                    }
                    column(ExternalDocumentNo_SalesShptHeader; "Sales Shipment Header"."External Document No.")
                    {
                    }
                    dataitem(Customer; Customer)
                    {
                        DataItemLink = "No." = field("Sell-to Customer No.");
                        DataItemLinkReference = "Sales Shipment Header";
                        dataitem("Comment Line"; "Comment Line")
                        {
                            DataItemLink = "No." = field("No.");
                            DataItemLinkReference = Customer;
                            DataItemTableView = where("Table Name" = filter(Customer), "Print on Invoice_LDR" = filter(true));
                            column(Comment; Comment) { }
                        }
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Sales Shipment Header";
                        DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(HeaderDimensionsCaption; HeaderDimensionsCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then begin
                                if not DimSetEntry1.FindSet() then
                                    CurrReport.Break();
                            end else
                                if not Continue then
                                    CurrReport.Break();

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 - %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        '%1; %2 - %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until DimSetEntry1.Next() = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowInternalInfo then
                                CurrReport.Break();
                        end;
                    }
                    dataitem("Sales Shipment Line"; "Sales Shipment Line")
                    {
                        DataItemLink = "Document No." = field("No.");
                        DataItemLinkReference = "Sales Shipment Header";
                        DataItemTableView = sorting("Document No.", "Line No.");
                        column(LineAmount_LDR; LineAmount_LDR) { }
                        column(UnitPrice_LDR; UnitPrice_LDR) { }
                        column(Description_SalesShptLine; Description)
                        {
                        }
                        column(ShowInternalInfofield; ShowInternalInfo)
                        {
                        }
                        column(ShowCorrectionLines; ShowCorrectionLines)
                        {
                        }
                        column(Type_SalesShptLine; Format(Type, 0, 2))
                        {
                        }
                        column(AsmHeaderExists; AsmHeaderExists)
                        {
                        }
                        column(DocumentNo_SalesShptLine; "Document No.")
                        {
                        }
                        column(LinNo; LinNo)
                        {
                        }
                        column(ItemReferenceNo_Line; "Item Reference No.")
                        {
                        }
                        column(ItemReferenceNo_Line_Lbl; FieldCaption("Item Reference No."))
                        {
                        }
                        column(Qty_SalesShptLine; Quantity)
                        {
                        }
                        column(UOM_SalesShptLine; "Unit of Measure")
                        {
                        }
                        column(No_SalesShptLine; "No.")
                        {
                        }
                        column(LineNo_SalesShptLine; "Line No.")
                        {
                        }
                        column(Description_SalesShptLineCaption; FieldCaption(Description))
                        {
                        }
                        column(Qty_SalesShptLineCaption; FieldCaption(Quantity))
                        {
                        }
                        column(UOM_SalesShptLineCaption; FieldCaption("Unit of Measure"))
                        {
                        }
                        column(No_SalesShptLineCaption; FieldCaption("No."))
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                            column(DimText1; DimText)
                            {
                            }
                            column(LineDimensionsCaption; LineDimensionsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then begin
                                    if not DimSetEntry2.FindSet() then
                                        CurrReport.Break();
                                end else
                                    if not Continue then
                                        CurrReport.Break();

                                Clear(DimText);
                                Continue := false;
                                repeat
                                    OldDimText := DimText;
                                    if DimText = '' then
                                        DimText := StrSubstNo('%1 - %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    else
                                        DimText :=
                                          StrSubstNo(
                                            '%1; %2 - %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                        DimText := OldDimText;
                                        Continue := true;
                                        exit;
                                    end;
                                until DimSetEntry2.Next() = 0;
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not ShowInternalInfo then
                                    CurrReport.Break();
                            end;
                        }
                        dataitem(DisplayAsmInfo; "Integer")
                        {
                            DataItemTableView = sorting(Number);
                            column(PostedAsmLineItemNo; BlanksForIndent() + PostedAsmLine."No.")
                            {
                            }
                            column(PostedAsmLineDescription; BlanksForIndent() + PostedAsmLine.Description)
                            {
                            }
                            column(PostedAsmLineQuantity; PostedAsmLine.Quantity)
                            {
                                DecimalPlaces = 0 : 5;
                            }
                            column(PostedAsmLineUOMCode; GetUnitOfMeasureDescr(PostedAsmLine."Unit of Measure Code"))
                            {
                            }

                            trigger OnAfterGetRecord()
                            var
                                ItemTranslation: Record "Item Translation";
                            begin
                                if Number = 1 then
                                    PostedAsmLine.FindSet()
                                else
                                    PostedAsmLine.Next();

                                if ItemTranslation.Get(PostedAsmLine."No.",
                                     PostedAsmLine."Variant Code",
                                     "Sales Shipment Header"."Language Code")
                                then
                                    PostedAsmLine.Description := ItemTranslation.Description;
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not DisplayAssemblyInformation then
                                    CurrReport.Break();
                                if not AsmHeaderExists then
                                    CurrReport.Break();

                                PostedAsmLine.SetRange("Document No.", PostedAsmHeader."No.");
                                SetRange(Number, 1, PostedAsmLine.Count);
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Quantity = 0 then begin
                                LineAmount_LDR := "Unit Price";
                                UnitPrice_LDR := "Unit Price";
                            end;/* else begin
                                //UnitPrice_LDR := Round((UnitPrice_LDR + LineDiscAmount_LDR) / Quantity, Currency."Unit-Amount Rounding Precision");
                                //LineAmount_LDR := Round(LineAmount_LDR * Quantity / Quantity, Currency."Amount Rounding Precision");

                            end;*/

                            LinNo := "Line No.";
                            if not ShowCorrectionLines and Correction then
                                CurrReport.Skip();

                            DimSetEntry2.SetRange("Dimension Set ID", "Dimension Set ID");
                            if DisplayAssemblyInformation then
                                AsmHeaderExists := AsmToShipmentExists(PostedAsmHeader);

                        end;

                        trigger OnPostDataItem()
                        begin
                            if ShowLotSN then begin
                                ItemTrackingDocMgt.SetRetrieveAsmItemTracking(true);
                                TrackingSpecCount :=
                                  ItemTrackingDocMgt.RetrieveDocumentItemTracking(
                                      TempTrackingSpecBuffer, "Sales Shipment Header"."No.", DATABASE::"Sales Shipment Header", 0);
                                ItemTrackingDocMgt.SetRetrieveAsmItemTracking(false);
                            end;
                        end;

                        trigger OnPreDataItem()
                        begin
                            MoreLines := Find('+');
                            while MoreLines and (Description = '') and ("No." = '') and (Quantity = 0) do
                                MoreLines := Next(-1) <> 0;
                            if not MoreLines then
                                CurrReport.Break();
                            SetRange("Line No.", 0, "Line No.");
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = const(1));
                    }
                    dataitem(Total2; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = const(1));
                        column(BilltoCustNo_SalesShptHeader; "Sales Shipment Header"."Bill-to Customer No.")
                        {
                        }
                        column(CustAddr1; CustAddr[1])
                        {
                        }
                        column(CustAddr2; CustAddr[2])
                        {
                        }
                        column(CustAddr3; CustAddr[3])
                        {
                        }
                        column(CustAddr4; CustAddr[4])
                        {
                        }
                        column(CustAddr5; CustAddr[5])
                        {
                        }
                        column(CustAddr6; CustAddr[6])
                        {
                        }
                        column(CustAddr7; CustAddr[7])
                        {
                        }
                        column(CustAddr8; CustAddr[8])
                        {
                        }
                        column(BilltoAddressCaption; BilltoAddressCaptionLbl)
                        {
                        }
                        column(BilltoCustNo_SalesShptHeaderCaption; "Sales Shipment Header".FieldCaption("Bill-to Customer No."))
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            if not ShowCustAddr then
                                CurrReport.Break();
                        end;
                    }
                    dataitem(ItemTrackingLine; "Integer")
                    {
                        DataItemTableView = sorting(Number);
                        column(TrackingSpecBufferNo; TempTrackingSpecBuffer."Item No.")
                        {
                        }
                        column(TrackingSpecBufferDesc; TempTrackingSpecBuffer.Description)
                        {
                        }
                        column(TrackingSpecBufferLotNo; TempTrackingSpecBuffer."Lot No.")
                        {
                        }
                        column(TrackingSpecBufferSerNo; TempTrackingSpecBuffer."Serial No.")
                        {
                        }
                        column(TrackingSpecBufferQty; TempTrackingSpecBuffer."Quantity (Base)")
                        {
                        }
                        column(ShowTotal; ShowTotal)
                        {
                        }
                        column(ShowGroup; ShowGroup)
                        {
                        }
                        column(QuantityCaption; QuantityCaptionLbl)
                        {
                        }
                        column(SerialNoCaption; SerialNoCaptionLbl)
                        {
                        }
                        column(LotNoCaption; LotNoCaptionLbl)
                        {
                        }
                        column(DescriptionCaption; DescriptionCaptionLbl)
                        {
                        }
                        column(NoCaption; NoCaptionLbl)
                        {
                        }
                        dataitem(TotalItemTracking; "Integer")
                        {
                            DataItemTableView = sorting(Number) where(Number = const(1));
                            column(Quantity1; TotalQty)
                            {
                            }
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then
                                TempTrackingSpecBuffer.FindSet()
                            else
                                TempTrackingSpecBuffer.Next();

                            if not ShowCorrectionLines and TempTrackingSpecBuffer.Correction then
                                CurrReport.Skip();
                            if TempTrackingSpecBuffer.Correction then
                                TempTrackingSpecBuffer."Quantity (Base)" := -TempTrackingSpecBuffer."Quantity (Base)";

                            ShowTotal := false;
                            if ItemTrackingAppendix.IsStartNewGroup(TempTrackingSpecBuffer) then
                                ShowTotal := true;

                            ShowGroup := false;
                            if (TempTrackingSpecBuffer."Source Ref. No." <> OldRefNo) or
                               (TempTrackingSpecBuffer."Item No." <> OldNo)
                            then begin
                                OldRefNo := TempTrackingSpecBuffer."Source Ref. No.";
                                OldNo := TempTrackingSpecBuffer."Item No.";
                                TotalQty := 0;
                            end else
                                ShowGroup := true;
                            TotalQty += TempTrackingSpecBuffer."Quantity (Base)";
                        end;

                        trigger OnPreDataItem()
                        begin
                            if TrackingSpecCount = 0 then
                                CurrReport.Break();
                            SetRange(Number, 1, TrackingSpecCount);
                            TempTrackingSpecBuffer.SetCurrentKey(
                                "Source ID", "Source Type", "Source Subtype", "Source Batch Name", "Source Prod. Order Line", "Source Ref. No.");
                        end;
                    }

                    trigger OnPreDataItem()
                    begin
                        // Item Tracking:
                        if ShowLotSN then begin
                            TrackingSpecCount := 0;
                            OldRefNo := 0;
                            ShowGroup := false;
                        end;
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    if Number > 1 then begin
                        CopyText := FormatDocument.GetCOPYText();
                        OutputNo += 1;
                    end;
                    TotalQty := 0;           // Item Tracking
                end;

                trigger OnPostDataItem()
                begin
                    if not IsReportInPreviewMode() then
                        Codeunit.Run(Codeunit::"Sales Shpt.-Printed", "Sales Shipment Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := 1 + Abs(NoOfCopies);
                    CopyText := '';
                    SetRange(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            var
                Customer: Record Customer;
                BarcodeStr: Code[20];
                BarcodeSymbology: Enum "Barcode Symbology";
                BarcodeFontProvider: Interface "Barcode Font Provider";                       //BARCODE SIMBOLOGY DECLARATION
            begin
                if Customer.Get("Sell-to Customer No.") then
                    CustVatRegNo := Customer."VAT Registration No.";
                CurrReport.Language := Language.GetLanguageIdOrDefault("Language Code");

                FormatAddressFields("Sales Shipment Header");
                FormatDocumentFields("Sales Shipment Header");

                if not CompanyBankAccount.Get("Sales Shipment Header"."Company Bank Account Code") then
                    CompanyBankAccount.CopyBankFieldsFromCompanyInfo(CompanyInfo);

                DimSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");

                if "Order No." <> '' then begin
                    BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;         //FONT PROVIDER IDAUTOMATION
                    BarcodeSymbology := Enum::"Barcode Symbology"::Code39;                        //SIMBOLOGY - "CODE 39" in this case
                    BarcodeStr := "Order No.";
                    BarcodeFontProvider.ValidateInput(BarcodeStr, BarcodeSymbology);              //VALIDATE INPUT DATA - NOT MANDATORY
                    EncodedText := BarcodeFontProvider.EncodeFont(BarcodeStr, BarcodeSymbology);  //ENCODETEXT in Barcode
                end;
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
                    field(NoOfCopiesfield; NoOfCopies)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'No. of Copies', comment = 'ESP="Nº de copias"';
                    }
                    field(ShowInternalInfofield; ShowInternalInfo)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Internal Information', comment = 'ESP="Muestra información interna"';
                        Visible = false;
                    }
                    field(LogInteractionfield; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction', comment = 'ESP="Log interacción"';
                        Enabled = LogInteractionEnable;
                    }
                    field(ValuedSalesShipment_LDR; ValuedSalesShipment)
                    {
                        ApplicationArea = All;
                        Caption = 'Valued sales shipment', comment = 'ESP="Albarán valorado"';
                    }
                    field("Show Correction Lines"; ShowCorrectionLines)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Correction Lines', comment = 'ESP="Muestra lineas de correción"';
                        Visible = false;
                    }
                    field(ShowLotSNfield; ShowLotSN)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Serial/Lot Number Appendix', comment = 'ESP="Muestra Nº Serie/Lote"';
                        Visible = false;
                    }
                    field(DisplayAsmInfofield; DisplayAssemblyInformation)
                    {
                        ApplicationArea = Assembly;
                        Caption = 'Show Assembly Components', comment = 'ESP="Muestra componentes de ensamblado"';
                        Visible = false;
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
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInfo.Get();
        SalesSetup.Get();
        FormatDocument.SetLogoPosition(SalesSetup."Logo Position on Documents", CompanyInfo1, CompanyInfo2, CompanyInfo3);
        NoOfCopies := 1;

    end;

    trigger OnPostReport()
    begin
        if LogInteraction and not IsReportInPreviewMode() then
            if "Sales Shipment Header".FindSet() then
                repeat
                    SegManagement.LogDocument(
                      5, "Sales Shipment Header"."No.", 0, 0, DATABASE::Customer, "Sales Shipment Header"."Sell-to Customer No.",
                      "Sales Shipment Header"."Salesperson Code", "Sales Shipment Header"."Campaign No.",
                      "Sales Shipment Header"."Posting Description", '');
                until "Sales Shipment Header".Next() = 0;
    end;

    trigger OnPreReport()
    var
        Customer: Record Customer;
    begin
        if CustomCompanyInfo.Get() then
            CustomCompanyInfo.CalcFields(Picture, "Legal Text_LDR", "Legal Text2_LDR", "Legal Text3_LDR");
        if Customer.Get("Sales Shipment Header"."Bill-to Customer No.") then
            ValuedSalesShipment := Customer."Valued Sales Shipment_LDR";

        if not CurrReport.UseRequestPage then
            InitLogInteraction();
        AsmHeaderExists := false;
    end;

    var
        CompanyBankAccount: Record "Bank Account";
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        CustomCompanyInfo: Record "Company Information";
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        PostedAsmHeader: Record "Posted Assembly Header";
        PostedAsmLine: Record "Posted Assembly Line";
        RespCenter: Record "Responsibility Center";
        SalesSetup: Record "Sales & Receivables Setup";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        TenantMedia: Record "Tenant Media";
        ItemTrackingAppendix: Report "Item Tracking Appendix";
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        ItemTrackingDocMgt: Codeunit "Item Tracking Doc. Management";
        Language: Codeunit Language;
        SegManagement: Codeunit SegManagement;
        AsmHeaderExists: Boolean;
        Continue: Boolean;
        DisplayAssemblyInformation: Boolean;
        LogInteraction: Boolean;
        [InDataSet]
        LogInteractionEnable: Boolean;
        MoreLines: Boolean;
        ShowCorrectionLines: Boolean;
        ShowCustAddr: Boolean;
        ShowGroup: Boolean;
        ShowInternalInfo: Boolean;
        ShowLotSN: Boolean;
        ShowTotal: Boolean;
        ValuedSalesShipment: Boolean;
        SiteCountry: Code[10];
        OldNo: Code[20];
        SitePostCode: Code[20];
        TotalQty: Decimal;
        LinNo: Integer;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        OldRefNo: Integer;
        OutputNo: Integer;
        TrackingSpecCount: Integer;
        AbsenceBodiesLbl: Label 'Absence of foreign bodies', comment = 'ESP="Ausencia de cuerpos extraños"';
        AbsenceMoldsLbl: Label 'Absence of molds', comment = 'ESP="Ausencia de mohos"';
        AbsenceOdorsLbl: Label 'Absence of foreign odors', comment = 'ESP="Ausencia de olores extraños"';
        AbsencePestsLbl: Label 'Absence of pests', comment = 'ESP="Ausencia de plagas"';
        AccordingAgencyLbl: Label 'According to agency', comment = 'ESP="Conforme agencia"';
        AccordingCustomerLbl: Label 'According to customer', comment = 'ESP="Conforme cliente"';
        AccordingLbl: Label 'ACCORDING', comment = 'ESP="CONFORME"';
        ACLbl: Label 'A.C.', comment = 'ESP="A.C."';
        Address2Lbl: Label 'Address 2', comment = 'ESP="Dirección 2"';
        AddressLbl: Label 'Address', comment = 'ESP="Dirección"';
        AgencyIdLbl: Label 'Agency ID', comment = 'ESP="D.N.I. Transportista"';
        AgencyRegistrationLbl: Label 'Agency registration', comment = 'ESP="Matrícula transportista"';
        AmountLbl: Label 'Amount', comment = 'ESP="Importe"';
        BankAccNoCaptionLbl: Label 'Account No.', comment = 'ESP="Nº cuenta"';
        BankNameCaptionLbl: Label 'Bank', comment = 'ESP="Banco"';
        BaseLbl: Label 'Base', comment = 'ESP="Base"';
        BeforeLoadingLbl: Label '(before loading)', comment = 'ESP="(antes de la carga)"';

        BilledToLbl: Label 'Billed to', comment = 'ESP="Facturado a"';
        BilltoAddressCaptionLbl: Label 'Bill-to Address', comment = 'ESP="Fact. a dirección"';
        BillToLbl: Label 'Bill to', comment = 'ESP="Facturar a"';
        BoxesLbl: Label 'Boxes', comment = 'ESP="Caj."';
        BundlesLbl: Label 'Bundles', comment = 'ESP="Bultos"';
        CityLbl: Label 'City', comment = 'ESP="Población"';
        CLbl: Label 'C', comment = 'ESP="C"';
        ClosingLbl: Label 'Sincerely', comment = 'ESP="Atentamente"';
        CodLineLbl: Label 'Code', comment = 'ESP="Cód."';
        CopyLbl: Label 'Copy', comment = 'ESP="Copia"';
        CountryLbl: Label 'Country', comment = 'ESP="País"';
        CountyLbl: Label 'County', comment = 'ESP="Provincia"';
        CustomerLbl: Label 'Customer', comment = 'ESP="Cliente"';
        DateLbl: Label 'Date', comment = 'ESP="Fecha"';
        DescriptionCaptionLbl: Label 'Description', comment = 'ESP="Descripción"';
        DescriptionLbl: Label 'Description', comment = 'ESP="Descripción"';
        DescriptionLineLbl: Label 'Description', comment = 'ESP="Descripción"';
        DestinytLbl: Label 'DESTINY', comment = 'ESP="DESTINO"';
        DiscountAmountLineLbl: Label 'Disc. Amt.', comment = 'ESP="Imp. Dto."';
        DiscountPercentLineLbl: Label 'Disc. %', comment = 'ESP="% Dto."';
        DiscountsLbl: Label 'Discounts', comment = 'ESP="Descuentos"';
        DocumentDateCaptionLbl: Label 'Document Date', comment = 'ESP="Fecha documento"';
        EmailCaptionLbl: Label 'Email', comment = 'ESP="Email"';
        EMailLbl: Label 'e-Mail', comment = 'ESP="e-Mail"';
        ExpDateLbl: Label 'Expiration Date', Comment = 'ESP="Fecha caducidad"';
        ExtRefOrderLbl: Label 'EXTERNAL ORDER REF.', comment = 'ESP="REF. EXTERNA PEDIDO"';
        FeeLbl: Label 'Share', comment = 'ESP="Cuota"';
        FromLbl: Label 'From', comment = 'ESP="Desde"';
        GiroNoCaptionLbl: Label 'Giro No.', comment = 'ESP="Giro Nº"';
        GreetingLbl: Label 'Hello', comment = 'ESP="Hola"';
        GrossTotalLbl: Label 'Total Gross', comment = 'ESP="Total Bruto"';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions', comment = 'ESP="Dimensiones cabecera"';
        HomePageCaptionLbl: Label 'Home Page', comment = 'ESP="Sitio web"';
        HygienicConditionLbl: Label 'Hygienic condition of the vehicle and absence of dust', comment = 'ESP="Estado higiénico del vehículo y ausencia de polvo"';
        ILbl: Label 'I', comment = 'ESP="I"';
        InvNoLbl: Label 'Shipment No.', comment = 'ESP="Cód. albarán"';
        InvoiceLbl: Label 'SHIPMENT', comment = 'ESP="ALBARÁN"';
        InvoiceNoLbl: Label 'Shipment No.', comment = 'ESP="Nº de albarán"';
        ItemLbl: Label 'Item', comment = 'ESP="Artículo"';
        ItemTrackingAppendixCaptionLbl: Label 'Item Tracking - Appendix', comment = 'ESP="Seguimiento producto - apéndice"';
        IVALbl: Label 'VAT', comment = 'ESP="IVA"';

        JobNo2Lbl: Label 'Job No.', comment = 'ESP="Cód. trabajo"';
        LineDimensionsCaptionLbl: Label 'Line Dimensions', comment = 'ESP="Dimensiones linea/s"';
        LoadDateLbl: Label 'Load date', comment = 'ESP="Fecha carga"';
        LocationLbl: Label 'Loc.', comment = 'ESP="Alm."';
        LotLbl: Label 'Lot', comment = 'ESP="Lote"';
        LotNoCaptionLbl: Label 'Lot No.', comment = 'ESP="Nº lote"';
        MerchandiseCompatibilityLbl: Label 'Merchandise Compatibility', comment = 'ESP="Compatibilidad de mercancía"';
        NoCaptionLbl: Label 'No.', comment = 'ESP="Nº"';
        ObservationLbl: Label 'Observations', comment = 'ESP="Observaciones"';
        OrderNoLbl: Label 'ORDER NO.', comment = 'ESP="Nº PEDIDO"';
        OurDocumentNoLbl: Label 'Our Document No.', comment = 'ESP="Nuestro nº documento"';
        PackQuantityLbl: Label 'Packaging quantity', comment = 'ESP="Cantidad embalaje"';
        PageCaptionCapLbl: Label 'Page %1 of %2', comment = 'ESP="Pág. %1 de %2"';
        PageLbl: Label 'Page', comment = 'ESP="Página"';
        PalletLbl: Label 'Pallets', comment = 'ESP="Palets"';
        PalletsInfoLbl: Label 'Pallets (firm, dry, clean, free of damage and contamination)', comment = 'ESP="Palets (fimes, secos limpios, libres de daños y contaminación)"';
        PaymentMethodLbl: Label 'Payment method', comment = 'ESP="Forma de pago"';
        PhoneLbl: Label 'Phone No.', comment = 'ESP="Telf"';
        PhoneNoCaptionLbl: Label 'Phone No.', comment = 'ESP="Nº teléfono"';
        PortsLbl: Label 'Ports', comment = 'ESP="Portes"';

        PriceLbl: Label 'Price', comment = 'ESP="Precio"';
        PriceLineLbl: Label 'Price', comment = 'ESP="Precio"';
        PricePerLbl: Label 'Price per', comment = 'ESP="Precio por"';
        ProcessPlantLbl: Label 'Process plant', comment = 'ESP="Planta proceso"';
        ProductTemperatureLbl: Label 'Product temperature (Tª.........ºC)', comment = 'ESP="Temperatura del producto (Tª........ºC)"';
        PurchaseOrderNoLbl: Label 'Purchase Order No.', comment = 'ESP="Nº pedido compra"';
        QtyLbl: Label 'Qty', comment = 'ESP="Cant."';
        QuantityCaptionLbl: Label 'Quantity', comment = 'ESP="Cantidad"';
        QuantityLbl: Label 'Quantity', comment = 'ESP="Cantidad"';
        QuantityLineLbl: Label 'Quantity', comment = 'ESP="Cantidad"';
        REAmountLbl: Label 'RE Amt.', comment = 'ESP="Imp. RE"';
        RecLbl: Label 'Rec.', comment = 'ESP="Rec."';
        RegisteredOfficeLbl: Label 'Registered office', comment = 'ESP="Sede social"';
        REPercentLbl: Label '% R.E.', comment = 'ESP="% R.E."';
        ResponsibleSignatureLbl: Label 'RESPONSIBLE SIGNATURE', comment = 'ESP="FIRMA RESPONSABLE"';
        ReturnedPackagingLbl: Label 'RETURNED PACKAGING', comment = 'ESP="ENVASES DEVUELTOS"';
        ReturnedPalletLbl: Label 'RETURNED PALETS', comment = 'ESP="PALETS DEVUELTOS"';
        SerialNoCaptionLbl: Label 'Serial No.', comment = 'ESP="Nº serie"';
        ShipmentAddressLbl: Label 'SHIPMENT ADDRESS:', comment = 'ESP="DIRECCIÓN DE ENVÍO:"';
        ShipmentControlLbl: Label 'SHIPMENT CONTROL', comment = 'ESP="CONTROL EXPEDICIÓN"';
        ShipmentDateCaptionLbl: Label 'Shipment Date', comment = 'ESP="Fecha de envío"';
        ShipmentLbl: Label 'SHIPMENT', comment = 'ESP="ALBARÁN"';
        ShipmentNoCaptionLbl: Label 'Shipment No.', comment = 'ESP="Nº envío"';
        ShipmentNoLbl: Label 'Shipment No.', comment = 'ESP="No. Albarán"';
        ShipmentTLbl: Label 'SHIPMENT T.', comment = 'ESP="T. ALBARAN"';
        ShipToLbl: Label 'Ship to', comment = 'ESP="Entregar a"';
        TemperatureLbl: Label 'TEMPERATURE', comment = 'ESP="TEMPERATURA"';
        Text002Lbl: Label 'Sales - Shipment %1', Comment = 'Ventas - Envío %1';
        ThanksLbl: Label 'Thank You!', comment = 'ESP="Gracias!"';
        TotalInvoiceLbl: Label 'TOTAL SHIPMENT', comment = 'ESP="TOTAL ALBARÁN"';
        TotalLbl: Label 'Total', comment = 'ESP="Total"';
        TransportLbl: Label 'Transport', comment = 'ESP="Transportista"';
        UnfavorableHumidityLbl: Label 'unfavorable humidity', comment = 'ESP="Humedad desfavorable"';
        UnitLbl: Label 'Unit', comment = 'ESP="Unidad"';
        UnitOfMeasureLineLbl: Label 'U.M.', comment = 'ESP="U.M."';
        UnitsLbl: Label 'Units', comment = 'ESP="Uni."';
        VATAmtLbl: Label 'VAT Amt.', comment = 'ESP="Imp. IVA"';
        VatPercentLbl: Label 'VAT %', comment = 'ESP="% IVA"';
        VATRegNoCaptionLbl: Label 'VAT Reg. No.', comment = 'ESP="N.I.F. - D.N.I."';

        VATRegNoLbl: Label 'VAT Registration No.', comment = 'ESP="CIF"';
        VehicleTemperatureLbl: Label 'Vehicle temperature (Tª........ºC)', comment = 'ESP="Temperatura del vehículo (Tª........ºC)"';
        WeightLbl: Label 'Weight', comment = 'ESP="Peso"';
        YourOrderLbl: Label 'Your No./Order', comment = 'ESP="Su pedido"';
        EncodedText: Text;
        CustVatRegNo: Text[20];
        SalesPersonText: Text[20];
        CopyText: Text[30];
        SiteCity: Text[30];
        SiteCounty: Text[30];
        SitePhoneNo: Text[30];
        OldDimText: Text[75];
        ReferenceText: Text[80];
        CompanyAddr: array[8] of Text[100];
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        SiteAddress: Text[100];
        DimText: Text[120];

    protected var
        TempTrackingSpecBuffer: Record "Tracking Specification" temporary;

    procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(5) <> '';
    end;

    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean; NewShowCorrectionLines: Boolean; NewShowLotSN: Boolean; DisplayAsmInfo: Boolean)
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        LogInteraction := NewLogInteraction;
        ShowCorrectionLines := NewShowCorrectionLines;
        ShowLotSN := NewShowLotSN;
        DisplayAssemblyInformation := DisplayAsmInfo;
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody());
    end;

    local procedure FormatAddressFields(SalesShipmentHeader: Record "Sales Shipment Header")
    begin
        FormatAddr.GetCompanyAddr(SalesShipmentHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.SalesShptShipTo(ShipToAddr, SalesShipmentHeader);
        ShowCustAddr := FormatAddr.SalesShptBillTo(CustAddr, ShipToAddr, SalesShipmentHeader);
    end;

    local procedure FormatDocumentFields(SalesShipmentHeader: Record "Sales Shipment Header")
    begin
        with SalesShipmentHeader do begin
            FormatDocument.SetSalesPerson(SalesPurchPerson, "Salesperson Code", SalesPersonText);
            ReferenceText := FormatDocument.SetText("Your Reference" <> '', FieldCaption("Your Reference"));
        end;
    end;

    local procedure GetUnitOfMeasureDescr(UOMCode: Code[10]): Text[50]
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        if not UnitOfMeasure.Get(UOMCode) then
            exit(UOMCode);
        exit(UnitOfMeasure.Description);
    end;

    procedure BlanksForIndent(): Text[10]
    begin
        exit(PadStr('', 2, ' '));
    end;
}

