pageextension 62003 "PTE WSH Payment Terms" extends "Payment Terms"
{
    layout
    {
        addafter(Description)
        {

            field("Opter ID"; rec."Opter ID")
            {
                ApplicationArea = All;
                Editable = true;
            }



        }
    }
}
