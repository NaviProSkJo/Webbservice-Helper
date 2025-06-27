xmlport 62000 "PTE WSHelper Dist Products"
{
    TextEncoding = WINDOWS;
    Format = VariableText;
    Direction = Export;
    UseRequestPage = false;
    FieldSeparator = '<TAB>';
    TableSeparator = '<CR>';
    RecordSeparator = '<CR>';
    FieldDelimiter = '<None>';

    Caption = 'WSHelper Dist Products';
    schema
    {
        textelement(Root)
        {
            tableelement(Header; Integer)
            {
                XmlName = 'Header';
                SourceTableView = sorting(Number) where(Number = const(1));

                textelement(SKU)
                {
                    trigger OnBeforePassVariable()
                    begin
                        SKU := 'SKU';
                    end;
                }
                textelement(PartNo)
                {
                    trigger OnBeforePassVariable()
                    begin
                        PartNo := 'Part no';
                    end;
                }
                textelement(Manufacturer)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Manufacturer := 'Manufacturer';
                    end;
                }
                textelement(Description)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Description := 'Description';
                    end;
                }
                textelement(Price)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Price := 'Price';
                    end;
                }
                textelement(Weight)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Weight := 'Weight';
                    end;
                }
                textelement(EAN)
                {
                    trigger OnBeforePassVariable()
                    begin
                        EAN := 'EAN';
                    end;
                }
                textelement(Condition)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Condition := 'Condition';
                    end;
                }
                textelement(Cat1)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Cat1 := 'Cat1';
                    end;
                }
                textelement(Cat2)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Cat2 := 'Cat2';
                    end;
                }
                textelement(MinSalesQty)
                {
                    trigger OnBeforePassVariable()
                    begin
                        MinSalesQty := 'min sales qty';
                    end;
                }
            }
            tableelement(Item; Item)
            {
                XmlName = 'Item';

                fieldelement(ItemSKU; Item."No.") { }

                textelement(ItemManufacturer)
                {
                    trigger OnBeforePassVariable()
                    var
                        Manufacturer: Record Manufacturer;
                    begin
                        if (Item."Manufacturer Code" <> '') and Manufacturer.Get(Item."Manufacturer Code") then
                            ItemManufacturer := Manufacturer.Name
                        else
                            ItemManufacturer := '';
                    end;
                }
                fieldelement(ItemDescription; Item.Description) { }
                fieldelement(ItemPrice; Item."Unit Price") { }
                fieldelement(ItemWeight; Item."Net Weight") { }
                textelement(ItemEAN)
                {
                    trigger OnBeforePassVariable()
                    var
                        ItemReference: Record "Item Reference";
                    begin
                        ItemReference.Reset();
                        ItemReference.SetRange("Item No.", Item."No.");
                        ItemReference.SetRange("Variant Code", '');
                        ItemReference.SetRange("Unit of Measure", Item."Sales Unit of Measure");
                        ItemReference.SetRange("Reference Type", ItemReference."Reference Type"::"Bar Code");
                        ItemReference.SetFilter("Reference No.", '<>%1', '');
                        if ItemReference.FindFirst() then
                            ItemEAN := ItemReference."Reference No."
                        else
                            ItemEAN := '';
                    end;
                }
                textelement(ItemCondition)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemCondition := '';
                    end;
                }
                textelement(ItemCat1) { }
                textelement(ItemCat2) { }
                fieldelement(ItemMinSalesQty; Item."Minimum Order Quantity") { }

                trigger OnPreXmlItem()
                var
                    Location: Record Location;
                begin
                    LocationFilterText := '';
                    Location.Reset();
                    if Location.FindSet(false) then
                        repeat
                            if LocationFilterText = '' then
                                LocationFilterText := Location.Code
                            else
                                LocationFilterText += '|' + Location.Code;
                        until Location.Next() = 0;
                end;

                trigger OnAfterGetRecord()
                var
                    ItemCategory: Record "Item Category";
                begin
                    Item.SetRange("Location Filter", LocationFilterText);
                    Item.CalcFields(Inventory);

                    ItemCat1 := '';
                    ItemCat2 := '';
                    if Item."Item Category Code" <> '' then
                        if ItemCategory.Get(Item."Item Category Code") then begin
                            if ItemCategory."Parent Category" <> '' then begin
                                ItemCat1 := ItemCategory."Parent Category";
                                ItemCat2 := ItemCategory.Code;
                            end
                            else begin
                                ItemCat1 := ItemCategory.Code;
                                ItemCat2 := '';
                            end;
                        end;
                end;
            }
            tableelement(Resource; Resource)
            {
                XmlName = 'Resource';


                fieldelement(ItemSKU; Resource."No.") { }
                fieldelement(ItemPartNo; Resource."No.") { }
                textelement(ResourceManufacturer)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Setup.Get();
                        ResourceManufacturer := Setup."Distributor Name";
                    end;
                }
                fieldelement(ResourceDescription; Resource.Name) { }
                fieldelement(ResourcePrice; Resource."Unit Price") { }
                textelement(ResourceWeight)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ResourceWeight := '1';
                    end;
                }
                textelement(ResourceEAN)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ResourceEAN := '';
                    end;
                }
                textelement(ResourceCondition)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ResourceCondition := '';
                    end;
                }
                textelement(ResourceCat1) { }
                textelement(ResourceCat2) { }
                textelement(ResourceMinSalesQty)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ResourceMinSalesQty := '1';
                    end;
                }

                trigger OnPreXmlItem()
                begin
                    Setup.Get();
                end;

                trigger OnAfterGetRecord()
                var
                    ItemCategory: Record "Item Category";
                begin
                    ResourceCat1 := '';
                    ResourceCat2 := '';
                    if Setup."Resource Category Code" <> '' then
                        if ItemCategory.Get(Setup."Resource Category Code") then begin
                            if ItemCategory."Parent Category" <> '' then begin
                                ResourceCat1 := ItemCategory."Parent Category";
                                ResourceCat2 := ItemCategory.Code;
                            end
                            else begin
                                ResourceCat1 := ItemCategory.Code;
                                ResourceCat2 := '';
                            end;
                        end;
                end;
            }
        }
    }
    requestpage
    {
    }
    var
        Setup: Record "PTE WSHelper Setup";
        LocationFilterText: Text;
}
