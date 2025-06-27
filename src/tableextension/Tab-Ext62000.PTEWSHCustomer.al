tableextension 62000 "PTE WSH Customer" extends Customer
{
    fields
    {
        field(62000; "Opter Customer"; Boolean)
        {
            Caption = 'Opter Customer';
            DataClassification = CustomerContent;
        }
        field(62001; "Opter ID"; integer)
        {
            Caption = 'Opter ID';
            DataClassification = CustomerContent;
        }
        field(62002; "Opter Credit Limit"; Decimal)
        {
            Caption = 'Opter Credit Limit';
            DataClassification = CustomerContent;
        }
        //field(62003; "Opter Previous Credit Limit"; Decimal)
        //{
        //    Caption = 'Opter Previous Credit Limit';
        //    DataClassification = CustomerContent;
        //}
        // field(62004;"Opter Credit changed DateTime"; Datetime)
        // {
        //     Caption = 'Opter Credit changed DateTime';
        //     DataClassification = CustomerContent;
        // }
        // field(62005; "Opter Blocked  By Credit Limit"; Boolean)
        // {
        //     Caption = 'Blocked by Creditlimit';
        //     DataClassification = CustomerContent;
        // }

    }
}
