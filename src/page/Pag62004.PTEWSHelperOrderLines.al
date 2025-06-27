page 62004 "PTE WSHelper Order Lines"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'WSHelper Order Lines';
    PageType = List;
    SourceTable = "PTE WSHelper Order Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Bid; Rec.Bid)
                {
                    ToolTip = 'Specifies the value of the Bid field.', Comment = '%';
                }
                field("Calculated Cost Price"; Rec."Calculated Cost Price")
                {
                    ToolTip = 'Specifies the value of the Calculated Cost Price field.', Comment = '%';
                }
                field("Calculated Purchase Price"; Rec."Calculated Purchase Price")
                {
                    ToolTip = 'Specifies the value of the Calculated Purchase Price field.', Comment = '%';
                }
                field(Category; Rec.Category)
                {
                    ToolTip = 'Specifies the value of the Category field.', Comment = '%';
                }
                field("Category Code"; Rec."Category Code")
                {
                    ToolTip = 'Specifies the value of the Category Code field.', Comment = '%';
                }
                field("Category Export Id"; Rec."Category Export Id")
                {
                    ToolTip = 'Specifies the value of the Category Export Id field.', Comment = '%';
                }
                field("Cost Price"; Rec."Cost Price")
                {
                    ToolTip = 'Specifies the value of the Cost Price field.', Comment = '%';
                }
                field("Delivered Quantity"; Rec."Delivered Quantity")
                {
                    ToolTip = 'Specifies the value of the Delivered Quantity field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Discount Pct"; Rec."Discount Pct")
                {
                    ToolTip = 'Specifies the value of the Discount Pct field.', Comment = '%';
                }
                field(Family; Rec.Family)
                {
                    ToolTip = 'Specifies the value of the Family field.', Comment = '%';
                }
                field("In Stock"; Rec."In Stock")
                {
                    ToolTip = 'Specifies the value of the In Stock field.', Comment = '%';
                }
                field("Last Delivery Date"; Rec."Last Delivery Date")
                {
                    ToolTip = 'Specifies the value of the Last Delivery Date field.', Comment = '%';
                }
                field("Line Id"; Rec."Line Id")
                {
                    ToolTip = 'Specifies the value of the Line Id field.', Comment = '%';
                }
                field("Line Internal Group Id"; Rec."Line Internal Group Id")
                {
                    ToolTip = 'Specifies the value of the Line Internal Group Id field.', Comment = '%';
                }
                field("Line Internal Id"; Rec."Line Internal Id")
                {
                    ToolTip = 'Specifies the value of the Line Internal Id field.', Comment = '%';
                }
                field("Line Internal Parent Id"; Rec."Line Internal Parent Id")
                {
                    ToolTip = 'Specifies the value of the Line Internal Parent Id field.', Comment = '%';
                }
                field("Line Internal Quote Id"; Rec."Line Internal Quote Id")
                {
                    ToolTip = 'Specifies the value of the Line Internal Quote Id field.', Comment = '%';
                }

                field("Main Category"; Rec."Main Category")
                {
                    ToolTip = 'Specifies the value of the Main Category field.', Comment = '%';
                }
                field("Main Category Export Id"; Rec."Main Category Export Id")
                {
                    ToolTip = 'Specifies the value of the Main Category Export Id field.', Comment = '%';
                }
                field("Manufacturer Item No"; Rec."Manufacturer Item No")
                {
                    ToolTip = 'Specifies the value of the Manufacturer Item No field.', Comment = '%';
                }
                field("Manufacturer Name"; Rec."Manufacturer Name")
                {
                    ToolTip = 'Specifies the value of the Manufacturer Name field.', Comment = '%';
                }
                field("Order Id"; Rec."Order Id")
                {
                    ToolTip = 'Specifies the value of the Id field.', Comment = '%';
                }
                field("Product Condition Code"; Rec."Product Condition Code")
                {
                    ToolTip = 'Specifies the value of the Product Condition Code field.', Comment = '%';
                }
                field("Product Id"; Rec."Product Id")
                {
                    ToolTip = 'Specifies the value of the Product Id field.', Comment = '%';
                }
                field("Purchase Order Item Id"; Rec."Purchase Order Item Id")
                {
                    ToolTip = 'Specifies the value of the Purchase Order Item Id field.', Comment = '%';
                }
                field("Purchase Order No."; Rec."Purchase Order No.")
                {
                    ToolTip = 'Specifies the value of the Purchase Order No. field.', Comment = '%';
                }

                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';
                }
                field("Registered Purchase Price"; Rec."Registered Purchase Price")
                {
                    ToolTip = 'Specifies the value of the Registered Purchase Price field.', Comment = '%';
                }
                field("Sales Pr.Rent Excl. VAT Displ."; Rec."Sales Pr.Rent Excl. VAT Displ.")
                {
                    ToolTip = 'Specifies the value of the Sales Price Rent Excl. VAT Display field.', Comment = '%';
                }
                field("Sales Pr.Rent Incl. VAT Displ."; Rec."Sales Pr.Rent Incl. VAT Displ.")
                {
                    ToolTip = 'Specifies the value of the Sales Price Rent Incl. VAT Display field.', Comment = '%';
                }
                field("Sales Price Excl. VAT"; Rec."Sales Price Excl. VAT")
                {
                    ToolTip = 'Specifies the value of the Sales Price Excl. VAT field.', Comment = '%';
                }
                field("Sales Price Excl. VAT Display"; Rec."Sales Price Excl. VAT Display")
                {
                    ToolTip = 'Specifies the value of the Sales Price Excl. VAT Display field.', Comment = '%';
                }
                field("Sales Price Incl. VAT"; Rec."Sales Price Incl. VAT")
                {
                    ToolTip = 'Specifies the value of the Sales Price Incl. VAT field.', Comment = '%';
                }
                field("Sales Price Incl. VAT Display"; Rec."Sales Price Incl. VAT Display")
                {
                    ToolTip = 'Specifies the value of the Sales Price Incl. VAT Display field.', Comment = '%';
                }
                field("Sales Price Rent Excl. VAT"; Rec."Sales Price Rent Excl. VAT")
                {
                    ToolTip = 'Specifies the value of the Sales Price Rent Excl. VAT field.', Comment = '%';
                }
                field("Sales Price Rent Incl. VAT"; Rec."Sales Price Rent Incl. VAT")
                {
                    ToolTip = 'Specifies the value of the Sales Price Rent Incl. VAT field.', Comment = '%';
                }
                field("Sales Price Rent VAT"; Rec."Sales Price Rent VAT")
                {
                    ToolTip = 'Specifies the value of the Sales Price Rent VAT field.', Comment = '%';
                }
                field("Sales Price Rent VAT Display"; Rec."Sales Price Rent VAT Display")
                {
                    ToolTip = 'Specifies the value of the Sales Price Rent VAT Display field.', Comment = '%';
                }
                field("Sales Price VAT"; Rec."Sales Price VAT")
                {
                    ToolTip = 'Specifies the value of the Sales Price VAT field.', Comment = '%';
                }
                field("Sales Price VAT Display"; Rec."Sales Price VAT Display")
                {
                    ToolTip = 'Specifies the value of the Sales Price VAT Display field.', Comment = '%';
                }

                field("Stock ETA"; Rec."Stock ETA")
                {
                    ToolTip = 'Specifies the value of the Stock ETA field.', Comment = '%';
                }
                field("Supplier Export Id"; Rec."Supplier Export Id")
                {
                    ToolTip = 'Specifies the value of the Supplier Export Id field.', Comment = '%';
                }
                field("Supplier Item No"; Rec."Supplier Item No")
                {
                    ToolTip = 'Specifies the value of the Supplier Item No field.', Comment = '%';
                }
                field("Supplier Name"; Rec."Supplier Name")
                {
                    ToolTip = 'Specifies the value of the Supplier Name field.', Comment = '%';
                }
                field("Supplier Price"; Rec."Supplier Price")
                {
                    ToolTip = 'Specifies the value of the Supplier Price field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
                field("Tax Code"; Rec."Tax Code")
                {
                    ToolTip = 'Specifies the value of the Tax Code field.', Comment = '%';
                }
                field("Tax Percent"; Rec."Tax Percent")
                {
                    ToolTip = 'Specifies the value of the Tax Percent field.', Comment = '%';
                }
                field("Total Pr.Rent Excl. VAT Displ."; Rec."Total Pr.Rent Excl. VAT Displ.")
                {
                    ToolTip = 'Specifies the value of the Total Price Rent Excl. VAT Display field.', Comment = '%';
                }
                field("Total Pr.Rent Incl. VAT Displ."; Rec."Total Pr.Rent Incl. VAT Displ.")
                {
                    ToolTip = 'Specifies the value of the Total Price Rent Incl. VAT Display field.', Comment = '%';
                }
                field("Total Price Excl. VAT"; Rec."Total Price Excl. VAT")
                {
                    ToolTip = 'Specifies the value of the Total Price Excl. VAT field.', Comment = '%';
                }
                field("Total Price Excl. VAT Display"; Rec."Total Price Excl. VAT Display")
                {
                    ToolTip = 'Specifies the value of the Total Price Excl. VAT Display field.', Comment = '%';
                }
                field("Total Price Incl. VAT"; Rec."Total Price Incl. VAT")
                {
                    ToolTip = 'Specifies the value of the Total Price Incl. VAT field.', Comment = '%';
                }
                field("Total Price Incl. VAT Display"; Rec."Total Price Incl. VAT Display")
                {
                    ToolTip = 'Specifies the value of the Total Price Incl. VAT Display field.', Comment = '%';
                }
                field("Total Price Rent Excl. VAT"; Rec."Total Price Rent Excl. VAT")
                {
                    ToolTip = 'Specifies the value of the Total Price Rent Excl. VAT field.', Comment = '%';
                }
                field("Total Price Rent Incl. VAT"; Rec."Total Price Rent Incl. VAT")
                {
                    ToolTip = 'Specifies the value of the Total Price Rent Incl. VAT field.', Comment = '%';
                }
                field("Total Price Rent VAT"; Rec."Total Price Rent VAT")
                {
                    ToolTip = 'Specifies the value of the Total Price Rent VAT field.', Comment = '%';
                }
                field("Total Price Rent VAT Display"; Rec."Total Price Rent VAT Display")
                {
                    ToolTip = 'Specifies the value of the Total Price Rent VAT Display field.', Comment = '%';
                }
                field("Total Price VAT"; Rec."Total Price VAT")
                {
                    ToolTip = 'Specifies the value of the Total Price VAT field.', Comment = '%';
                }
                field("Total Price VAT Display"; Rec."Total Price VAT Display")
                {
                    ToolTip = 'Specifies the value of the Total Price VAT Display field.', Comment = '%';
                }
                field(UNSPSC; Rec.UNSPSC)
                {
                    ToolTip = 'Specifies the value of the UNSPSC field.', Comment = '%';
                }
            }
        }
    }
}
