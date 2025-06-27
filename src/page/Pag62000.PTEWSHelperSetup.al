page 62000 "PTE WSHelper Setup"
{
    ApplicationArea = All;
    Caption = 'WSHelper Setup';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = Card;
    ShowFilter = false;
    SourceTable = "PTE WSHelper Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Distributor; Rec.Distributor)
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field(SyncedRowVersionWS; Rec."SyncedRowVersion Cust. WS")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field(SyncedRowVersionFTP; Rec."SyncedRowVersion Cust. FTP ")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = False;
                }
                field("SyncedDatetime Cust. FTP"; Rec."SyncedDatetime Cust. FTP")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = False;
                }
                field(Test; Rec.Test)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = true;
                    ShowMandatory = true;
                    Visible = true;

                }
                group(Control25)
                {
                    ShowCaption = false;
                    field(Enabled; Rec.Enabled)
                    {
                        ApplicationArea = Basic, Suite;

                        trigger OnValidate()
                        begin
                            //UpdateBasedOnEnable();
                            CurrPage.Update();
                        end;
                    }
                    //field(ShowEnableWarning; ShowEnableWarning)
                    //{
                    //    ShowCaption = false;
                    //    ApplicationArea = Basic, Suite;
                    //    AssistEdit = false;
                    //    Editable = false;
                    //    Enabled = NOT EditableByNotEnabled;
                    //    trigger OnDrillDown()
                    //    begin
                    //        DrilldownCode();
                    //    end;
                    //}
                }
            }
            group(Distributor_Group)
            {
                Caption = 'Distributor';
                Editable = Rec.Distributor;

                field("Supplier Name"; Rec."Distributor Name")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = true;
                    ShowMandatory = true;
                    Visible = false;
                }

                group("FTP Service")
                {
                    Caption = 'FTP Service';
                    Visible = false;
                    field("FTP Address"; Rec."FTP Address")
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = true;
                        ShowMandatory = true;
                        trigger OnValidate()
                        begin
                            CurrPage.SaveRecord();
                        end;
                    }
                    field("FTP User Name"; Rec."FTP User Name")
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = true;
                        ShowMandatory = true;
                        trigger OnValidate()
                        begin
                            CurrPage.SaveRecord();
                        end;
                    }
                    //field("FTP Password"; FTPPassword)
                    //{
                    //    ApplicationArea = Basic, Suite;
                    //    Caption = 'Password';
                    //    Editable = true;
                    //    ExtendedDatatype = Masked;
                    //    ShowMandatory = true;

                    //    trigger OnValidate()
                    //    begin
                    //        Rec.SavePassword(Rec."FTP Password Key", FTPPassword);
                    //        if FTPPassword <> '' then
                    //            CheckEncryption();
                    //    end;
                    //}
                }
                group(AzureService)
                {
                    Caption = 'Azure Service';
                    field("Azure Function URL"; Rec."Azure Function URL")
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = true;
                        ShowMandatory = true;
                        Visible = False;

                    }

                    // field(AuthorizationKey; AuthorizationKey)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'Authorization Key';
                    //     Editable = true;
                    //     //ExtendedDatatype = Masked;
                    //     ShowMandatory = true;

                    //     trigger OnValidate()
                    //     begin
                    //         Rec.SavePassword(Rec."Authorization Key", AuthorizationKey);
                    //         if AuthorizationKey <> '' then
                    //             CheckEncryption();
                    //     end;
                    // }

                    field(AuthorizationKey; rec."FTP Password Key")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Authorization Key';
                        Editable = true;
                        //ExtendedDatatype = Masked;
                        ShowMandatory = true;
                        Visible = false;
                        trigger OnValidate()
                        begin
                            //Rec.SavePassword(Rec."Authorization Key", AuthorizationKey);
                            //if AuthorizationKey <> '' then
                            //    CheckEncryption();
                        end;
                    }
                }
            }
            group(WSHelperAPI)
            {
                Caption = 'WSHelper API';
                field("WSHelper Base URL"; Rec."WSHelper Base URL")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = true;
                    ShowMandatory = true;
                }
                field("WSHelper User Name"; Rec."WSHelper User Name")
                {
                    ApplicationArea = Basic, Suite;
                    //Editable = EditableByNotEnabled;
                    Editable = true;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                    end;
                }
                // field("WSHelper Password Key"; WSHelperPassword)
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Password';
                //     //Editable = EditableByNotEnabled;
                //     //ExtendedDatatype = Masked;
                //     Editable = true;
                //     ShowMandatory = true;

                //     trigger OnValidate()
                //     begin
                //         Rec.SavePassword(Rec."WSHelper Password Key", WSHelperPassword);
                //         if WSHelperPassword <> '' then
                //             CheckEncryption();
                //     end;
                // }
                field("WSHelper Password Key"; Rec."WSHelper Password Key Basic")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Password GUID';
                    //Editable = EditableByNotEnabled;
                    //ExtendedDatatype = Masked;
                    Editable = true;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin

                    end;
                }
                field("WSHelper Pass Key GUID"; Rec."WSHelper Pass. Key GUID")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Password Basic';
                    //Editable = EditableByNotEnabled;
                    //ExtendedDatatype = Masked;
                    Editable = true;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin

                    end;
                }
                field("Dimension Code Department"; Rec."Dimension Code Department")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Dimension Code Department';
                    Editable = true;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin

                    end;
                }
                field("Dimension Code Project"; Rec."Dimension Code Project")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Dimension Code Project';
                    Editable = true;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin

                    end;
                }
                field("No of Customers Exported"; Rec."No of Customers Exported")
                {
                    ApplicationArea = All;
                }
                field("Allow Cust. integration Delete"; Rec."Allow Cust. integration Delete")
                {
                    ApplicationArea = All;
                }
                field("No of Orders"; Rec."No of Orders")
                {
                    ApplicationArea = All;
                }
                field("No of Purchase Orders"; Rec."No of Purchase Orders")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(processing)
        {
            group(RunJob)
            {
                Caption = 'Run Job';
                // group(Distr)
                // {
                //     Caption = 'Distributor';
                //     action(Product)
                //     {
                //         ApplicationArea = Basic, Suite;
                //         Caption = 'Product';
                //         Enabled = Rec.Enabled;
                //         Image = NewItem;
                //         trigger OnAction()
                //         var
                //             JobQueueEntry: Record "Job Queue Entry";
                //         begin
                //             JobQueueEntry."Parameter String" := '/price.zip';
                //             Codeunit.Run(Codeunit::"PTE WSHelper Dist Product Job", JobQueueEntry);
                //         end;
                //     }

            }
            group(Integration)
            {
                Caption = 'Integration';

                // action(GetOrders)
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Get Orders';
                //     Enabled = Rec.Enabled;
                //     Image = GetOrder;

                //     trigger OnAction()
                //     var
                //         JobQueueEntry: Record "Job Queue Entry";
                //         WSHelperOrderJob: Codeunit "PTE WSHelper Order Job";
                //     begin
                //         WSHelperOrderJob.Run(JobQueueEntry);
                //     end;
                // }
                action(CustomerWSJson)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer WS Json';
                    Enabled = Rec.Enabled;
                    Image = NewCustomer;
                    trigger OnAction()
                    var
                        Customer: Record Customer;
                        CustomerExport: record "PTE WSH Customer Export";
                        CustomerExport2: record "PTE WSH Customer Export";
                        Customer2: Record Customer;
                        WSHelperMgt: Codeunit "PTE WSHelper Mgt";
                        LastRowVersion: BigInteger;
                    begin
                        //10.0 or greater
                        //LastRowVersion := LastUsedRowVersion();
                        //Customer.SetRange(SystemRowVersion, Rec."SyncedRowVersion Cust. WS", LastRowVersion);
                        CustomerExport.Setrange("Export OK", False);
                        IF CustomerExport.FindSet() then
                            repeat
                                IF CustomerExport."Export status" <> CustomerExport."Export status"::Deleted then
                                    Customer2.get(CustomerExport."Customer No.")
                                else begin
                                    IF CustomerExport."Opter ID" = 0 then
                                        error('Cant delete a post that is missing its Opter ID');
                                end;
                                if not WSHelperMgt.SendCustomersWS_json(Customer2, CustomerExport) then;
                                CustomerExport.modify();

                            until CustomerExport.next() = 0;

                        CurrPage.Update(true);

                    end;
                }
                action(CustomerWSxml)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer WS Json XML';
                    Enabled = Rec.Enabled;
                    Image = NewCustomer;
                    visible = false;
                    trigger OnAction()
                    var
                        Customer: Record Customer;
                        CustomerExport: record "PTE WSH Customer Export";
                        CustomerExport2: record "PTE WSH Customer Export";
                        Customer2: Record Customer;
                        WSHelperMgt: Codeunit "PTE WSHelper Mgt";
                        LastRowVersion: BigInteger;
                    begin
                        //10.0 or greater
                        //LastRowVersion := LastUsedRowVersion();
                        //Customer.SetRange(SystemRowVersion, Rec."SyncedRowVersion Cust. WS", LastRowVersion);
                        CustomerExport.Setrange("Export OK", False);
                        IF CustomerExport.FindSet() then
                            repeat
                                IF CustomerExport."Export status" <> CustomerExport."Export status"::Deleted then
                                    Customer2.get(CustomerExport."Customer No.")
                                else begin
                                    IF CustomerExport."Opter ID" = 0 then
                                        error('Cant delete a post that is missing its Opter ID');
                                end;
                                if not WSHelperMgt.SendCustomersWS_xml(Customer2, CustomerExport) then;
                                CustomerExport.modify();

                            until CustomerExport.next() = 0;

                        CurrPage.Update(true);

                    end;
                }
                action(CustomerFTP)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer FTP';
                    Enabled = Rec.Enabled;
                    Image = NewCustomer;
                    Visible = false;
                    trigger OnAction()
                    var
                        Customer: Record Customer;
                        WSHelperMgt: Codeunit "PTE WSHelper Mgt";
                        LastRowVersion: BigInteger;
                    begin

                        //10.0 or greater
                        //LastRowVersion := LastUsedRowVersion();
                        Customer.SETRANGE(SystemModifiedAt, Rec."SyncedDatetime Cust. FTP", CurrentDateTime);
                        if Customer.IsEmpty then
                            exit;
                        if not WSHelperMgt.SendCustomersFTP(Customer) then
                            Error(WSHelperMgt.GetLastErrorMsg());
                        Rec."SyncedRowVersion Cust. FTP " := LastRowVersion;
                        CurrPage.Update(true);
                    end;
                }
            }
            group(XmlPorts)
            {
                Caption = 'XmlPorts';
                //     action(Products)
                //     {
                //         ApplicationArea = Basic, Suite;
                //         Caption = 'Products';
                //         Enabled = Rec.Enabled;
                //         Image = XMLFile;

                //         trigger OnAction()
                //         begin
                //             Xmlport.Run(XmlPort::"PTE WSHelper Dist Products", true);
                //         end;
                //     }
                //     action(StockLevels)
                //     {
                //         ApplicationArea = Basic, Suite;
                //         Caption = 'StockLevels';
                //         Enabled = Rec.Enabled;
                //         Image = XMLFile;
                //         trigger OnAction()
                //         begin
                //             //Xmlport.Run(XmlPort::"PTE WSHelper Dist StockLevels", true);
                //         end;
                //     }
                //     action(Customers)
                //     {
                //         ApplicationArea = Basic, Suite;
                //         Caption = 'Customers';
                //         Enabled = Rec.Enabled;
                //         Image = XMLFile;
                //         trigger OnAction()
                //         begin
                //             Xmlport.Run(XmlPort::"PTE WSHelper Customer FTP", true);
                //         end;
                //     }
                // }
                action(Customers)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customers';
                    Enabled = Rec.Enabled;
                    Image = XMLFile;
                    trigger OnAction()
                    begin
                        Xmlport.Run(XmlPort::"PTE WSHelper Customer WS", true);
                    end;
                }
            }
            action(JobQueueEntry)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Job Queue Entry';
                Enabled = Rec.Enabled;
                Image = JobListSetup;

                trigger OnAction()
                begin
                    Rec.ShowJobQueueEntry();
                end;
            }
        }
        area(navigation)
        {
            action(EncryptionManagement)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Encryption Management';
                Enabled = true;
                Image = EncryptionKeys;
                RunObject = Page "Data Encryption Management";
                RunPageMode = View;
            }
            action(ActivityLog)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Activity Log';
                Image = Log;

                trigger OnAction()
                var
                    ActivityLog: Record "Activity Log";
                begin
                    ActivityLog.ShowEntries(Rec);
                end;
            }
        }

    }

    trigger OnAfterGetCurrRecord()
    begin
        UpdateEncryptedField(Rec."FTP Password Key", FTPPassword);
        UpdateEncryptedField(Rec."Authorization Key", AuthorizationKey);
        UpdateEncryptedField(Rec."WSHelper Pass. Key GUID", WSHelperPassword);
    end;

    trigger OnAfterGetRecord()
    begin
        UpdateBasedOnEnable();
    end;

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert(true);
        end;
        UpdateBasedOnEnable();
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if not Rec.Enabled then
            if not Confirm(StrSubstNo(EnableServiceQst, CurrPage.Caption), true) then
                exit(false);
    end;

    var
        FTPPassword: Text;
        WSHelperPassword: Text;
        AuthorizationKey: Text;
        ShowEnableWarning: Text;
        EditableByNotEnabled: Boolean;
        EnabledWarningTok: Label 'You must disable the service before you can make changes.';
        DisableEnableQst: Label 'Do you want to disable the service?';
        EnableServiceQst: Label 'The %1 is not enabled. Are you sure you want to exit?', Comment = '%1 is the record E ';
        EncryptionIsNotActivatedQst: Label 'Data encryption is not activated. It is recommended that you encrypt data. \Do you want to open the Data Encryption Management window?';
        EditableBySyncEnabled: Boolean;
        CheckedEncryption: Boolean;

    local procedure UpdateBasedOnEnable()
    begin
        EditableByNotEnabled := (not Rec.Enabled) and CurrPage.Editable;
        ShowEnableWarning := '';
        if CurrPage.Editable and Rec.Enabled then
            ShowEnableWarning := EnabledWarningTok;
        UpdateBasedOnSyncEnable();
    end;

    local procedure UpdateBasedOnSyncEnable()
    begin
        EditableBySyncEnabled := Rec.Enabled;
        if EditableBySyncEnabled then
            exit;
        Rec.Modify();
    end;

    local procedure DrilldownCode()
    begin
        if Confirm(DisableEnableQst, true) then begin
            Rec.Enabled := false;
            UpdateBasedOnEnable();
            CurrPage.Update();
        end;
    end;

    local procedure UpdateEncryptedField(InputGUID: Guid; var Text: Text[50])
    begin
        if IsNullGuid(InputGUID) then
            Text := ''
        else
            Text := '*************';
    end;

    //local procedure CheckEncryption()
    //begin
    //    if not CheckedEncryption and not EncryptionEnabled() then begin
    //        CheckedEncryption := true;
    //        if not EncryptionEnabled() then
    //            if Confirm(EncryptionIsNotActivatedQst) then
    //                PAGE.Run(PAGE::"Data Encryption Management");
    //    end;
    //end;
}

