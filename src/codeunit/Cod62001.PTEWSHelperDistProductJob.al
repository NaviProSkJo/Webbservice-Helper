codeunit 62001 "PTE WSHelper Dist Product Job"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        WSHelperDistMgt: Codeunit "PTE WSHelper Dist. Mgt";
        TempBlob: Codeunit "Temp Blob";
        ZipBlob: Codeunit "Temp Blob";
        DataCompression: Codeunit "Data Compression";
        OutStr: OutStream;
        InStr: InStream;
    begin
        Rec.TestField("Parameter String");
        //Update Items with current export status
        //WSHelperDistMgt.UpdateItemDistrType();

        //Save data from XMLport to TempBlob
        TempBlob.CreateOutStream(OutStr);
        If WSHelperDistMgt.ExportDistProducts(OutStr) then begin
            TempBlob.CreateInStream(InStr);
            //Compress data from TempBlob to ZipBlob
            DataCompression.CreateZipArchive();
            DataCompression.AddEntry(InStr, 'price.csv');
            ZipBlob.CreateOutStream(OutStr);
            DataCompression.SaveZipArchive(OutStr);
            ZipBlob.CreateInStream(InStr);
            //Upload data from ZipBlob
            if not WSHelperDistMgt.Transfer(Rec."Parameter String", InStr) then
                Error(JobbErr, WSHelperDistMgt.GetLastErrorMsg());
        end;
    end;

    var
        JobbErr: Label 'Jobb failed with error %1';
}
