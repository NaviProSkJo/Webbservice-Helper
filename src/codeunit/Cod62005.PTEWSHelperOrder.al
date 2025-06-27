codeunit 62005 "PTE WSHelper Order"

{
    TableNo = "PTE WSHelper Order Header";

    trigger OnRun()
    var
        GLSetup: Record "General Ledger Setup";
        Setup: Record "PTE WSHelper Setup";
        Header: Record "PTE WSHelper Order Header";
        Line: Record "PTE WSHelper Order Line";
        SerialLine: Record "PTE WSHelper Serial Line";
        PHeader: Record "PTE WSHelper Purch. Order Hdr";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Customer: Record Customer;
        Vendor: Record Vendor;
        ShiptoAddress: Record "Ship-to Address";
        CurrencyRec: Record Currency;
        Item: Record Item;
        ItemTrackingCode: Record "Item Tracking Code";
        Resource: Record Resource;
        ReservationEntry: Record "Reservation Entry";
        ReservEntry1: Record "Reservation Entry";
        PurchHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        SalesPost: Codeunit "Sales-Post";
        ItemTrackingMgt: Codeunit "Item Tracking Management";
        CreateReservEntry: Codeunit "Create Reserv. Entry";
        CopyDocumentMgt: Codeunit "Copy Document Mgt.";
        ReleasePurchaseDocument: Codeunit "Release Purchase Document";
        NextLineNo, NextPurchLineNo : Integer;
    begin
        Header := rec;

        Setup.Get();
        GLSetup.Get();
        //         case Header.Status of
        //             Header.Status::"Pending":               //New order
        //                 begin
        //                     //SalesHeader.SetCurrentKey("PTE Order Id");
        //                     SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        //                     //SalesHeader.SetRange("PTE Order Id", Header.Id);
        //                     if NOT SalesHeader.FindLast() then begin
        //                         SalesHeader.Init();
        //                         SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
        //                         SalesHeader."No." := '';
        //                         //SalesHeader."PTE Order Id" := Header.Id;
        //                         SalesHeader.Insert(true);

        //                         SalesHeader.Validate("Order Date", DT2Date(Header."Order Date/Time"));
        //                         SalesHeader.Validate("External Document No.", TruncateText(Header."External Order Number", MaxStrLen(SalesHeader."External Document No.")));
        //                         Customer.Get(Header."Customer No.");
        //                         SalesHeader.Validate("Sell-to Customer No.", Customer."No.");
        //                         if (Header.Currency <> '') and (Header.Currency <> GLSetup."LCY Code") then begin
        //                             CurrencyRec.Get(Header.Currency);
        //                             SalesHeader.Validate("Currency Code", CurrencyRec.Code);
        //                         end;

        //                         SalesHeader.Validate("Your Reference", TruncateText(Header."External Order Reference", MaxStrLen(SalesHeader."Your Reference")));
        //                         SalesHeader.Validate("PEB Note of Goods", TruncateText(Header."Goods Label", MaxStrLen(SalesHeader."PEB Note of Goods")));

        //                         if ShiptoAddress.Get(Customer."No.", CopyStr(Header."Ship-to Code", 1, MaxStrLen(ShiptoAddress.Code))) then
        //                             SalesHeader.Validate("Ship-to Code", ShiptoAddress.Code);

        //                         SalesHeader."Ship-to Name" := TruncateText(Header."Ship-to Company Name", MaxStrLen(SalesHeader."Ship-to Name"));
        //                         SalesHeader."Ship-to Contact" := TruncateText(Header."Ship-to Attention", MaxStrLen(SalesHeader."Ship-to Contact"));
        //                         SalesHeader."Ship-to Address" := TruncateText(Header."Ship-to Address", MaxStrLen(SalesHeader."Ship-to Address"));
        //                         SalesHeader."Ship-to Address 2" := TruncateText(Header."Ship-to Address 2", MaxStrLen(SalesHeader."Ship-to Address 2"));
        //                         SalesHeader."Ship-to City" := TruncateText(Header."Ship-to City", MaxStrLen(SalesHeader."Ship-to City"));
        //                         SalesHeader."Ship-to Post Code" := TruncateText(Header."Ship-to Post Code", MaxStrLen(SalesHeader."Ship-to Post Code"));
        //                         SalesHeader."Ship-to County" := TruncateText(Header."Ship-to County", MaxStrLen(SalesHeader."Ship-to County"));
        //                         SalesHeader."Ship-to Country/Region Code" := TruncateText(Header."Ship-to Country Code", MaxStrLen(SalesHeader."Ship-to Country/Region Code"));

        //                         SalesHeader.Modify(true);

        //                         NextLineNo := 10000;
        //                         Line.Reset();
        //                         Line.SetRange("Order Id", Header.Id);
        //                         if Line.Find('-') then
        //                             repeat
        //                                 SalesLine.Init();
        //                                 SalesLine."Document Type" := SalesHeader."Document Type";
        //                                 SalesLine."Document No." := SalesHeader."No.";
        //                                 SalesLine."Line No." := NextLineNo;
        //                                 //SalesLine."PTE Line Id" := Line."Line Id";
        //                                 SalesLine.Insert(true);
        //                                 NextLineNo += 10000;

        //                                 case Line."Line Type" of
        //                                     Line."Line Type"::Normal,
        //                                     Line."Line Type"::Package:
        //                                         begin
        //                                             //Use "Supplier Item No" to get Resource or Item if we are the supplier
        //                                             if Line."Supplier Name" = Setup."Distributor Name" then begin
        //                                                 if Resource.Get(Line."Supplier Item No") then begin
        //                                                     SalesLine.Validate(Type, SalesLine.Type::Resource);
        //                                                     SalesLine.Validate("No.", Resource."No.");
        //                                                 end
        //                                                 else begin
        //                                                     Item.Get(Line."Supplier Item No");
        //                                                     SalesLine.Validate(Type, SalesLine.Type::Item);
        //                                                     SalesLine.Validate("No.", Item."No.");
        //                                                     SalesLine."Drop Shipment" := true;
        //                                                 end;
        //                                             end
        //                                             //else get the item using "Product Id"
        //                                             else begin
        //                                                 SalesLine.Validate(Type, SalesLine.Type::Item);
        //                                                 Item.Reset();
        //                                                 //Item.SetCurrentKey("PTE WSHelper Product Id");
        //                                                 //Item.SetRange("PTE WSHelper Product Id", Line."Product Id");
        //                                                 if Item.FindFirst() then
        //                                                     SalesLine.Validate("No.", Item."No.");
        //                                             end;
        //                                             if StrLen(Line.Description) > MaxStrLen(SalesLine.Description) then
        //                                                 SalesLine.Validate(Description, CopyStr(Line.Description, 1, MaxStrLen(SalesLine.Description)))
        //                                             else
        //                                                 SalesLine.Validate(Description, Line.Description);

        //                                             SalesLine.Validate(Quantity, Line.Quantity);
        //                                             SalesLine.Validate("Unit Cost", Line."Calculated Cost Price");
        //                                             SalesLine.Validate("Unit Price", Line."Sales Price Excl. VAT");
        //                                             // TODO: Get Location Code from WSHelper?
        //                                             // SalesLine.Validate("Location Code",);

        //                                             if (Item."Item Tracking Code" <> '') and (ItemTrackingCode.Get(Item."Item Tracking Code")) then begin
        //                                                 //Item Tracking
        //                                                 SerialLine.Reset();
        //                                                 SerialLine.SetRange(OrderId, Line."Order Id");
        //                                                 SerialLine.SetRange(LineId, Line."Line Id");
        //                                                 if SerialLine.Find('-') then
        //                                                     repeat
        //                                                         ReservationEntry.Reset();
        //                                                         //ReservationEntry.ReadIsolation := IsolationLevel::ReadCommitted;
        //                                                         ReservationEntry.SetCurrentKey("Source ID", "Source Ref. No.", "Source Type", "Source Subtype", "Source Batch Name", "Source Prod. Order Line", "Reservation Status", "Shipment Date", "Expected Receipt Date");
        //                                                         ReservationEntry.SetRange("Source ID", SalesLine."Document No.");
        //                                                         ReservationEntry.SetRange("Source Ref. No.", SalesLine."Line No.");
        //                                                         ReservationEntry.SetRange("Source Type", Database::"Sales Line");
        //                                                         ReservationEntry.SetRange("Source Subtype", SalesLine."Document Type");
        //                                                         ReservationEntry.SetRange("Reservation Status", ReservationEntry."Reservation Status"::Prospect);
        //                                                         ReservationEntry.SetRange("Item No.", SalesLine."No.");
        //                                                         if ReservationEntry.Count < SalesLine.Quantity then begin
        //                                                             ReservationEntry.SetRange("Location Code", SalesLine."Location Code");
        //                                                             ReservationEntry.SetRange("Serial No.", SerialLine."Serial Number");
        //                                                             //ReservationEntry.ReadIsolation := IsolationLevel::ReadCommitted;
        //                                                             if ReservationEntry.IsEmpty then begin
        //                                                                 ReservEntry1.Init;
        //                                                                 ReservEntry1."Serial No." := SerialLine."Serial Number";
        //                                                                 Clear(CreateReservEntry);
        //                                                                 CreateReservEntry.SetDates(0D, 0D);
        //                                                                 CreateReservEntry.SetApplyFromEntryNo(0);
        //                                                                 CreateReservEntry.SetApplyToEntryNo(0);

        //                                                                 CreateReservEntry.CreateReservEntryFor(Database::"Sales Line",
        //                                                                                                         SalesLine."Document Type".AsInteger(),
        //                                                                                                         SalesLine."Document No.",
        //                                                                                                         '',
        //                                                                                                         0,
        //                                                                                                         SalesLine."Line No.",
        //                                                                                                         1,
        //                                                                                                         0,
        //                                                                                                         1,
        //                                                                                                         ReservEntry1);
        //                                                                 CreateReservEntry.CreateEntry(SalesLine."No.",
        //                                                                                               SalesLine."Variant Code",
        //                                                                                               SalesLine."Location Code",
        //                                                                                               SalesLine.Description,
        //                                                                                               0D,
        //                                                                                               SalesLine."Shipment Date",
        //                                                                                               0,
        //                                                                                               "Reservation Status"::Surplus);
        //                                                             end;
        //                                                         end;
        //                                                     until SerialLine.Next() = 0;
        //                                             end;

        //                                             if SalesLine."Drop Shipment" then begin
        //                                                 PHeader.Reset();
        //                                                 PHeader.SetRange("Order Number", Line."Purchase Order No.");
        //                                                 if PHeader.FindFirst() then begin
        //                                                     InsertPurchaseOrder(PurchHeader, PHeader, SalesHeader);
        //                                                     PurchLine.RESET;
        //                                                     PurchLine.SETRANGE("Document Type", PurchHeader."Document Type");
        //                                                     PurchLine.SETRANGE("Document No.", PurchHeader."No.");
        //                                                     if PurchLine.FINDLAST then
        //                                                         NextPurchLineNo := PurchLine."Line No." + 10000
        //                                                     else
        //                                                         NextPurchLineNo := 10000;
        //                                                     PurchLine.Init();
        //                                                     PurchLine."Document Type" := PurchHeader."Document Type";
        //                                                     PurchLine."Document No." := PurchHeader."No.";
        //                                                     PurchLine."Line No." := NextPurchLineNo;
        //                                                     CopyDocumentMgt.TransfldsFromSalesToPurchLine(SalesLine, PurchLine);
        //                                                     PurchLine."Sales Order No." := SalesLine."Document No.";
        //                                                     PurchLine."Sales Order Line No." := SalesLine."Line No.";
        //                                                     PurchLine."Drop Shipment" := true;
        //                                                     PurchLine.Insert();

        //                                                     if PurchHeader."Currency Code" <> '' then
        //                                                         PurchLine.Validate("Direct Unit Cost", (Line."Calculated Cost Price" * PurchHeader."Currency Factor"))
        //                                                     else
        //                                                         PurchLine.Validate("Direct Unit Cost", Line."Calculated Cost Price");
        //                                                     PurchLine.Modify();

        //                                                     SalesLine."Unit Cost (LCY)" := PurchLine."Unit Cost (LCY)";
        //                                                     SalesLine.Validate("Unit Cost (LCY)");
        //                                                     SalesLine."Purchase Order No." := PurchLine."Document No.";
        //                                                     SalesLine."Purch. Order Line No." := PurchLine."Line No.";
        //                                                     SalesLine.Modify();

        //                                                     ItemTrackingMgt.CopyItemTracking(SalesLine.RowID1(), PurchLine.RowID1(), true);
        //                                                     ReleasePurchaseDocument.Run(PurchHeader);
        //                                                 end;
        //                                             end
        //                                             else begin
        //                                                 SalesLine."Unit Cost (LCY)" := Item."Last Direct Cost";
        //                                                 SalesLine.Validate("Unit Cost (LCY)");
        //                                                 SalesLine.Modify();
        //                                             end;
        //                                         end;
        //                                     Line."Line Type"::Tariff:
        //                                         begin
        //                                         end;
        //                                     Line."Line Type"::Voucher:
        //                                         begin
        //                                         end;
        //                                 end;
        //                                 SalesLine.Modify(true);
        //                             until Line.Next() = 0;
        //                     end;
        //                 end;
        //             Header.Status::"Partially delivered",   //Partially shipped from vendor
        // Header.Status::"Delivered",             //Completely shipped from vendor
        // Header.Status::"Closed":                //Completely shipped and closed
        //                 begin
        //                     SalesHeader.Reset();
        //                     //SalesHeader.SetCurrentKey("PTE Order Id");
        //                     SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        //                     //SalesHeader.SetRange("PTE Order Id", Header.Id);
        //                     if SalesHeader.FindLast() then begin
        //                         Line.Reset();
        //                         Line.SetRange("Order Id", Header.Id);
        //                         if Line.Find('-') then
        //                             repeat
        //                                 SalesLine.Reset();
        //                                 SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        //                                 SalesLine.SetRange("Document No.", SalesHeader."No.");
        //                                 //SalesLine.SetRange("PTE Line Id", Line."Line Id");
        //                                 SalesLine.SetRange(Type, SalesLine.Type::Item);
        //                                 if SalesLine.FindLast() then begin
        //                                     if Item.Get(SalesLine."No.") then begin
        //                                         if Item."Item Tracking Code" = '' then begin
        //                                             SerialLine.SetRange(OrderId, Line."Order Id");
        //                                             SerialLine.SetRange(LineId, Line."Line Id");
        //                                             SerialLine.DeleteAll();
        //                                         end
        //                                         else if ItemTrackingCode.Get(Item."Item Tracking Code") then
        //                                             if ItemTrackingCode."SN Sales Outbound Tracking" then begin
        //                                                 SerialLine.Reset();
        //                                                 SerialLine.SetRange(OrderId, Line."Order Id");
        //                                                 SerialLine.SetRange(LineId, Line."Line Id");
        //                                                 if SerialLine.Count <> Line.Quantity then
        //                                                     Error(SerialNoMissingErr, Line."Order Id", Line."Line Id");
        //                                             end;
        //                                     end;
        //                                 end;
        //                             until Line.Next() = 0;

        //                         SalesHeader.SetHideValidationDialog(true);
        //                         if Line.Find('-') then
        //                             repeat
        //                                 SalesLine.Reset();
        //                                 SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        //                                 SalesLine.SetRange("Document No.", SalesHeader."No.");
        //                                 //SalesLine.SetRange("PTE Line Id", Line."Line Id");
        //                                 SalesLine.SetRange(Type, SalesLine.Type::Item);
        //                                 if SalesLine.FindLast() then begin
        //                                     SalesLine.SuspendStatusCheck(true);
        //                                     SalesLine.Validate("Qty. to Ship", Line.Quantity);
        //                                     if Line."Last Delivery Date" <> 0D then
        //                                         SalesLine.Validate("Shipment Date", Line."Last Delivery Date");
        //                                     SalesLine.Modify(true);

        //                                     //Item Tracking
        //                                     SerialLine.Reset();
        //                                     SerialLine.SetRange(OrderId, Line."Order Id");
        //                                     SerialLine.SetRange(LineId, Line."Line Id");
        //                                     if SerialLine.Find('-') then
        //                                         repeat
        //                                             ReservationEntry.Reset();
        //                                             //ReservationEntry.ReadIsolation := IsolationLevel::ReadCommitted;
        //                                             ReservationEntry.SetCurrentKey("Source ID", "Source Ref. No.", "Source Type", "Source Subtype", "Source Batch Name", "Source Prod. Order Line", "Reservation Status", "Shipment Date", "Expected Receipt Date");
        //                                             ReservationEntry.SetRange("Source ID", SalesLine."Document No.");
        //                                             ReservationEntry.SetRange("Source Ref. No.", SalesLine."Line No.");
        //                                             ReservationEntry.SetRange("Source Type", Database::"Sales Line");
        //                                             ReservationEntry.SetRange("Source Subtype", SalesLine."Document Type");
        //                                             ReservationEntry.SetRange("Reservation Status", ReservationEntry."Reservation Status"::Surplus);
        //                                             ReservationEntry.SetRange("Item No.", SalesLine."No.");
        //                                             if ReservationEntry.Count < SalesLine.Quantity then begin
        //                                                 ReservationEntry.SetRange("Location Code", SalesLine."Location Code");
        //                                                 ReservationEntry.SetRange("Serial No.", SerialLine."Serial Number");
        //                                                 //ReservationEntry.ReadIsolation := IsolationLevel::ReadCommitted;
        //                                                 if ReservationEntry.IsEmpty then begin
        //                                                     ReservEntry1.Init;
        //                                                     ReservEntry1."Serial No." := SerialLine."Serial Number";
        //                                                     Clear(CreateReservEntry);
        //                                                     CreateReservEntry.SetDates(0D, 0D);
        //                                                     CreateReservEntry.SetApplyFromEntryNo(0);
        //                                                     CreateReservEntry.SetApplyToEntryNo(0);

        //                                                     CreateReservEntry.CreateReservEntryFor(Database::"Sales Line",
        //                                                                                             SalesLine."Document Type".AsInteger(),
        //                                                                                             SalesLine."Document No.",
        //                                                                                             '',
        //                                                                                             0,
        //                                                                                             SalesLine."Line No.",
        //                                                                                             1,
        //                                                                                             0,
        //                                                                                             1,
        //                                                                                             ReservEntry1);
        //                                                     CreateReservEntry.CreateEntry(SalesLine."No.",
        //                                                                                   SalesLine."Variant Code",
        //                                                                                   SalesLine."Location Code",
        //                                                                                   SalesLine.Description,
        //                                                                                   0D,
        //                                                                                   SalesLine."Shipment Date",
        //                                                                                   0,
        //                                                                                   "Reservation Status"::Surplus);
        //                                                 end;
        //                                             end;
        //                                         until SerialLine.Next() = 0;

        //                                     if SalesLine."Drop Shipment" then begin
        //                                         PurchLine.Get(PurchLine."Document Type"::Order, SalesLine."Purchase Order No.", SalesLine."Purch. Order Line No.");
        //                                         ItemTrackingMgt.SynchronizeItemTracking(SalesLine.RowID1(), PurchLine.RowID1(), '');
        //                                         if SalesLine."Shipment Date" <> PurchLine."Expected Receipt Date" then begin
        //                                             PurchLine."Expected Receipt Date" := SalesLine."Shipment Date";
        //                                             PurchLine.Modify();
        //                                         end;
        //                                     end;
        //                                 end;
        //                             until Line.Next() = 0;
        //                         Commit();
        //                     end;
        //                     SalesHeader.Invoice := false;
        //                     SalesHeader.Ship := true;
        //                     SalesHeader."Posting Date" := Today;
        //                     Clear(SalesPost);
        //                     SalesPost.Run(SalesHeader);
        //                 end;
        //        end;
    end;

    local procedure InsertPurchaseOrder(var PurchHeader:
                                                Record "Purchase Header";
    PHeader:
        Record "PTE WSHelper Purch. Order Hdr";
    SalesOrderHeader:
        Record "Sales Header")
    var
        Vendor: Record Vendor;
        ReleasePurchDoc:
                Codeunit "Release Purchase Document";
    begin
        Vendor.Get(PHeader."Vendor No.");
        PurchHeader.Reset();
        PurchHeader.SetCurrentKey("Document Type", "Buy-from Vendor No.");
        PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::Order);
        PurchHeader.SetRange("Buy-from Vendor No.", Vendor."No.");
        //PurchHeader.SetRange("PTE Order Id", PHeader.Id);
        if not PurchHeader.FindFirst() then begin
            PurchHeader.Init();
            PurchHeader."Document Type" := PurchHeader."Document Type"::Order;
            //PurchHeader."PTE Order Id" := PHeader.Id;
            PurchHeader.Insert(true);
            PurchHeader.SetHideValidationDialog(true);
            PurchHeader.Validate("Buy-from Vendor No.", Vendor."No.");
            PurchHeader.Validate("Sell-to Customer No.", SalesOrderHeader."Sell-to Customer No.");
            PurchHeader.SetShipToAddress(SalesOrderHeader."Ship-to Name",
                                         SalesOrderHeader."Ship-to Name 2",
                                         SalesOrderHeader."Ship-to Address",
                                         SalesOrderHeader."Ship-to Address 2",
                                         SalesOrderHeader."Ship-to City",
                                         SalesOrderHeader."Ship-to Post Code",
                                         SalesOrderHeader."Ship-to County",
                                         SalesOrderHeader."Ship-to Country/Region Code");
            PurchHeader."Ship-to Contact" := SalesOrderHeader."Ship-to Contact";
            PurchHeader.Validate("Document Date", DT2Date(PHeader."Created Date/Time"));
            PurchHeader.Modify(true);
        end
        else
            ReleasePurchDoc.Reopen(PurchHeader);
    end;

    internal procedure TruncateText(Input: Text;
    MaxLen:
        Integer) Result: Text
    begin
        if StrLen(Input) > MaxLen then
            Result := CopyStr(Input, 1, MaxLen)
        else
            Result := Input;
    end;

    var
        OrderStatusErr: Label '%1 unsupported', Comment = '%1 = fieldname';
        OrderCancelErr: Label 'Canceled order %1 could not be deleted', Comment = '%1 = ordernumber';
        SerialNoMissingErr: Label 'Serialnumbers are missing for order %1 %2, line %3.', Comment = '%1 = Order No; %2 = Line No; %3 = Line Id';
}
