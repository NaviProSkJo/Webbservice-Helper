xmlport 62001 "PTE WSHelper Sales Order List"
{
    Caption = 'WSHelper Sales Order List';
    Direction = Import;
    Encoding = UTF8;
    Format = Xml;
    UseRequestPage = false;

    schema
    {
        textelement(Orders)
        {
            MinOccurs = Once;
            MaxOccurs = Once;
            tableelement(OrderHeader; "PTE WSHelper Order Header")
            {
                XmlName = 'Order';
                UseTemporary = true;
                MinOccurs = Zero;
                fieldattribute(id; OrderHeader.Id)
                {
                }
            }
        }
    }

    internal procedure GetData(var OrderList: Record "PTE WSHelper Order Header" temporary)
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
