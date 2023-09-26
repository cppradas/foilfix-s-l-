/// <summary>
/// Codeunit PlannerIntegration_LDR (ID 50100).
/// </summary>
codeunit 50100 PlannerIntegration_LDR
{
    Access = Internal;

    [EventSubscriber(ObjectType::Table, Database::"Production Order", 'OnAfterDeleteEvent', '', false, false)]
    local procedure OnAfterDeleteEventCustomer(var Rec: Record "Production Order"; RunTrigger: Boolean)
    begin
        if Rec.Status <> Rec.Status::Released then
            exit;

        SendRequest(Rec."No.");
    end;

    /// <summary>
    /// GetResponse.
    /// </summary>
    /// <param name="OrderNo">Code[20].</param>
    local procedure SendRequest(OrderNo: Code[20])
    var
        AuxHttpClient: HttpClient;
        ContentHttpContent: HttpContent;
        ContentHeaders: HttpHeaders;
        AuxHttpRequestMessage: HttpRequestMessage;
        AuxHttpResponseMessage: HttpResponseMessage;
        ContentJsonObject: JsonObject;
        UrlLbl: Label 'http://192.168.1.86:3000', comment = 'ESP="http://192.168.1.86:3000"'; //TODO: Paremetrizar la URL en un campo de alguna tabla de configuración.
        JsonData: Text;
    begin
        ContentJsonObject.Add('order', OrderNo);
        ContentJsonObject.WriteTo(JsonData);
        ContentHttpContent.WriteFrom(JsonData);

        ContentHttpContent.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');

        AuxHttpRequestMessage.Method := 'POST';
        AuxHttpRequestMessage.SetRequestUri(UrlLbl);
        AuxHttpRequestMessage.Content(ContentHttpContent);

        AuxHttpClient.Send(AuxHttpRequestMessage, AuxHttpResponseMessage);
    end;
}