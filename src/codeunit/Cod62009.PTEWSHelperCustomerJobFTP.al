Codeunit 62009 "PTE WSHelper Customer Job FTP"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        Setup: Record "PTE WSHelper Setup";
        Customer: Record Customer;
        WSHelperSalesMgt: Codeunit "PTE WSHelper Mgt";
        LastRowVersion: BigInteger;
    begin
        Setup.Get();
        //10.0 or greater
        //LastRowVersion := LastUsedRowVersion();
        //Customer.SetRange(SystemRowVersion, Setup."SyncedRowVersion Cust. FTP ", LastRowVersion);
        Customer.SETRANGE(SystemModifiedAt, Setup."SyncedDatetime Cust. FTP", CurrentDateTime);
        if Customer.IsEmpty then
            exit;
        if not WSHelperSalesMgt.SendCustomersFTP(Customer) then
            Error(WSHelperSalesMgt.GetLastErrorMsg());
        Setup."SyncedRowVersion Cust. FTP " := LastRowVersion;
        Setup.Modify();
    end;
}
