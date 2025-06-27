table 62003 "PTE WSHelper Serial Line"
{
    Caption = 'WSHelper Serial Line', Locked = true;
    DataClassification = CustomerContent;

    fields
    {
        field(1; OrderId; Integer)
        {
            Caption = 'Id', Locked = true;
            DataClassification = SystemMetadata;
        }
        field(2; LineId; Integer)
        {
            Caption = 'Line Id', Locked = true;
            DataClassification = SystemMetadata;
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No', Locked = true;
            DataClassification = SystemMetadata;
        }
        field(5; "Serial Number"; Text[200])
        {
            Caption = 'Serial Number', Locked = true;
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; OrderId, LineId, "Line No.")
        {
            Clustered = true;
        }
    }
}
