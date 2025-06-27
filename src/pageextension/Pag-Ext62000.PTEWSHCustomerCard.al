pageextension 62000 "PTE WSH Customer Card" extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            group("PTE WSH Opter")
            {
                field("PTE Price Group"; Rec."PTE Opter Customer")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("PTE Opter ID"; rec."PTE Opter ID")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("PTE Opter Credit Limit"; rec."PTE Opter Credit Limit")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

            }
        }
    }
}
