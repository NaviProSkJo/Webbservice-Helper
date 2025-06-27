table 62004 "PTE WSHelper Purch. Order Hdr"
{
    Caption = 'WSHelper Purchase Order Header', Locked = true;
    DataClassification = CustomerContent;
    DrillDownPageId = "PTE WSHelper Purch. Orders";
    fields
    {
        field(1; Id; Integer)
        {
            Caption = 'Id', Locked = true;
            DataClassification = SystemMetadata;
        }
        field(2; "Order Number"; Text[200])
        {
            Caption = 'Order Number', Locked = true;
            DataClassification = CustomerContent;
        }
        field(3; "Sent Order Number"; BigInteger)
        {
            Caption = 'Sent Order Number', Locked = true;
            DataClassification = CustomerContent;
        }
        field(4; "Supplier Order Number"; Text[200])
        {
            Caption = 'Supplier Order Number', Locked = true;
            DataClassification = CustomerContent;
        }
        field(5; "External Purchase Order Number"; Text[200])
        {
            Caption = 'External Purchase Order Number', Locked = true;
            DataClassification = CustomerContent;
        }
        field(7; "Created Date/Time"; DateTime)
        {
            Caption = 'Created Date/Time', Locked = true;
            DataClassification = CustomerContent;
        }
        field(8; "Currency"; Code[10])
        {
            Caption = 'Currency', Locked = true;
            DataClassification = CustomerContent;
        }
        field(10; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.', Locked = true;
            DataClassification = CustomerContent;
        }
        field(11; "Vendor Id"; Integer)
        {
            Caption = 'Vendor Id', Locked = true;
            DataClassification = CustomerContent;
        }
        field(27; "Order Attester"; Text[401])
        {
            Caption = 'Order Attester', Locked = true;
            DataClassification = CustomerContent;
        }
        field(28; "Administrator"; Text[401])
        {
            Caption = 'Administrator', Locked = true;
            DataClassification = CustomerContent;
        }
        field(29; "Administrator Login"; Text[200])
        {
            Caption = 'Administrator Login', Locked = true;
            DataClassification = CustomerContent;
        }
        field(30; "Administrator Export Id"; Text[200])
        {
            Caption = 'Administrator Export Id', Locked = true;
            DataClassification = CustomerContent;
        }
        field(36; "Company Name"; Text[200])
        {
            Caption = 'Company Name', Locked = true;
            DataClassification = CustomerContent;
        }
        field(37; "Company Registration No."; Text[40])
        {
            Caption = 'Company Registration No.', Locked = true;
            DataClassification = CustomerContent;
        }
        field(70; "Customer Order Reference"; Text[100])
        {
            Caption = 'Customer Order Reference', Locked = true;
            DataClassification = CustomerContent;
        }
        field(71; "Goods Label"; Text[100])
        {
            Caption = 'Goods Label', Locked = true;
            DataClassification = CustomerContent;
        }
        field(72; "Delivery Method"; Text[100])
        {
            Caption = 'Delivery Method', Locked = true;
            DataClassification = CustomerContent;
        }
        field(80; "Ship-to Name"; Text[401])
        {
            Caption = 'Ship-to Name', Locked = true;
            DataClassification = CustomerContent;
        }
        field(81; "Ship-to Name 2"; Text[200])
        {
            Caption = 'Ship-to Name 2', Locked = true;
            DataClassification = CustomerContent;
        }
        field(83; "Ship-to Address"; Text[200])
        {
            Caption = 'Ship-to Address', Locked = true;
            DataClassification = CustomerContent;
        }
        field(84; "Ship-to Address 2"; Text[200])
        {
            Caption = 'Ship-to Address 2', Locked = true;
            DataClassification = CustomerContent;
        }
        field(85; "Ship-to Address 3"; Text[200])
        {
            Caption = 'Ship-to Address', Locked = true;
            DataClassification = CustomerContent;
        }
        field(86; "Ship-to Address 4"; Text[200])
        {
            Caption = 'Ship-to Address 2', Locked = true;
            DataClassification = CustomerContent;
        }
        field(87; "Ship-to County"; Text[200])
        {
            Caption = 'Ship-to County', Locked = true;
            DataClassification = CustomerContent;
        }
        field(88; "Ship-to Post Code"; Code[20])
        {
            Caption = 'Ship-to Post Code', Locked = true;
            DataClassification = CustomerContent;
        }
        field(89; "Ship-to City"; Text[100])
        {
            Caption = 'Ship-to City', Locked = true;
            DataClassification = CustomerContent;
        }
        field(90; "Ship-to Country"; Text[200])
        {
            Caption = 'Ship-to Country', Locked = true;
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; Id)
        {
            Clustered = true;
        }
    }
}
