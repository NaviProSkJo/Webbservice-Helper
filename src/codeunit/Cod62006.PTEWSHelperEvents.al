codeunit 62006 "PTE WSHelper Events"
{
    SingleInstance = true;
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterModifyEvent', '', false, false)]
    local procedure "Customer_OnAfterModifyEvent"(var Rec: Record Customer; var xRec: Record Customer; RunTrigger: Boolean)
    var
        CustomerExport: record "PTE WSH Customer Export";
        CustomerExport2: record "PTE WSH Customer Export";
        Customer2: record Customer;
        Setup: Record "PTE WSHelper Setup";
        PaymentTerms: record "Payment Terms";
        MainFiedsModified: Boolean;
        RecCurrentKreditLimit: Decimal;
    begin
        if Rec.IsTemporary() then
            exit;
        if not Rec."PTE Opter Customer" then
            exit;
        if runtrigger = false then
            exit;
        Setup.get();
        //Cust Credit limit changed and Opter true OR Opter Set from fakse to True
        //if ((rec."Credit Limit (LCY)" = xrec."Credit Limit (LCY)") and (rec."Opter Customer" = true)) OR ((rec."Opter Customer" <> Xrec."Opter Customer") and (rec."Opter Customer" = true)) then
        //    exit;
        //INSERT

        if rec."PTE Opter ID" = 0 then begin
            CustomerExport2.SetCurrentKey("Customer No.", "Export status", "Export OK");
            CustomerExport2.SetRange("Customer No.", rec."No.");
            CustomerExport2.SetRange("Export status", CustomerExport2."Export status"::New);
            CustomerExport2.Setrange("Export ok", false);
            if NOT CustomerExport2.FindFirst() then begin
                //NEW POST
                CustomerExport.Init();
                CustomerExport."Entry No." := 0;
                CustomerExport."Export Created Datetime" := CurrentDateTime;
                CustomerExport."Export status" := CustomerExport."Export status"::New;
                CustomerExport."Customer No." := rec."No.";
                CustomerExport."Customer Name" := Rec.Name;
                CustomerExport.Insert(false);
            end
            else begin
                //POST ALLREADY EXISTS
                CustomerExport2."Export Created Datetime" := CurrentDateTime;
                CustomerExport2.modify(false);
            end;
        end
        else begin
            //MODifY    
            MainFiedsModified := false;
            CustomerExport2.SetCurrentKey("Customer No.", "Export status", "Export OK");
            CustomerExport2.SetRange("Customer No.", rec."No.");
            CustomerExport2.SetRange("Export status", CustomerExport2."Export status"::Modified);
            CustomerExport2.Setrange("Export ok", false);
            if NOT CustomerExport2.FindFirst() then begin
                //NEW POST
                CustomerExport.Init();
                CustomerExport."Entry No." := 0;
                CustomerExport."Export Created Datetime" := CurrentDateTime;
                CustomerExport."Export status" := CustomerExport."Export status"::Modified;
                CustomerExport."Customer No." := rec."No.";
                CustomerExport."Customer Name" := Rec.Name;
                IF (rec."Payment Terms Code" <> xrec."Payment Terms Code") and (rec."Payment Terms Code" <> '') then begin
                    IF PaymentTerms.get(rec."Payment Terms Code") then begin
                        IF PaymentTerms."PTE Opter ID" <> 0 then
                            CustomerExport.invoicePaymentConditionId := PaymentTerms."PTE Opter ID"
                        else
                            CustomerExport.invoicePaymentConditionId := 0;
                        MainFiedsModified := true;
                    end;
                end
                else begin
                    IF (rec."Payment Terms Code" <> xrec."Payment Terms Code") then begin
                        CustomerExport.invoicePaymentConditionId := 0;
                        MainFiedsModified := true;
                    end;
                end;

                if xRec."No." <> rec."No." then begin
                    CustomerExport."Customer No." := rec."No.";
                    CustomerExport.customerCode := rec."No.";
                end;
                if xRec."Name" <> rec."Name" then begin
                    CustomerExport.name := rec."Name";
                    CustomerExport.companyInvoice := rec.Name;
                    CustomerExport.companyVisit := Rec.Name;
                    CustomerExport.addressLine1Visit := rec.Name;
                    CustomerExport.addressLine1Invoice := rec.Name;
                    MainFiedsModified := true;
                end;

                if rec.Address <> xrec.Address then begin
                    //CustomerExport.addressLine2Invoice := rec.Address;
                    //CustomerExport.addressLine2Visit := rec.Address;
                    CustomerExport.streetVisit := rec.Address;
                    CustomerExport.streetInvoice := rec.Address;

                    MainFiedsModified := true;
                end;

                if xRec."EVRY_TI Visiting Post Code" <> rec."EVRY_TI Visiting Post Code" then begin
                    CustomerExport.zipCodeVisit := rec."EVRY_TI Visiting Post Code";
                    MainFiedsModified := true;
                end;
                if xRec."EVRY_TI Visiting City" <> rec."EVRY_TI Visiting City" then begin
                    CustomerExport.cityVisit := rec."EVRY_TI Visiting City";
                    MainFiedsModified := true;
                end;
                if xRec."EVRY_TI Visiting Country Code" <> rec."EVRY_TI Visiting Country Code" then begin
                    CustomerExport.stateVisit := rec."EVRY_TI Visiting Country Code";
                    MainFiedsModified := true;
                end;


                if xRec."Post Code" <> rec."Post Code" then begin
                    CustomerExport.zipCodeInvoice := rec."Post Code";
                    MainFiedsModified := true;
                end;
                if xRec."City" <> rec."City" then begin
                    CustomerExport.cityInvoice := rec.City;
                    MainFiedsModified := true;
                end;
                if xRec."Country/Region Code" <> rec."Country/Region Code" then begin
                    CustomerExport.stateInvoice := rec."Country/Region Code";
                    MainFiedsModified := true;
                end;
                if xRec."E-Mail" <> rec."E-Mail" then begin
                    CustomerExport.emailAdress := rec."E-Mail";
                    MainFiedsModified := true;
                end;
                if xRec."TE_EDI E-Mail" <> rec."TE_EDI E-Mail" then begin
                    CustomerExport.emailAdressInvoice := rec."TE_EDI E-Mail";
                    MainFiedsModified := true;
                end;
                if xRec."VAT Registration No." <> rec."VAT Registration No." then begin
                    CustomerExport.vatNumber := rec."VAT Registration No.";
                    MainFiedsModified := true;
                end;
                if xRec."Preferred Bank Account Code" <> rec."Preferred Bank Account Code" then begin
                    CustomerExport.bankAccountNumber := rec."Preferred Bank Account Code";
                    MainFiedsModified := true;
                end;
                if xRec."Phone No." <> rec."Phone No." then begin
                    CustomerExport.phone1 := rec."Phone No.";
                    MainFiedsModified := true;
                end;
                if xRec."Mobile Phone No." <> rec."Mobile Phone No." then begin
                    CustomerExport.phone2 := rec."Mobile Phone No.";
                    MainFiedsModified := true;
                end;
                if xRec.Contact <> rec.Contact then begin
                    CustomerExport.invoiceReference := rec.Contact;
                    MainFiedsModified := true;
                end;

                rec.CalcFields("Balance (LCY)");
                RecCurrentKreditLimit := ROUND(rec."Credit Limit (LCY)" - rec."Balance (LCY)", 0.000001, '=');
                IF (RecCurrentKreditLimit <> rec."PTE Opter Credit Limit") and (RecCurrentKreditLimit > 0) then begin
                    MainFiedsModified := true;
                    Customer2.get(rec."No.");
                    Customer2."PTE Opter Credit Limit" := RecCurrentKreditLimit;
                    Customer2.Modify(false);
                    CustomerExport."Opter Credit Limit" := RecCurrentKreditLimit;
                end
                else begin
                    if RecCurrentKreditLimit < 0 then begin
                        //Customer2.get(Customer."No.");
                        //Customer2.Blocked := Customer2.Blocked::Ship;
                        MainFiedsModified := true;
                        Customer2.get(rec."No.");
                        Customer2."PTE Opter Credit Limit" := RecCurrentKreditLimit;
                        Customer2.Modify(false);
                        CustomerExport."Opter Credit Limit" := RecCurrentKreditLimit;
                    end
                end;


                if xRec.Contact <> rec.Contact then begin
                    CustomerExport.invoiceReference := rec.Contact;
                    MainFiedsModified := true;
                end;

                IF rec.Blocked = rec.Blocked::" " then
                    CustomerExport.orderAllowed := true
                else
                    CustomerExport.orderAllowed := false;

                IF rec."PEB Registration No." <> xRec."PEB Registration No." then begin
                    CustomerExport.organizationNumber := rec."PEB Registration No.";
                    MainFiedsModified := true;
                end;

                if (xRec.Blocked <> rec.Blocked) then
                    MainFiedsModified := true;

                IF MainFiedsModified = true then
                    CustomerExport.Insert(false);
            end
            else begin
                //POST ALLREADY EXISTS
                MainFiedsModified := false;

                IF (rec."Payment Terms Code" <> xrec."Payment Terms Code") and (rec."Payment Terms Code" <> '') then begin
                    IF PaymentTerms.get(rec."Payment Terms Code") then begin
                        IF PaymentTerms."PTE Opter ID" <> 0 then
                            CustomerExport.invoicePaymentConditionId := PaymentTerms."PTE Opter ID"
                        else
                            CustomerExport.invoicePaymentConditionId := 0;
                        MainFiedsModified := true;
                    end;
                end
                else begin
                    IF (rec."Payment Terms Code" <> xrec."Payment Terms Code") then begin
                        CustomerExport.invoicePaymentConditionId := 0;
                        MainFiedsModified := true;
                    end;
                end;
                CustomerExport2."Export Created Datetime" := CurrentDateTime;
                if xRec."No." <> rec."No." then begin
                    CustomerExport2."Customer No." := rec."No.";
                    CustomerExport2.customerCode := rec."No.";
                end;
                if xRec."Name" <> rec."Name" then begin
                    CustomerExport2.name := rec."Name";
                    CustomerExport2.companyInvoice := rec.Name;
                    CustomerExport2.companyVisit := Rec.Name;
                    CustomerExport2.addressLine1Visit := rec.Name;
                    CustomerExport2.addressLine1Invoice := rec.Name;
                    MainFiedsModified := true;
                end;

                if rec.Address <> xrec.Address then begin
                    //CustomerExport2.addressLine2Invoice := rec.Address;
                    //CustomerExport2.addressLine2Visit := rec.Address;
                    CustomerExport2.streetVisit := rec.Address;
                    CustomerExport2.streetInvoice := rec.Address;
                    MainFiedsModified := true;
                end;

                if xRec."EVRY_TI Visiting Post Code" <> rec."EVRY_TI Visiting Post Code" then begin
                    CustomerExport2.zipCodeVisit := rec."EVRY_TI Visiting Post Code";
                    MainFiedsModified := true;
                end;
                if xRec."EVRY_TI Visiting City" <> rec."EVRY_TI Visiting City" then begin
                    CustomerExport2.cityVisit := rec."EVRY_TI Visiting City";
                    MainFiedsModified := true;
                end;
                if xRec."EVRY_TI Visiting Country Code" <> rec."EVRY_TI Visiting Country Code" then begin
                    CustomerExport2.stateVisit := rec."EVRY_TI Visiting Country Code";
                    MainFiedsModified := true;
                end;

                if xRec."Post Code" <> rec."Post Code" then begin
                    CustomerExport2.zipCodeInvoice := rec."Post Code";
                    MainFiedsModified := true;
                end;
                if xRec."City" <> rec."City" then begin
                    CustomerExport2.cityInvoice := rec.City;
                    MainFiedsModified := true;
                end;
                if xRec."Country/Region Code" <> rec."Country/Region Code" then begin
                    CustomerExport2.stateInvoice := rec."Country/Region Code";
                    MainFiedsModified := true;
                end;
                if xRec."E-Mail" <> rec."E-Mail" then begin
                    CustomerExport2.emailAdress := rec."E-Mail";
                    MainFiedsModified := true;
                end;
                if xRec."TE_EDI E-Mail" <> rec."TE_EDI E-Mail" then begin
                    CustomerExport2.emailAdressInvoice := rec."TE_EDI E-Mail";
                    MainFiedsModified := true;
                end;
                if xRec."VAT Registration No." <> rec."VAT Registration No." then begin
                    CustomerExport2.vatNumber := rec."VAT Registration No.";
                    MainFiedsModified := true;
                end;
                if xRec."Preferred Bank Account Code" <> rec."Preferred Bank Account Code" then begin
                    CustomerExport2.bankAccountNumber := rec."Preferred Bank Account Code";
                    MainFiedsModified := true;
                end;
                if xRec."Phone No." <> rec."Phone No." then begin
                    CustomerExport2.phone1 := rec."Phone No.";
                    MainFiedsModified := true;
                end;

                if xRec."Mobile Phone No." <> rec."Mobile Phone No." then begin
                    CustomerExport2.phone2 := rec."Mobile Phone No.";
                    MainFiedsModified := true;
                end;

                rec.CalcFields("Balance (LCY)");
                RecCurrentKreditLimit := ROUND(rec."Credit Limit (LCY)" - rec."Balance (LCY)", 0.000001, '=');
                IF (RecCurrentKreditLimit <> rec."PTE Opter Credit Limit") and (RecCurrentKreditLimit > 0) then begin
                    MainFiedsModified := true;
                    Customer2.get(rec."No.");
                    Customer2."PTE Opter Credit Limit" := RecCurrentKreditLimit;
                    Customer2.Modify(false);
                    CustomerExport2."Opter Credit Limit" := RecCurrentKreditLimit;
                end
                else begin
                    if RecCurrentKreditLimit < 0 then begin
                        //Customer2.get(Customer."No.");
                        //Customer2.Blocked := Customer2.Blocked::Ship;
                        Customer2.get(rec."No.");
                        MainFiedsModified := true;
                        Customer2."PTE Opter Credit Limit" := RecCurrentKreditLimit;
                        Customer2.Modify(false);
                        CustomerExport2."Opter Credit Limit" := RecCurrentKreditLimit;
                    end
                end;

                if xRec.Contact <> rec.Contact then begin
                    CustomerExport2.invoiceReference := rec.Contact;
                    MainFiedsModified := true;
                end;

                IF rec.Blocked = rec.Blocked::" " then
                    CustomerExport2.orderAllowed := true
                else
                    CustomerExport2.orderAllowed := false;

                IF rec."PEB Registration No." <> xRec."PEB Registration No." then begin
                    CustomerExport2.organizationNumber := rec."PEB Registration No.";
                    MainFiedsModified := true;
                end;

                if (xRec.Blocked <> rec.Blocked) then
                    MainFiedsModified := true;

                IF MainFiedsModified = true then
                    CustomerExport2.modify(false);
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterDeleteEvent', '', false, false)]
    local procedure "Customer_OnAfterDeleteEvent"(var Rec: Record Customer; RunTrigger: Boolean)
    var
        CustomerExport: record "PTE WSH Customer Export";
        CustomerExport2: record "PTE WSH Customer Export";
        Setup: Record "PTE WSHelper Setup";
    begin
        if Rec.IsTemporary() then
            exit;
        if not Rec."PTE Opter Customer" then
            exit;
        if rec."PTE Opter ID" = 0 then
            exit;
        Setup.get();
        //if NOT Setup."Allow Cust. integration Delete" then
        //    exit;
        CustomerExport2.SetCurrentKey("Customer No.", "Export status", "Export OK");
        CustomerExport2.SetRange("Customer No.", rec."No.");
        CustomerExport2.SetRange("Export status", CustomerExport2."Export status"::Deleted);
        CustomerExport2.Setrange("Export ok", false);
        if NOT CustomerExport2.FindFirst() then begin
            //NEW POST
            CustomerExport.Init();
            CustomerExport."Entry No." := 0;
            CustomerExport."Export Created Datetime" := CurrentDateTime;
            CustomerExport."Export status" := CustomerExport."Export status"::deleted;
            CustomerExport."Customer No." := rec."No.";
            CustomerExport."Opter ID" := rec."PTE Opter ID";
            CustomerExport."Customer Name" := Rec.Name;
            CustomerExport.Insert(false);
        end
        else begin
            //POST ALLREADY EXISTS
            CustomerExport2."Export Created Datetime" := CurrentDateTime;
            CustomerExport2.modify(false);
        end;
    end;



}
