page 62009 "PTE Purch. Journal Import"
{
    ApplicationArea = All;
    Caption = 'Purch. Journal Import';
    PageType = List;
    SourceTable = "PTE Purch Journal Buffer";
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
                    ToolTip = 'Specifies the value of the Applies to Doc. No. field.', Comment = '%';
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Account No. field.', Comment = '%';
                }
                field(BankGiro; Rec.BankGiro)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Giro field.', Comment = '%';
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
                field(DueDate; Rec.DueDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Due Date field.', Comment = '%';
                }
                field(DocumentType; Rec.DocumentType)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
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
                field(Plusgiro; Rec.Plusgiro)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Plus Giro field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field(ExternalDocumentNo; Rec.ExternalDocumentNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the External Document No. field.', Comment = '%';
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
                field(VendorNoIsMissing; rec.VendorIsMissing)
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
                    PurchJournalBuffer: record "PTE Purch Journal Buffer";
                    PurchJournalBuffer2: record "PTE Purch Journal Buffer";
                    PurchaseJournal: record "Gen. Journal Line";
                    Setup: record "PTE WSHelper Setup";
                    DimensionValue: record "Dimension value";
                    GLAccount: record "G/L Account";
                    Vendor: record Vendor;
                    VatBusPostingGroup: record "VAT Business Posting Group";
                    VatProdPostingGroup: record "VAT Product Posting Group";
                    MissingValues: Boolean;
                    VatAmount: Decimal;
                begin
                    Setup.get();
                    IF (Setup."Dimension Code Department" = '') or (Setup."Dimension Code Project" = '') then
                        exit;
                    PurchJournalBuffer.copyfilters(rec);
                    IF PurchJournalBuffer.findset() then
                        repeat
                            MissingValues := false;
                            IF PurchJournalBuffer.DepartmentCode <> '' then begin
                                DimensionValue.SetRange("Dimension Code", Setup."Dimension Code Department");
                                DimensionValue.SetRange(code, PurchJournalBuffer.DepartmentCode);
                                IF not DimensionValue.FindFirst() then begin
                                    PurchJournalBuffer2.get(PurchJournalBuffer.JournalTemplateName, PurchJournalBuffer.JournalBatchName, PurchJournalBuffer.LineNo);
                                    PurchJournalBuffer2.DepartmentDimensionMissing := true;
                                    PurchJournalBuffer2.modify();
                                    MissingValues := true;
                                end;
                            end;
                            IF PurchJournalBuffer.ProjectCode <> '' then begin
                                DimensionValue.SetRange("Dimension Code", Setup."Dimension Code Project");
                                DimensionValue.SetRange(code, PurchJournalBuffer.ProjectCode);
                                IF not DimensionValue.FindFirst() then begin
                                    PurchJournalBuffer2.get(PurchJournalBuffer.JournalTemplateName, PurchJournalBuffer.JournalBatchName, PurchJournalBuffer.LineNo);
                                    PurchJournalBuffer2.ProjectDimensionMissing := true;
                                    PurchJournalBuffer2.modify();
                                    MissingValues := true;
                                end;
                            end;

                            IF PurchJournalBuffer."Account Type" = PurchJournalBuffer."Account Type"::"G/L Account" then begin
                                IF PurchJournalBuffer."Account No." <> '' then begin
                                    if not GLAccount.get(PurchJournalBuffer."Account No.") then begin
                                        PurchJournalBuffer2.get(PurchJournalBuffer.JournalTemplateName, PurchJournalBuffer.JournalBatchName, PurchJournalBuffer.LineNo);
                                        PurchJournalBuffer2.AccountNoIsMissing := true;
                                        PurchJournalBuffer2.modify();
                                        MissingValues := true;
                                    end;
                                end
                                else begin
                                    PurchJournalBuffer2.get(PurchJournalBuffer.JournalTemplateName, PurchJournalBuffer.JournalBatchName, PurchJournalBuffer.LineNo);
                                    PurchJournalBuffer2.AccountNoIsMissing := true;
                                    PurchJournalBuffer2.modify();
                                    MissingValues := true;
                                end;
                            end;

                            IF PurchJournalBuffer."Account Type" = PurchJournalBuffer."Account Type"::Vendor then begin
                                IF PurchJournalBuffer."Account No." <> '' then begin
                                    if not Vendor.get(PurchJournalBuffer."Account No.") then begin
                                        PurchJournalBuffer2.get(PurchJournalBuffer.JournalTemplateName, PurchJournalBuffer.JournalBatchName, PurchJournalBuffer.LineNo);
                                        PurchJournalBuffer2.VendorIsMissing := true;
                                        PurchJournalBuffer2.modify();
                                        MissingValues := true;
                                    end;
                                end
                                else begin
                                    PurchJournalBuffer2.get(PurchJournalBuffer.JournalTemplateName, PurchJournalBuffer.JournalBatchName, PurchJournalBuffer.LineNo);
                                    PurchJournalBuffer2.VendorIsMissing := true;
                                    PurchJournalBuffer2.modify();
                                    MissingValues := true;
                                end;
                            end;

                            if PurchJournalBuffer.VatBusPostingGroup <> '' then begin
                                if NOT VatBusPostingGroup.get(PurchJournalBuffer.VatBusPostingGroup) then begin
                                    PurchJournalBuffer2.get(PurchJournalBuffer.JournalTemplateName, PurchJournalBuffer.JournalBatchName, PurchJournalBuffer.LineNo);
                                    PurchJournalBuffer2.VATBusPostingGrpIsMissing := true;
                                    PurchJournalBuffer2.modify();
                                    MissingValues := true;
                                end;
                            end;
                            if PurchJournalBuffer.VATProdPostingGroup <> '' then begin
                                IF NOT VatProdPostingGroup.GET(PurchJournalBuffer.VATProdPostingGroup) then begin
                                    PurchJournalBuffer2.get(PurchJournalBuffer.JournalTemplateName, PurchJournalBuffer.JournalBatchName, PurchJournalBuffer.LineNo);
                                    PurchJournalBuffer2.VATProdPostingGrpIsMissing := true;
                                    PurchJournalBuffer2.modify();
                                    MissingValues := true;
                                end;
                            end;

                            IF not MissingValues then begin
                                if not PurchaseJournal.GET(PurchJournalBuffer.JournalTemplateName, PurchJournalBuffer.JournalBatchName, PurchJournalBuffer.LineNo) then begin
                                    PurchaseJournal.init();
                                    PurchaseJournal.Validate("Journal Template Name", PurchJournalBuffer.JournalTemplateName);
                                    PurchaseJournal.Validate("Journal Batch Name", PurchJournalBuffer.JournalBatchName);
                                    PurchaseJournal."Line No." := PurchJournalBuffer.LineNo;
                                    PurchaseJournal.insert();
                                    PurchaseJournal.Validate("Posting Date", PurchJournalBuffer."Posting Date");
                                    PurchaseJournal.Validate("Document Date", PurchJournalBuffer.DocumentDate);
                                    PurchaseJournal.Validate("Document Type", PurchJournalBuffer.DocumentType);
                                    PurchaseJournal.Validate("Document No.", PurchJournalBuffer."Document No.");
                                    PurchaseJournal.Validate("Account Type", PurchJournalBuffer."Account Type");
                                    if PurchaseJournal."Account Type" = PurchaseJournal."Account Type"::"G/L Account" then
                                        PurchaseJournal.VALIDATE("Gen. Posting Type", PurchaseJournal."Gen. Posting Type"::Purchase);
                                    PurchaseJournal.Validate("Account No.", PurchJournalBuffer."Account No.");
                                    PurchaseJournal.Validate(Description, PurchJournalBuffer.Description);
                                    PurchaseJournal.Validate("Shortcut Dimension 1 Code", PurchJournalBuffer.DepartmentCode);
                                    PurchaseJournal.Validate("Shortcut Dimension 2 Code", PurchJournalBuffer.ProjectCode);
                                    PurchaseJournal.Validate("Currency Code", PurchJournalBuffer.CurrencyCode);
                                    if PurchJournalBuffer.Amount <> 0 then
                                        PurchaseJournal.Validate(Amount, PurchJournalBuffer.Amount);
                                    if PurchJournalBuffer."Amount (LCY)" <> 0 then
                                        PurchaseJournal.Validate("Amount (LCY)", PurchJournalBuffer."Amount (LCY)");
                                    PurchaseJournal.Validate("Applies-to Doc. No.", PurchJournalBuffer.AppliesToDocNo);
                                    PurchaseJournal."Reason Code" := PurchJournalBuffer."Reason Code";
                                    PurchaseJournal."External Document No." := PurchJournalBuffer.ExternalDocumentNo;
                                    if PurchJournalBuffer.DocumentType = PurchJournalBuffer.DocumentType::"Credit Memo" then
                                        PurchaseJournal.Validate("Document Type", PurchaseJournal."Document Type"::"Credit Memo");
                                    if PurchJournalBuffer.DocumentType = PurchJournalBuffer.DocumentType::"Finance Charge Memo" then
                                        PurchaseJournal.Validate("Document Type", PurchaseJournal."Document Type"::"Finance Charge Memo");
                                    if PurchJournalBuffer.DocumentType = PurchJournalBuffer.DocumentType::Invoice then
                                        PurchaseJournal.Validate("Document Type", PurchaseJournal."Document Type"::Invoice);
                                    if PurchJournalBuffer.DocumentType = PurchJournalBuffer.DocumentType::Payment then
                                        PurchaseJournal.Validate("Document Type", PurchaseJournal."Document Type"::Payment);
                                    if PurchJournalBuffer.DocumentType = PurchJournalBuffer.DocumentType::Refund then
                                        PurchaseJournal.Validate("Document Type", PurchaseJournal."Document Type"::Refund);
                                    if PurchJournalBuffer.DocumentType = PurchJournalBuffer.DocumentType::Reminder then
                                        PurchaseJournal.Validate("Document Type", PurchaseJournal."Document Type"::Reminder);
                                    PurchaseJournal."Document No." := PurchJournalBuffer."Document No.";
                                    if PurchJournalBuffer.VatBusPostingGroup <> '' then
                                        PurchaseJournal.Validate("VAT Bus. Posting Group", PurchJournalBuffer.VatBusPostingGroup);
                                    if PurchJournalBuffer.VATProdPostingGroup <> '' then
                                        PurchaseJournal.Validate("VAT Prod. Posting Group", PurchJournalBuffer.VatProdPostingGroup);
                                    PurchaseJournal."Due Date" := PurchJournalBuffer.DueDate;
                                    //>>FORIA-371
                                    if PurchaseJournal."Account Type" = PurchaseJournal."Account Type"::Vendor then begin
                                        VatAmount := FindVatLineAmount(PurchJournalBuffer, PurchaseJournal);
                                        IF PurchaseJournal.amount < 0 then
                                            PurchaseJournal."Sales/Purch. (LCY)" := PurchaseJournal.amount + VatAmount
                                        else begin
                                            if VatAmount > 0 then
                                                PurchaseJournal."Sales/Purch. (LCY)" := PurchaseJournal.amount - VatAmount
                                            else
                                                PurchaseJournal."Sales/Purch. (LCY)" := PurchaseJournal.amount + VatAmount

                                        end;
                                    end;
                                    //<<FORIA-371
                                    if PurchaseJournal.modify(true) then begin
                                        PurchJournalBuffer2.get(PurchJournalBuffer.JournalTemplateName, PurchJournalBuffer.JournalBatchName, PurchJournalBuffer.LineNo);
                                        PurchJournalBuffer2.Delete();
                                    end;

                                end
                                else begin
                                    PurchaseJournal.delete();
                                    PurchJournalBuffer2.get(PurchJournalBuffer.JournalTemplateName, PurchJournalBuffer.JournalBatchName, PurchJournalBuffer.LineNo);
                                    PurchJournalBuffer2.LineNoIsOccupied := true;
                                    PurchJournalBuffer2.modify();
                                end;
                            end;
                        until PurchJournalBuffer.next() = 0;
                    CurrPage.update();
                end;
            }

        }
    }
    local procedure FindVatLineAmount(PurchJournalBuffer: record "PTE Purch Journal Buffer"; PurchJournal: record "Gen. Journal Line") VatAmount: Decimal;
    var
        PurchJournalBufferVAT: record "PTE Purch Journal Buffer";
        PurchJournalVAT: record "Gen. Journal Line";
        VatPostingSetup: record "VAT Posting Setup";
    begin
        PurchJournalBufferVAT.CopyFilters(PurchJournalBuffer);
        PurchJournalVAT.CopyFilters(PurchJournal);
        VatAmount := 0;

        PurchJournalBufferVAT.setrange("Account Type", PurchJournalBufferVAT."Account Type"::"G/L Account");
        PurchJournalBufferVAT.setrange("Document No.", PurchJournalBuffer."Document No.");
        PurchJournalBufferVAT.setfilter(VATProdPostingGroup, '<>%1', '');
        IF PurchJournalBufferVAT.findset() then
            repeat
                If VatPostingSetup.get(PurchJournalBufferVAT.VatBusPostingGroup, PurchJournalBufferVAT.VATProdPostingGroup) and (VatPostingSetup."VAT %" = 100) then
                    VatAmount := PurchJournalBufferVAT."Amount (LCY)";
            until (PurchJournalBufferVAT.Next() = 0) OR (VatAmount <> 0);

        IF VatAmount = 0 then begin
            PurchJournalVAT.setrange("Account Type", PurchJournalVAT."Account Type"::"G/L Account");
            PurchJournalVAT.setrange("Document No.", PurchJournal."Document No.");
            PurchJournalVAT.setfilter("VAT Prod. Posting Group", '<>%1', '');
            PurchJournalVAT.SetRange("Gen. Posting Type", PurchJournalVAT."Gen. Posting Type"::Sale);
            IF PurchJournalVAT.findset() then
                repeat
                    If VatPostingSetup.get(PurchJournalVAT."VAT Bus. Posting Group", PurchJournalVAT."VAT Prod. Posting Group") and (VatPostingSetup."VAT %" = 100) then
                        VatAmount := PurchJournalVAT."Amount (LCY)";
                until (PurchJournalVAT.next() = 0) or (VatAmount <> 0)
        end;

        exit(VatAmount);
    end;
}
