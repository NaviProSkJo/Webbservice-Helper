table 62008 "PTE Sales Journal Buffer"
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
        field(11; GenPostingKey; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'GenPostingKey';
        }
        field(12; VatBusPostingGroup; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Vat Bus Posting Group';
        }
        field(13; VATProdPostingGroup; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'VAT Prod Posting Group';
        }

        field(14; DepartmentCode; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Department Code';
        }
        field(15; ProjectCode; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Project Code';
        }
        field(16; CurrencyCode; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Currency Code';
        }
        field(17; Amount; decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount';
        }
        field(19; "Amount (LCY)"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount (LCY)';
        }
        field(20; "Due Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Due Date';
        }
        field(21; "AppliesToDocType"; enum "Gen. Journal Document Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Applies To Doc. Type';
        }
        field(22; AppliesToDocNo; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Applies To Doc. No.';
        }
        field(23; ExternalDocumentNo; code[35])
        {
            DataClassification = CustomerContent;
            Caption = 'External Document No.';
        }
        field(24; SalesCampaignCode; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sales Campaign Code';
        }
        field(25; "SalespersPurchCode"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sales/Purch -person Code';
        }
        field(26; "Reason Code"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Reason Code';
        }
        field(30; ProjectDimensionMissing; boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Project Dimension is missing';
        }
        field(31; DepartmentDimensionMissing; boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Department Dimension is missing';
        }
        field(32; "AccountNoIsMissing"; boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Account No. is missing';
        }
        field(33; "CustomerIsMissing"; boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer is missing';
        }
        field(34; "VATProdPostingGrpIsMissing"; boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer is missing';
        }
        field(35; "VATBusPostingGrpIsMissing"; boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer is missing';
        }
        field(36; "LineNoIsOccupied"; boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Line No Is Occupied in Journal';
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
