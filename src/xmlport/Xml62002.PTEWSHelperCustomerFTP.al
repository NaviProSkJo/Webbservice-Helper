
xmlport 62002 "PTE WSHelper Customer FTP"
{
    Caption = 'WSHelper Customer FTP';
    Direction = Export;
    Encoding = UTF8;
    Format = Xml;
    UseRequestPage = false;

    schema
    {
        textelement(UpdateCustomers)
        {
            tableelement(Customer; Customer)
            {
                fieldelement(CustomerNumber; Customer."No.")
                {
                }
                textelement(AllowCreate)
                {
                }
                textelement(IsActive)
                {
                }
                fieldelement(CompanyName; Customer.Name)
                {
                }

                fieldelement(SalesPersonExportId; Customer."Salesperson Code")
                {
                }
                fieldelement(GLN; Customer.GLN)
                {
                }
                textelement(ContactInformation)
                {
                    fieldelement(FirstName; Customer.Contact)
                    {
                    }
                    textelement(LastName)
                    {
                    }
                    fieldelement(Phone; Customer."Phone No.")
                    {
                    }
                    fieldelement(Email; Customer."E-Mail")
                    {
                    }
                }
                textelement(SendUserActivation)
                {
                }
                textelement(ExtrinsicFields)
                {
                    textelement(ExtrinsicField)
                    {
                        textelement(UniqueIdentifier)
                        {
                        }
                        textelement(DefaultValue)
                        {
                        }
                    }
                }
                textelement(InvoiceAddresses)
                {
                    tableelement(InvAddressLoop; Integer)
                    {
                        XmlName = 'Address';
                        textelement(InvAddressID)
                        {
                            XmlName = 'ID';
                        }
                        textelement(InvAddressGLN)
                        {
                            XmlName = 'GLN';
                        }
                        textelement(InvAddressName)
                        {
                            XmlName = 'Name';
                        }
                        textelement(InvAddressStreet1)
                        {
                            XmlName = 'Street1';
                        }
                        textelement(InvAddressStreet2)
                        {
                            XmlName = 'Street2';
                        }
                        textelement(InvAddressPostalCode)
                        {
                            XmlName = 'PostalCode';
                        }
                        textelement(InvAddressCity)
                        {
                            XmlName = 'City';
                        }
                        textelement(InvAddressCountry)
                        {
                            XmlName = 'Country';
                            textattribute(InvAddress_alpha2)
                            {
                                XmlName = 'alpha2';
                                trigger OnBeforePassVariable()
                                begin
                                    if InvAddress_alpha2 = '' then
                                        currXMLport.Skip();
                                end;
                            }
                        }
                        trigger OnPreXmlItem()
                        begin
                            InvAddressLoop.SetRange(Number, 1, 2);
                        end;

                        trigger OnAfterGetRecord()
                        var
                            Country: Record "Country/Region";
                            CompInfo: Record "Company Information";
                            BilltoCust: Record Customer;
                        begin
                            CompInfo.Get();
                            CompInfo.TestField("Country/Region Code");

                            if InvAddressLoop.Number = 1 then begin
                                InvAddressID := Customer."No.";
                                InvAddressGLN := Customer.GLN;
                                InvAddressName := Customer.Name;
                                InvAddressStreet1 := Customer.Address;
                                InvAddressStreet2 := Customer."Address 2";
                                InvAddressPostalCode := Customer."Post Code";
                                InvAddressCity := Customer.City;
                                if Customer."Country/Region Code" = '' then
                                    Customer."Country/Region Code" := CompInfo."Country/Region Code";
                                if Country.Get(Customer."Country/Region Code") then begin
                                    InvAddressCountry := Country.Code;
                                    InvAddress_alpha2 := Country."ISO Code"
                                end
                                else begin
                                    InvAddressCountry := '';
                                    InvAddress_alpha2 := '';
                                end;
                            end
                            else begin
                                if (Customer."Bill-to Customer No." <> '') and (Customer."Bill-to Customer No." <> Customer."No.") then begin
                                    BilltoCust.Get(Customer."Bill-to Customer No.");
                                    InvAddressID := BilltoCust."No.";
                                    InvAddressGLN := BilltoCust.GLN;
                                    InvAddressName := BilltoCust.Name;
                                    InvAddressStreet1 := BilltoCust.Address;
                                    InvAddressStreet2 := BilltoCust."Address 2";
                                    InvAddressPostalCode := BilltoCust."Post Code";
                                    InvAddressCity := BilltoCust.City;
                                    if BilltoCust."Country/Region Code" = '' then
                                        BilltoCust."Country/Region Code" := CompInfo."Country/Region Code";
                                    if Country.Get(BilltoCust."Country/Region Code") then begin
                                        InvAddressCountry := Country.Code;
                                        InvAddress_alpha2 := Country."ISO Code"
                                    end
                                    else begin
                                        InvAddressCountry := '';
                                        InvAddress_alpha2 := '';
                                    end;
                                end
                                else
                                    currXMLport.Skip();
                            end;
                        end;
                    }
                }
                textelement(DeliveryAddresses)
                {
                    tableelement(ShipAddressLoop; "Ship-to Address")
                    {
                        XmlName = 'Address';
                        LinkTable = Customer;
                        LinkFields = "Customer No." = field("No.");
                        fieldelement(ShipAddressID; ShipAddressLoop.Code)
                        {
                            XmlName = 'ID';
                        }
                        fieldelement(ShipAddressGLN; ShipAddressLoop.GLN)
                        {
                            XmlName = 'GLN';
                        }
                        fieldelement(ShipAddressName; ShipAddressLoop.Name)
                        {
                            XmlName = 'Name';
                        }
                        fieldelement(ShipAddressStreet1; ShipAddressLoop.Address)
                        {
                            XmlName = 'Street1';
                        }
                        fieldelement(ShipAddressStreet2; ShipAddressLoop."Address 2")
                        {
                            XmlName = 'Street2';
                        }
                        fieldelement(ShipAddressPostalCode; ShipAddressLoop."Post Code")
                        {
                            XmlName = 'PostalCode';
                        }
                        fieldelement(ShipAddressCity; ShipAddressLoop.City)
                        {
                            XmlName = 'City';
                        }
                        textelement(ShipAddressCountry)
                        {
                            XmlName = 'Country';
                            textattribute(ShipAddress_alpha2)
                            {
                                XmlName = 'alpha2';
                                trigger OnBeforePassVariable()
                                begin
                                    if ShipAddress_alpha2 = '' then
                                        currXMLport.Skip();
                                end;
                            }
                        }
                        trigger OnAfterGetRecord()
                        var
                            Country: Record "Country/Region";
                            CompInfo: Record "Company Information";
                        begin
                            CompInfo.Get();
                            CompInfo.TestField("Country/Region Code");

                            if ShipAddressLoop."Country/Region Code" = '' then
                                ShipAddressLoop."Country/Region Code" := CompInfo."Country/Region Code";
                            if Country.Get(Customer."Country/Region Code") then begin
                                ShipAddressCountry := Country.Code;
                                ShipAddress_alpha2 := Country."ISO Code"
                            end
                            else begin
                                ShipAddressCountry := '';
                                ShipAddress_alpha2 := '';
                            end;
                        end;
                    }
                }
                trigger OnAfterGetRecord()
                begin
                    AllowCreate := 'Y';

                    if Customer.Blocked = Customer.Blocked::" " then
                        IsActive := 'Y'
                    else
                        IsActive := 'N';

                    SendUserActivation := 'N';
                end;
            }
        }
    }
}
