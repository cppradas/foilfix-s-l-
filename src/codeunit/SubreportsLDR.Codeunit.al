codeunit 50111 "Sub reports_LDR"
{
    Access = Public;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', false, false)]
    local procedure SubstituteReport(ReportId: Integer; var NewReportId: Integer)
    begin
        case ReportId of
            1305:
                NewReportId := Report::"Custom Sales - Order Conf_LDR";
        end
    end;
}