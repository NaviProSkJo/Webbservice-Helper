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
                }
                field(Source; Rec.Source)
                {
                }
                field("External System Order No."; Rec."External System Order No.")
                {
                }
                field("Order Date/Time"; Rec."Order Date/Time")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Created By E-Mail"; Rec."Created By E-Mail")
                {
                }
                field("Order Number"; Rec."Order Number")
                {
                }
                field("External Order Number"; Rec."External Order Number")
                {
                }
                field("External Order Reference"; Rec."External Order Reference")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Customer Id"; Rec."Customer Id")
                {
                }
                field("Customer Group Id"; Rec."Customer Group Id")
                {
                }
                field("Customer Group Name"; Rec."Customer Group Name")
                {
                }
                field("Customer GLN"; Rec."Customer GLN")
                {
                }
                field("Customer ERP Id"; Rec."Customer ERP Id")
                {
                }
                field("Customer Group ERP Id"; Rec."Customer Group ERP Id")
                {
                }
                field("Sales Person Export Id"; Rec."Sales Person Export Id")
                {
                }
                field("Goods Label"; Rec."Goods Label")
                {
                }
                field(Currency; Rec.Currency)
                {
                }
                field("Currency Id"; Rec."Currency Id")
                {
                }
                field("Currency Display"; Rec."Currency Display")
                {
                }
                field("Currency Display Id"; Rec."Currency Display Id")
                {
                }
                field("Customer PO"; Rec."Customer PO")
                {
                }
                field("Invoice Reference"; Rec."Invoice Reference")
                {
                }

                field("Is Direct Delivery"; Rec."Is Direct Delivery")
                {
                }
                field("Order Attester"; Rec."Order Attester")
                {
                }
                field(Administrator; Rec.Administrator)
                {
                }
                field("Administrator Login"; Rec."Administrator Login")
                {
                }
                field("Administrator Export Id"; Rec."Administrator Export Id")
                {
                }
                field("Sales Team"; Rec."Sales Team")
                {
                }
                field("Sales Team Export Id"; Rec."Sales Team Export Id")
                {
                }
                field("Reseller Name"; Rec."Reseller Name")
                {
                }
                field("Reseller Registration No."; Rec."Reseller Registration No.")
                {
                }
                field("Reseller VAT Registration No."; Rec."Reseller VAT Registration No.")
                {
                }
                field("Company Name"; Rec."Company Name")
                {
                }
                field("Company Registration No."; Rec."Company Registration No.")
                {
                }
                field("Company VAT Registration No."; Rec."Company VAT Registration No.")
                {
                }
                field(Contact; Rec.Contact)
                {
                }
                field("Contact Phone"; Rec."Contact Phone")
                {
                }
                field("Contact Mobile"; Rec."Contact Mobile")
                {
                }
                field("Contact Fax"; Rec."Contact Fax")
                {
                }
                field("Contact Email"; Rec."Contact Email")
                {
                }
                field("Invoice Contact"; Rec."Invoice Contact")
                {
                }
                field("Invoice Contact Name"; Rec."Invoice Contact Name")
                {
                }
                field("Invoice Contact Phone"; Rec."Invoice Contact Phone")
                {
                }
                field("Invoice Contact Mobile"; Rec."Invoice Contact Mobile")
                {
                }
                field("Invoice Contact Fax"; Rec."Invoice Contact Fax")
                {
                }
                field("Invoice Contact Email"; Rec."Invoice Contact Email")
                {
                }
                field("Delivery Recipient Name"; Rec."Delivery Recipient Name")
                {
                }
                field("Delivery Recipient Email"; Rec."Delivery Recipient Email")
                {
                }
                field("Delivery Recipient Phone"; Rec."Delivery Recipient Phone")
                {
                }
                field("Delivery Recipient Phone 2"; Rec."Delivery Recipient Phone 2")
                {
                }
                field("Delivery Recipient Mobile"; Rec."Delivery Recipient Mobile")
                {
                }
                field("Delivery Recipient Fax"; Rec."Delivery Recipient Fax")
                {
                }
                field("Shipment Rental"; Rec."Shipment Rental")
                {
                }
                field("Shipment Payment"; Rec."Shipment Payment")
                {
                }
                field("Shipment Payed"; Rec."Shipment Payed")
                {
                }
                field("Shipment Delivery"; Rec."Shipment Delivery")
                {
                }
                field("Shipment Delivery Code"; Rec."Shipment Delivery Code")
                {
                }
                field("Shpmt. Allow Partial Delivery"; Rec."Shpmt. Allow Partial Delivery")
                {
                }
                field("Financing Period"; Rec."Financing Period")
                {
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                }
                field("Bill-to Attention"; Rec."Bill-to Attention")
                {
                }
                field("Bill-to Company Name"; Rec."Bill-to Company Name")
                {
                }
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                }
                field("Bill-to Address 2"; Rec."Bill-to Address 2")
                {
                }
                field("Bill-to County"; Rec."Bill-to County")
                {
                }
                field("Bill-to Post Code"; Rec."Bill-to Post Code")
                {
                }
                field("Bill-to City"; Rec."Bill-to City")
                {
                }
                field("Bill-to Code"; Rec."Bill-to Code")
                {
                }
                field("Bill-to GLN"; Rec."Bill-to GLN")
                {
                }
                field("Bill-to State"; Rec."Bill-to State")
                {
                }
                field("Bill-to Country Code"; Rec."Bill-to Country Code")
                {
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                }
                field("Ship-to Attention"; Rec."Ship-to Attention")
                {
                }
                field("Ship-to Company Name"; Rec."Ship-to Company Name")
                {
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                }
                field("Ship-to County"; Rec."Ship-to County")
                {
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                }
                field("Ship-to GLN"; Rec."Ship-to GLN")
                {
                }
                field("Ship-to State"; Rec."Ship-to State")
                {
                }
                field("Ship-to Country Code"; Rec."Ship-to Country Code")
                {
                }
                field("Shipping Total VAT"; Rec."Shipping Total VAT")
                {
                }
                field("Shipping Total Excl. VAT"; Rec."Shipping Total Excl. VAT")
                {
                }
                field("Shipping Total Incl. VAT"; Rec."Shipping Total Incl. VAT")
                {
                }
                field("Shipping VAT Display"; Rec."Shipping VAT Display")
                {
                }
                field("Shipping Excl. VAT Display"; Rec."Shipping Excl. VAT Display")
                {
                }
                field("Shipping Incl. VAT Display"; Rec."Shipping Incl. VAT Display")
                {
                }
                field("Shipping Rent Excl. VAT Displ."; Rec."Shipping Rent Excl. VAT Displ.")
                {
                }
                field("Shipping Rent Incl. VAT Displ."; Rec."Shipping Rent Incl. VAT Displ.")
                {
                }
                field("Shipping Tax Code"; Rec."Shipping Tax Code")
                {
                }
                field("Shipping Item No."; Rec."Shipping Item No.")
                {
                }
                field("Order Total VAT"; Rec."Order Total VAT")
                {
                }
                field("Order Total Excl. VAT"; Rec."Order Total Excl. VAT")
                {
                }
                field("Order Total Incl. VAT"; Rec."Order Total Incl. VAT")
                {
                }
                field("Order Rent VAT"; Rec."Order Rent VAT")
                {
                }
                field("Order Rent Excl. VAT"; Rec."Order Rent Excl. VAT")
                {
                }
                field("Order Rent Incl. VAT"; Rec."Order Rent Incl. VAT")
                {
                }
                field("Order VAT Display"; Rec."Order VAT Display")
                {
                }
                field("Order Excl. VAT Display"; Rec."Order Excl. VAT Display")
                {
                }
                field("Order Incl. VAT Display"; Rec."Order Incl. VAT Display")
                {
                }
                field("Order Rent VAT Display"; Rec."Order Rent VAT Display")
                {
                }
                field("Order Rent Excl. VAT Displ."; Rec."Order Rent Excl. VAT Displ.")
                {
                }
                field("Order Rent Incl. VAT Displ."; Rec."Order Rent Incl. VAT Displ.")
                {
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
                    IF PTENettalerOrderLines.FindSet then
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
                    SalesOrder: page "Sales Order";
                begin
                    SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
                    IF SalesHeader.FindSet then begin
                        Page.run(Page::"Sales Order", SalesHeader);
                    end;
                end;
            }
        }
    }
}
