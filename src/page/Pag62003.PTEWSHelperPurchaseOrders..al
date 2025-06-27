page 62003 "PTE WSHelper Purch. Orders"
{
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'WSHelper Purchase Orders';
    PageType = List;
    SourceTable = "PTE WSHelper Purch. Order Hdr";

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

                field("Order Number"; Rec."Order Number")
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

                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = all;
                }
                field("Company Registration No."; Rec."Company Registration No.")
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
            action(Order)
            {
                ApplicationArea = all; // Changed from Basic, Suite
                Caption = 'Order';
                Enabled = true;
                Image = Order;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    PurchHeader: record "Purchase Header";
                begin
                    PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::Order);
                    IF PurchHeader.FindSet() then begin
                        Page.run(Page::"Sales Order", PurchHeader);
                    end;
                end;
            }
        }
    }
}
