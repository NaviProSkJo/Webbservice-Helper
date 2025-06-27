permissionset 62001 "PTE Evatic API"
{
    Caption = 'Evatic API', Locked = true;
    Assignable = true;
    IncludedPermissionSets = "D365 BASIC";
    Permissions = tabledata Dimension = R,
        tabledata "Dimension Value" = RIMD,
        page "PTE API Dim. Values Entity" = X,
        page "PTE API - Dimensions" = X;
}