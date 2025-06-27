pageextension 62003 "PTE WSH Payment Terms" extends "Payment Terms"
{
    layout
    {
        addafter(Description)
        {

            field("PTE Opter ID"; rec."PTE Opter ID")
            {
                ApplicationArea = All;
                Editable = true;
            }



        }
    }
}
