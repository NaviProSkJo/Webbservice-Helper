pageextension 62001 "PTE Sales Journal" extends "Sales Journal"
{
    actions
    {
        addlast(processing)
        {
            action("ImportLines Opter")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Import XML';
                Enabled = true;
                Image = XMLFile;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    ImportCsv_XML: Codeunit PTEWSHImport_Csv_XML;
                    GenJournalTemplate: record "Gen. Journal Template";
                begin
                    GenJournalTemplate.Setrange(Type, GenJournalTemplate.Type::Sales);
                    IF GenJournalTemplate.FINDFIRST THEN
                        ImportCsv_XML.ImportSalesJournal_XML(GenJournalTemplate.Name, GetCurrentJnlBatchName);
                    page.Run(Page::"PTE Sales Journal Import");
                    CurrPage.update;
                end;
            }
            action("ImportedLines Opter")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Import Lines';
                Enabled = true;
                Image = Line;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction();
                begin
                    page.Run(Page::"PTE Sales Journal Import");
                    CurrPage.update;
                end;
            }
        }
    }
}
