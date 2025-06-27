page 62008 "PTE WSH Customer export"
{
    Caption = 'WSH Customer export';
    PageType = List;
    SourceTable = "PTE WSH Customer Export";
    UsageCategory = lists;
    ApplicationArea = all;
    Editable = true;
    DeleteAllowed = true;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Export Created Datetime"; Rec."Export Created Datetime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Export Created Datetime field.', Comment = '%';
                }
                field("Export Datetime"; Rec."Export Datetime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Export Datetime field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field("Customer Name"; rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field("Opter ID"; Rec."Opter ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the "Opter ID" field.', Comment = '%';
                }

                field("Export OK"; Rec."Export OK")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Export OK field.', Comment = '%';
                }
                field("Export Type"; Rec."Export Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Export Type field.', Comment = '%';
                }
                field("Export status"; Rec."Export status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Export status field.', Comment = '%';
                }
                field("Response Message"; Rec."Response Message")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Response Message field.', Comment = '%';
                }
                field("Response Message Blob"; Rec."Response Message Blob")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Response Message Blob field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("View Response")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'View Response';
                Enabled = true;
                Image = XMLFile;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    inStrm: InStream;
                    toFile: Text;
                    toPath: Text;
                    isDownloaded: Boolean;
                begin
                    rec.CalcFields("Response Message Blob");
                    if rec."Response Message Blob".HasValue then begin
                        rec."Response Message Blob".CreateInStream(inStrm);
                        toFile := 'ResponseFile.txt';
                        toPath := 'C:\Temp\';
                        isDownloaded := DownloadFromStream(inStrm, '', topath, '', toFile);
                        if isDownloaded then
                            Hyperlink(StrSubstNo('%1%2', toPath, toFile));
                    end
                    else begin
                        message('Response Message Missing')
                    end;
                end;
            }
            action("View Content")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'View Content';
                Enabled = true;
                Image = Line;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    inStrm: InStream;
                    toFile: Text;
                    toPath: Text;
                    isDownloaded: Boolean;
                begin
                    rec.CalcFields("Export Content");
                    if rec."Export Content".HasValue then begin
                        rec."Export Content".CreateInStream(inStrm);
                        toFile := 'Content.txt';
                        toPath := 'C:\Temp\';
                        isDownloaded := DownloadFromStream(inStrm, '', topath, '', toFile);
                        if isDownloaded then
                            Hyperlink(StrSubstNo('%1%2', toPath, toFile));
                    end
                    else begin
                        message('Content is missing')
                    end;
                end;
            }
        }
    }
}
