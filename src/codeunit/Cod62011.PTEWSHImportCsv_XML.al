codeunit 62011 "PTEWSHImport_Csv_XML"
{
    Permissions = tabledata "Gen. Journal Line" = rimd;

    trigger OnRun()
    begin

    end;


    procedure ImportSalesJournal_CSV(SalesJournalTemplateName: Code[10]; SalesJournalBatchName: code[10])
    var
        CSVBuffer: Record "CSV Buffer";
        SalesJournal: record "Gen. Journal Line";
        SalesJournal2: record "Gen. Journal Line";
        Tempblob: Codeunit "Temp Blob";
        ImportedInStream: InStream;
        filename: text;
        Uploadresult: Boolean;
        EntryNo: Integer;
        Window: Dialog;
        counter: Integer;
        TotalLines: Integer;
        Text000: Label 'TotalLines    #1##########\';
        Text001: Label 'Processed Lines    #2##########\';
        Setup: record "PTE WSHelper Setup";
    begin
        Counter := 0;
        TotalLines := 0;
        Setup.get;
        SalesJournal.SetRange("Journal Template Name", SalesJournalTemplateName);
        SalesJournal.Setrange("Journal Batch Name", SalesJournalBatchName);
        if SalesJournal.FindLast() then
            EntryNo := SalesJournal."Line No." + 10000
        else
            entryno := 10000;


        TempBlob.CreateInStream(ImportedInStream);
        CSVBuffer.InitializeReaderFromStream(ImportedInStream, ';');
        Uploadresult := UploadIntoStream('Import Sales Journal', '', '', FileName, ImportedInStream);
        if not Uploadresult then
            exit;
        CSVBuffer.DeleteAll();
        CSVBuffer.LoadDataFromStream(ImportedInStream, ';');
        IF TotalLines = 0 then begin
            IF CSVBuffer.FINDLAST then
                TotalLines := CSVBuffer."Line No.";
        end;
        Window.OPEN(
                  Text000 +
                  Text001);

        Window.Update(1, TotalLines);
        if CSVBuffer.FindSet() then
            repeat

                if CSVBuffer."Line No." > 1 then begin
                    // CSVBuffer.
                    if (CSVBuffer."Field No." = 1) then begin
                        SalesJournal.Init();
                        SalesJournal."Line No." := EntryNo;
                    end;




                    case CSVBuffer."Field No." of
                        1:
                            //Assign Fields
                            ;
                        2:
                            //Assign Fields
                            ;
                        3:
                            //Assign Fields
                            ;
                        4:
                            //Assign Fields
                            ;
                        5:
                            //Assign Fields
                            ;
                        6:
                            //Assign Fields
                            ;
                        7:
                            //Assign Fields
                            ;
                        8:
                            //Assign Fields
                            ;
                        9:
                            //Assign Fields
                            ;
                        10:
                            //Assign Fields
                            ;
                        11:
                            //Assign Fields
                            ;
                        12:
                            //Assign Fields
                            ;
                        13:
                            //Assign Fields
                            ;
                        14:
                            //Assign Fields
                            ;
                        15:
                            //Assign Fields
                            ;
                        16:
                            //Assign Fields
                            ;

                        17:
                            //Assign Fields
                            ;
                        18:
                            //Assign Fields
                            ;
                        19:
                            //Assign Fields
                            ;
                        20:
                            //Assign Fields
                            ;
                        21:
                            //Assign Fields
                            ;
                        22:
                            //Assign Fields
                            ;
                        23:
                            //Assign Fields
                            ;

                        24:
                            //Assign Fields
                            ;
                        25:
                            //Assign Fields
                            ;
                        26:
                            //Assign Fields
                            ;
                        27:
                            //Assign Fields
                            ;
                        28:
                            //Assign Fields
                            ;
                        29:
                            //Assign Fields
                            ;
                        30:
                            //Assign Fields
                            ;
                    end;

                end;
            until CSVBuffer.Next() = 0;
        Message(StrSubstNo('%1 Lines imported', Counter));
        Window.CLOSE()
    end;

    procedure ImportSalesJournal_XML(SalesJournalTemplateName: Code[10]; SalesJournalBatchName: code[10])
    var
        TempXMLBuffer: Record "XML Buffer" temporary;
        SalesJournal: record "PTE Sales Journal Buffer";
        SalesJournal2: record "PTE Sales Journal Buffer";
        Tempblob: Codeunit "Temp Blob";
        ImportedInStream: InStream;
        filename: text;
        Uploadresult: Boolean;
        LineNoCounter: Integer;
        Window: Dialog;
        counter: Integer;
        TotalLines: Integer;
        Text000: Label 'TotalLines    #1##########\';
        Text001: Label 'Processed Lines    #2##########\';
        Setup: record "PTE WSHelper Setup";
        TempText: Text;
    begin
        IF (SalesJournalTemplateName = '') or (SalesJournalBatchName = '') then
            exit;
        Counter := 0;
        TotalLines := 0;
        Setup.get;
        SalesJournal.SetRange("JournalTemplateName", SalesJournalTemplateName);
        SalesJournal.Setrange("JournalBatchName", SalesJournalBatchName);
        if SalesJournal.FindLast() then
            LineNoCounter := SalesJournal.LineNo + 10000
        else
            LineNoCounter := 0;

        ClearLastError();

        TempBlob.CreateInStream(ImportedInStream);
        Uploadresult := UploadIntoStream('Import Sales Journal', '', '', FileName, ImportedInStream);
        if not Uploadresult then
            exit;
        TempXMLBuffer.DeleteAll();
        TempXMLBuffer.LoadFromStream(ImportedInStream);
        TempXMLBuffer.Reset();
        if TempXMLBuffer.IsEmpty then
            exit;

        IF TotalLines = 0 then begin
            TempXMLBuffer.SetRange(Path, '/Rows/row/PostingDate');
            IF TempXMLBuffer.FINDLAST then
                TotalLines := Round(TempXMLBuffer.Count, 1);
        end;
        TempXMLBuffer.SetRange(Path);
        Window.OPEN(
                  Text000 +
                  Text001);

        Window.Update(1, TotalLines);
        IF TempXMLBuffer.findset then
            repeat
                case TempXMLBuffer.Path of

                    '/rows/row/PostingDate':
                        begin
                            SalesJournal.init;
                            SalesJournal."Posting Date" := GetDateValue(TempXMLBuffer, '/rows/row/PostingDate');
                            LineNoCounter += 10000;
                            SalesJournal.LineNo := LineNoCounter;
                            SalesJournal.Validate(JournalTemplateName, SalesJournalTemplateName);
                            SalesJournal.Validate(JournalBatchName, SalesJournalBatchName);
                            TempText := '';
                        end;
                    '/rows/row/DocumentDate':
                        SalesJournal.DocumentDate := GetDateValue(TempXMLBuffer, '/rows/row/DocumentDate');
                    '/rows/row/DocumentType':
                        begin
                            ;
                            TempText := GetTextValue(TempXMLBuffer, '/rows/row/DocumentType', STRLEN(TempXMLBuffer.value));
                            case TempText of
                                'Invoice':
                                    SalesJournal.DocumentType := SalesJournal.DocumentType::Invoice;
                                'Credit Memo':
                                    SalesJournal.DocumentType := SalesJournal.DocumentType::"Credit Memo";
                                'Payment':
                                    SalesJournal.DocumentType := SalesJournal.DocumentType::Payment;
                                'Finance Charge Memo':
                                    SalesJournal.DocumentType := SalesJournal.DocumentType::"Finance Charge Memo";
                                'Refund':
                                    SalesJournal.DocumentType := SalesJournal.DocumentType::Refund;
                                'Reminder':
                                    SalesJournal.DocumentType := SalesJournal.DocumentType::Reminder;
                                ' ':
                                    SalesJournal.DocumentType := SalesJournal.DocumentType::" ";
                            end;
                        end;
                    '/rows/row/DocumentNo':
                        SalesJournal."Document No." := GetTextValue(TempXMLBuffer, '/rows/row/DocumentNo', MaxStrLen(SalesJournal."Document No."));
                    '/rows/row/AccountType':
                        begin
                            TempText := GetTextValue(TempXMLBuffer, '/rows/row/AccountType', STRLEN(TempXMLBuffer.value));
                            case TempText of
                                'Customer':
                                    SalesJournal."Account Type" := SalesJournal."Account Type"::Customer;
                                'G/L Account':
                                    SalesJournal."Account Type" := SalesJournal."Account Type"::"G/L Account";
                                'Bank Account':
                                    SalesJournal."Account Type" := SalesJournal."Account Type"::"Bank Account";
                                'Employee':
                                    SalesJournal."Account Type" := SalesJournal."Account Type"::Employee;
                                'Fixed Asset':
                                    SalesJournal."Account Type" := SalesJournal."Account Type"::"Fixed Asset";
                                'IC Partner':
                                    SalesJournal."Account Type" := SalesJournal."Account Type"::"IC Partner";
                                'Vendor':
                                    SalesJournal."Account Type" := SalesJournal."Account Type"::"Vendor";
                            end;
                        end;
                    '/rows/row/Account':
                        SalesJournal."Account No." := GetTextValue(TempXMLBuffer, '/rows/row/Account', MaxStrLen(SalesJournal."Account No."));
                    '/rows/row/Description':
                        SalesJournal.Description := GetTextValue(TempXMLBuffer, '/rows/row/Description', MaxStrLen(SalesJournal.Description));
                    '/rows/row/GenPostingKey':
                        ;
                    '/rows/row/VatBusPostingGroup':
                        SalesJournal.VatBusPostingGroup := GetTextValue(TempXMLBuffer, '/rows/row/VatBusPostingGroup', MaxStrLen(SalesJournal.VatBusPostingGroup));
                    '/rows/row/VATProdPostingGroup':
                        SalesJournal.VATProdPostingGroup := GetTextValue(TempXMLBuffer, '/rows/row/VATProdPostingGroup', MaxStrLen(SalesJournal.VATProdPostingGroup));
                    '/rows/row/DepartmentCode':
                        SalesJournal.DepartmentCode := GetTextValue(TempXMLBuffer, '/rows/row/DepartmentCode', MaxStrLen(SalesJournal.DepartmentCode));
                    '/rows/row/ProjectCode':
                        SalesJournal.ProjectCode := GetTextValue(TempXMLBuffer, '/rows/row/ProjectCode', MaxStrLen(SalesJournal.ProjectCode));
                    '/rows/row/CurrencyCode':
                        SalesJournal.CurrencyCode := GetTextValue(TempXMLBuffer, '/rows/row/CurrencyCode', MaxStrLen(SalesJournal.CurrencyCode));
                    '/rows/row/Amount':
                        SalesJournal.Amount := GetDecimalValue(TempXMLBuffer, '/rows/row/Amount');
                    '/rows/row/AmountLCY':
                        SalesJournal."Amount (LCY)" := GetDecimalValue(TempXMLBuffer, '/rows/row/AmountLCY');
                    '/rows/row/DueDate':
                        SalesJournal."Due Date" := GetdateValue(TempXMLBuffer, '/rows/row/DueDate');
                    '/rows/row/AppliesToDocType':
                        ;
                    '/rows/row/AppliesToDocNo':
                        ;
                    '/rows/row/ExternalDocumentNo':
                        SalesJournal."ExternalDocumentNo" := GetTextValue(TempXMLBuffer, '/rows/row/ExternalDocumentNo', MaxStrLen(SalesJournal.ExternalDocumentNo));
                    '/rows/row/SalescampaignCode':
                        ;
                    '/rows/row/SalespersPurchCode':
                        ;
                    '/rows/row/ReasonCode':
                        begin
                            Counter += 1;
                            Window.UPDATE(2, counter);
                            SalesJournal.insert;
                        end;
                end;
            Until TempXMLBuffer.next = 0;

        Message(StrSubstNo('%1 Lines imported', Counter));
        Window.CLOSE()



        //EXAMPLE with Lines (And section above would be header)
        // TempXMLBuffer.SetFilter(Path, '/row/OrderLines/ProductLine*');
        // IF SorderCreated then begin
        //     NextSerialLineNo := 10000;
        //     TempXMLBuffer.Find('-');
        //     repeat
        //         case TempXMLBuffer.Path of
        //             '/row/OrderLines/ProductLine':
        //                 begin
        //                     if SOrderLine."Line Id" <> 0 then begin
        //                         SOrderLine.Insert(true);
        //                         NextSerialLineNo := 10000;
        //                     end;
        //                     SOrderLine.Init();
        //                     SOrderLine."Order Id" := SOrderHeader.Id;
        //                 end;

        //         end;
        //     until TempXMLBuffer.Next() = 0;
        //     SOrderLine.Insert(true);

    end;

    procedure ImportPurchJournal_CSV(PurchJournalTemplateName: Code[10]; PurchJournalBatchName: code[10])
    var
        CSVBuffer: Record "CSV Buffer";
        PurchJournal: record "Gen. Journal Line";
        PurchJournal2: record "Gen. Journal Line";
        Tempblob: Codeunit "Temp Blob";
        ImportedInStream: InStream;
        filename: text;
        Uploadresult: Boolean;
        EntryNo: Integer;
        Window: Dialog;
        counter: Integer;
        TotalLines: Integer;
        Text000: Label 'TotalLines    #1##########\';
        Text001: Label 'Processed Lines    #2##########\';
        Setup: record "PTE WSHelper Setup";
    begin
        Counter := 0;
        TotalLines := 0;
        Setup.get;
        PurchJournal.SetRange("Journal Template Name", PurchJournalTemplateName);
        PurchJournal.Setrange("Journal Batch Name", PurchJournalBatchName);
        if PurchJournal.FindLast() then
            EntryNo := PurchJournal."Line No." + 10000
        else
            entryno := 10000;


        TempBlob.CreateInStream(ImportedInStream);
        CSVBuffer.InitializeReaderFromStream(ImportedInStream, ';');
        Uploadresult := UploadIntoStream('Import Purch Journal', '', '', FileName, ImportedInStream);
        if not Uploadresult then
            exit;
        CSVBuffer.DeleteAll();
        CSVBuffer.LoadDataFromStream(ImportedInStream, ';');
        IF TotalLines = 0 then begin
            IF CSVBuffer.FINDLAST then
                TotalLines := CSVBuffer."Line No.";
        end;
        Window.OPEN(
                  Text000 +
                  Text001);

        Window.Update(1, TotalLines);
        if CSVBuffer.FindSet() then
            repeat

                if CSVBuffer."Line No." > 1 then begin
                    // CSVBuffer.
                    if (CSVBuffer."Field No." = 1) then begin
                        PurchJournal.Init();
                        PurchJournal."Line No." := EntryNo;
                    end;




                    case CSVBuffer."Field No." of
                        1:
                            //Assign Fields
                            ;
                        2:
                            //Assign Fields
                            ;
                        3:
                            //Assign Fields
                            ;
                        4:
                            //Assign Fields
                            ;
                        5:
                            //Assign Fields
                            ;
                        6:
                            //Assign Fields
                            ;
                        7:
                            //Assign Fields
                            ;
                        8:
                            //Assign Fields
                            ;
                        9:
                            //Assign Fields
                            ;
                        10:
                            //Assign Fields
                            ;
                        11:
                            //Assign Fields
                            ;
                        12:
                            //Assign Fields
                            ;
                        13:
                            //Assign Fields
                            ;
                        14:
                            //Assign Fields
                            ;
                        15:
                            //Assign Fields
                            ;
                        16:
                            //Assign Fields
                            ;

                        17:
                            //Assign Fields
                            ;
                        18:
                            //Assign Fields
                            ;
                        19:
                            //Assign Fields
                            ;
                        20:
                            //Assign Fields
                            ;
                        21:
                            //Assign Fields
                            ;
                        22:
                            //Assign Fields
                            ;
                        23:
                            //Assign Fields
                            ;

                        24:
                            //Assign Fields
                            ;
                        25:
                            //Assign Fields
                            ;
                        26:
                            //Assign Fields
                            ;
                        27:
                            //Assign Fields
                            ;
                        28:
                            //Assign Fields
                            ;
                        29:
                            //Assign Fields
                            ;
                        30:
                            //Assign Fields
                            ;
                    end;

                end;
            until CSVBuffer.Next() = 0;
        Message(StrSubstNo('%1 Lines imported', Counter));
        Window.CLOSE()
    end;

    procedure ImportPurchJournal_XML(PurchJournalTemplateName: Code[10]; PurchJournalBatchName: code[10])
    var
        TempXMLBuffer: Record "XML Buffer" temporary;
        PurchJournal: record "PTE Purch Journal Buffer";
        PurchJournal2: record "PTE Purch Journal Buffer";
        Tempblob: Codeunit "Temp Blob";
        ImportedInStream: InStream;
        filename: text;
        Uploadresult: Boolean;
        LinenoCounter: Integer;
        Window: Dialog;
        counter: Integer;
        TotalLines: Integer;
        Text000: Label 'TotalLines    #1##########\';
        Text001: Label 'Processed Lines    #2##########\';
        Setup: record "PTE WSHelper Setup";
        TempText: Text;
    begin
        IF (PurchJournalTemplateName = '') or (PurchJournalBatchName = '') then
            exit;
        Counter := 0;
        TotalLines := 0;
        Setup.get;
        PurchJournal.SetRange(JournalTemplateName, PurchJournalTemplateName);
        PurchJournal.Setrange(JournalBatchName, PurchJournalBatchName);
        if PurchJournal.FindLast() then
            LinenoCounter := PurchJournal.LineNo + 10000
        else
            LinenoCounter := 0;

        ClearLastError();

        TempBlob.CreateInStream(ImportedInStream);

        Uploadresult := UploadIntoStream('Import Purch. Journal', '', '', FileName, ImportedInStream);
        if not Uploadresult then
            exit;

        TempXMLBuffer.DeleteAll();
        TempXMLBuffer.LoadFromStream(ImportedInStream);

        TempXMLBuffer.Reset();
        if TempXMLBuffer.IsEmpty then
            exit;
        IF TotalLines = 0 then begin
            TempXMLBuffer.SetRange(Path, '/Rows/row/PostingDate');
            IF TempXMLBuffer.FINDLAST then
                TotalLines := ROUND(TempXMLBuffer.Count, 1);
        end;
        TempXMLBuffer.SetRange(Path);
        Window.OPEN(
                  Text000 +
                  Text001);

        Window.Update(1, TotalLines);
        IF TempXMLBuffer.findset then
            repeat
                case TempXMLBuffer.Path of

                    '/SupplierBills/Rows/row/PostingDate':
                        begin
                            PurchJournal.init;
                            PurchJournal."Posting Date" := GetDateValue(TempXMLBuffer, '/SupplierBills/Rows/row/PostingDate');
                            LineNoCounter += 10000;
                            PurchJournal.Validate(JournalTemplateName, PurchJournalTemplateName);
                            PurchJournal.Validate(JournalBatchName, PurchJournalBatchName);
                            PurchJournal.LineNo := LineNoCounter;
                            TempText := '';
                        end;
                    '/SupplierBills/Rows/row/DocumentDate':
                        PurchJournal.DocumentDate := GetDateValue(TempXMLBuffer, '/SupplierBills/Rows/row/DocumentDate');
                    '/SupplierBills/Rows/row/DocumentType':
                        begin
                            TempText := GetTextValue(TempXMLBuffer, '/SupplierBills/Rows/row/DocumentType', STRLEN(TempXMLBuffer.value));
                            case TempText of
                                'Invoice':
                                    PurchJournal.DocumentType := PurchJournal.DocumentType::Invoice;
                                'Credit Memo':
                                    PurchJournal.DocumentType := PurchJournal.DocumentType::"Credit Memo";
                                'Payment':
                                    PurchJournal.DocumentType := PurchJournal.DocumentType::Payment;
                                'Finance Charge Memo':
                                    PurchJournal.DocumentType := PurchJournal.DocumentType::"Finance Charge Memo";
                                'Refund':
                                    PurchJournal.DocumentType := PurchJournal.DocumentType::Refund;
                                'Reminder':
                                    PurchJournal.DocumentType := PurchJournal.DocumentType::Reminder;
                                ' ':
                                    PurchJournal.DocumentType := PurchJournal.DocumentType::" ";


                            end;
                        end;
                    '/SupplierBills/Rows/row/DocumentNo':
                        PurchJournal."Document No." := GetTextValue(TempXMLBuffer, '/SupplierBills/Rows/row/DocumentNo', MaxStrLen(PurchJournal."Document No."));
                    '/SupplierBills/Rows/row/AccountType':
                        begin
                            TempText := GetTextValue(TempXMLBuffer, '/SupplierBills/Rows/row/AccountType', STRLEN(TempXMLBuffer.value));
                            case TempText of
                                'Customer':
                                    PurchJournal."Account Type" := PurchJournal."Account Type"::Customer;
                                'G/L Account':
                                    PurchJournal."Account Type" := PurchJournal."Account Type"::"G/L Account";
                                'Bank Account':
                                    PurchJournal."Account Type" := PurchJournal."Account Type"::"Bank Account";
                                'Employee':
                                    PurchJournal."Account Type" := PurchJournal."Account Type"::Employee;
                                'Fixed Asset':
                                    PurchJournal."Account Type" := PurchJournal."Account Type"::"Fixed Asset";
                                'IC Partner':
                                    PurchJournal."Account Type" := PurchJournal."Account Type"::"IC Partner";
                                'Vendor':
                                    PurchJournal."Account Type" := PurchJournal."Account Type"::"Vendor";
                            end;
                        end;
                    '/SupplierBills/Rows/row/AccountNo':
                        PurchJournal."Account No." := GetTextValue(TempXMLBuffer, '/SupplierBills/Rows/row/Account', MaxStrLen(PurchJournal."Account No."));
                    '/SupplierBills/Rows/row/Description':
                        PurchJournal.Description := GetTextValue(TempXMLBuffer, '/SupplierBills/Rows/row/Description', MaxStrLen(PurchJournal.Description));
                    '/SupplierBills/Rows/row/VatBusPostingGroup':
                        PurchJournal.VatBusPostingGroup := GetTextValue(TempXMLBuffer, '/SupplierBills/Rows/row/VatBusPostingGroup', MaxStrLen(PurchJournal.VatBusPostingGroup));
                    '/SupplierBills/Rows/row/VATProdPostingGroup':
                        PurchJournal.VATProdPostingGroup := GetTextValue(TempXMLBuffer, '/SupplierBills/Rows/row/VATProdPostingGroup', MaxStrLen(PurchJournal.VATProdPostingGroup));
                    '/SupplierBills/Rows/row/DepartmentCode':
                        PurchJournal.DepartmentCode := GetTextValue(TempXMLBuffer, '/SupplierBills/Rows/row/DepartmentCode', MaxStrLen(PurchJournal.DepartmentCode));
                    '/SupplierBills/Rows/row/ProjectCode':
                        PurchJournal.ProjectCode := GetTextValue(TempXMLBuffer, '/SupplierBills/Rows/row/ProjectCode', MaxStrLen(PurchJournal.ProjectCode));
                    '/SupplierBills/Rows/row/CurrencyCode':
                        PurchJournal.CurrencyCode := GetTextValue(TempXMLBuffer, '/SupplierBills/Rows/row/CurrencyCode', MaxStrLen(PurchJournal.CurrencyCode));
                    '/SupplierBills/Rows/row/Amount':
                        PurchJournal.Amount := GetDecimalValue(TempXMLBuffer, '/SupplierBills/Rows/row/Amount');
                    '/SupplierBills/Rows/AmountLCY':
                        PurchJournal."Amount (LCY)" := GetDecimalValue(TempXMLBuffer, '/SupplierBills/Rows/row/AmountLCY');
                    '/SupplierBills/Rows/row/DueDate':
                        PurchJournal.DueDate := GetDateValue(TempXMLBuffer, '/SupplierBills/Rows/row/DueDate');
                    '/SupplierBills/Rows/row/AppliesToDocNo':
                        ;
                    '/SupplierBills/Rows/row/ExternalDocumentNo':
                        PurchJournal."ExternalDocumentNo" := GetTextValue(TempXMLBuffer, '/rows/row/ExternalDocumentNo', MaxStrLen(PurchJournal.ExternalDocumentNo));
                    '/SupplierBills/Rows/row/BankGiro':
                        ;
                    '/SupplierBills/Rows/row/Plusgiro':
                        ;
                    '/SupplierBills/Rows/row/Bankkonto':
                        ;
                    '/SupplierBills/Rows/row/ReasonCode':
                        begin
                            Counter += 1;
                            Window.UPDATE(2, counter);
                            PurchJournal.insert;
                        end;



                end;
            Until TempXMLBuffer.next = 0;

        Message(StrSubstNo('%1 Lines imported', Counter));
        Window.CLOSE()



        //EXAMPLE with Lines (And section above would be header)
        // TempXMLBuffer.SetFilter(Path, '/row/OrderLines/ProductLine*');
        // IF SorderCreated then begin
        //     NextSerialLineNo := 10000;
        //     TempXMLBuffer.Find('-');
        //     repeat
        //         case TempXMLBuffer.Path of
        //             '/row/OrderLines/ProductLine':
        //                 begin
        //                     if SOrderLine."Line Id" <> 0 then begin
        //                         SOrderLine.Insert(true);
        //                         NextSerialLineNo := 10000;
        //                     end;
        //                     SOrderLine.Init();
        //                     SOrderLine."Order Id" := SOrderHeader.Id;
        //                 end;

        //         end;
        //     until TempXMLBuffer.Next() = 0;
        //     SOrderLine.Insert(true);

    end;




    internal procedure ValueAsInteger(Value: Text) Result: BigInteger
    begin
        if not Evaluate(Result, Value, 9) then
            Result := 0;
    end;

    internal procedure ValueAsDecimal(Value: Text) Result: Decimal
    begin
        if not Evaluate(Result, Value, 9) then
            Result := 0;
    end;

    internal procedure ValueAsDate(Value: Text) Result: Date
    begin
        if not Evaluate(Result, Value, 9) then
            Result := 0D;
    end;

    Internal procedure ValueAsDateTime(Value: Text) Result: Datetime
    begin
        if not Evaluate(Result, Value, 9) then
            Result := 0DT;
    end;

    internal procedure GetTextValue(TempXMLBuffer: Record "XML Buffer"; SelectPath: Text; Lenght: Integer) Result: Text
    begin
        Result := '';
        Result := CopyStr(TempXMLBuffer.Value, 1, Lenght);
    end;

    internal procedure GetIntegerValue(TempXMLBuffer: Record "XML Buffer"; SelectPath: Text) Result: BigInteger
    begin
        Result := 0;
        //TempXMLBuffer.SetRange(Path, SelectPath);
        //if TempXMLBuffer.FindFirst() then
        if not Evaluate(Result, TempXMLBuffer.Value) then
            Result := 0;
    end;

    internal procedure GetDecimalValue(TempXMLBuffer: Record "XML Buffer"; SelectPath: Text) Result: Decimal
    begin
        Result := 0;
        //TempXMLBuffer.SetRange(Path, SelectPath);
        //if TempXMLBuffer.FindFirst() then begin
        IF STRPOS(TempXMLBuffer.value, '.') <> 0 then
            TempXMLBuffer.value := TempXMLBuffer.value.Replace('.', ',');
        if not Evaluate(Result, TempXMLBuffer.Value) then
            Result := 0;
        //end;
    end;

    internal procedure GetDateTimeValue(TempXMLBuffer: Record "XML Buffer"; SelectPath: Text) Result: DateTime
    begin
        Result := 0DT;
        //TempXMLBuffer.SetRange(Path, SelectPath);
        //if TempXMLBuffer.FindFirst() then
        if not Evaluate(Result, TempXMLBuffer.Value) then
            Result := 0DT;
    end;

    internal procedure GetDateValue(TempXMLBuffer: Record "XML Buffer"; SelectPath: Text) Result: Date
    begin
        Result := 0D;
        //TempXMLBuffer.SetRange(Path, SelectPath);
        //if TempXMLBuffer.FindFirst() then
        if not Evaluate(Result, TempXMLBuffer.Value) then
            Result := 0D;
    end;


}