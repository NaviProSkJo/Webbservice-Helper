permissionset 62000 "PTE Webs. Helper"
{
    Caption = 'Webservice Helper', Locked = true;
    Assignable = true;
    Permissions = tabledata "PTE WSHelper Setup" = RIMD,
        table "PTE WSHelper Setup" = X,
        tabledata "PTE WSHelper Order Header" = RIMD,
        table "PTE WSHelper Order Header" = X,
        codeunit "PTE WSHelper Dist Product Job" = X,
        codeunit "PTE WSHelper Dist. Mgt" = X,
        xmlport "PTE WSHelper Dist Products" = X,
        tabledata "PTE WSHelper Order Line" = RIMD,
        table "PTE WSHelper Order Line" = X,
        codeunit "PTE WSHelper Customer Job FTP" = X,
        codeunit "PTE WSHelper Events" = X,
        codeunit "PTE WSHelper Mgt" = X,
        xmlport "PTE WSHelper Customer FTP" = X,
        xmlport "PTE WSHelper Customer WS" = X,
        xmlport "PTE WSHelper Sales Order List" = X,
        page "PTE WSHelper Setup" = X,
        tabledata "PTE WSHelper Prod. Supplier" = RIMD,
        table "PTE WSHelper Prod. Supplier" = X,
        tabledata "PTE WSHelper Serial Line" = RIMD,
        table "PTE WSHelper Serial Line" = X,
        tabledata "PTE WSHelper Purch. Order Hdr" = RIMD,
        table "PTE WSHelper Purch. Order Hdr" = X,
        codeunit "PTE WSHelper Order Job" = X,
        codeunit "PTE WSHelper Order" = X,
        xmlport "PTE WSHelper Purch.Order List" = X,
        codeunit "PTE Schedule WSHelper JobQ." = X,
        page "PTE XMLBuffer" = X,
        page "PTE WSHelper Orders" = X,
        codeunit "PTE WSHelper Cust. Job WS Json" = X,
        codeunit "PTE WSHelper Cust. Job WS XML" = X,
        tabledata "PTE WSH Customer Export" = RIMD,
        table "PTE WSH Customer Export" = X,
        Page "PTE WSH Customer export" = X;

}