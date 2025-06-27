codeunit 62007 "PTE WSHelper Order Job"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        TempSOrderList: Record "PTE WSHelper Order Header" temporary;
        TempPOrderList: Record "PTE WSHelper Purch. Order Hdr" temporary;
        WSHelperMgt: Codeunit "PTE WSHelper Mgt";
    begin
        if not WSHelperMgt.GetSalesOrderList(TempSOrderList) then
            Error(JobbErr, WSHelperMgt.GetLastErrorMsg());

        TempSOrderList.Reset();
        if TempSOrderList.Find('-') then
            repeat
                if not WSHelperMgt.GetSalesOrder(TempSOrderList.Id) then
                    Error(JobbErr, WSHelperMgt.GetLastErrorMsg());
            until TempSOrderList.Next() = 0;

        if not WSHelperMgt.GetPurchOrderList(TempPOrderList) then
            Error(JobbErr, WSHelperMgt.GetLastErrorMsg());

        TempPOrderList.Reset();
        if TempPOrderList.Find('-') then
            repeat
                if not WSHelperMgt.GetPurchaseOrder(TempPOrderList.Id) then
                    Error(JobbErr, WSHelperMgt.GetLastErrorMsg());
            until TempPOrderList.Next() = 0;

        if not WSHelperMgt.ProcessOrders() then
            Error(JobbErr, WSHelperMgt.GetLastErrorMsg());
    end;

    var
        // %1 = Error message returned from WSHelperMgt.GetLastErrorMsg()
        JobbErr: Label 'Jobb failed with error %1', Comment = '%1 = Error message returned from WSHelperMgt.GetLastErrorMsg()';
}
