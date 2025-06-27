page 62007 "PTE XMLBuffer"
{
    /*
    Temporary page to test XML-data
    */
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'XMLBuffer', Locked = true;
    PageType = List;
    SourceTable = "XML Buffer";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Data Type"; Rec."Data Type")
                {
                }
                field(Depth; Rec.Depth)
                {
                }
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Import ID"; Rec."Import ID")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Namespace; Rec.Namespace)
                {
                }
                field("Node Number"; Rec."Node Number")
                {
                }
                field("Parent Entry No."; Rec."Parent Entry No.")
                {
                }
                field(Path; Rec.Path)
                {
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                }
                field(SystemId; Rec.SystemId)
                {
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                }
                field("Type"; Rec."Type")
                {
                }
                field("Value"; Rec."Value")
                {
                }
                field("Value BLOB"; Rec."Value BLOB")
                {
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(load)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    FileMgt: Codeunit "File Management";
                    InStr: InStream;
                begin
                    FileMgt.BLOBImport(TempBlob, 'Source.xml');
                    TempBlob.CreateInStream(InStr);
                    Rec.LoadFromStream(InStr);
                    CurrPage.Update(false);
                end;
            }
        }
    }
}
