table 62006 "PTE WSH Customer Export"
{
    Caption = 'WSH Customer Export';
    DataClassification = CustomerContent;
    LookupPageId = "PTE WSH Customer export";
    DrillDownPageId = "PTE WSH Customer export";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            DataClassification = CustomerContent;
        }
        field(2; "Export Datetime"; DateTime)
        {
            Caption = 'Export Datetime';
            DataClassification = CustomerContent;
        }
        field(3; "Response Message Blob"; Blob)
        {
            Caption = 'Response Message Blob';
            DataClassification = CustomerContent;
        }
        field(4; "Response Message"; Text[250])
        {
            Caption = 'Response Message';
            DataClassification = CustomerContent;
        }
        field(5; "Export Type"; Text[30])
        {
            Caption = 'Export Type';
            DataClassification = CustomerContent;
        }
        field(6; "Export status"; Enum "PTE WSH Export Status")
        {
            Caption = 'Export status';
            DataClassification = CustomerContent;
        }
        field(7; "Export OK"; Boolean)
        {
            Caption = 'Export OK';
            DataClassification = CustomerContent;
        }
        field(8; "Export Content"; blob)
        {
            Caption = 'Export Content';
            DataClassification = CustomerContent;
        }
        field(9; "Customer No."; code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer."No.";
            DataClassification = CustomerContent;
        }
        field(10; XMLBlob; blob)
        {
            Caption = 'XML';
            DataClassification = CustomerContent;
        }
        field(11; "Export Created Datetime"; DateTime)
        {
            Caption = 'Export Created Datetime';
            DataClassification = CustomerContent;
        }
        field(12; "Opter ID"; integer)
        {
            Caption = 'Opter ID';
            DataClassification = CustomerContent;
        }
        field(13; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
        }
        field(200; "id"; integer)
        {
            Caption = 'id', Locked = true;
            DataClassification = CustomerContent;
        }
        field(201; "currencyId"; Integer)
        {
            Caption = 'currencyId';
            DataClassification = CustomerContent;
        }
        field(202; "customerCategoryId"; Integer)
        {
            Caption = 'customerCategoryId';
            DataClassification = CustomerContent;
        }
        field(203; "regionId"; Integer)
        {
            Caption = 'regionId';
            DataClassification = CustomerContent;
        }
        field(204; "invoiceIntervalId"; Integer)
        {
            Caption = 'invoiceIntervalId';
            DataClassification = CustomerContent;
        }
        field(205; "invoiceFeeId"; Integer)
        {
            Caption = 'invoiceFeeId';
            DataClassification = CustomerContent;
        }
        field(206; "fuelExtraId"; Integer)
        {
            Caption = 'fuelExtraId';
            DataClassification = CustomerContent;
        }
        field(207; "currencyExtraId"; Integer)
        {
            Caption = 'currencyExtraId';
            DataClassification = CustomerContent;
        }
        field(208; "invoicePaymentConditionId"; Integer)
        {
            Caption = 'invoicePaymentConditionId';
            DataClassification = CustomerContent;
        }
        field(209; "invoiceInterestRateId"; Integer)
        {
            Caption = 'invoiceInterestRateId';
            DataClassification = CustomerContent;
        }
        field(210; "vatRateId"; Integer)
        {
            Caption = 'vatRateId';
            DataClassification = CustomerContent;
        }
        field(211; "customerCode"; Code[20])
        {
            Caption = 'customerCode';
            DataClassification = CustomerContent;
        }
        field(212; "customerNumber"; Code[20])
        {
            Caption = 'customerNumber';
            DataClassification = CustomerContent;
        }
        field(213; "name"; Text[100])
        {
            Caption = 'name';
            DataClassification = CustomerContent;
        }
        field(214; "companyVisit"; Text[100])
        {
            Caption = 'companyVisit';
            DataClassification = CustomerContent;
        }
        field(215; "addressLine1Visit"; Text[50])
        {
            Caption = 'addressLine1Visit';
            DataClassification = CustomerContent;
        }
        field(216; "addressLine2Visit"; Text[50])
        {
            Caption = 'addressLine2Visit';
            DataClassification = CustomerContent;
        }
        field(217; "addressLine3Visit"; Text[50])
        {
            Caption = 'addressLine3Visit';
            DataClassification = CustomerContent;
        }
        field(218; "streetVisit"; Text[50])
        {
            Caption = 'streetVisit';
            DataClassification = CustomerContent;
        }
        field(219; "streetNoVisit"; Text[50])
        {
            Caption = 'streetNoVisit';
            DataClassification = CustomerContent;
        }
        field(220; "zipCodeVisit"; Code[20])
        {
            Caption = 'zipCodeVisit';
            DataClassification = CustomerContent;
        }
        field(221; "cityVisit"; Text[30])
        {
            Caption = 'cityVisit';
            DataClassification = CustomerContent;
        }
        field(222; "stateVisit"; Code[10])
        {
            Caption = 'stateVisit';
            DataClassification = CustomerContent;
        }
        field(223; "informationVisit"; Text[50])
        {
            Caption = 'informationVisit';
            DataClassification = CustomerContent;
        }
        field(224; "entreCodeVisit"; Text[50])
        {
            Caption = 'entreCodeVisit';
            DataClassification = CustomerContent;
        }
        field(225; "companyInvoice"; Code[20])
        {
            Caption = 'companyInvoice';
            DataClassification = CustomerContent;
        }
        field(226; "addressLine1Invoice"; Text[100])
        {
            Caption = 'addressLine1Invoice';
            DataClassification = CustomerContent;
        }
        field(227; "addressLine2Invoice"; Text[50])
        {
            Caption = 'addressLine2Invoice';
            DataClassification = CustomerContent;
        }
        field(228; "addressLine3Invoice"; Text[50])
        {
            Caption = 'addressLine3Invoice';
            DataClassification = CustomerContent;
        }
        field(229; "streetInvoice"; Text[50])
        {
            Caption = 'streetInvoice';
            DataClassification = CustomerContent;
        }
        field(230; "streetNoInvoice"; Text[50])
        {
            Caption = 'streetNoInvoice';
            DataClassification = CustomerContent;
        }
        field(231; "zipCodeInvoice"; Code[20])
        {
            Caption = 'zipCodeInvoice';
            DataClassification = CustomerContent;
        }
        field(232; "cityInvoice"; Text[30])
        {
            Caption = 'cityInvoice';
            DataClassification = CustomerContent;
        }
        field(233; "stateInvoice"; Code[10])
        {
            Caption = 'stateInvoice';
            DataClassification = CustomerContent;
        }
        field(234; "informationInvoice"; Text[50])
        {
            Caption = 'informationInvoice';
            DataClassification = CustomerContent;
        }
        field(235; "emailAdress"; Text[80])
        {
            Caption = 'emailAdress';
            DataClassification = CustomerContent;
        }
        field(236; "emailAdressInvoice"; Text[150])
        {
            Caption = 'emailAdressInvoice';
            DataClassification = CustomerContent;
        }
        field(238; "organizationNumber"; Text[50])
        {
            Caption = 'organizationNumber';
            DataClassification = CustomerContent;
        }
        field(239; "vatNumber"; Text[20])
        {
            Caption = 'vatNumber';
            DataClassification = CustomerContent;
        }
        field(240; "bankAccountNumber"; Code[20])
        {
            Caption = 'bankAccountNumber';
            DataClassification = CustomerContent;
        }
        field(241; "iban"; Code[20])
        {
            Caption = 'iban';
            DataClassification = CustomerContent;
        }
        field(242; "bic"; Code[20])
        {
            Caption = 'bic';
            DataClassification = CustomerContent;
        }
        field(243; "phone1"; Text[30])
        {
            Caption = 'phone1';
            DataClassification = CustomerContent;
        }
        field(244; "phone2"; Text[30])
        {
            Caption = 'phone2';
            DataClassification = CustomerContent;
        }
        field(245; "information"; Text[30])
        {
            Caption = 'information';
            DataClassification = CustomerContent;
        }
        field(246; "dispatchInformation"; Text[30])
        {
            Caption = 'dispatchInformation';
            DataClassification = CustomerContent;
        }
        field(247; "driverInformation"; Text[30])
        {
            Caption = 'driverInformation';
            DataClassification = CustomerContent;
        }
        field(248; "orderAllowed"; Boolean)
        {
            Caption = 'orderAllowed';
            DataClassification = CustomerContent;
        }
        field(249; "creditLimit"; decimal)
        {
            Caption = 'creditLimit';
            DataClassification = CustomerContent;
        }
        field(251; "invoiceReference"; Text[100])
        {
            Caption = 'invoiceReference';
            DataClassification = CustomerContent;
        }
        field(252; "noFuelExtra"; Boolean)
        {
            Caption = 'noFuelExtra';
            DataClassification = CustomerContent;
        }
        field(253; "latitude"; Decimal)
        {
            Caption = 'latitude';
            DataClassification = CustomerContent;
        }
        field(254; "longitude"; Decimal)
        {
            Caption = 'longitude';
            DataClassification = CustomerContent;
        }
        field(255; "Opter Credit Limit"; Decimal)
        {
            Caption = 'Opter Credit Limit';
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(key2; "Customer No.", "Export status", "Export OK")
        {
        }
    }
}
