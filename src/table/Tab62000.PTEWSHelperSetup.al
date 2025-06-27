table 62000 "PTE WSHelper Setup"
{
    Caption = 'WSHelper Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "FTP User Name"; Text[50])
        {
            Caption = 'FTP User Name';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(3; "FTP Password Key"; Guid)
        {
            Caption = 'FTP Password Key';
        }
        field(4; "FTP Address"; Text[250])
        {
            Caption = 'FTP Address';
            ExtendedDatatype = URL;
        }
        field(5; "Azure Function URL"; Text[250])
        {
            Caption = 'Azure Function URL';
            ExtendedDatatype = URL;

            trigger OnValidate()
            var
                HttpWebRequestMgt: Codeunit "Http Web Request Mgt.";
            begin
                if "Azure Function URL" = '' then
                    exit;
                HttpWebRequestMgt.CheckUrl("Azure Function URL");
                while (StrLen("Azure Function URL") > 8) and ("Azure Function URL"[StrLen("Azure Function URL")] = '/') do
                    "Azure Function URL" := CopyStr("Azure Function URL", 1, StrLen("Azure Function URL") - 1);
            end;
        }
        field(6; "WSHelper Base URL"; Text[250])
        {
            Caption = 'WSHelper Base URL';
            ExtendedDatatype = URL;

            trigger OnValidate()
            var
                HttpWebRequestMgt: Codeunit "Http Web Request Mgt.";
            begin
                if "WSHelper Base URL" = '' then
                    exit;
                HttpWebRequestMgt.CheckUrl("WSHelper Base URL");
                while (StrLen("WSHelper Base URL") > 8) and ("WSHelper Base URL"[StrLen("WSHelper Base URL")] = '/') do
                    "WSHelper Base URL" := CopyStr("WSHelper Base URL", 1, StrLen("WSHelper Base URL") - 1);
            end;
        }
        field(7; "Authorization Key"; Guid)
        {
            Caption = 'Authorization Key';
        }
        field(8; "Distributor Name"; Text[100])
        {
            Caption = 'Distributor Name';
        }
        field(9; Distributor; Boolean)
        {
            Caption = 'Distributor';
        }
        field(10; "WSHelper User Name"; Text[50])
        {
            Caption = 'WSHelper User Name';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(11; "WSHelper Pass. Key GUID"; Guid)
        {
            Caption = 'WSHelper Password Key GUID';
        }
        field(12; "SyncedRowVersion Cust. WS"; BigInteger)
        {
            Caption = 'Synced RowVersion Customer';
            MinValue = 0;
        }
        field(13; Enabled; Boolean)
        {
            Caption = 'Enabled';

            trigger OnValidate()
            var
                CompanyInformation: Record "Company Information";
                WSHelperDistMgt: Codeunit "PTE WSHelper Dist. Mgt";
                WSHelperMgt: Codeunit "PTE WSHelper Mgt";
                CustomerConsentMgt: Codeunit "Customer Consent Mgt.";
            begin
                if not xRec."Enabled" and Rec."Enabled" then
                    Rec."Enabled" := CustomerConsentMgt.ConfirmUserConsent();

                if Rec.Enabled then begin
                    if Rec.Distributor then
                        WSHelperDistMgt.SetupConnection(Rec);
                    IF confirm(CreateJobLabel, false) then begin
                        WSHelperMgt.SetupConnection(Rec);
                        ScheduleJobQueueEntries();

                        if Confirm(JobQEntriesCreatedQst) then
                            ShowJobQueueEntry();
                    end;
                end else begin
                    CancelJobQueueEntries();
                end;
            end;
        }
        field(15; "Resource Category Code"; Code[20])
        {
            Caption = 'Resource Category Code';
            TableRelation = "Item Category";
        }
        field(16; "Resource Available Qty."; Decimal)
        {
            Caption = 'Resource Available Qty.';
            InitValue = 100;
        }
        field(20; "No of Orders"; Integer)
        {
            Caption = 'No of Orders';
            FieldClass = FlowField;
            CalcFormula = count("PTE WSHelper Order Header");
            Editable = false;
        }
        field(21; "No of Purchase Orders"; Integer)
        {
            Caption = 'No of Purchase Orders';
            FieldClass = FlowField;
            CalcFormula = count("PTE WSHelper Purch. Order Hdr");
            Editable = false;
        }
        field(23; "SyncedRowVersion Cust. FTP "; BigInteger)
        {
            Caption = 'Synced RowVersion Customer';
            MinValue = 0;
        }
        field(24; "No of Customers Exported"; Integer)
        {
            Caption = 'No of Customers Exported';
            FieldClass = FlowField;
            CalcFormula = count("PTE WSH Customer Export");
            Editable = false;
        }
        field(25; Test; Boolean)
        {
            Caption = 'Test';
            DataClassification = ToBeClassified;
        }

        field(27; "SyncedDatetime Cust. FTP"; Datetime)
        {
            Caption = 'Synced Datetime Customer FTP';
            Editable = false;
        }
        field(28; "Allow Cust. integration Delete"; Boolean)
        {
            Caption = 'Allow Customer Integration Delete';
            Editable = false;
        }
        field(29; "WSHelper Password Key Basic"; Text[250])
        {
            Caption = 'WSHelper Password Key Basic';
        }
        field(100; "Dimension Code Department"; Code[20])
        {
            Caption = 'Dimension Code Department';
            TableRelation = Dimension.Code;
        }
        field(101; "Dimension Code Project"; Code[20])
        {
            Caption = 'Dimension Code Project';
            TableRelation = Dimension.Code;
        }


    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        DeletePassword("FTP Password Key");
        DeletePassword("Authorization Key");
    end;

    trigger OnInsert()
    begin
        TestField("Primary Key", '');
    end;

    var
        MustBeEnabledErr: Label 'The WSHelper Dist. service is not enabled.\\In the WSHelper Dist. Service Setup window, select the Enabled check box.';
        JobQEntriesCreatedQst: Label 'Job queue entries for sending data to WSHelper have been created.\\Do you want to open the Job Queue Entries window?';
        BasicAuthLbl: Label 'Basic %1', Locked = true;
        UserPassLbl: Label '%1:%2', Locked = true;
        JobQEntriesCreatedMsg: Label 'Job queue entries could not be created due to the following error.\\%1', Comment = '%1 = GetLastErrorText';
        CreateJobLabel: label 'Want to create Job queue entries for sending data to Opter?';

    procedure GetWSHelperAuthentication() Result: Text
    var
        Base64Convert: Codeunit "Base64 Convert";
    begin
        Result := StrSubstNo(BasicAuthLbl, Base64Convert.ToBase64(StrSubstNo(UserPassLbl, Rec."WSHelper User Name", GetPassword(Rec."WSHelper Pass. Key GUID"))));
    end;

    [NonDebuggable]
    procedure SavePassword(var PasswordKey: Guid; PasswordText: Text)
    begin
        if IsNullGuid(PasswordKey) then begin
            PasswordKey := CreateGuid();
            Modify();
        end;
        IsolatedStorage.Set(PasswordKey, PasswordText, DATASCOPE::Company);
    end;

    [NonDebuggable]
    procedure GetPassword(PasswordKey: Guid): Text
    var
        Value: Text;
    begin
        if IsolatedStorage.Contains(PasswordKey, DATASCOPE::Company) then
            IsolatedStorage.Get(PasswordKey, DATASCOPE::Company, Value);
        exit(Value);
    end;


    local procedure DeletePassword(PasswordKey: Guid)
    begin
        IsolatedStorage.Delete(PasswordKey, DATASCOPE::Company);
    end;

    [NonDebuggable]
    procedure HasPassword(PasswordKey: Guid): Boolean
    var
        Value: Text;
    begin
        if IsolatedStorage.Contains(PasswordKey, DATASCOPE::Company) then
            IsolatedStorage.Get(PasswordKey, DATASCOPE::Company, Value);
        exit(Value <> '');
    end;

    procedure CheckEnabled()
    begin
        if not Enabled then
            Error(MustBeEnabledErr);
    end;

    local procedure ScheduleJobQueueEntries()
    var
        Success: Boolean;
    begin
        Success := Codeunit.Run(Codeunit::"PTE Schedule WSHelper JobQ.", Rec);
        if not Success then
            Message(JobQEntriesCreatedMsg, GetLastErrorText());
    end;

    local procedure CancelJobQueueEntries()
    begin
        CancelJobQueueSend();
    end;

    local procedure CancelJobQueueEntry(ObjType: Option; ObjID: Integer)
    var
        JobQueueEntry: Record "Job Queue Entry";
    begin
        if JobQueueEntry.FindJobQueueEntry(ObjType, ObjID) then
            JobQueueEntry.Cancel();
    end;

    procedure CancelJobQueueSend()
    var
        JobQueueEntry: Record "Job Queue Entry";
    begin
        CancelJobQueueEntry(JobQueueEntry."Object Type to Run"::Codeunit,
          CODEUNIT::"PTE WSHelper Dist Product Job");
        CancelJobQueueEntry(JobQueueEntry."Object Type to Run"::Codeunit,
          CODEUNIT::"PTE WSHelper Customer Job FTP");
        CancelJobQueueEntry(JobQueueEntry."Object Type to Run"::Codeunit,
          CODEUNIT::"PTE WSHelper Order Job");
    end;

    procedure ShowJobQueueEntry()
    var
        JobQueueEntry: Record "Job Queue Entry";
    begin
        JobQueueEntry.SetRange("Object Type to Run", JobQueueEntry."Object Type to Run"::Codeunit);
        JobQueueEntry.SetFilter("Object ID to Run", '%1|%2|%3|%4|%5',
          CODEUNIT::"PTE WSHelper Dist Product Job",
          CODEUNIT::"PTE WSHelper Customer Job FTP",
          CODEUNIT::"PTE WSHelper Order Job");
        if JobQueueEntry.FindFirst() then
            PAGE.Run(PAGE::"Job Queue Entries", JobQueueEntry);
    end;


}

