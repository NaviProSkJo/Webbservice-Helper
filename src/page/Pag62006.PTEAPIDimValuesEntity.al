page 62006 "PTE API Dim. Values Entity"
{
    APIGroup = 'trexium';
    APIPublisher = 'tietoevry';
    APIVersion = 'v1.0';
    DelayedInsert = true;
    EntityName = 'dimensionValue';
    EntitySetName = 'dimensionValues';
    PageType = API;
    SourceTable = "Dimension Value";
    ODataKeyFields = SystemId;
    Extensible = false;
    ChangeTrackingAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id', Locked = true;
                    Editable = false;
                }
                field("code"; Rec."Code")
                {
                    Caption = 'Code', Locked = true;
                }
                field(dimensionId; Rec."Dimension Id")
                {
                    Caption = 'Dimension Id', Locked = true;
                    trigger OnValidate()
                    begin
                        if not IsNullGuid(Dimension.SystemId) then
                            if Dimension.SystemId <> Rec."Dimension Id" then
                                Error(DimensionValueDontMatchErr);

                        if Rec.GetFilter("Dimension Id") <> '' then
                            if Rec."Dimension Id" <> Rec.GetFilter("Dimension Id") then
                                Error(DimensionValueDontMatchErr);

                        if Rec."Dimension Id" = BlankGuid then
                            Rec."Dimension Code" := ''
                        else
                            if not Dimension.GetBySystemId(Rec."Dimension Id") then
                                Error(DimensionIdDoesNotMatchErr);
                    end;

                }
                field("dimensionCode"; Rec."Dimension Code")
                {
                    Caption = 'Dimension Code', Locked = true;

                    trigger OnValidate()
                    begin
                        if Rec."Dimension Code" = '' then
                            Rec."Dimension Id" := BlankGuid
                        else
                            if not Dimension.Get(Rec."Dimension Code") then
                                Error(DimensionNoDoesNotMatchErr);

                        if Rec.GetFilter("Dimension Id") <> '' then
                            if Dimension.SystemId <> Rec.GetFilter("Dimension Code") then
                                Error(DimensionValueDontMatchErr);
                    end;
                }
                field(displayName; Rec.Name)
                {
                    Caption = 'Display Name', Locked = true;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date', Locked = true;
                }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if Rec.HasFilter() then
            Rec.Validate("Dimension Id", Rec.GetFilter("Dimension Id"));

        if Rec.Code = '' then
            Error(NotProvidedDimensionCodeErr);

        Dimension.Get(Rec."Dimension Code");

    end;

    trigger OnModifyRecord(): Boolean
    var
        DimValue: Record "Dimension Value";
    begin
        DimValue.GetBySystemId(Rec.SystemId);

        Dimension.Get(DimValue."Dimension Code");


        if Rec."Dimension Code" = DimValue."Dimension Code" then
            Rec.Modify(true)
        else begin
            DimValue.TransferFields(Rec, false);
            DimValue.Rename(Rec."Dimension Code", Rec.Code);
            Rec.TransferFields(DimValue, true);
        end;
        exit(false);
    end;

    var
        Dimension: Record Dimension;
        DimensionValueDontMatchErr: Label 'The Dimension values do not match to a specific dimension', Locked = true;
        DimensionIdDoesNotMatchErr: Label 'The "dimensionId" does not match to a Dimension', Locked = true;
        DimensionNoDoesNotMatchErr: Label 'The "dimensionNo" does not match to a Dimension', Locked = true;
        DimensionValuesIsNotEditableErr: Label 'The Dimension values are not editable', Locked = true;
        NotProvidedDimensionCodeErr: Label 'A "code" must be provided.', Locked = true;
        BlankGuid: Guid;
}
