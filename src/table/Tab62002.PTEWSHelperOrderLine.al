table 62002 "PTE WSHelper Order Line"
{
    Caption = 'WSHelper Order Line', Locked = true;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Order Id"; Integer)
        {
            Caption = 'Id', Locked = true;
            DataClassification = SystemMetadata;
        }
        field(2; "Line Id"; Integer)
        {
            Caption = 'Line Id', Locked = true;
            DataClassification = SystemMetadata;
        }

        field(4; "Line Internal Id"; Integer)
        {
            Caption = 'Line Internal Id', Locked = true;
            DataClassification = SystemMetadata;
        }
        field(5; "Line Internal Group Id"; Integer)
        {
            Caption = 'Line Internal Group Id', Locked = true;
            DataClassification = SystemMetadata;
        }
        field(6; "Line Internal Parent Id"; Integer)
        {
            Caption = 'Line Internal Parent Id', Locked = true;
            DataClassification = SystemMetadata;
        }
        field(7; "Line Internal Quote Id"; Integer)
        {
            Caption = 'Line Internal Quote Id', Locked = true;
            DataClassification = SystemMetadata;
        }
        field(8; "Manufacturer Item No"; Text[50])
        {
            Caption = 'Manufacturer Item No', Locked = true;
            DataClassification = CustomerContent;
        }
        field(9; "Supplier Item No"; Text[75])
        {
            Caption = 'Supplier Item No', Locked = true;
            DataClassification = CustomerContent;
        }
        field(10; Description; Text[750])
        {
            Caption = 'Description', Locked = true;
            DataClassification = CustomerContent;
        }
        field(11; "Manufacturer Name"; Text[200])
        {
            Caption = 'Manufacturer Name', Locked = true;
            DataClassification = CustomerContent;
        }
        field(12; "Supplier Name"; Text[200])
        {
            Caption = 'Supplier Name', Locked = true;
            DataClassification = CustomerContent;
        }
        field(13; "Supplier Export Id"; Text[200])
        {
            Caption = 'Supplier Export Id', Locked = true;
            DataClassification = CustomerContent;
        }
        field(14; Quantity; Decimal)
        {
            Caption = 'Quantity', Locked = true;
            DataClassification = CustomerContent;
        }
        field(15; "Cost Price"; Decimal)
        {
            Caption = 'Cost Price', Locked = true;
            DataClassification = CustomerContent;
        }
        field(16; "Discount Pct"; Decimal)
        {
            Caption = 'Discount Pct', Locked = true;
            DataClassification = CustomerContent;
        }
        field(17; "Supplier Price"; Decimal)
        {
            Caption = 'Supplier Price', Locked = true;
            DataClassification = CustomerContent;
        }
        field(18; "Registered Purchase Price"; Decimal)
        {
            Caption = 'Registered Purchase Price', Locked = true;
            DataClassification = CustomerContent;
        }
        field(19; "Calculated Purchase Price"; Decimal)
        {
            Caption = 'Calculated Purchase Price', Locked = true;
            DataClassification = CustomerContent;
        }
        field(20; "Calculated Cost Price"; Decimal)
        {
            Caption = 'Calculated Cost Price', Locked = true;
            DataClassification = CustomerContent;
        }
        field(21; "In Stock"; Integer)
        {
            Caption = 'In Stock', Locked = true;
            DataClassification = CustomerContent;
        }
        field(22; "Stock ETA"; Date)
        {
            Caption = 'Stock ETA', Locked = true;
            DataClassification = CustomerContent;
        }

        field(24; "Main Category"; Text[254])
        {
            Caption = 'Main Category', Locked = true;
            DataClassification = CustomerContent;
        }
        field(25; "Main Category Export Id"; Text[400])
        {
            Caption = 'Main Category Export Id', Locked = true;
            DataClassification = CustomerContent;
        }
        field(26; "Category"; Text[243])
        {
            Caption = 'Category', Locked = true;
            DataClassification = CustomerContent;
        }
        field(27; "Category Code"; Code[20])
        {
            Caption = 'Category Code', Locked = true;
            DataClassification = CustomerContent;
        }
        field(28; "Category Export Id"; Text[400])
        {
            Caption = 'Category Export Id', Locked = true;
            DataClassification = CustomerContent;
        }
        field(29; UNSPSC; Code[20])
        {
            Caption = 'UNSPSC', Locked = true;
            DataClassification = CustomerContent;
        }
        field(30; Family; Text[200])
        {
            Caption = 'Family', Locked = true;
            DataClassification = CustomerContent;
        }

        field(32; Bid; Text[200])
        {
            Caption = 'Bid', Locked = true;
            DataClassification = CustomerContent;
        }
        field(33; "Tax Code"; Code[200])
        {
            Caption = 'Tax Code', Locked = true;
            DataClassification = CustomerContent;
        }
        field(34; "Product Condition Code"; Integer)
        {
            Caption = 'Product Condition Code', Locked = true;
            DataClassification = CustomerContent;
        }
        field(35; "Product Id"; Integer)
        {
            Caption = 'Product Id', Locked = true;
            DataClassification = CustomerContent;
        }
        field(36; "Tax Percent"; Decimal)
        {
            Caption = 'Tax Percent', Locked = true;
            DataClassification = CustomerContent;
        }
        field(40; "Sales Price VAT"; Decimal)
        {
            Caption = 'Sales Price VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(41; "Sales Price Excl. VAT"; Decimal)
        {
            Caption = 'Sales Price Excl. VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(42; "Sales Price Incl. VAT"; Decimal)
        {
            Caption = 'Sales Price Incl. VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(43; "Sales Price Rent VAT"; Decimal)
        {
            Caption = 'Sales Price Rent VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(44; "Sales Price Rent Excl. VAT"; Decimal)
        {
            Caption = 'Sales Price Rent Excl. VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(45; "Sales Price Rent Incl. VAT"; Decimal)
        {
            Caption = 'Sales Price Rent Incl. VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(46; "Sales Price VAT Display"; Decimal)
        {
            Caption = 'Sales Price VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(47; "Sales Price Excl. VAT Display"; Decimal)
        {
            Caption = 'Sales Price Excl. VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(48; "Sales Price Incl. VAT Display"; Decimal)
        {
            Caption = 'Sales Price Incl. VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(49; "Sales Price Rent VAT Display"; Decimal)
        {
            Caption = 'Sales Price Rent VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(50; "Sales Pr.Rent Excl. VAT Displ."; Decimal)
        {
            Caption = 'Sales Price Rent Excl. VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(51; "Sales Pr.Rent Incl. VAT Displ."; Decimal)
        {
            Caption = 'Sales Price Rent Incl. VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(55; "Delivered Quantity"; Decimal)
        {
            Caption = 'Delivered Quantity', Locked = true;
            DataClassification = CustomerContent;
        }
        field(56; "Last Delivery Date"; Date)
        {
            Caption = 'Last Delivery Date', Locked = true;
            DataClassification = CustomerContent;
        }
        field(60; "Purchase Order No."; Text[200])
        {
            Caption = 'Purchase Order No.', Locked = true;
            DataClassification = CustomerContent;
        }
        field(61; "Purchase Order Item Id"; BigInteger)
        {
            Caption = 'Purchase Order Item Id', Locked = true;
            DataClassification = CustomerContent;
        }
        field(70; "Total Price VAT"; Decimal)
        {
            Caption = 'Total Price VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(71; "Total Price Excl. VAT"; Decimal)
        {
            Caption = 'Total Price Excl. VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(72; "Total Price Incl. VAT"; Decimal)
        {
            Caption = 'Total Price Incl. VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(73; "Total Price Rent VAT"; Decimal)
        {
            Caption = 'Total Price Rent VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(74; "Total Price Rent Excl. VAT"; Decimal)
        {
            Caption = 'Total Price Rent Excl. VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(75; "Total Price Rent Incl. VAT"; Decimal)
        {
            Caption = 'Total Price Rent Incl. VAT', Locked = true;
            DataClassification = CustomerContent;
        }
        field(76; "Total Price VAT Display"; Decimal)
        {
            Caption = 'Total Price VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(77; "Total Price Excl. VAT Display"; Decimal)
        {
            Caption = 'Total Price Excl. VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(78; "Total Price Incl. VAT Display"; Decimal)
        {
            Caption = 'Total Price Incl. VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(79; "Total Price Rent VAT Display"; Decimal)
        {
            Caption = 'Total Price Rent VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(80; "Total Pr.Rent Excl. VAT Displ."; Decimal)
        {
            Caption = 'Total Price Rent Excl. VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }
        field(81; "Total Pr.Rent Incl. VAT Displ."; Decimal)
        {
            Caption = 'Total Price Rent Incl. VAT Display', Locked = true;
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(PK; "Order Id", "Line Id")
        {
            Clustered = true;
        }
    }
}
