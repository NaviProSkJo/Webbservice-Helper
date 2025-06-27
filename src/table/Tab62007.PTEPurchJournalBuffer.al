table 62007 "PTE Purch Journal Buffer"
{
    Caption = 'Sales Journal Buffer';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; JournalTemplateName; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Journal Template Name';
        }
        field(2; JournalBatchName; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Journal Batch Name';
        }
        field(3; LineNo; integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No.';
        }
        field(4; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Posting Date';
        }
        field(5; DocumentDate; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Document Date';
        }
        field(6; DocumentType; Enum "Gen. Journal Document Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Document Type';
        }
        field(7; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
        }
        field(8; "Account Type"; Enum "Gen. Journal Account Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Account Type';
        }
        field(9; "Account No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Account No.';
        }
        field(10; Description; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(11; DepartmentCode; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Department Code';
        }
        field(12; ProjectCode; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Project Code';
        }
        field(13; CurrencyCode; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Currency Code';
        }
        field(14; Amount; decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount';
        }
        field(15; "Amount (LCY)"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount (LCY)';
        }
        field(16; AppliesToDocNo; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Applies to Doc. No.';
        }
        field(17; BankGiro; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Giro';
        }
        field(18; Plusgiro; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Plus Giro';
        }
        field(19; "Bank Account No."; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Account No.';
        }
        field(20; "Reason Code"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Reason Code';
        }
        field(21; VatBusPostingGroup; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Vat Bus Posting Group';
        }
        field(22; VATProdPostingGroup; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'VAT Prod Posting Group';
        }
        field(23; ExternalDocumentNo; code[35])
        {
            DataClassification = CustomerContent;
            Caption = 'External Document No.';
        }
        field(30; ProjectDimensionMissing; boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Project Dimension is missing';
        }
        field(31; DepartmentDimensionMissing; boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Department Dimension is missing';
        }
        field(32; "AccountNoIsMissing"; boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Account No. is missing';
        }
        field(33; "VendorIsMissing"; boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Vendor is missing';
        }
        field(34; "VATProdPostingGrpIsMissing"; boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Customer is missing';
        }
        field(35; "VATBusPostingGrpIsMissing"; boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Customer is missing';
        }
        field(36; "LineNoIsOccupied"; boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No Is Occupied in Journal';
        }
        field(37; DueDate; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Due Date';
        }


    }
    keys
    {
        key(PK; "JournalTemplateName", JournalBatchName, LineNo)
        {
            Clustered = true;
        }
    }
}
