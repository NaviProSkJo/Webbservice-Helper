table 62005 "PTE WSHelper Prod. Supplier"
{
    Caption = 'WSHelper Product Supplier', Locked = true;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Product Id"; Integer)
        {
            Caption = 'Product Id', Locked = true;
            DataClassification = CustomerContent;
        }
        field(2; "Name"; Text[80])
        {
            Caption = 'Name', Locked = true;
            DataClassification = CustomerContent;
        }
        field(3; SupplierExportId; Text[80])
        {
            Caption = 'Supplier Export Id', Locked = true;
            DataClassification = CustomerContent;
        }
        field(4; SupplierArticleNo; Decimal)
        {
            Caption = 'Supplier Article No', Locked = true;
            DataClassification = CustomerContent;
        }
        field(5; PurchasePrice; Decimal)
        {
            Caption = 'Purchase Price', Locked = true;
            DataClassification = CustomerContent;
        }
        field(6; InStock; Boolean)
        {
            Caption = 'In Stock', Locked = true;
            DataClassification = CustomerContent;
        }
        field(7; SerialNumberArticle; Boolean)
        {
            Caption = 'Serial Number Article', Locked = true;
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Product Id", Name)
        {
            Clustered = true;
        }
    }
}
