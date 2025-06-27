pageextension 62000 "PTE WSH Customer Card" extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            group("WSH Opter")
            {
                field("Price Group"; Rec."Opter Customer")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Opter ID"; rec."Opter ID")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Opter Credit Limit"; rec."Opter Credit Limit")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

            }
        }
    }
}
