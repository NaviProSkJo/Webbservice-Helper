table 62001 "PTE WSHelper Order Header"
{
    Caption = 'WSHelper Order Header', Locked = true;
    DataClassification = CustomerContent;
    DrillDownPageId = "PTE WSHelper Orders";

    fields
    {
        field(1; Id; Integer)
        {
            Caption = 'Id', Locked = true;
            DataClassification = SystemMetadata;
        }
        field(2; Source; Text[200])
        {
            Caption = 'Source', Locked = true;
            DataClassification = CustomerContent;
        }
        field(3; "External System Order No."; BigInteger)
        {
            Caption = 'External System Order No.', Locked = true;
            DataClassification = CustomerContent;
        }
        field(4; "Order Date/Time"; DateTime)
        {
            Caption = 'Order Date/Time', Locked = true;
            DataClassification = CustomerContent;
        }
        field(5; "Created By"; Text[200])
        {
            Caption = 'Created By', Locked = true;
            DataClassification = CustomerContent;
        }
        field(6; "Created By E-Mail"; Text[80])
        {
            Caption = 'Created By E-Mail', Locked = true;
            DataClassification = CustomerContent;
        }
        field(7; "Order Number"; BigInteger)
        {
            Caption = 'Order Number', Locked = true;
            DataClassification = CustomerContent;
        }
        field(8; "External Order Number"; Text[200])
        {
            Caption = 'External Order Number', Locked = true;
            DataClassification = CustomerContent;
        }
        field(9; "External Order Reference"; Text[200])
        {
            Caption = 'External Order Reference', Locked = true;
            DataClassification = CustomerContent;
        }
        field(10; "Customer No."; Code[20])
        {
            Caption = 'Customer No.', Locked = true;
            DataClassification = CustomerContent;
        }
        field(11; "Customer Id"; Integer)
        {
            Caption = 'Customer Id', Locked = true;
            DataClassification = CustomerContent;
        }
        field(12; "Customer Group Id"; Text[10])
        {
            Caption = 'Customer Group Id', Locked = true;
            DataClassification = CustomerContent;
        }
        field(13; "Customer Group Name"; Text[200])
        {
            Caption = 'Customer Group Name', Locked = true;
            DataClassification = CustomerContent;
        }
        field(14; "Customer GLN"; Code[20])
        {
            Caption = 'Customer GLN', Locked = true;
            DataClassification = CustomerContent;
        }
        field(15; "Customer ERP Id"; Code[20])
        {
            Caption = 'Customer ERP Id', Locked = true;
            DataClassification = CustomerContent;
        }
        field(16; "Customer Group ERP Id"; Code[20])
        {
            Caption = 'Customer Group ERP Id', Locked = true;
            DataClassification = CustomerContent;
        }
        field(17; "Sales Person Export Id"; Text[200])
        {
            Caption = 'Sales Person Export Id', Locked = true;
            DataClassification = CustomerContent;
        }
        field(18; "Goods Label"; Text[200])
        {
            Caption = 'Goods Label', Locked = true;
            DataClassification = CustomerContent;
        }
        field(19; "Currency"; Code[10])
        {
            Caption = 'Currency', Locked = true;
            DataClassification = CustomerContent;
        }
        field(20; "Currency Id"; Integer)
        {
            Caption = 'Currency Id', Locked = true;
            DataClassification = CustomerContent;
        }
        field(21; "Currency Display"; Text[10])
        {
            Caption = 'Currency Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(22; "Currency Display Id"; Integer)
        {
            Caption = 'Currency Display Id', Locked = true;
            DataClassification = CustomerContent;
        }
        field(23; "Customer PO"; Text[200])
        {
            Caption = 'Customer PO', Locked = true;
            DataClassification = CustomerContent;
        }
        field(24; "Invoice Reference"; Text[200])
        {
            Caption = 'Invoice Reference', Locked = true;
            DataClassification = CustomerContent;
        }
        field(26; "Is Direct Delivery"; Boolean)
        {
            Caption = 'Is Direct Delivery', Locked = true;
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
        field(31; "Sales Team"; Text[200])
        {
            Caption = 'Sales Team', Locked = true;
            DataClassification = CustomerContent;
        }
        field(32; "Sales Team Export Id"; Text[200])
        {
            Caption = 'Sales Team Export Id', Locked = true;
            DataClassification = CustomerContent;
        }
        field(33; "Reseller Name"; Text[200])
        {
            Caption = 'Reseller Name', Locked = true;
            DataClassification = CustomerContent;
        }
        field(34; "Reseller Registration No."; Text[40])
        {
            Caption = 'Reseller Registration No.', Locked = true;
            DataClassification = CustomerContent;
        }
        field(35; "Reseller VAT Registration No."; Text[40])
        {
            Caption = 'Reseller VAT Registration No.', Locked = true;
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
        field(38; "Company VAT Registration No."; Text[40])
        {
            Caption = 'Company VAT Registration No.', Locked = true;
            DataClassification = CustomerContent;
        }
        field(39; "Contact"; Text[401])
        {
            Caption = 'Contact', Locked = true;
            DataClassification = CustomerContent;
        }
        field(41; "Contact Phone"; Text[40])
        {
            Caption = 'Contact Phone', Locked = true;
            DataClassification = CustomerContent;
        }
        field(42; "Contact Mobile"; Text[40])
        {
            Caption = 'Contact Mobile', Locked = true;
            DataClassification = CustomerContent;
        }
        field(43; "Contact Fax"; Text[40])
        {
            Caption = 'Contact Fax', Locked = true;
            DataClassification = CustomerContent;
        }
        field(44; "Contact Email"; Text[80])
        {
            Caption = 'Contact Email', Locked = true;
            DataClassification = CustomerContent;
        }
        field(45; "Invoice Contact"; Text[401])
        {
            Caption = 'Invoice Contact', Locked = true;
            DataClassification = CustomerContent;
        }
        field(46; "Invoice Contact Name"; Text[401])
        {
            Caption = 'Invoice Contact Name', Locked = true;
            DataClassification = CustomerContent;
        }
        field(47; "Invoice Contact Phone"; Text[40])
        {
            Caption = 'Invoice Contact Phone', Locked = true;
            DataClassification = CustomerContent;
        }
        field(48; "Invoice Contact Mobile"; Text[40])
        {
            Caption = 'Invoice Contact Mobile', Locked = true;
            DataClassification = CustomerContent;
        }
        field(49; "Invoice Contact Fax"; Text[40])
        {
            Caption = 'Invoice Contact Fax', Locked = true;
            DataClassification = CustomerContent;
        }
        field(50; "Invoice Contact Email"; Text[80])
        {
            Caption = 'Invoice Contact Email', Locked = true;
            DataClassification = CustomerContent;
        }
        field(51; "Delivery Recipient Name"; Text[401])
        {
            Caption = 'Delivery Recipient Name', Locked = true;
            DataClassification = CustomerContent;
        }
        field(52; "Delivery Recipient Email"; Text[80])
        {
            Caption = 'Delivery Recipient Email', Locked = true;
            DataClassification = CustomerContent;
        }
        field(53; "Delivery Recipient Phone"; Text[40])
        {
            Caption = 'Delivery Recipient Phone', Locked = true;
            DataClassification = CustomerContent;
        }
        field(54; "Delivery Recipient Phone 2"; Text[40])
        {
            Caption = 'Delivery Recipient Phone 2', Locked = true;
            DataClassification = CustomerContent;
        }
        field(55; "Delivery Recipient Mobile"; Text[40])
        {
            Caption = 'Delivery Recipient Mobile', Locked = true;
            DataClassification = CustomerContent;
        }
        field(56; "Delivery Recipient Fax"; Text[40])
        {
            Caption = 'Delivery Recipient Fax', Locked = true;
            DataClassification = CustomerContent;
        }
        field(57; "Shipment Rental"; Integer)
        {
            Caption = 'Shipment Rental', Locked = true;
            DataClassification = CustomerContent;
        }
        field(58; "Shipment Payment"; Text[200])
        {
            Caption = 'Shipment Payment', Locked = true;
            DataClassification = CustomerContent;
        }
        field(59; "Shipment Payed"; Boolean)
        {
            Caption = 'Shipment Payed', Locked = true;
            DataClassification = CustomerContent;
        }
        field(60; "Shipment Delivery"; Text[200])
        {
            Caption = 'Shipment Delivery', Locked = true;
            DataClassification = CustomerContent;
        }
        field(61; "Shipment Delivery Code"; Code[20])
        {
            Caption = 'Shipment Delivery Code', Locked = true;
            DataClassification = CustomerContent;
        }
        field(62; "Shpmt. Allow Partial Delivery"; Boolean)
        {
            Caption = 'Shpmt. Allow Partial Delivery', Locked = true;
            DataClassification = CustomerContent;
        }
        field(63; "Financing Period"; Integer)
        {
            Caption = 'Financing Period', Locked = true;
            DataClassification = CustomerContent;
        }
        field(64; "Bill-to Name"; Text[401])
        {
            Caption = 'Bill-to Name', Locked = true;
            DataClassification = CustomerContent;
        }
        field(65; "Bill-to Attention"; Text[200])
        {
            Caption = 'Bill-to Attention', Locked = true;
            DataClassification = CustomerContent;
        }
        field(66; "Bill-to Company Name"; Text[200])
        {
            Caption = 'Bill-to Company Name', Locked = true;
            DataClassification = CustomerContent;
        }
        field(67; "Bill-to Address"; Text[200])
        {
            Caption = 'Bill-to Address', Locked = true;
            DataClassification = CustomerContent;
        }
        field(68; "Bill-to Address 2"; Text[200])
        {
            Caption = 'Bill-to Address 2', Locked = true;
            DataClassification = CustomerContent;
        }
        field(69; "Bill-to County"; Text[200])
        {
            Caption = 'Bill-to County', Locked = true;
            DataClassification = CustomerContent;
        }
        field(70; "Bill-to Post Code"; Code[20])
        {
            Caption = 'Bill-to Post Code', Locked = true;
            DataClassification = CustomerContent;
        }
        field(71; "Bill-to City"; Text[100])
        {
            Caption = 'Bill-to City', Locked = true;
            DataClassification = CustomerContent;
        }
        field(72; "Bill-to Code"; Code[200])
        {
            Caption = 'Bill-to Code', Locked = true;
            DataClassification = CustomerContent;
        }
        field(73; "Bill-to GLN"; Code[20])
        {
            Caption = 'Bill-to GLN', Locked = true;
            DataClassification = CustomerContent;
        }
        field(74; "Bill-to State"; Text[50])
        {
            Caption = 'Bill-to State', Locked = true;
            DataClassification = CustomerContent;
        }
        field(75; "Bill-to Country Code"; Code[10])
        {
            Caption = 'Bill-to Country Code', Locked = true;
            DataClassification = CustomerContent;
        }
        field(80; "Ship-to Name"; Text[401])
        {
            Caption = 'Ship-to Name', Locked = true;
            DataClassification = CustomerContent;
        }
        field(81; "Ship-to Attention"; Text[200])
        {
            Caption = 'Ship-to Attention', Locked = true;
            DataClassification = CustomerContent;
        }
        field(82; "Ship-to Company Name"; Text[200])
        {
            Caption = 'Ship-to Company Name', Locked = true;
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
        field(85; "Ship-to County"; Text[200])
        {
            Caption = 'Ship-to County', Locked = true;
            DataClassification = CustomerContent;
        }
        field(86; "Ship-to Post Code"; Code[20])
        {
            Caption = 'Ship-to Post Code', Locked = true;
            DataClassification = CustomerContent;
        }
        field(87; "Ship-to City"; Text[100])
        {
            Caption = 'Ship-to City', Locked = true;
            DataClassification = CustomerContent;
        }
        field(88; "Ship-to Code"; Code[200])
        {
            Caption = 'Ship-to Code', Locked = true;
            DataClassification = CustomerContent;
        }
        field(89; "Ship-to GLN"; Code[20])
        {
            Caption = 'Ship-to GLN', Locked = true;
            DataClassification = CustomerContent;
        }
        field(90; "Ship-to State"; Text[50])
        {
            Caption = 'Ship-to State', Locked = true;
            DataClassification = CustomerContent;
        }
        field(91; "Ship-to Country Code"; Code[10])
        {
            Caption = 'Ship-to Country Code', Locked = true;
            DataClassification = CustomerContent;
        }
        field(100; "Shipping Total VAT"; Decimal)
        {
            Caption = 'Shipping Total VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(101; "Shipping Total Excl. VAT"; Decimal)
        {
            Caption = 'Shipping Total Excl. VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(102; "Shipping Total Incl. VAT"; Decimal)
        {
            Caption = 'Shipping Total Incl. VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(103; "Shipping VAT Display"; Decimal)
        {
            Caption = 'Shipping Total VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(104; "Shipping Excl. VAT Display"; Decimal)
        {
            Caption = 'Shipping Excl. VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(105; "Shipping Incl. VAT Display"; Decimal)
        {
            Caption = 'Shipping Incl. VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(106; "Shipping Rent Excl. VAT Displ."; Decimal)
        {
            Caption = 'Shipping Rent Excl. VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(107; "Shipping Rent Incl. VAT Displ."; Decimal)
        {
            Caption = 'Shipping Rent Incl. VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(108; "Shipping Tax Code"; Code[200])
        {
            Caption = 'Shipping Tax Code', Locked = true;
            DataClassification = CustomerContent;
        }
        field(109; "Shipping Item No."; Code[50])
        {
            Caption = 'Shipping Item No.', Locked = true;
            DataClassification = CustomerContent;
        }
        field(110; "Order Total VAT"; Decimal)
        {
            Caption = 'Order Total VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(111; "Order Total Excl. VAT"; Decimal)
        {
            Caption = 'Order Total Excl. VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(112; "Order Total Incl. VAT"; Decimal)
        {
            Caption = 'Order Total Incl. VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(113; "Order Rent VAT"; Decimal)
        {
            Caption = 'Order Rent VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(114; "Order Rent Excl. VAT"; Decimal)
        {
            Caption = 'Order Rent Excl. VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(115; "Order Rent Incl. VAT"; Decimal)
        {
            Caption = 'Order Rent Incl. VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(116; "Order VAT Display"; Decimal)
        {
            Caption = 'Order VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(117; "Order Excl. VAT Display"; Decimal)
        {
            Caption = 'Order Excl. VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(118; "Order Incl. VAT Display"; Decimal)
        {
            Caption = 'Order Incl. VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(119; "Order Rent VAT Display"; Decimal)
        {
            Caption = 'Order Rent VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(120; "Order Rent Excl. VAT Displ."; Decimal)
        {
            Caption = 'Order Rent Excl. VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(121; "Order Rent Incl. VAT Displ."; Decimal)
        {
            Caption = 'Order Rent Incl. VAT Display', Locked = true;
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
