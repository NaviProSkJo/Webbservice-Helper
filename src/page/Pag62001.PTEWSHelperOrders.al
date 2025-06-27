page 62001 "PTE WSHelper Orders"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'WSHelper Orders';
    PageType = List;
    SourceTable = "PTE WSHelper Order Header";


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Id; Rec.Id)
                {
                    ApplicationArea = all;
                }
                field(Source; Rec.Source)
                {
                    ApplicationArea = all;
                }
                field("External System Order No."; Rec."External System Order No.")
                {
                    ApplicationArea = all;
                }
                field("Order Date/Time"; Rec."Order Date/Time")
                {
                    ApplicationArea = all;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = all;
                }
                field("Created By E-Mail"; Rec."Created By E-Mail")
                {
                    ApplicationArea = all;
                }
                field("Order Number"; Rec."Order Number")
                {
                    ApplicationArea = all;
                }
                field("External Order Number"; Rec."External Order Number")
                {
                    ApplicationArea = all;
                }
                field("External Order Reference"; Rec."External Order Reference")
                {
                    ApplicationArea = all;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = all;
                }
                field("Customer Id"; Rec."Customer Id")
                {
                    ApplicationArea = all;
                }
                field("Customer Group Id"; Rec."Customer Group Id")
                {
                    ApplicationArea = all;
                }
                field("Customer Group Name"; Rec."Customer Group Name")
                {
                    ApplicationArea = all;
                }
                field("Customer GLN"; Rec."Customer GLN")
                {
                    ApplicationArea = all;
                }
                field("Customer ERP Id"; Rec."Customer ERP Id")
                {
                    ApplicationArea = all;
                }
                field("Customer Group ERP Id"; Rec."Customer Group ERP Id")
                {
                    ApplicationArea = all;
                }
                field("Sales Person Export Id"; Rec."Sales Person Export Id")
                {
                    ApplicationArea = all;
                }
                field("Goods Label"; Rec."Goods Label")
                {
                    ApplicationArea = all;
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = all;
                }
                field("Currency Id"; Rec."Currency Id")
                {
                    ApplicationArea = all;
                }
                field("Currency Display"; Rec."Currency Display")
                {
                    ApplicationArea = all;
                }
                field("Currency Display Id"; Rec."Currency Display Id")
                {
                    ApplicationArea = all;
                }
                field("Customer PO"; Rec."Customer PO")
                {
                    ApplicationArea = all;
                }
                field("Invoice Reference"; Rec."Invoice Reference")
                {
                    ApplicationArea = all;
                }

                field("Is Direct Delivery"; Rec."Is Direct Delivery")
                {
                    ApplicationArea = all;
                }
                field("Order Attester"; Rec."Order Attester")
                {
                    ApplicationArea = all;
                }
                field(Administrator; Rec.Administrator)
                {
                    ApplicationArea = all;
                }
                field("Administrator Login"; Rec."Administrator Login")
                {
                    ApplicationArea = all;
                }
                field("Administrator Export Id"; Rec."Administrator Export Id")
                {
                    ApplicationArea = all;
                }
                field("Sales Team"; Rec."Sales Team")
                {
                    ApplicationArea = all;
                }
                field("Sales Team Export Id"; Rec."Sales Team Export Id")
                {
                    ApplicationArea = all;
                }
                field("Reseller Name"; Rec."Reseller Name")
                {
                    ApplicationArea = all;
                }
                field("Reseller Registration No."; Rec."Reseller Registration No.")
                {
                    ApplicationArea = all;
                }
                field("Reseller VAT Registration No."; Rec."Reseller VAT Registration No.")
                {
                    ApplicationArea = all;
                }
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = all;
                }
                field("Company Registration No."; Rec."Company Registration No.")
                {
                    ApplicationArea = all;
                }
                field("Company VAT Registration No."; Rec."Company VAT Registration No.")
                {
                    ApplicationArea = all;
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = all;
                }
                field("Contact Phone"; Rec."Contact Phone")
                {
                    ApplicationArea = all;
                }
                field("Contact Mobile"; Rec."Contact Mobile")
                {
                    ApplicationArea = all;
                }
                field("Contact Fax"; Rec."Contact Fax")
                {
                    ApplicationArea = all;
                }
                field("Contact Email"; Rec."Contact Email")
                {
                    ApplicationArea = all;
                }
                field("Invoice Contact"; Rec."Invoice Contact")
                {
                    ApplicationArea = all;
                }
                field("Invoice Contact Name"; Rec."Invoice Contact Name")
                {
                    ApplicationArea = all;
                }
                field("Invoice Contact Phone"; Rec."Invoice Contact Phone")
                {
                    ApplicationArea = all;
                }
                field("Invoice Contact Mobile"; Rec."Invoice Contact Mobile")
                {
                    ApplicationArea = all;
                }
                field("Invoice Contact Fax"; Rec."Invoice Contact Fax")
                {
                    ApplicationArea = all;
                }
                field("Invoice Contact Email"; Rec."Invoice Contact Email")
                {
                    ApplicationArea = all;
                }
                field("Delivery Recipient Name"; Rec."Delivery Recipient Name")
                {
                    ApplicationArea = all;
                }
                field("Delivery Recipient Email"; Rec."Delivery Recipient Email")
                {
                    ApplicationArea = all;
                }
                field("Delivery Recipient Phone"; Rec."Delivery Recipient Phone")
                {
                    ApplicationArea = all;
                }
                field("Delivery Recipient Phone 2"; Rec."Delivery Recipient Phone 2")
                {
                    ApplicationArea = all;
                }
                field("Delivery Recipient Mobile"; Rec."Delivery Recipient Mobile")
                {
                    ApplicationArea = all;
                }
                field("Delivery Recipient Fax"; Rec."Delivery Recipient Fax")
                {
                    ApplicationArea = all;
                }
                field("Shipment Rental"; Rec."Shipment Rental")
                {
                    ApplicationArea = all;
                }
                field("Shipment Payment"; Rec."Shipment Payment")
                {
                    ApplicationArea = all;
                }
                field("Shipment Payed"; Rec."Shipment Payed")
                {
                    ApplicationArea = all;
                }
                field("Shipment Delivery"; Rec."Shipment Delivery")
                {
                    ApplicationArea = all;
                }
                field("Shipment Delivery Code"; Rec."Shipment Delivery Code")
                {
                    ApplicationArea = all;
                }
                field("Shpmt. Allow Partial Delivery"; Rec."Shpmt. Allow Partial Delivery")
                {
                    ApplicationArea = all;
                }
                field("Financing Period"; Rec."Financing Period")
                {
                    ApplicationArea = all;
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                    ApplicationArea = all;
                }
                field("Bill-to Attention"; Rec."Bill-to Attention")
                {
                    ApplicationArea = all;
                }
                field("Bill-to Company Name"; Rec."Bill-to Company Name")
                {
                    ApplicationArea = all;
                }
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                    ApplicationArea = all;
                }
                field("Bill-to Address 2"; Rec."Bill-to Address 2")
                {
                    ApplicationArea = all;
                }
                field("Bill-to County"; Rec."Bill-to County")
                {
                    ApplicationArea = all;
                }
                field("Bill-to Post Code"; Rec."Bill-to Post Code")
                {
                    ApplicationArea = all;
                }
                field("Bill-to City"; Rec."Bill-to City")
                {
                    ApplicationArea = all;
                }
                field("Bill-to Code"; Rec."Bill-to Code")
                {
                    ApplicationArea = all;
                }
                field("Bill-to GLN"; Rec."Bill-to GLN")
                {
                    ApplicationArea = all;
                }
                field("Bill-to State"; Rec."Bill-to State")
                {
                    ApplicationArea = all;
                }
                field("Bill-to Country Code"; Rec."Bill-to Country Code")
                {
                    ApplicationArea = all;
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = all;
                }
                field("Ship-to Attention"; Rec."Ship-to Attention")
                {
                    ApplicationArea = all;
                }
                field("Ship-to Company Name"; Rec."Ship-to Company Name")
                {
                    ApplicationArea = all;
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = all;
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = all;
                }
                field("Ship-to County"; Rec."Ship-to County")
                {
                    ApplicationArea = all;
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = all;
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = all;
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = all;
                }
                field("Ship-to GLN"; Rec."Ship-to GLN")
                {
                    ApplicationArea = all;
                }
                field("Ship-to State"; Rec."Ship-to State")
                {
                    ApplicationArea = all;
                }
                field("Ship-to Country Code"; Rec."Ship-to Country Code")
                {
                    ApplicationArea = all;
                }
                field("Shipping Total VAT"; Rec."Shipping Total VAT")
                {
                    ApplicationArea = all;
                }
                field("Shipping Total Excl. VAT"; Rec."Shipping Total Excl. VAT")
                {
                    ApplicationArea = all;
                }
                field("Shipping Total Incl. VAT"; Rec."Shipping Total Incl. VAT")
                {
                    ApplicationArea = all;
                }
                field("Shipping VAT Display"; Rec."Shipping VAT Display")
                {
                    ApplicationArea = all;
                }
                field("Shipping Excl. VAT Display"; Rec."Shipping Excl. VAT Display")
                {
                    ApplicationArea = all;
                }
                field("Shipping Incl. VAT Display"; Rec."Shipping Incl. VAT Display")
                {
                    ApplicationArea = all;
                }
                field("Shipping Rent Excl. VAT Displ."; Rec."Shipping Rent Excl. VAT Displ.")
                {
                    ApplicationArea = all;
                }
                field("Shipping Rent Incl. VAT Displ."; Rec."Shipping Rent Incl. VAT Displ.")
                {
                    ApplicationArea = all;
                }
                field("Shipping Tax Code"; Rec."Shipping Tax Code")
                {
                    ApplicationArea = all;
                }
                field("Shipping Item No."; Rec."Shipping Item No.")
                {
                    ApplicationArea = all;
                }
                field("Order Total VAT"; Rec."Order Total VAT")
                {
                    ApplicationArea = all;
                }
                field("Order Total Excl. VAT"; Rec."Order Total Excl. VAT")
                {
                    ApplicationArea = all;
                }
                field("Order Total Incl. VAT"; Rec."Order Total Incl. VAT")
                {
                    ApplicationArea = all;
                }
                field("Order Rent VAT"; Rec."Order Rent VAT")
                {
                    ApplicationArea = all;
                }
                field("Order Rent Excl. VAT"; Rec."Order Rent Excl. VAT")
                {
                    ApplicationArea = all;
                }
                field("Order Rent Incl. VAT"; Rec."Order Rent Incl. VAT")
                {
                    ApplicationArea = all;
                }
                field("Order VAT Display"; Rec."Order VAT Display")
                {
                    ApplicationArea = all;
                }
                field("Order Excl. VAT Display"; Rec."Order Excl. VAT Display")
                {
                    ApplicationArea = all;
                }
                field("Order Incl. VAT Display"; Rec."Order Incl. VAT Display")
                {
                    ApplicationArea = all;
                }
                field("Order Rent VAT Display"; Rec."Order Rent VAT Display")
                {
                    ApplicationArea = all;
                }
                field("Order Rent Excl. VAT Displ."; Rec."Order Rent Excl. VAT Displ.")
                {
                    ApplicationArea = all;
                }
                field("Order Rent Incl. VAT Displ."; Rec."Order Rent Incl. VAT Displ.")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(Lines)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Lines';
                Enabled = true;
                Image = Line;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    PTENettalerOrderLines: Record "PTE WSHelper Order Line";
                begin
                    PTENettalerOrderLines.SetRange("Order Id", rec.id);
                    IF PTENettalerOrderLines.FindSet() then
                        Page.run(Page::"PTE WSHelper Order Lines", PTENettalerOrderLines);
                end;
            }
            action(Order)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Order';
                Enabled = true;
                Image = Order;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    SalesHeader: record "Sales Header";
                begin
                    SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
                    if SalesHeader.FindSet() then begin
                        Page.run(Page::"Sales Order", SalesHeader);
                    end;
                end;
            }
        }
    }
}
