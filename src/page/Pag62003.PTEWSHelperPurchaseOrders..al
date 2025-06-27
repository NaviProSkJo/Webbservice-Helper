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
                }

                field("Order Number"; Rec."Order Number")
                {
                }

                field("Goods Label"; Rec."Goods Label")
                {
                }
                field(Currency; Rec.Currency)
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

                field("Company Name"; Rec."Company Name")
                {
                }
                field("Company Registration No."; Rec."Company Registration No.")
                {
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
                ApplicationArea = Basic, Suite;
                Caption = 'Order';
                Enabled = true;
                Image = Order;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    PurchHeader: record "Purchase Header";
                    PurchOrder: page "Purchase Order";
                begin
                    PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::Order);
                    IF PurchHeader.FindSet then begin
                        Page.run(Page::"Sales Order", PurchHeader);
                    end;
                end;
            }
        }
    }
}
