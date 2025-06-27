enum 62000 "PTE WSH Export Status"
{
    Extensible = true;

    value(0; "")
    {
        Caption = '', Locked = true;
    }
    value(1; New)
    {
        Caption = 'Ny';
    }
    value(2; Modified)
    {
        Caption = 'Ändrad';
    }
    value(3; Deleted)
    {
        Caption = 'Bortagen';
    }
}
