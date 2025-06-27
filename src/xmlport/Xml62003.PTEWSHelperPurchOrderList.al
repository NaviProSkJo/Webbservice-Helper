xmlport 62003 "PTE WSHelper Purch.Order List"
{
    Caption = 'WSHelper Purchase Order List';
    Direction = Import;
    Encoding = UTF8;
    Format = Xml;
    UseRequestPage = false;

    schema
    {
        textelement(PurchaseOrders)
        {
            MinOccurs = Once;
            MaxOccurs = Once;
            tableelement(OrderHeader; "PTE WSHelper Purch. Order Hdr")
            {
                XmlName = 'PurchaseOrder';
                UseTemporary = true;
                MinOccurs = Zero;
                fieldattribute(id; OrderHeader.Id)
                {
                }
            }
        }
    }

    internal procedure GetData(var OrderList: Record "PTE WSHelper Purch. Order Hdr" temporary)
    begin
        OrderList.Reset();
        OrderList.DeleteAll();
        OrderHeader.Reset();
        if OrderHeader.Find('-') then
            repeat
                OrderList := OrderHeader;
                OrderList.Insert();
            until OrderHeader.Next() = 0;
    end;
}
