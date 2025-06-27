codeunit 62000 "PTE WSHelper Dist. Mgt"
{


    internal procedure ExportDistProducts(var Dest: OutStream) Success: Boolean
    var
        Dist: xmlport "PTE WSHelper Dist Products";
    begin
        Dist.SetDestination(Dest);
        if Dist.Export() then
            exit(true)
        else
            exit(false);
    end;



    internal procedure Transfer(DestFileName: Text; var Source: InStream) Success: Boolean
    var
        Setup: Record "PTE WSHelper Setup";
        Base64Convert: Codeunit "Base64 Convert";
        Client: HttpClient;
        Content: HttpContent;
        Headers: HttpHeaders;
        Response: HttpResponseMessage;
        JsonBody: text;
    begin
        Setup.Get();
        JsonBody := '{"host": "' + Setup."FTP Address" +
        '","username": "' + Setup."FTP User Name" +
        '","password": "' + Setup.GetPassword(Setup."FTP Password Key") +
        '","remotePath": "' + DestFileName +
        '","base64":"' + Base64Convert.ToBase64(Source) +
        '"}';

        LastErrorMsg := '';
        Client.Clear();
        Content.WriteFrom(JsonBody);
        Content.GetHeaders(Headers);
        if Headers.Contains('Content-Type') then
            Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'application/json');
        Headers.Add('x-functions-key', Setup.GetPassword(Setup."Authorization Key"));

        Success := Client.Post(Setup."Azure Function URL", Content, Response);
        if Success then
            if not Response.IsSuccessStatusCode() then
                Success := false;
        if not Success then
            LastErrorMsg := Response.ReasonPhrase();
    end;

    internal procedure GetLastErrorMsg() Result: Text
    begin
        exit(LastErrorMsg);
    end;

    internal procedure SetupConnection(var Setup: Record "PTE WSHelper Setup"): Boolean
    begin
        if not HasCredentials(Setup) then
            Error(MissingDistrFieldsErr);
        exit(true);
    end;

    local procedure HasCredentials(Setup: Record "PTE WSHelper Setup"): Boolean
    begin
        exit(
          Setup.Get() and
          (Setup."Distributor Name" <> '') and
          (Setup."FTP Address" <> '') and
          (Setup."Azure Function URL" <> '') and
          Setup.HasPassword(Setup."FTP Password Key") and
          Setup.HasPassword(Setup."Authorization Key") and
          (Setup."FTP User Name" <> ''));
    end;

    var
        MissingDistrFieldsErr: Label 'You must complete the fields for distributor.';
        LastErrorMsg: Text;
}

