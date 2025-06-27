page 62005 "PTE API - Dimensions"
{
    APIGroup = 'trexium';
    APIPublisher = 'tietoevry';
    APIVersion = 'v1.0';
    EntityCaption = 'Dimension';
    EntitySetCaption = 'Dimensions';
    DelayedInsert = true;
    DeleteAllowed = false;
    Editable = false;
    EntityName = 'dimension';
    EntitySetName = 'dimensions';
    InsertAllowed = false;
    ModifyAllowed = false;
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = Dimension;
    Extensible = false;
    //SourceTableView = where("PTE Allow External Updates" = const(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id', Locked = true;
                    Editable = false;
                }
                field("code"; Rec.Code)
                {
                    Caption = 'Code', Locked = true;
                }
                field(displayName; Rec.Name)
                {
                    Caption = 'Display Name', Locked = true;
                }
                field(consolidationCode; Rec."Consolidation Code")
                {
                    Caption = 'Consolidation Code', Locked = true;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date', Locked = true;
                }
                part(dimensionValues; "PTE API Dim. Values Entity")
                {
                    Caption = 'Dimension Values', Locked = true;
                    EntityName = 'dimensionValue';
                    EntitySetName = 'dimensionValues';
                    SubPageLink = "Dimension Id" = field(SystemId);
                }
            }
        }
    }

    actions
    {
    }
}

