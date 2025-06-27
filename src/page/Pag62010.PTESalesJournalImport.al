page 62010 "PTE Sales Journal Import"
{
    ApplicationArea = All;
    Caption = 'Sales Journal Import';
    PageType = List;
    SourceTable = "PTE Sales Journal Buffer";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account No. field.', Comment = '%';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Type field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount (LCY) field.', Comment = '%';
                }
                field(AppliesToDocNo; Rec.AppliesToDocNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Applies To Doc. No. field.', Comment = '%';
                }
                field(AppliesToDocType; Rec.AppliesToDocType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Applies To Doc. Type field.', Comment = '%';
                }
                field(CurrencyCode; Rec.CurrencyCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency Code field.', Comment = '%';
                }
                field(DepartmentCode; Rec.DepartmentCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field(DocumentDate; Rec.DocumentDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field(DocumentType; Rec.DocumentType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Due Date field.', Comment = '%';
                }
                field(ExternalDocumentNo; Rec.ExternalDocumentNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the External Document No. field.', Comment = '%';
                }
                field(GenPostingKey; Rec.GenPostingKey)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the GenPostingKey field.', Comment = '%';
                }
                field(JournalBatchName; Rec.JournalBatchName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Journal Batch Name field.', Comment = '%';
                }
                field(JournalTemplateName; Rec.JournalTemplateName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Journal Template Name field.', Comment = '%';
                }
                field(LineNo; Rec.LineNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field(ProjectCode; Rec.ProjectCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project Code field.', Comment = '%';
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reason Code field.', Comment = '%';
                }
                field(SalesCampaignCode; Rec.SalesCampaignCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Campaign Code field.', Comment = '%';
                }
                field(SalespersPurchCode; Rec.SalespersPurchCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales/Purch -person Code field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
                field(VATProdPostingGroup; Rec.VATProdPostingGroup)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Prod Posting Group field.', Comment = '%';
                }
                field(VatBusPostingGroup; Rec.VatBusPostingGroup)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vat Bus Posting Group field.', Comment = '%';
                }
                field(DepartmentDimensionMissing; rec.DepartmentDimensionMissing)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DepartmentDimensionMissing field.', Comment = '%';
                }
                field(ProjectDimensionMissing; rec.ProjectDimensionMissing)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ProjectDimensionMissing field.', Comment = '%';
                }
                field(AccountNoIsMissing; rec.AccountNoIsMissing)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the AccountNoIsMissing field.', Comment = '%';
                }
                field(CustomerNoIsMissing; rec.CustomerIsMissing)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VendorIsMissing field.', Comment = '%';
                }
                field(VATBusPostingGrpIsMissing; Rec.VATBusPostingGrpIsMissing)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VATBusPostingGrpIsMissing field.', Comment = '%';
                }
                field(VATProdPostingGrpIsMissing; Rec.VATProdPostingGrpIsMissing)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VATProdPostingGrpIsMissing field.', Comment = '%';
                }
                field(LineNoIsOccupied; rec.LineNoIsOccupied)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LineNoIsOccupied field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(ImportJournalLines)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Import Journal Lines';
                Enabled = true;
                Image = Line;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    SalesJournalBuffer: record "PTE Sales Journal Buffer";
                    SalesJournalBuffer2: record "PTE Sales Journal Buffer";
                    SalesJournal: record "Gen. Journal Line";
                    Setup: record "PTE WSHelper Setup";
                    DimensionValue: record "Dimension value";
                    GLAccount: record "G/L Account";
                    Customer: record Customer;
                    MissingValues: Boolean;
                    VatBusPostingGroup: record "VAT Business Posting Group";
                    VatProdPostingGroup: record "VAT Product Posting Group";
                    VatAmount: Decimal;
                begin
                    Setup.get;
                    IF (Setup."Dimension Code Department" = '') or (Setup."Dimension Code Project" = '') then
                        exit;
                    SalesJournalBuffer.copyfilters(rec);
                    IF SalesJournalBuffer.findset then
                        repeat
                            MissingValues := false;
                            IF SalesJournalBuffer.DepartmentCode <> '' then begin
                                DimensionValue.SetRange("Dimension Code", Setup."Dimension Code Department");
                                DimensionValue.SetRange(code, SalesJournalBuffer.DepartmentCode);
                                IF not DimensionValue.FindFirst then begin
                                    SalesJournalBuffer2.get(SalesJournalBuffer.JournalTemplateName, SalesJournalBuffer.JournalBatchName, SalesJournalBuffer.LineNo);
                                    SalesJournalBuffer2.DepartmentDimensionMissing := true;
                                    SalesJournalBuffer2.modify;
                                    MissingValues := true;
                                end;
                            end;
                            IF SalesJournalBuffer.ProjectCode <> '' then begin
                                DimensionValue.SetRange("Dimension Code", Setup."Dimension Code Project");
                                DimensionValue.SetRange(code, SalesJournalBuffer.ProjectCode);
                                IF not DimensionValue.FindFirst then begin
                                    SalesJournalBuffer2.get(SalesJournalBuffer.JournalTemplateName, SalesJournalBuffer.JournalBatchName, SalesJournalBuffer.LineNo);
                                    SalesJournalBuffer2.ProjectDimensionMissing := true;
                                    SalesJournalBuffer2.modify;
                                    MissingValues := true;
                                end;
                            end;
                            IF SalesJournalBuffer."Account Type" = SalesJournalBuffer."Account Type"::"G/L Account" then begin
                                IF SalesJournalBuffer."Account No." <> '' then begin
                                    if not GLAccount.get(SalesJournalBuffer."Account No.") then begin
                                        SalesJournalBuffer2.get(SalesJournalBuffer.JournalTemplateName, SalesJournalBuffer.JournalBatchName, SalesJournalBuffer.LineNo);
                                        SalesJournalBuffer2.AccountNoIsMissing := true;
                                        SalesJournalBuffer2.modify;
                                        MissingValues := true;
                                    end;
                                end
                                else begin
                                    SalesJournalBuffer2.get(SalesJournalBuffer.JournalTemplateName, SalesJournalBuffer.JournalBatchName, SalesJournalBuffer.LineNo);
                                    SalesJournalBuffer2.AccountNoIsMissing := true;
                                    SalesJournalBuffer2.modify;
                                    MissingValues := true;
                                end;
                            end;
                            IF SalesJournalBuffer."Account Type" = SalesJournalBuffer."Account Type"::Customer then begin
                                IF SalesJournalBuffer."Account No." <> '' then begin
                                    if not Customer.get(SalesJournalBuffer."Account No.") then begin
                                        SalesJournalBuffer2.get(SalesJournalBuffer.JournalTemplateName, SalesJournalBuffer.JournalBatchName, SalesJournalBuffer.LineNo);
                                        SalesJournalBuffer2.CustomerIsMissing := true;
                                        SalesJournalBuffer2.modify;
                                        MissingValues := true;
                                    end;
                                end
                                else begin
                                    SalesJournalBuffer2.get(SalesJournalBuffer.JournalTemplateName, SalesJournalBuffer.JournalBatchName, SalesJournalBuffer.LineNo);
                                    SalesJournalBuffer2.CustomerIsMissing := true;
                                    SalesJournalBuffer2.modify;
                                    MissingValues := true;
                                end;
                            end;

                            if SalesJournalBuffer.VatBusPostingGroup <> '' then begin
                                if NOT VatBusPostingGroup.get(SalesJournalBuffer.VatBusPostingGroup) then begin
                                    SalesJournalBuffer2.get(SalesJournalBuffer.JournalTemplateName, SalesJournalBuffer.JournalBatchName, SalesJournalBuffer.LineNo);
                                    SalesJournalBuffer2.VATBusPostingGrpIsMissing := true;
                                    SalesJournalBuffer2.modify;
                                    MissingValues := true;
                                end;
                            end;
                            if SalesJournalBuffer.VATProdPostingGroup <> '' then begin
                                IF NOT VatProdPostingGroup.GET(SalesJournalBuffer.VATProdPostingGroup) then begin
                                    SalesJournalBuffer2.get(SalesJournalBuffer.JournalTemplateName, SalesJournalBuffer.JournalBatchName, SalesJournalBuffer.LineNo);
                                    SalesJournalBuffer2.VATProdPostingGrpIsMissing := true;
                                    SalesJournalBuffer2.modify;
                                    MissingValues := true;
                                end;

                            end;

                            IF not MissingValues then begin
                                if not SalesJournal.GET(SalesJournalBuffer.JournalTemplateName, SalesJournalBuffer.JournalBatchName, SalesJournalBuffer.LineNo) then begin
                                    SalesJournal.init;
                                    SalesJournal.Validate("Journal Template Name", SalesJournalBuffer.JournalTemplateName);
                                    SalesJournal.validate("Journal Batch Name", SalesJournalBuffer.JournalBatchName);
                                    SalesJournal."Line No." := SalesJournalBuffer.LineNo;
                                    SalesJournal.Insert();
                                    SalesJournal.Validate("Posting Date", SalesJournalBuffer."Posting Date");
                                    SalesJournal.Validate("Document Date", SalesJournalBuffer.DocumentDate);
                                    SalesJournal.Validate("Account Type", SalesJournalBuffer."Account Type");
                                    if SalesJournal."Account Type" = SalesJournal."Account Type"::"G/L Account" then
                                        SalesJournal.VALIDATE("Gen. Posting Type", SalesJournal."Gen. Posting Type"::Sale);

                                    if SalesJournal."Account Type" = SalesJournal."Account Type"::Customer then begin

                                    end;
                                    SalesJournal.Validate("Account No.", SalesJournalBuffer."Account No.");
                                    SalesJournal.Validate(Description, SalesJournalBuffer.Description);
                                    if SalesJournalBuffer.GenPostingKey <> '' then
                                        ;

                                    SalesJournal.Validate("Shortcut Dimension 1 Code", SalesJournalBuffer.DepartmentCode);
                                    SalesJournal.Validate("Shortcut Dimension 2 Code", SalesJournalBuffer.ProjectCode);
                                    SalesJournal.Validate("Currency Code", SalesJournalBuffer.CurrencyCode);
                                    IF SalesJournalBuffer.Amount <> 0 then
                                        SalesJournal.Validate(Amount, SalesJournalBuffer.Amount);
                                    IF SalesJournalBuffer."Amount (LCY)" <> 0 then
                                        SalesJournal.Validate("Amount (LCY)", SalesJournalBuffer."Amount (LCY)");
                                    SalesJournal.Validate("Applies-to Doc. type", SalesJournalBuffer.AppliesToDocType);
                                    SalesJournal.Validate("Applies-to Doc. No.", SalesJournalBuffer.AppliesToDocNo);
                                    SalesJournal."External Document No." := SalesJournalBuffer.ExternalDocumentNo;
                                    SalesJournal."Campaign No." := SalesJournalBuffer.SalesCampaignCode;
                                    SalesJournal."Reason Code" := SalesJournalBuffer."Reason Code";
                                    SalesJournal."Salespers./Purch. Code" := SalesJournalBuffer.SalespersPurchCode;
                                    if SalesJournalBuffer.DocumentType = SalesJournalBuffer.DocumentType::"Credit Memo" then
                                        SalesJournal.Validate("Document Type", SalesJournal."Document Type"::"Credit Memo");
                                    if SalesJournalBuffer.DocumentType = SalesJournalBuffer.DocumentType::"Finance Charge Memo" then
                                        SalesJournal.Validate("Document Type", SalesJournal."Document Type"::"Finance Charge Memo");
                                    if SalesJournalBuffer.DocumentType = SalesJournalBuffer.DocumentType::Invoice then
                                        SalesJournal.Validate("Document Type", SalesJournal."Document Type"::Invoice);
                                    if SalesJournalBuffer.DocumentType = SalesJournalBuffer.DocumentType::Payment then
                                        SalesJournal.Validate("Document Type", SalesJournal."Document Type"::Payment);
                                    if SalesJournalBuffer.DocumentType = SalesJournalBuffer.DocumentType::Refund then
                                        SalesJournal.Validate("Document Type", SalesJournal."Document Type"::Refund);
                                    if SalesJournalBuffer.DocumentType = SalesJournalBuffer.DocumentType::Reminder then
                                        SalesJournal.Validate("Document Type", SalesJournal."Document Type"::Reminder);
                                    SalesJournal."Document No." := SalesJournalBuffer."Document No.";
                                    if SalesJournalBuffer.VatBusPostingGroup <> '' then
                                        SalesJournal.Validate("VAT Bus. Posting Group", SalesJournalBuffer.VatBusPostingGroup);
                                    if SalesJournalBuffer.VATProdPostingGroup <> '' then
                                        SalesJournal.Validate("VAT Prod. Posting Group", SalesJournalBuffer.VatProdPostingGroup);
                                    SalesJournal."Due Date" := SalesJournalBuffer."Due Date";
                                    //>>FORIA-371
                                    if SalesJournal."Account Type" = SalesJournal."Account Type"::Customer then begin
                                        VatAmount := FindVatLineAmount(SalesJournalBuffer, SalesJournal);
                                        IF SalesJournal.amount < 0 then
                                            SalesJournal."Sales/Purch. (LCY)" := SalesJournal.amount + VatAmount
                                        else begin
                                            if VatAmount > 0 then
                                                SalesJournal."Sales/Purch. (LCY)" := SalesJournal.amount - VatAmount
                                            else
                                                SalesJournal."Sales/Purch. (LCY)" := SalesJournal.amount + VatAmount;
                                        end;
                                    end;
                                    //<<FORIA-371
                                    if SalesJournal.Modify(true) then begin
                                        SalesJournalBuffer2.get(SalesJournalBuffer.JournalTemplateName, SalesJournalBuffer.JournalBatchName, SalesJournalBuffer.LineNo);
                                        SalesJournalBuffer2.Delete;
                                    end
                                    else begin
                                        SalesJournal.modify(true);
                                    end;
                                end
                                else begin
                                    SalesJournal.Delete();
                                    SalesJournalBuffer2.get(SalesJournalBuffer.JournalTemplateName, SalesJournalBuffer.JournalBatchName, SalesJournalBuffer.LineNo);
                                    SalesJournalBuffer2.LineNoIsOccupied := true;
                                    SalesJournalBuffer2.modify;
                                end;
                            end;
                        until SalesJournalBuffer.next = 0;
                    CurrPage.update;
                end;
            }
        }
    }
    local procedure FindVatLineAmount(SalesJournalBuffer: record "PTE Sales Journal Buffer"; SalesJournal: record "Gen. Journal Line") VatAmount: Decimal;
    var
        SalesJournalBufferVAT: record "PTE Sales Journal Buffer";
        SalesJournalVAT: record "Gen. Journal Line";
        VatPostingSetup: record "VAT Posting Setup";
    begin
        SalesJournalBufferVAT.CopyFilters(SalesJournalBuffer);
        SalesJournalVAT.CopyFilters(SalesJournal);
        VatAmount := 0;

        SalesJournalBufferVAT.setrange("Account Type", SalesJournalBufferVAT."Account Type"::"G/L Account");
        SalesJournalBufferVAT.setrange("Document No.", SalesJournalBuffer."Document No.");
        SalesJournalBufferVAT.setfilter(VATProdPostingGroup, '<>%1', '');
        IF SalesJournalBufferVAT.findset then
            repeat
                If VatPostingSetup.get(SalesJournalBufferVAT.VatBusPostingGroup, SalesJournalBufferVAT.VATProdPostingGroup) and (VatPostingSetup."VAT %" = 100) then
                    VatAmount := SalesJournalBufferVAT."Amount (LCY)";
            until (SalesJournalBufferVAT.Next = 0) OR (VatAmount <> 0);

        IF VatAmount = 0 then begin
            SalesJournalVAT.setrange("Account Type", SalesJournalVAT."Account Type"::"G/L Account");
            SalesJournalVAT.setrange("Document No.", SalesJournal."Document No.");
            SalesJournalVAT.setfilter("VAT Prod. Posting Group", '<>%1', '');
            SalesJournalVAT.SetRange("Gen. Posting Type", SalesJournalVAT."Gen. Posting Type"::Sale);
            IF SalesJournalVAT.findset then
                repeat
                    If VatPostingSetup.get(SalesJournalVAT."VAT Bus. Posting Group", SalesJournalVAT."VAT Prod. Posting Group") and (VatPostingSetup."VAT %" = 100) then
                        VatAmount := SalesJournalVAT."Amount (LCY)";
                until (SalesJournalVAT.next = 0) or (VatAmount <> 0)
        end;

        exit(VatAmount);
    end;
}

