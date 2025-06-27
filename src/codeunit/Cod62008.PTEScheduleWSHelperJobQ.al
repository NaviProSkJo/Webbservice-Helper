codeunit 62008 "PTE Schedule WSHelper JobQ."
{
    TableNo = "PTE WSHelper Setup";

    trigger OnRun()
    var
        JobQueueEntry: Record "Job Queue Entry";
        DummyRecId: RecordId;
    begin
        Rec.CancelJobQueueSend();

        if Rec."Distributor Name" <> '' then begin
            JobQueueEntry.ScheduleRecurrentJobQueueEntryWithFrequency(JobQueueEntry."Object Type to Run"::Codeunit,
              CODEUNIT::"PTE WSHelper Dist Product Job", DummyRecId, 60);
            JobQueueEntry."Parameter String" := '/price.zip';
            JobQueueEntry.Modify();


        end;

        JobQueueEntry.Init();
        JobQueueEntry.ScheduleRecurrentJobQueueEntryWithFrequency(JobQueueEntry."Object Type to Run"::Codeunit,
          CODEUNIT::"PTE WSHelper Customer Job FTP", DummyRecId, 5);

        JobQueueEntry.Init();
        JobQueueEntry.ScheduleRecurrentJobQueueEntryWithFrequency(JobQueueEntry."Object Type to Run"::Codeunit,
          CODEUNIT::"PTE WSHelper Order Job", DummyRecId, 5);
    end;

}
