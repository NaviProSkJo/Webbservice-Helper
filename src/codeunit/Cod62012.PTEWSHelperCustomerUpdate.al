
Codeunit 62012 "PTE WSHelper Cust. Update Job"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        Customer: Record Customer;
        Customer2: Record Customer;
        WSHelperMgt: Codeunit "PTE WSHelper Mgt";
        LastRowVersion: BigInteger;
        Skiprecord: boolean;
        CurrentKreditLimit: decimal;
    begin
        // //10.0 or greater
        // //LastRowVersion := LastUsedRowVersion();
        // //Customer.SetRange(SystemRowVersion, Setup."SyncedRowVersion Cust. WS", LastRowVersion);
        Customer.SetRange("PTE Opter Customer", true);
        Customer.SetFilter("PTE Opter ID", '<>%1', 0);
        IF Customer.FindSet() then
            repeat
                Customer.CalcFields("Balance (LCY)");
                CurrentKreditLimit := ROUND(Customer."Credit Limit (LCY)" - Customer."Balance (LCY)", 0.000001, '=');
                IF (CurrentKreditLimit <> Customer."PTE Opter Credit Limit") and (CurrentKreditLimit > 0) then begin
                    Customer2.get(Customer."No.");
                    //Triggers Event
                    Customer2.Modify(true);
                end
                else begin
                    if CurrentKreditLimit < 0 then begin
                        Customer2.get(Customer."No.");
                        Customer2.Modify(true);
                    end
                end;
            until Customer.next() = 0;
    end;
}

