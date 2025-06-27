Codeunit 62003 "PTE WSHelper Cust. Job WS Json"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        Customer: Record Customer;
        CustomerExport: record "PTE WSH Customer Export";
        CustomerExport2: record "PTE WSH Customer Export";
        Customer2: Record Customer;
        WSHelperMgt: Codeunit "PTE WSHelper Mgt";
        LastRowVersion: BigInteger;
        Skiprecord: boolean;
    begin

        //10.0 or greater
        //LastRowVersion := LastUsedRowVersion();
        //Customer.SetRange(SystemRowVersion, Setup."SyncedRowVersion Cust. WS", LastRowVersion);
        CustomerExport.Setrange("Export OK", False);
        IF CustomerExport.FindSet() then
            repeat
                Skiprecord := false;
                IF CustomerExport."Export status" <> CustomerExport."Export status"::Deleted then
                    Customer2.get(CustomerExport."Customer No.")
                else begin
                    IF CustomerExport."Opter ID" = 0 then
                        Skiprecord := true;
                end;
                IF Not Skiprecord then begin
                    if not WSHelperMgt.SendCustomersWS_json(Customer2, CustomerExport) then;
                    CustomerExport.modify();
                end;
            until CustomerExport.next() = 0;
    end;
}
