
xmlport 62004 "PTE WSHelper Customer WS"
{
    Caption = 'WSHelper Customer';
    Direction = Export;
    Encoding = UTF8;
    Format = Xml;
    UseRequestPage = false;

    schema
    {

        tableelement(Customer; Customer)
        {

            fieldelement(id; Customer."No.")
            {
            }
            textelement(currencyId)
            {
                trigger OnBeforePassVariable()
                begin
                    currencyId := '0';
                end;
            }
            textelement(customerCategoryId)
            {
                trigger OnBeforePassVariable()
                begin
                    customerCategoryId := '0';
                end;
            }
            textelement(regionId)
            {
                trigger OnBeforePassVariable()
                begin
                    regionId := '0';
                end;
            }
            fieldelement(invoiceIntervalId; customer."EVRY_TE Invoice Frequency Code")
            {
            }
            textelement(invoiceFeeId)
            {
                trigger OnBeforePassVariable()
                begin
                    invoiceFeeId := '0';
                end;
            }
            textelement(fuelExtraId)
            {
                trigger OnBeforePassVariable()
                begin
                    fuelExtraId := '0';
                end;
            }
            textelement(currencyExtraId)
            {
                trigger OnBeforePassVariable()
                begin
                    currencyExtraId := '0';
                end;
            }
            textelement(invoicePaymentConditionId)
            {
                trigger OnBeforePassVariable()
                begin
                    invoicePaymentConditionId := '0';
                end;
            }
            textelement(invoiceInterestRateId)
            {
                trigger OnBeforePassVariable()
                begin
                    invoiceInterestRateId := '0';
                end;
            }
            textelement(vatRateId)
            {
                trigger OnBeforePassVariable()
                begin
                    vatRateId := '0';
                end;
            }
            textelement(customerCode)
            {
                trigger OnBeforePassVariable()
                begin
                    customerCode := '0';
                end;
            }
            fieldelement(customerNumber; Customer."No.")
            {

            }
            fieldelement(customerName; Customer."Name")
            {
                trigger OnBeforePassField()
                begin

                end;
            }
            fieldelement(companyVisit; Customer."EVRY_TI Visiting Address")
            {
            }

            fieldelement(addressLine1Visit; Customer."EVRY_TI Visiting Address 2")
            {
            }
            textelement(addressLine2Visit)
            {
                trigger OnBeforePassVariable()
                begin
                    addressLine2Visit := '';
                end;
            }
            textelement(addressLine3Visit)
            {
                trigger OnBeforePassVariable()
                begin
                    addressLine3Visit := '';
                end;
            }
            textelement(streetVisit)
            {
                trigger OnBeforePassVariable()
                begin
                    streetVisit := '';
                end;
            }
            textelement(streetNoVisit)
            {
                trigger OnBeforePassVariable()
                begin
                    streetNoVisit := '';
                end;
            }
            fieldelement(zipNoVisit; Customer."EVRY_TI Visiting Post Code")
            {
            }
            fieldelement(cityVisit; Customer."EVRY_TI Visiting City")
            {
            }
            fieldelement(stateVisit; Customer."EVRY_TI Visiting Country Code")
            {
            }
            textelement(countryIdVisit)
            {
                trigger OnBeforePassVariable()
                begin
                    countryIdVisit := '0';
                end;
            }
            textelement(informationVisit)
            {
                trigger OnBeforePassVariable()
                begin
                    informationVisit := '';
                end;
            }
            textelement(entreCodeVisit)
            {
                trigger OnBeforePassVariable()
                begin
                    entreCodeVisit := '';
                end;
            }
            fieldelement(companyInvoice; Customer."Bill-to Customer No.")
            {

            }
            fieldelement(addressLine1Invoice; Customer.Address)
            {
            }
            fieldelement(addressLine2Invoice; Customer."Address 2")
            {
            }
            textelement(addressLine3Invoice)
            {
                trigger OnBeforePassVariable()
                begin
                    addressLine3Invoice := '';
                end;
            }
            textelement("streetInvoice")
            {
                trigger OnBeforePassVariable()
                begin
                    streetInvoice := '';
                end;
            }
            fieldelement(zipCodeInvoice; customer."Post Code")
            {
            }
            fieldelement(cityInvoice; customer.City)
            {
            }
            fieldelement(stateInvoice; customer."Country/Region Code")
            {
            }
            textelement(countryIdInvoice)
            {
                trigger OnBeforePassVariable()
                begin
                    countryIdInvoice := '0';
                end;
            }
            textelement(informationInvoice)
            {
                trigger OnBeforePassVariable()
                begin
                    informationInvoice := '';
                end;
            }
            textelement(active)
            {
                trigger OnBeforePassVariable()
                begin
                    if Customer.Blocked <> customer.Blocked::" " then
                        active := 'true'
                    else
                        active := 'false'
                end;
            }
            fieldelement(changed; Customer."Last Modified Date Time")
            {
            }
            fieldelement(emailAdress; Customer."E-Mail")
            {
            }
            fieldelement(emailAdressInvoice; customer."TE_EDI E-Mail")
            {
            }
            textelement(organizationNumber)
            {
                trigger OnBeforePassVariable()
                begin
                    organizationNumber := '';
                end;
            }
            fieldelement(vatNumber; Customer."VAT Registration No.")
            {
            }
            fieldelement(bankAccountNumber; customer."Preferred Bank Account Code")
            {
            }
            textelement(iban)
            {
                trigger OnBeforePassVariable()
                begin
                    iban := '';
                end;
            }

            textelement(bic)
            {
                trigger OnBeforePassVariable()
                begin
                    bic := '';
                end;
            }
            fieldelement(phone1; customer."Phone No.")
            {
            }
            fieldelement(phone2; Customer."Mobile Phone No.")
            {
            }
            textelement(information)
            {
                trigger OnBeforePassVariable()
                begin
                    information := '';
                end;
            }
            textelement(dispatchInformation)
            {
                trigger OnBeforePassVariable()
                begin
                    dispatchInformation := '';
                end;
            }
            textelement(driverInformation)
            {
                trigger OnBeforePassVariable()
                begin
                    driverInformation := '';
                end;
            }
            textelement(orderAllowed)
            {
                trigger OnBeforePassVariable()
                begin
                    orderAllowed := 'true';
                end;
            }
            fieldelement(creditLimit; Customer."Credit Limit (LCY)")
            {
            }
            fieldelement(invoiceReference; customer.Contact)
            {
            }
            textelement(noFuelExtra)
            {
                trigger OnBeforePassVariable()
                begin
                    noFuelExtra := 'true';
                end;
            }

            textelement(latitude)
            {
                trigger OnBeforePassVariable()
                begin
                    latitude := '0';
                end;
            }
            textelement(longitude)
            {
                trigger OnBeforePassVariable()
                begin
                    longitude := '0';
                end;
            }
        }
    }
}
