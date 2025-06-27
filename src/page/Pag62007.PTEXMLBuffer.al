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
                    ApplicationArea = all;
                }
                field(Depth; Rec.Depth)
                {
                    ApplicationArea = all;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = all;
                }
                field("Import ID"; Rec."Import ID")
                {
                    ApplicationArea = all;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                }
                field(Namespace; Rec.Namespace)
                {
                    ApplicationArea = all;
                }
                field("Node Number"; Rec."Node Number")
                {
                    ApplicationArea = all;
                }
                field("Parent Entry No."; Rec."Parent Entry No.")
                {
                    ApplicationArea = all;
                }
                field(Path; Rec.Path)
                {
                    ApplicationArea = all;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = all;
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = all;
                }
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = all;
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = all;
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = all;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = all;
                }
                field("Value"; Rec."Value")
                {
                    ApplicationArea = all;
                }
                field("Value BLOB"; Rec."Value BLOB")
                {
                    ApplicationArea = all;
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
                ApplicationArea = all;
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