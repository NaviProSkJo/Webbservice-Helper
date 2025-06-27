codeunit 62004 "PTE WSHelper Mgt"
{
    internal procedure ProcessOrders() Result: Boolean
    var
        GLSetup: Record "General Ledger Setup";
        Setup: Record "PTE WSHelper Setup";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Customer: Record Customer;
        Vendor: Record Vendor;
        Currency: Record Currency;
        Item: Record Item;
        Resource: Record Resource;
        ReservationEntry: Record "Reservation Entry";
        ReservEntry1: Record "Reservation Entry";
        SalesPost: Codeunit "Sales-Post";
        ItemTrackingMgt: Codeunit "Item Tracking Management";
        CreateReservEntry: Codeunit "Create Reserv. Entry";
        WSHelperOrderMgt: Codeunit "PTE WSHelper Order";
        Success: Boolean;
        NextLineNo: Integer;
    begin
        Setup.Get();
        GLSetup.Get();

        //Process all Products
        SOrderLine.Reset();
        //if not ProcessProducts(SOrderLine) then
        //    exit(false);

        //Process all Vendors
        POrderHeader.Reset();
        if POrderHeader.FindSet(false) then
            repeat
                if not Vendor.Get(POrderHeader."Vendor No.") then begin
                    LastErrorMsg := StrSubstNo(VendorNoFoundErr, POrderHeader."Vendor No.", POrderHeader."Vendor Id");
                    exit(false);
                end;
            until POrderHeader.Next() = 0;

        //Process all Orders
        SOrderHeader.Reset();
        if SOrderHeader.FindSet(false) then
            repeat
                SOrderLine.Reset();
                SOrderLine.SetRange("Order Id", SOrderHeader.Id);
                Clear(WSHelperOrderMgt);
                ClearLastError();
                WSHelperOrderMgt.Run(SOrderHeader);
            //Success := WSHelperOrderMgt.Run();
            //if not Success then begin
            //    LastErrorMsg := GetLastErrorMsg();
            //    exit(false);
            //end;
            until SOrderHeader.Next() = 0;
        exit(true);
    end;
    #region purchase    
    internal procedure GetPurchOrderList(var OrderList: Record "PTE WSHelper Purch. Order Hdr" temporary) Result: Boolean
    var
        Setup: Record "PTE WSHelper Setup";
        TempBlob: Codeunit "Temp Blob";
        NetOrderList: XmlPort "PTE WSHelper Purch.Order List";
        Client: HttpClient;
        RequestHeaders: HttpHeaders;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        InStr: InStream;
        Success: Boolean;
        Test: Text;
    begin
        Setup.Get();
        Request.Method('GET');
        Request.SetRequestUri(Setup."WSHelper Base URL" + PurchaseOrderListEnpointLbl);
        Request.GetHeaders(RequestHeaders);
        RequestHeaders.Add('Accept', 'application/xml');
        RequestHeaders.Add('Accept-Language', 'en-US');
        RequestHeaders.Add('Authorization', Setup.GetWSHelperAuthentication());
        Success := Client.Send(Request, Response);
        if Success = true then
            if not Response.IsSuccessStatusCode() then
                Success := false;
        if not Success then begin
            ;
            LastErrorMsg := Response.ReasonPhrase();
            exit(false);
        end;

        Clear(NetOrderList);
        ClearLastError();
        TempBlob.CreateInStream(InStr);
        Response.Content.ReadAs(InStr);
        InStr.ReadText(Test);
        NetOrderList.SetSource(InStr);
        //>>
        //if Test <> '<?xml version="1.0" encoding="UTF8" standalone="no"?><PurchaseOrders/>' then begin
        begin
            //<<
            Success := NetOrderList.Import();
            if not Success then begin
                LastErrorMsg := GetLastErrorText();
                exit(false);
            end;
            NetOrderList.GetData(OrderList);
            //>>
        end;
        //<<
        exit(true);
    end;

    internal procedure GetPurchaseOrder(OrderId: Integer) Result: Boolean
    var
        Setup: Record "PTE WSHelper Setup";
        TempXMLBuffer: Record "XML Buffer" temporary;
        Vendor: Record Vendor;
        TempBlob: Codeunit "Temp Blob";
        TypeHelper: Codeunit "Type Helper";
        Client: HttpClient;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
        RequestHeaders: HttpHeaders;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        InStr: InStream;
        Success: Boolean;
        XMLData: Text;
        ResultOrderId: Integer;
    begin
        Setup.Get();
        XmlData := StrSubstNo('<?xml version="1.0" encoding="UTF8"?><PurchaseOrderRequest id="%1"/>', Format(OrderId, 0, 9));
        Content.WriteFrom(XMLData);
        Content.GetHeaders(ContentHeaders);
        if ContentHeaders.Contains('Content-Type') then
            ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/xml');

        Request.Content(Content);
        Request.SetRequestUri(Setup."WSHelper Base URL" + PurchaseOrderEnpointLbl);
        Request.Method('POST');
        Request.GetHeaders(RequestHeaders);
        RequestHeaders.Add('Accept', 'application/xml');
        RequestHeaders.Add('Accept-Language', 'en-US');
        RequestHeaders.Add('Authorization', Setup.GetWSHelperAuthentication());
        Success := Client.Send(Request, Response);
        if Success then
            if not Response.IsSuccessStatusCode() then
                Success := false;
        if not Success then begin
            LastErrorMsg := Response.ReasonPhrase();
            exit(false);
        end;

        ClearLastError();
        TempBlob.CreateInStream(InStr);
        Response.Content.ReadAs(InStr);

        Clear(TempXMLBuffer);
        TempXMLBuffer.LoadFromStream(InStr);

        TempXMLBuffer.Reset();
        if TempXMLBuffer.IsEmpty then
            exit(true);

        //if POrderHeader.Get(GetIntegerValue(TempXMLBuffer, '/PurchaseOrder/Header/Id')) then
        //    exit(true);

        POrderHeader.Init();
        POrderHeader.Id := OrderId;
        POrderHeader.Insert();

        if TempXMLBuffer.findset() then
            repeat
                case TempXMLBuffer.Path of
                    '/PurchaseOrder/Header/Id':
                        begin
                            if GetIntegerValue(TempXMLBuffer, '/PurchaseOrder/Header/Id') = 0 then
                                exit(true);
                        end;

                    '/PurchaseOrder/Header/OrderNumber':
                        POrderHeader."Order Number" := GetTextValue(TempXMLBuffer, '/PurchaseOrder/Header/OrderNumber', MaxStrLen(POrderHeader."Order Number"));
                    '/PurchaseOrder/Header/CreatedDate':
                        POrderHeader."Created Date/Time" := GetDateTimeValue(TempXMLBuffer, '/PurchaseOrder/Header/CreatedDate');
                    '/PurchaseOrder/Header/Currency':
                        POrderHeader.Currency := GetTextValue(TempXMLBuffer, '/PurchaseOrder/Header/Currency', MaxStrLen(POrderHeader.Currency));
                    '/PurchaseOrder/Header/Supplier':
                        POrderHeader."Vendor No." := GetTextValue(TempXMLBuffer, '/PurchaseOrder/Header/Supplier', MaxStrLen(POrderHeader."Vendor No."));
                    '/PurchaseOrder/Header/Supplier/@exportId':
                        begin
                            POrderHeader."Vendor Id" := GetIntegerValue(TempXMLBuffer, '/PurchaseOrder/Header/Supplier/@exportId');

                            if not Vendor.Get(POrderHeader."Vendor No.") then begin
                                Vendor.Reset();
                                //Vendor.SetCurrentKey("PTE Vendor Id");
                                //Vendor.SetRange("PTE Vendor Id", POrderHeader."Vendor Id");
                                if Vendor.FindFirst() then
                                    POrderHeader."Vendor No." := Vendor."No.";
                            end;
                        end;
                    '/PurchaseOrder/Header/Delivery/GoodsLabel':
                        POrderHeader."Goods Label" := GetTextValue(TempXMLBuffer, '/PurchaseOrder/Header/Delivery/GoodsLabel', MaxStrLen(POrderHeader."Goods Label"));
                    '/PurchaseOrder/Header/Delivery/Address/Name1':
                        POrderHeader."Ship-to Name" := GetTextValue(TempXMLBuffer, '/PurchaseOrder/Header/Delivery/Address/Name1', MaxStrLen(POrderHeader."Ship-to Name"));
                    '/PurchaseOrder/Header/Delivery/Address/Name2':
                        POrderHeader."Ship-to Name 2" := GetTextValue(TempXMLBuffer, '/PurchaseOrder/Header/Delivery/Address/Name2', MaxStrLen(POrderHeader."Ship-to Name 2"));
                    '/PurchaseOrder/Header/Delivery/Address/Address1':
                        POrderHeader."Ship-to Address" := GetTextValue(TempXMLBuffer, '/PurchaseOrder/Header/Delivery/Address/Address1', MaxStrLen(POrderHeader."Ship-to Address"));
                    '/PurchaseOrder/Header/Delivery/Address/Address2':
                        POrderHeader."Ship-to Address 2" := GetTextValue(TempXMLBuffer, '/PurchaseOrder/Header/Delivery/Address/Address2', MaxStrLen(POrderHeader."Ship-to Address 2"));
                    '/PurchaseOrder/Header/Delivery/Address/Address3':
                        POrderHeader."Ship-to Address 3" := GetTextValue(TempXMLBuffer, '/PurchaseOrder/Header/Delivery/Address/Address3', MaxStrLen(POrderHeader."Ship-to Address 3"));
                    '/PurchaseOrder/Header/Delivery/Address/Address4':
                        POrderHeader."Ship-to Address 4" := GetTextValue(TempXMLBuffer, '/PurchaseOrder/Header/Delivery/Address/Address4', MaxStrLen(POrderHeader."Ship-to Address 4"));
                    '/PurchaseOrder/Header/Delivery/Address/PostalCode':
                        POrderHeader."Ship-to Post Code" := GetTextValue(TempXMLBuffer, '/PurchaseOrder/Header/Delivery/Address/PostalCode', MaxStrLen(POrderHeader."Ship-to Post Code"));
                    '/PurchaseOrder/Header/Delivery/Address/City':
                        POrderHeader."Ship-to City" := GetTextValue(TempXMLBuffer, '/PurchaseOrder/Header/Delivery/Address/City', MaxStrLen(POrderHeader."Ship-to City"));
                    '/PurchaseOrder/Header/Delivery/Address/County':
                        POrderHeader."Ship-to County" := GetTextValue(TempXMLBuffer, '/PurchaseOrder/Header/Delivery/Address/County', MaxStrLen(POrderHeader."Ship-to County"));
                    '/PurchaseOrder/Header/Delivery/Address/Country':
                        POrderHeader."Ship-to Country" := GetTextValue(TempXMLBuffer, '/PurchaseOrder/Header/Delivery/Address/Country', MaxStrLen(POrderHeader."Ship-to Country"));
                end;
            Until TempXMLBuffer.next() = 0;
        POrderHeader.Modify();
        exit(true);

    end;

    #endregion

    #region sales
    internal procedure GetSalesOrderList(var
                                             OrderList: Record "PTE WSHelper Order Header" temporary) Result: Boolean
    var
        Setup: Record "PTE WSHelper Setup";
        TempBlob: Codeunit "Temp Blob";
        NetOrderList: XmlPort "PTE WSHelper Sales Order List";
        Client: HttpClient;
        RequestHeaders: HttpHeaders;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        InStr: InStream;
        Success: Boolean;
        Test: Text;
    begin
        Setup.Get();
        Request.Method('GET');
        Request.SetRequestUri(Setup."WSHelper Base URL" + SalesOrderListEndpointLbl);
        Request.GetHeaders(RequestHeaders);
        RequestHeaders.Add('Accept', 'application/xml');
        RequestHeaders.Add('Accept-Language', 'en-US');
        RequestHeaders.Add('Authorization', Setup.GetWSHelperAuthentication());
        Success := Client.Send(Request, Response);
        if Success then
            if not Response.IsSuccessStatusCode() then
                Success := false;
        if not Success then begin
            LastErrorMsg := Response.ReasonPhrase();
            exit(false);
        end;

        Clear(NetOrderList);
        ClearLastError();
        TempBlob.CreateInStream(InStr);
        Response.Content.ReadAs(InStr);
        InStr.ReadText(Test);
        NetOrderList.SetSource(InStr);
        Success := NetOrderList.Import();
        if not Success then begin
            LastErrorMsg := GetLastErrorText();
            exit(false);
        end;
        NetOrderList.GetData(OrderList);
        exit(true);
    end;

    internal procedure GetSalesOrder(OrderId: Integer) Result: Boolean
    var
        Setup: Record "PTE WSHelper Setup";
        TempXMLBuffer: Record "XML Buffer" temporary;
        SOrderHeader2: Record "PTE WSHelper Order Header";
        TempBlob: Codeunit "Temp Blob";
        TypeHelper: Codeunit "Type Helper";
        Client: HttpClient;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
        RequestHeaders: HttpHeaders;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        InStr: InStream;
        Success: Boolean;
        XMLData: Text;
        NextSerialLineNo: Integer;
        SorderCreated: Boolean;
    begin
        Setup.Get();
        XmlData := StrSubstNo('<?xml version="1.0" encoding="UTF8"?><OrderRequest id="%1"/>', Format(OrderId, 0, 9));
        Content.WriteFrom(XMLData);
        Content.GetHeaders(ContentHeaders);
        if ContentHeaders.Contains('Content-Type') then
            ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/xml');

        Request.Content(Content);
        Request.SetRequestUri(Setup."WSHelper Base URL" + SalesOrderEndpointLbl);
        Request.Method('POST');
        Request.GetHeaders(RequestHeaders);
        RequestHeaders.Add('Accept', 'application/xml');
        RequestHeaders.Add('Accept-Language', 'en-US');
        RequestHeaders.Add('Authorization', Setup.GetWSHelperAuthentication());
        Success := Client.Send(Request, Response);
        if Success then
            if not Response.IsSuccessStatusCode() then
                Success := false;
        if not Success then begin
            LastErrorMsg := Response.ReasonPhrase();
            exit(false);
        end;

        ClearLastError();
        TempBlob.CreateInStream(InStr);
        Response.Content.ReadAs(InStr);

        Clear(TempXMLBuffer);
        TempXMLBuffer.LoadFromStream(InStr);

        TempXMLBuffer.Reset();
        if TempXMLBuffer.IsEmpty then
            exit(true);
        #region Header

        //if GuiAllowed then
        //    Page.run(Page::"PTE XMLBuffer",TempXMLBuffer);


        //SOrderHeader.Id := OrderId;
        //SOrderHeader.Insert();
        if TempXMLBuffer.findset() then
            repeat
                case TempXMLBuffer.Path of
                    '/Order/@Id':
                        begin
                            if ValueAsInteger(TempXMLBuffer.Value) = 0 then
                                exit(true);
                        end;
                    '/Order/OrderHeader/Source':
                        SOrderHeader.Source := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/Source', MaxStrLen(SOrderHeader.Source));
                    '/Order/OrderHeader/ExternalSystemOrderNo':
                        SOrderHeader."External System Order No." := ValueAsInteger(TempXMLBuffer.Value);
                    '/Order/OrderHeader/OrderDate':
                        SOrderHeader."Order Date/Time" := ValueAsDatetime(TempXMLBuffer.Value);
                    '/Order/OrderHeader/CreatedBy':
                        SOrderHeader."Created By" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/CreatedBy', MaxStrLen(SOrderHeader."Created By"));
                    '/Order/OrderHeader/CreatedByEmail':
                        SOrderHeader."Created By E-Mail" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/CreatedByEmail', MaxStrLen(SOrderHeader."Created By E-Mail"));
                    '/Order/OrderHeader/OrderNumber':
                        SOrderHeader."Order Number" := ValueAsInteger(TempXMLBuffer.Value);
                    '/Order/OrderHeader/ExternalOrderNumber':
                        SOrderHeader."External Order Number" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/ExternalOrderNumber', MaxStrLen(SOrderHeader."External Order Number"));
                    '/Order/OrderHeader/ExternalOrderReference':
                        SOrderHeader."External Order Reference" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/ExternalOrderReference', MaxStrLen(SOrderHeader."External Order Reference"));
                    '/Order/OrderHeader/CustomerNo':
                        SOrderHeader."Customer No." := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/CustomerNo', MaxStrLen(SOrderHeader."Customer No."));
                    '/Order/OrderHeader/CustomerId':
                        SOrderHeader."Customer Id" := ValueAsInteger(TempXMLBuffer.Value);
                    '/Order/OrderHeader/CustomerGroupId':
                        SOrderHeader."Customer Group Id" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/CustomerGroupId', MaxStrLen(SOrderHeader."Customer Group Id"));
                    '/Order/OrderHeader/CustomerGroupName':
                        SOrderHeader."Customer Group Name" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/CustomerGroupName', MaxStrLen(SOrderHeader."Customer Group Name"));
                    '/Order/OrderHeader/CustomerGLN':
                        SOrderHeader."Customer GLN" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/CustomerGLN', MaxStrLen(SOrderHeader."Customer GLN"));
                    '/Order/OrderHeader/CustomerErpId':
                        SOrderHeader."Customer ERP Id" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/CustomerErpId', MaxStrLen(SOrderHeader."Customer ERP Id"));
                    '/Order/OrderHeader/CustomerGroupErpId':
                        SOrderHeader."Customer Group ERP Id" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/CustomerGroupErpId', MaxStrLen(SOrderHeader."Customer Group ERP Id"));
                    '/Order/OrderHeader/SalesPersonExportId':
                        SOrderHeader."Sales Person Export Id" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/SalesPersonExportId', MaxStrLen(SOrderHeader."Sales Person Export Id"));
                    '/Order/OrderHeader/GoodsLabel':
                        SOrderHeader."Goods Label" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/GoodsLabel', MaxStrLen(SOrderHeader."Goods Label"));
                    '/Order/OrderHeader/Currency':
                        SOrderHeader.Currency := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/Currency', MaxStrLen(SOrderHeader.Currency));
                    '/Order/OrderHeader/CurrencyId':
                        SOrderHeader."Currency Id" := ValueAsInteger(TempXMLBuffer.Value);
                    '/Order/OrderHeader/CurrencyDisplay':
                        SOrderHeader."Currency Display" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/CurrencyDisplay', MaxStrLen(SOrderHeader."Currency Display"));
                    '/Order/OrderHeader/CurrencyDisplayId':
                        SOrderHeader."Currency Display Id" := ValueAsInteger(TempXMLBuffer.Value);
                    '/Order/OrderHeader/CustomerPO':
                        SOrderHeader."Customer PO" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/CustomerPO', MaxStrLen(SOrderHeader."Customer PO"));
                    '/Order/OrderHeader/InvoiceReference':
                        SOrderHeader."Invoice Reference" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/InvoiceReference', MaxStrLen(SOrderHeader."Invoice Reference"));
                    '/Order/OrderHeader/Status':
                        begin
                            //if not Evaluate(SOrderHeader.Status, GetTextValue(TempXMLBuffer, '/Order/OrderHeader/Status', 20)) then
                            //    exit(false);
                        end;
                    '/Order/OrderHeader/IsDirectDelivery':
                        begin
                            if not Evaluate(SOrderHeader."Is Direct Delivery", GetTextValue(TempXMLBuffer, '/Order/OrderHeader/IsDirectDelivery', 10)) then
                                SOrderHeader."Is Direct Delivery" := false;
                        end;
                    '/Order/OrderHeader/OrderAttester':
                        SOrderHeader."Order Attester" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/OrderAttester', MaxStrLen(SOrderHeader."Order Attester"));
                    '/Order/OrderHeader/Administrator':
                        SOrderHeader.Administrator := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/Administrator', MaxStrLen(SOrderHeader.Administrator));
                    '/Order/OrderHeader/AdministratorLogin':
                        SOrderHeader."Administrator Login" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AdministratorLogin', MaxStrLen(SOrderHeader."Administrator Login"));
                    '/Order/OrderHeader/AdministratorExportId':
                        SOrderHeader."Administrator Export Id" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AdministratorExportId', MaxStrLen(SOrderHeader."Administrator Export Id"));
                    '/Order/OrderHeader/SalesTeam':
                        SOrderHeader."Sales Team" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/SalesTeam', MaxStrLen(SOrderHeader."Sales Team"));
                    '/Order/OrderHeader/SalesTeamExportId':
                        SOrderHeader."Sales Team Export Id" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/SalesTeamExportId', MaxStrLen(SOrderHeader."Sales Team Export Id"));

                    //TODO: CustomFieldData

                    //TODO: ExtrinsicFields
                    '/Order/OrderHeader/ResellerInformation/Name':
                        SOrderHeader."Reseller Name" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/ResellerInformation/Name', MaxStrLen(SOrderHeader."Reseller Name"));
                    '/Order/OrderHeader/ResellerInformation/CorpRegNo':
                        SOrderHeader."Reseller Registration No." := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/ResellerInformation/CorpRegNo', MaxStrLen(SOrderHeader."Reseller Registration No."));
                    '/Order/OrderHeader/ResellerInformation/VatNumber':
                        SOrderHeader."Reseller VAT Registration No." := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/ResellerInformation/VatNumber', MaxStrLen(SOrderHeader."Reseller VAT Registration No."));
                    '/Order/OrderHeader/CompanyInformation/Name':
                        SOrderHeader."Company Name" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/CompanyInformation/Name', MaxStrLen(SOrderHeader."Company Name"));
                    '/Order/OrderHeader/CompanyInformation/CorpRegNo':
                        SOrderHeader."Company Registration No." := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/CompanyInformation/CorpRegNo', MaxStrLen(SOrderHeader."Company Registration No."));
                    '/Order/OrderHeader/CompanyInformation/VatNumber':
                        SOrderHeader."Company VAT Registration No." := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/CompanyInformation/VatNumber', MaxStrLen(SOrderHeader."Company VAT Registration No."));
                    '/Order/OrderHeader/ContactInformation/Contact':
                        SOrderHeader.Contact := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/ContactInformation/Contact', MaxStrLen(SOrderHeader.Contact));
                    '/Order/OrderHeader/ContactInformation/Phone':
                        SOrderHeader."Contact Phone" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/ContactInformation/Phone', MaxStrLen(SOrderHeader."Contact Phone"));
                    '/Order/OrderHeader/ContactInformation/Mobile':
                        SOrderHeader."Contact Mobile" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/ContactInformation/Mobile', MaxStrLen(SOrderHeader."Contact Mobile"));
                    '/Order/OrderHeader/ContactInformation/Fax':
                        SOrderHeader."Contact Fax" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/ContactInformation/Fax', MaxStrLen(SOrderHeader."Contact Fax"));
                    '/Order/OrderHeader/ContactInformation/Email':
                        SOrderHeader."Contact Email" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/ContactInformation/Email', MaxStrLen(SOrderHeader."Contact Email"));
                    '/Order/OrderHeader/InvoiceContactInformation/Contact':
                        SOrderHeader."Invoice Contact" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/InvoiceContactInformation/Contact', MaxStrLen(SOrderHeader."Invoice Contact"));
                    '/Order/OrderHeader/InvoiceContactInformation/Name':
                        SOrderHeader."Invoice Contact Name" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/InvoiceContactInformation/Name', MaxStrLen(SOrderHeader."Invoice Contact Name"));
                    '/Order/OrderHeader/InvoiceContactInformation/Phone':
                        SOrderHeader."Invoice Contact Phone" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/InvoiceContactInformation/Phone', MaxStrLen(SOrderHeader."Invoice Contact Phone"));
                    '/Order/OrderHeader/InvoiceContactInformation/Mobile':
                        SOrderHeader."Invoice Contact Mobile" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/InvoiceContactInformation/Mobile', MaxStrLen(SOrderHeader."Invoice Contact Mobile"));
                    '/Order/OrderHeader/InvoiceContactInformation/Fax':
                        SOrderHeader."Invoice Contact Fax" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/InvoiceContactInformation/Fax', MaxStrLen(SOrderHeader."Invoice Contact Fax"));
                    '/Order/OrderHeader/InvoiceContactInformation/Email':
                        SOrderHeader."Invoice Contact Email" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/InvoiceContactInformation/Email', MaxStrLen(SOrderHeader."Invoice Contact Email"));
                    '/Order/OrderHeader/DeliveryRecipientContactInformation/Name':
                        SOrderHeader."Delivery Recipient Name" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/DeliveryRecipientContactInformation/Name', MaxStrLen(SOrderHeader."Delivery Recipient Name"));
                    '/Order/OrderHeader/DeliveryRecipientContactInformation/Email':
                        SOrderHeader."Delivery Recipient Email" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/DeliveryRecipientContactInformation/Email', MaxStrLen(SOrderHeader."Delivery Recipient Email"));
                    '/Order/OrderHeader/DeliveryRecipientContactInformation/Phone1':
                        SOrderHeader."Delivery Recipient Phone" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/DeliveryRecipientContactInformation/Phone1', MaxStrLen(SOrderHeader."Delivery Recipient Phone"));
                    '/Order/OrderHeader/DeliveryRecipientContactInformation/Phone2':
                        SOrderHeader."Delivery Recipient Phone 2" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/DeliveryRecipientContactInformation/Phone2', MaxStrLen(SOrderHeader."Delivery Recipient Phone 2"));
                    '/Order/OrderHeader/DeliveryRecipientContactInformation/Mobile':
                        SOrderHeader."Delivery Recipient Mobile" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/DeliveryRecipientContactInformation/Mobile', MaxStrLen(SOrderHeader."Delivery Recipient Mobile"));
                    '/Order/OrderHeader/DeliveryRecipientContactInformation/Fax':
                        SOrderHeader."Delivery Recipient Fax" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/DeliveryRecipientContactInformation/Fax', MaxStrLen(SOrderHeader."Delivery Recipient Fax"));
                    '/Order/OrderHeader/ShipmentOptions/Rental':
                        SOrderHeader."Shipment Rental" := GetIntegerValue(TempXMLBuffer, '/Order/OrderHeader/ShipmentOptions/Rental');
                    '/Order/OrderHeader/ShipmentOptions/Payment':
                        SOrderHeader."Shipment Payment" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/ShipmentOptions/Payment', MaxStrLen(SOrderHeader."Shipment Payment"));
                    '/Order/OrderHeader/ShipmentOptions/Payed':
                        begin
                            if not Evaluate(SOrderHeader."Shipment Payed", GetTextValue(TempXMLBuffer, '/Order/OrderHeader/ShipmentOptions/Payed', 10)) then
                                SOrderHeader."Shipment Payed" := false;
                        end;
                    '/Order/OrderHeader/ShipmentOptions/Delivery':
                        SOrderHeader."Shipment Delivery" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/ShipmentOptions/Delivery', MaxStrLen(SOrderHeader."Shipment Delivery"));
                    '/Order/OrderHeader/ShipmentOptions/DeliveryCode':
                        SOrderHeader."Shipment Delivery Code" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/ShipmentOptions/DeliveryCode', MaxStrLen(SOrderHeader."Shipment Delivery Code"));
                    '/Order/OrderHeader/ShipmentOptions/AllowPartialDelivery':
                        begin
                            if not Evaluate(SOrderHeader."Shpmt. Allow Partial Delivery", GetTextValue(TempXMLBuffer, '/Order/OrderHeader/ShipmentOptions/AllowPartialDelivery', 10)) then
                                SOrderHeader."Shpmt. Allow Partial Delivery" := false;
                        end;
                    '/Order/OrderHeader/FinancingOptions/FinancingPeriod':
                        SOrderHeader."Financing Period" := ValueAsInteger(TempXMLBuffer.Value);
                    '/Order/OrderHeader/AddressingInformation/BillToAddress/AddressName':
                        SOrderHeader."Bill-to Name" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/BillToAddress/AddressName', MaxStrLen(SOrderHeader."Bill-to Name"));
                    '/Order/OrderHeader/AddressingInformation/BillToAddress/Attention':
                        SOrderHeader."Bill-to Attention" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/BillToAddress/Attention', MaxStrLen(SOrderHeader."Bill-to Attention"));
                    '/Order/OrderHeader/AddressingInformation/BillToAddress/Company':
                        SOrderHeader."Bill-to Company Name" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/BillToAddress/Company', MaxStrLen(SOrderHeader."Bill-to Company Name"));
                    '/Order/OrderHeader/AddressingInformation/BillToAddress/Address1':
                        SOrderHeader."Bill-to Address" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/BillToAddress/Address1', MaxStrLen(SOrderHeader."Bill-to Address"));
                    '/Order/OrderHeader/AddressingInformation/BillToAddress/Address2':
                        SOrderHeader."Bill-to Address 2" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/BillToAddress/Address2', MaxStrLen(SOrderHeader."Bill-to Address 2"));
                    '/Order/OrderHeader/AddressingInformation/BillToAddress/County':
                        SOrderHeader."Bill-to County" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/BillToAddress/County', MaxStrLen(SOrderHeader."Bill-to County"));
                    '/Order/OrderHeader/AddressingInformation/BillToAddress/Zip':
                        SOrderHeader."Bill-to Post Code" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/BillToAddress/Zip', MaxStrLen(SOrderHeader."Bill-to Post Code"));
                    '/Order/OrderHeader/AddressingInformation/BillToAddress/City':
                        SOrderHeader."Bill-to City" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/BillToAddress/City', MaxStrLen(SOrderHeader."Bill-to City"));
                    '/Order/OrderHeader/AddressingInformation/BillToAddress/Code':
                        SOrderHeader."Bill-to Code" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/BillToAddress/Code', MaxStrLen(SOrderHeader."Bill-to Code"));
                    '/Order/OrderHeader/AddressingInformation/BillToAddress/GLN':
                        SOrderHeader."Bill-to GLN" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/BillToAddress/GLN', MaxStrLen(SOrderHeader."Bill-to GLN"));
                    '/Order/OrderHeader/AddressingInformation/BillToAddress/State':
                        SOrderHeader."Bill-to State" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/BillToAddress/State', MaxStrLen(SOrderHeader."Bill-to State"));
                    '/Order/OrderHeader/AddressingInformation/BillToAddress/Country/@code':
                        SOrderHeader."Bill-to Country Code" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/BillToAddress/Country/@code', MaxStrLen(SOrderHeader."Bill-to Country Code"));
                    '/Order/OrderHeader/AddressingInformation/ShipToAddress/AddressName':
                        SOrderHeader."Ship-to Name" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/ShipToAddress/AddressName', MaxStrLen(SOrderHeader."Ship-to Name"));
                    '/Order/OrderHeader/AddressingInformation/ShipToAddress/Attention':
                        SOrderHeader."Ship-to Attention" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/ShipToAddress/Attention', MaxStrLen(SOrderHeader."Ship-to Attention"));
                    '/Order/OrderHeader/AddressingInformation/ShipToAddress/Company':
                        SOrderHeader."Ship-to Company Name" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/ShipToAddress/Company', MaxStrLen(SOrderHeader."Ship-to Company Name"));
                    '/Order/OrderHeader/AddressingInformation/ShipToAddress/Address1':
                        SOrderHeader."Ship-to Address" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/ShipToAddress/Address1', MaxStrLen(SOrderHeader."Ship-to Address"));
                    '/Order/OrderHeader/AddressingInformation/ShipToAddress/Address2':
                        SOrderHeader."Ship-to Address 2" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/ShipToAddress/Address2', MaxStrLen(SOrderHeader."Ship-to Address 2"));
                    '/Order/OrderHeader/AddressingInformation/ShipToAddress/County':
                        SOrderHeader."Ship-to County" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/ShipToAddress/County', MaxStrLen(SOrderHeader."Ship-to County"));
                    '/Order/OrderHeader/AddressingInformation/ShipToAddress/Zip':
                        SOrderHeader."Ship-to Post Code" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/ShipToAddress/Zip', MaxStrLen(SOrderHeader."Ship-to Post Code"));
                    '/Order/OrderHeader/AddressingInformation/ShipToAddress/City':
                        SOrderHeader."Ship-to City" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/ShipToAddress/City', MaxStrLen(SOrderHeader."Ship-to City"));
                    '/Order/OrderHeader/AddressingInformation/ShipToAddress/GLN':
                        SOrderHeader."Ship-to GLN" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/ShipToAddress/GLN', MaxStrLen(SOrderHeader."Ship-to GLN"));
                    '/Order/OrderHeader/AddressingInformation/ShipToAddress/State':
                        SOrderHeader."Ship-to State" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/ShipToAddress/State', MaxStrLen(SOrderHeader."Ship-to State"));
                    '/Order/OrderHeader/AddressingInformation/ShipToAddress/Country/@code':
                        SOrderHeader."Ship-to Country Code" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/AddressingInformation/ShipToAddress/Country/@code', MaxStrLen(SOrderHeader."Ship-to Country Code"));
                    '/Order/OrderHeader/ShippingTotal/VAT':
                        SOrderHeader."Shipping Total VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderHeader/ShippingTotal/ExclusiveVAT':
                        SOrderHeader."Shipping Total Excl. VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderHeader/ShippingTotal/InclusiveVAT':
                        SOrderHeader."Shipping Total Incl. VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderHeader/ShippingTotal/VATDisplay':
                        SOrderHeader."Shipping VAT Display" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderHeader/ShippingTotal/ExclusiveVATDisplay':
                        SOrderHeader."Shipping Excl. VAT Display" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderHeader/ShippingTotal/InclusiveVATDisplay':
                        SOrderHeader."Shipping Rent Excl. VAT Displ." := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderHeader/ShippingTotal/RentExclusiveVATDisplay':
                        SOrderHeader."Shipping Rent Excl. VAT Displ." := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderHeader/ShippingTotal/RentInclusiveVATDisplay':
                        SOrderHeader."Shipping Rent Incl. VAT Displ." := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderHeader/ShippingTotal/TaxCode':
                        SOrderHeader."Shipping Tax Code" := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/ShippingTotal/TaxCode', MaxStrLen(SOrderHeader."Shipping Tax Code"));
                    '/Order/OrderHeader/ShippingTotal/ShippingArticleNo':
                        SOrderHeader."Shipping Item No." := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/ShippingTotal/ShippingArticleNo', MaxStrLen(SOrderHeader."Shipping Item No."));
                    '/Order/OrderHeader/OrderTotal/VAT':
                        SOrderHeader."Shipping Item No." := GetTextValue(TempXMLBuffer, '/Order/OrderHeader/ShippingTotal/ShippingArticleNo', MaxStrLen(SOrderHeader."Shipping Item No."));
                    '/Order/OrderHeader/OrderTotal/ExclusiveVAT':
                        SOrderHeader."Order Total Excl. VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderHeader/OrderTotal/InclusiveVAT':
                        SOrderHeader."Order Total Incl. VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderHeader/OrderTotal/RentVAT':
                        SOrderHeader."Order Rent VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderHeader/OrderTotal/RentExclusiveVAT':
                        SOrderHeader."Order Rent Excl. VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderHeader/OrderTotal/RentInclusiveVAT':
                        SOrderHeader."Order Rent Incl. VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderHeader/OrderTotal/VATDisplay':
                        SOrderHeader."Order VAT Display" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderHeader/OrderTotal/ExclusiveVATDisplay':
                        SOrderHeader."Order Excl. VAT Display" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderHeader/OrderTotal/InclusiveVATDisplay':
                        SOrderHeader."Order Incl. VAT Display" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderHeader/OrderTotal/RentVATDisplay':
                        SOrderHeader."Order Rent VAT Display" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderHeader/OrderTotal/RentExclusiveVATDisplay':
                        SOrderHeader."Order Rent Excl. VAT Displ." := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderHeader/OrderTotal/RentInclusiveVATDisplay':
                        SOrderHeader."Order Rent Incl. VAT Displ." := ValueAsDecimal(TempXMLBuffer.Value);
                end;
            Until TempXMLBuffer.next() = 0;
        SOrderHeader2.setrange(id, OrderId);
        if SOrderHeader2.IsEmpty then begin
            SorderCreated := false;
        end
        else begin
            SOrderHeader.Id := OrderId;
            SOrderHeader.INSERT();
            SorderCreated := true;
        end;

        #endregion

        #region Lines
        TempXMLBuffer.SetFilter(Path, '/Order/OrderLines/ProductLine*');
        if SorderCreated then begin
            NextSerialLineNo := 10000;
            TempXMLBuffer.Find('-');
            repeat
                case TempXMLBuffer.Path of
                    '/Order/OrderLines/ProductLine':
                        begin
                            if SOrderLine."Line Id" <> 0 then begin
                                SOrderLine.Insert(true);
                                NextSerialLineNo := 10000;
                            end;
                            SOrderLine.Init();
                            SOrderLine."Order Id" := SOrderHeader.Id;
                        end;
                    '/Order/OrderLines/ProductLine/@id':
                        SOrderLine."Line Internal Id" := ValueAsInteger(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/LineId':
                        Evaluate(SOrderLine."Line Id", TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/ManufacturerArticleNo':
                        SOrderLine."Manufacturer Item No" := TempXMLBuffer.Value;
                    '/Order/OrderLines/ProductLine/SupplierArticleNo':
                        SOrderLine."Supplier Item No" := TempXMLBuffer.Value;
                    '/Order/OrderLines/ProductLine/Label':
                        SOrderLine.Description := TempXMLBuffer.Value;
                    '/Order/OrderLines/ProductLine/Manufacturer':
                        SOrderLine."Manufacturer Name" := TempXMLBuffer.Value;
                    '/Order/OrderLines/ProductLine/Supplier':
                        SOrderLine."Supplier Name" := TempXMLBuffer.Value;
                    '/Order/OrderLines/ProductLine/SupplierExportId':
                        SOrderLine."Supplier Export Id" := TempXMLBuffer.Value;
                    '/Order/OrderLines/ProductLine/Quantity':
                        SOrderLine.Quantity := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/CostPrice':
                        SOrderLine."Cost Price" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/DiscountPercent':
                        SOrderLine."Discount Pct" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/SupplierPrice':
                        SOrderLine."Supplier Price" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/RegisteredPurchasePrice':
                        SOrderLine."Registered Purchase Price" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/CalculatedCostPrice':
                        SOrderLine."Calculated Cost Price" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/Instock':
                        SOrderLine."In Stock" := ValueAsInteger(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/StockETA':
                        SOrderLine."Stock ETA" := ValueAsDate(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/PurchasePriceType':
                        begin
                            // case ValueAsInteger(TempXMLBuffer.Value) of
                            //     1:
                            //         SOrderLine."Purchase Price Type" := SOrderLine."Purchase Price Type"::Normal;
                            //     2:
                            //         SOrderLine."Purchase Price Type" := SOrderLine."Purchase Price Type"::Verva;
                            //     3:
                            //         SOrderLine."Purchase Price Type" := SOrderLine."Purchase Price Type"::Bid;
                            //     else
                            //         SOrderLine."Purchase Price Type" := SOrderLine."Purchase Price Type"::Undefined;  //0
                            // end;
                        end;
                    '/Order/OrderLines/ProductLine/MainCategory':
                        SOrderLine."Main Category" := TempXMLBuffer.Value;
                    '/Order/OrderLines/ProductLine/MainCategoryExportId':
                        SOrderLine."Main Category Export Id" := TempXMLBuffer.Value;
                    '/Order/OrderLines/ProductLine/Category':
                        SOrderLine.Category := TempXMLBuffer.Value;
                    '/Order/OrderLines/ProductLine/CategoryCode':
                        SOrderLine."Category Code" := TempXMLBuffer.Value;
                    '/Order/OrderLines/ProductLine/CategoryExportId':
                        SOrderLine."Category Export Id" := TempXMLBuffer.Value;
                    '/Order/OrderLines/ProductLine/UNSPSC':
                        SOrderLine.UNSPSC := TempXMLBuffer.Value;
                    '/Order/OrderLines/ProductLine/Family':
                        SOrderLine.Family := TempXMLBuffer.Value;
                    '/Order/OrderLines/ProductLine/Status':
                        begin
                            // case ValueAsInteger(TempXMLBuffer.Value) of
                            //     120:
                            //         SOrderLine.Status := SOrderLine.Status::"Waiting credit";
                            //     150:
                            //         SOrderLine.Status := SOrderLine.Status::"Waiting";
                            //     180:
                            //         SOrderLine.Status := SOrderLine.Status::"Waiting bank";
                            //     190:
                            //         SOrderLine.Status := SOrderLine.Status::"Denied bank";
                            //     200:
                            //         SOrderLine.Status := SOrderLine.Status::"Pending";
                            //     300:
                            //         SOrderLine.Status := SOrderLine.Status::"Partially delivered";
                            //     400:
                            //         SOrderLine.Status := SOrderLine.Status::"Delivered";
                            //     500:
                            //         SOrderLine.Status := SOrderLine.Status::"Closed";
                            //     600:
                            //         SOrderLine.Status := SOrderLine.Status::"Cancelled";
                            //     else
                            //         SOrderLine.Status := SOrderLine.Status::Unprocessed; //100
                            // end;
                        end;
                    '/Order/OrderLines/ProductLine/Bid':
                        SOrderLine.Bid := TempXMLBuffer.Value;
                    '/Order/OrderLines/ProductLine/TaxCode':
                        SOrderLine."Tax Code" := TempXMLBuffer.Value;
                    '/Order/OrderLines/ProductLine/ProductConditionCode':
                        SOrderLine."Product Condition Code" := ValueAsInteger(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/ProductId':
                        SOrderLine."Product Id" := ValueAsInteger(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/TaxPercent':
                        SOrderLine."Tax Percent" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/SalesPrice/VAT':
                        SOrderLine."Sales Price VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/SalesPrice/ExclusiveVAT':
                        SOrderLine."Sales Price Excl. VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/SalesPrice/InclusiveVAT':
                        SOrderLine."Sales Price Incl. VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/SalesPrice/RentVAT':
                        SOrderLine."Sales Price Rent VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/SalesPrice/RentExclusiveVAT':
                        SOrderLine."Sales Price Rent Excl. VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/SalesPrice/RentInclusiveVAT':
                        SOrderLine."Sales Price Rent Incl. VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/SalesPrice/VATDisplay':
                        SOrderLine."Sales Price VAT Display" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/SalesPrice/ExclusiveVATDisplay':
                        SOrderLine."Sales Price Excl. VAT Display" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/SalesPrice/InclusiveVATDisplay':
                        SOrderLine."Sales Price Incl. VAT Display" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/SalesPrice/RentVATDisplay':
                        SOrderLine."Sales Price Rent VAT Display" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/SalesPrice/RentExclusiveVATDisplay':
                        SOrderLine."Sales Pr.Rent Excl. VAT Displ." := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/SalesPrice/RentInclusiveVATDisplay':
                        SOrderLine."Sales Pr.Rent Incl. VAT Displ." := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/DeliveredQuantity':
                        SOrderLine."Delivered Quantity" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/PurchaseOrderNumber':
                        SOrderLine."Purchase Order No." := TempXMLBuffer.Value;
                    '/Order/OrderLines/ProductLine/PurchaseOrderItemId':
                        SOrderLine."Purchase Order Item Id" := ValueAsInteger(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/Serials/SerialNumber':
                        begin
                            SOrderSerialLine.Init();
                            SOrderSerialLine.OrderId := SOrderLine."Order Id";
                            SOrderSerialLine.LineId := SOrderLine."Line Id";
                            SOrderSerialLine."Line No." := NextSerialLineNo;
                            SOrderSerialLine."Serial Number" := TempXMLBuffer.Value;
                            SOrderSerialLine.Insert(true);
                            NextSerialLineNo += 10000;
                        end;
                    '/Order/OrderLines/ProductLine/TotalPrice/VAT':
                        SOrderLine."Total Price VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/TotalPrice/ExclusiveVAT':
                        SOrderLine."Total Price Excl. VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/TotalPrice/InclusiveVAT':
                        SOrderLine."Total Price Incl. VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/TotalPrice/RentVAT':
                        SOrderLine."Total Price Rent VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/TotalPrice/RentExclusiveVAT':
                        SOrderLine."Total Price Rent Excl. VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/TotalPrice/RentInclusiveVAT':
                        SOrderLine."Total Price Rent Incl. VAT" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/TotalPrice/VATDisplay':
                        SOrderLine."Total Price VAT Display" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/TotalPrice/ExclusiveVATDisplay':
                        SOrderLine."Total Price Excl. VAT Display" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/TotalPrice/InclusiveVATDisplay':
                        SOrderLine."Total Price Incl. VAT Display" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/TotalPrice/RentVATDisplay':
                        SOrderLine."Total Price VAT Display" := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/TotalPrice/RentExclusiveVATDisplay':
                        SOrderLine."Total Pr.Rent Excl. VAT Displ." := ValueAsDecimal(TempXMLBuffer.Value);
                    '/Order/OrderLines/ProductLine/TotalPrice/RentInclusiveVATDisplay':
                        SOrderLine."Total Pr.Rent Incl. VAT Displ." := ValueAsDecimal(TempXMLBuffer.Value);

                //TODO: 
                // '/Order/OrderLines/ProductLine/ExtrinsicFields'
                end;
            until TempXMLBuffer.Next() = 0;
            SOrderLine.Insert(true);
            #endregion
        end;
        exit(true);
    end;
    #region Helpers
    internal procedure ValueAsInteger(Value: Text) Result: BigInteger
    begin
        if not Evaluate(Result, Value, 9) then
            Result := 0;
    end;

    internal procedure ValueAsDecimal(Value: Text) Result: Decimal
    begin
        if not Evaluate(Result, Value, 9) then
            Result := 0;
    end;

    internal procedure ValueAsDate(Value: Text) Result: Date
    begin
        if not Evaluate(Result, Value, 9) then
            Result := 0D;
    end;

    Internal procedure ValueAsDateTime(Value: Text) Result: Datetime
    begin
        if not Evaluate(Result, Value, 9) then
            Result := 0DT;
    end;

    internal procedure GetTextValue(TempXMLBuffer: Record "XML Buffer"; SelectPath: Text; Lenght: Integer) Result: Text
    begin
        //TempXMLBuffer.SetRange(Path, SelectPath);
        //if TempXMLBuffer.FindFirst() then
        //    Result := CopyStr(TempXMLBuffer.Value, 1, Lenght)
        //else
        //    Result := '';
        Result := CopyStr(TempXMLBuffer.Value, 1, Lenght);
    end;

    internal procedure GetIntegerValue(TempXMLBuffer: Record "XML Buffer"; SelectPath: Text) Result: BigInteger
    begin
        Result := 0;
        TempXMLBuffer.SetRange(Path, SelectPath);
        if TempXMLBuffer.FindFirst() then
            if not Evaluate(Result, TempXMLBuffer.Value) then
                Result := 0;
    end;

    internal procedure GetDecimalValue(TempXMLBuffer: Record "XML Buffer"; SelectPath: Text) Result: Decimal
    begin
        Result := 0;
        TempXMLBuffer.SetRange(Path, SelectPath);
        if TempXMLBuffer.FindFirst() then
            if not Evaluate(Result, TempXMLBuffer.Value) then
                Result := 0;
    end;

    internal procedure GetDateTimeValue(TempXMLBuffer: Record "XML Buffer"; SelectPath: Text) Result: DateTime
    begin
        Result := 0DT;
        TempXMLBuffer.SetRange(Path, SelectPath);
        if TempXMLBuffer.FindFirst() then
            if not Evaluate(Result, TempXMLBuffer.Value) then
                Result := 0DT;
    end;
    #endregion

    internal procedure SendCustomersWS_json(var Customer: Record Customer; var "PTE WHS customer Export": Record "PTE WSH Customer Export") Result: Boolean
    var
        Setup: Record "PTE WSHelper Setup";
        TempBlob: Codeunit "Temp Blob";
        Client: HttpClient;
        RequestHeaders: HttpHeaders;
        Request: HttpRequestMessage;
        ContentHeaders: HttpHeaders;
        Content: HttpContent;
        Response: HttpResponseMessage;
        InStr: InStream;
        Success: Boolean;
        Test: Text;
        OutStr: OutStream;
        CustJsonObject: JsonObject;
        CustJsonData: Text;
        ResponseJsonString: Text;
        CustResponseJsonArray: JsonArray;
        CustResponseJsonToken: JsonToken;
        CustResponseJsonObject: JsonObject;
        i: integer;
    begin
        Setup.Get();

        if Setup."Allow Cust. integration Delete" THEN begin
            if "PTE WHS customer Export"."Export status" <> "PTE WHS customer Export"."Export status"::Deleted then begin
                CreateJSON(Customer, CustJsonObject, CustJsonData, "PTE WHS customer Export");
                TempBlob.CreateOutStream(OutStr, TextEncoding::UTF8);
                OutStr.WriteText(CustJsonData);
            end;
        end
        else begin
            CreateJSON(Customer, CustJsonObject, CustJsonData, "PTE WHS customer Export");
            TempBlob.CreateOutStream(OutStr, TextEncoding::UTF8);
            OutStr.WriteText(CustJsonData);
        end;
        TempBlob.CreateInStream(InStr, TextEncoding::UTF8);

        //write to blob
        if Setup.test then BEGIN
            if "PTE WHS customer Export"."Export status" <> "PTE WHS customer Export"."Export status"::Deleted then begin
                CLEAR(OutStr);
                "PTE WHS customer Export"."Export Content".CreateOutStream(OutStr, TextEncoding::UTF8);
                OutStr.WriteText(CustJsonData);
            end;
        end;
        if "PTE WHS customer Export"."Export status" <> "PTE WHS customer Export"."Export status"::Deleted then begin
            TempBlob.CreateInStream(InStr, TextEncoding::UTF8);
            //Write to content
            Content.WriteFrom(InStr);
        end;

        Content.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json;charset=UTF-8');
        if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::New then begin
            Request.Method('POST');
            Request.SetRequestUri(Setup."WSHelper Base URL" + CustomerEnpointLblWSLbl);
        end;
        if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::Modified then begin
            Request.Method('PUT');
            Request.SetRequestUri(Setup."WSHelper Base URL" + CustomerEnpointLblWSLbl + '\' + FORMAT(Customer."PTE Opter ID"));
        end;
        if Setup."Allow Cust. integration Delete" THEN begin
            if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::Deleted then begin
                Request.Method('DELETE');
                Request.SetRequestUri(Setup."WSHelper Base URL" + CustomerEnpointLblWSLbl + '\' + FORMAT("PTE WHS customer Export"."Opter ID"));
            end;
        end
        ELSE begin
            if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::Deleted then begin
                Request.Method('PUT');
                Request.SetRequestUri(Setup."WSHelper Base URL" + CustomerEnpointLblWSLbl + '\' + FORMAT(Customer."PTE Opter ID"));
            end;
        end;

        Request.Content(Content);
        Request.GetHeaders(RequestHeaders);
        RequestHeaders.Add('Accept', 'application/json');
        RequestHeaders.Add('X-Api-Key', Setup."WSHelper Password Key Basic");
        Success := Client.Send(Request, Response);
        if Success then begin
            if not Response.IsSuccessStatusCode() then
                Success := false;
            if StrLen(Response.ReasonPhrase) < 250 THEN
                "PTE WHS customer Export"."Response Message" := CopyStr(Response.ReasonPhrase(), 1, STRLEN(Response.ReasonPhrase()))
            else
                "PTE WHS customer Export"."Response Message" := CopyStr(Response.ReasonPhrase(), 1, 250);

            if Success then begin
                "PTE WHS customer Export"."Export OK" := true;
                ClearLastError();
                TempBlob.CreateInStream(InStr);
                Response.Content.ReadAs(InStr);

                if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::New then begin
                    Response.Content.ReadAs(ResponseJsonString);

                    if CustJsonObject.ReadFrom(ResponseJsonString) then begin
                        //id
                        CustJsonObject.get('id', CustResponseJsonToken);
                        Customer."PTE Opter ID" := CustResponseJsonToken.AsValue().AsInteger();
                        Customer.Modify(false);
                    end;
                    if Setup.Test then begin
                        CLEAR(OutStr);
                        "PTE WHS customer Export"."Response Message Blob".CreateOutStream(OutStr, TextEncoding::UTF8);
                        OutStr.WriteText(ResponseJsonString);
                    end;
                end;
                if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::Modified then begin
                    if Setup.Test then begin
                        Response.Content.ReadAs(ResponseJsonString);
                        if CustJsonObject.ReadFrom(ResponseJsonString) then begin
                            CLEAR(OutStr);
                            "PTE WHS customer Export"."Response Message Blob".CreateOutStream(OutStr, TextEncoding::UTF8);
                            OutStr.WriteText(ResponseJsonString);
                        end;
                    end;
                end;
                if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::Deleted then begin
                    if Setup.Test then begin
                        Response.Content.ReadAs(ResponseJsonString);
                        if CustJsonObject.ReadFrom(ResponseJsonString) then begin
                            CLEAR(OutStr);
                            "PTE WHS customer Export"."Response Message Blob".CreateOutStream(OutStr, TextEncoding::UTF8);
                            OutStr.WriteText(ResponseJsonString);
                        end;
                    end;
                end;
            end;
        end;

        "PTE WHS customer Export".modify();
        if not Success then begin
            LastErrorMsg := Response.ReasonPhrase();
            "PTE WHS customer Export"."Export OK" := false;
            exit(false);
        end;


    end;

    internal procedure SendCustomersWS_xml(var Customer: Record Customer; var "PTE WHS customer Export": Record "PTE WSH Customer Export") Result: Boolean
    var
        Setup: Record "PTE WSHelper Setup";
        TempXMLBuffer: Record "XML Buffer" temporary;
        TempBlob: Codeunit "Temp Blob";
        WSHelperCustomer: XmlPort "PTE WSHelper Customer WS";
        Client: HttpClient;
        RequestHeaders: HttpHeaders;
        Request: HttpRequestMessage;
        ContentHeaders: HttpHeaders;
        Content: HttpContent;
        Response: HttpResponseMessage;
        InStr: InStream;
        Success: Boolean;
        Test: Text;
        OutStr: OutStream;

    begin
        Setup.Get();
        TempBlob.CreateOutStream(OutStr);
        WSHelperCustomer.SetDestination(OutStr);
        WSHelperCustomer.SetTableView(Customer);
        Success := WSHelperCustomer.Export();



        if not Success then begin
            LastErrorMsg := GetLastErrorText();
            exit(false);
        end;

        TempBlob.CreateInStream(InStr);

        //write to blob
        if Setup.test then BEGIN
            CLEAR(OutStr);
            "PTE WHS customer Export"."Export Content".CreateOutStream(OutStr);
            WSHelperCustomer.Export();
            CLEAR(OutStr);

        end;
        if "PTE WHS customer Export"."Export status" <> "PTE WHS customer Export"."Export status"::Deleted then begin
            TempBlob.CreateInStream(InStr);
            //Write to content
            Content.WriteFrom(InStr);
        end;

        Content.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/xml;charset=UTF-8');
        if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::New then begin
            Request.Method('POST');
            Request.SetRequestUri(Setup."WSHelper Base URL" + CustomerEnpointLblWSLbl);
        end;
        if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::Modified then begin
            Request.Method('PUT');
            Request.SetRequestUri(Setup."WSHelper Base URL" + CustomerEnpointLblWSLbl + '\' + FORMAT(Customer."PTE Opter ID"));
        end;

        if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::Deleted then begin
            Request.Method('DELETE');
            Request.SetRequestUri(Setup."WSHelper Base URL" + CustomerEnpointLblWSLbl + '\' + FORMAT("PTE WHS customer Export"."Opter ID"));
        end;
        Request.Content(Content);
        Request.GetHeaders(RequestHeaders);
        RequestHeaders.Add('Accept', 'application/json');
        RequestHeaders.Add('X-Api-Key', Setup."WSHelper Password Key Basic");
        Success := Client.Send(Request, Response);
        if Success then begin
            if not Response.IsSuccessStatusCode() then
                Success := false;
            if StrLen(Response.ReasonPhrase) < 250 THEN
                "PTE WHS customer Export"."Response Message" := CopyStr(Response.ReasonPhrase(), 1, StrLen(Response.ReasonPhrase()))
            else
                "PTE WHS customer Export"."Response Message" := CopyStr(Response.ReasonPhrase(), 1, 250);

            if Success then begin
                "PTE WHS customer Export"."Export OK" := true;
                ClearLastError();
                TempBlob.CreateInStream(InStr);
                Response.Content.ReadAs(InStr);

                Clear(TempXMLBuffer);
                TempXMLBuffer.LoadFromStream(InStr);


                if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::Modified then begin

                end;
                if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::Deleted then begin

                end;


                TempXMLBuffer.Reset();
                if NOT TempXMLBuffer.IsEmpty then begin
                    if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::New then begin
                        if TempXMLBuffer.findset() then
                            repeat
                                case TempXMLBuffer.Path of
                                    'Id':
                                        begin
                                            Customer."PTE Opter ID" := ValueAsInteger(TempXMLBuffer.Value);
                                        end;
                                end;

                            until TempxmlBuffer.next() = 0;
                        Customer.modify(false);
                    end;
                    if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::Modified then begin
                    end;
                    if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::Deleted then begin
                    end;
                end;

            end;
        end;

        "PTE WHS customer Export".modify();
        if not Success then begin
            LastErrorMsg := Response.ReasonPhrase();
            "PTE WHS customer Export"."Export OK" := false;
            exit(false);
        end;


    end;

    internal procedure SendCustomersFTP(var Customer: Record Customer) Result: Boolean
    var
        Setup: Record "PTE WSHelper Setup";
        TempBlob: Codeunit "Temp Blob";
        WSHelperCustomer: XmlPort "PTE WSHelper Customer FTP";
        Client: HttpClient;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
        RequestHeaders: HttpHeaders;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        OutStr: OutStream;
        InStr: InStream;

        Success: Boolean;
    begin
        TempBlob.CreateOutStream(OutStr);
        WSHelperCustomer.SetDestination(OutStr);
        WSHelperCustomer.SetTableView(Customer);
        Success := WSHelperCustomer.Export();
        if not Success then begin
            LastErrorMsg := GetLastErrorText();
            exit(false);
        end;

        Setup.Get();
        TempBlob.CreateInStream(InStr);
        Content.WriteFrom(InStr);
        Content.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/xml');
        Request.Method('POST');
        Request.SetRequestUri(Setup."WSHelper Base URL" + CustomerEnpointLblFTPLbl);
        Request.Content(Content);
        Request.GetHeaders(RequestHeaders);
        RequestHeaders.Add('Accept', 'application/xml');
        RequestHeaders.Add('Accept-Language', 'en-US');
        RequestHeaders.Add('Authorization', Setup.GetWSHelperAuthentication());
        Success := Client.Send(Request, Response);
        if Success then
            if not Response.IsSuccessStatusCode() then
                Success := false;
        if not Success then begin
            LastErrorMsg := Response.ReasonPhrase();
            exit(false);
        end;
        exit(true);
    end;


    local procedure CreateJSON(Customer: Record Customer; VAR JsonObject: JsonObject; var JsonData: text; var "PTE WHS customer Export": Record "PTE WSH Customer Export")
    var
        ShiptoAddress: Record "Ship-to Address";
        PaymentTerms: record "Payment Terms";
        JArray: JsonArray;
        CustObject: JsonObject;
        integervar: integer;
        ShiptoObject: JsonObject;
        CurrentKreditLimit: decimal;
        PaymentTermsInteger: integer;
    begin
        if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::New then begin
            PaymentTermsInteger := 0;
            IF (Customer."Payment Terms Code" <> '') and (PaymentTerms.get(Customer."Payment Terms Code")) then begin
                IF PaymentTerms."PTE Opter ID" <> 0 then
                    PaymentTermsInteger := PaymentTerms."PTE Opter ID"
                else
                    PaymentTermsInteger := 0;
            end;

            Clear(JsonObject);
            Clear(CustObject);
            CustObject.Add('id', Customer."PTE Opter ID");
            CustObject.Add('currencyId', 0);
            CustObject.Add('customerCategoryId', 0);
            CustObject.Add('regionId', 0);
            CustObject.Add('invoiceIntervalId', 0);
            CustObject.Add('invoiceFeeId', 0);
            CustObject.Add('fuelExtraId', 0);
            CustObject.Add('currencyExtraId', 0);
            CustObject.Add('invoicePaymentConditionId', PaymentTermsInteger);
            CustObject.Add('invoiceInterestRateId', 0);
            CustObject.Add('vatRateId', 0);
            CustObject.Add('customerCode', Customer."No.");
            CustObject.Add('customerNumber', Customer."No.");
            CustObject.Add('name', Customer."Name");
            //CustObject.Add('companyVisit', Customer."Name");
            //CustObject.Add('addressLine1Visit', Customer."EVRY_TI Visiting Address 2");
            CustObject.Add('addressLine1Visit', Customer.Name);
            //CustObject.Add('addressLine2Visit', Customer.Address);
            CustObject.Add('addressLine3Visit', '');
            CustObject.Add('streetVisit', Customer.Address);
            CustObject.Add('streetNoVisit', '');
            CustObject.Add('zipCodeVisit', Customer."EVRY_TI Visiting Post Code");
            CustObject.Add('cityVisit', Customer."EVRY_TI Visiting City");
            CustObject.Add('stateVisit', Customer."EVRY_TI Visiting Country Code");
            CustObject.Add('countryIdVisit', 214);
            CustObject.Add('informationVisit', '');
            CustObject.Add('entreCodeVisit', '');
            //CustObject.Add('companyInvoice', Customer."Name");
            //CustObject.Add('addressLine1Invoice', Customer.Address);
            CustObject.Add('addressLine1Invoice', Customer.Name);
            //CustObject.Add('addressLine2Invoice', Customer.Address);
            CustObject.Add('addressLine3Invoice', '');
            CustObject.Add('streetInvoice', Customer.Address);
            CustObject.Add('streetNoInvoice', '');
            CustObject.Add('zipCodeInvoice', customer."Post Code");
            CustObject.Add('cityInvoice', customer.City);
            CustObject.Add('stateInvoice', customer."Country/Region Code");
            CustObject.Add('countryIdInvoice', 214);
            CustObject.Add('informationInvoice', '');
            if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::Deleted then
                CustObject.Add('active', false)
            else begin
                if Customer.Blocked <> customer.Blocked::" " then
                    CustObject.Add('active', false)
                else
                    CustObject.Add('active', true);
            end;
            CustObject.Add('changed', FORMAT(Customer."Last Modified Date Time", 0, '<Year4>-<Month,2>-<Day,2>T<Hours24,2>:<Minutes,2>:<Seconds,2>.000'));
            CustObject.Add('emailAddress', Customer."E-Mail");
            CustObject.Add('emailAddressInvoice', customer."TE_EDI E-Mail");
            CustObject.Add('organizationNumber', Customer."PEB Registration No.");
            CustObject.Add('vatNumber', Customer."VAT Registration No.");
            CustObject.Add('bankAccountNumber', customer."Preferred Bank Account Code");
            CustObject.Add('iban', '');
            CustObject.Add('bic', '');
            CustObject.Add('phone1', customer."Phone No.");
            CustObject.Add('phone2', Customer."Mobile Phone No.");
            CustObject.Add('information', '');
            CustObject.Add('dispatchInformation', '');
            CustObject.Add('driverInformation', '');
            IF Customer.Blocked = Customer.Blocked::" " then
                CustObject.Add('orderAllowed', true)
            else
                CustObject.Add('orderAllowed', false);

            Customer.CalcFields("Balance (LCY)");
            CurrentKreditLimit := ROUND(Customer."Credit Limit (LCY)" - Customer."Balance (LCY)", 0.000001, '=');
            if CurrentKreditLimit > 0 then
                CustObject.Add('creditLimit', CurrentKreditLimit)
            else
                CustObject.Add('creditLimit', 0.000000);
            CustObject.Add('invoiceReference', customer.Contact);
            CustObject.Add('noFuelExtra', true);
            CustObject.Add('latitude', 0.000000);
            CustObject.Add('longitude', 0.000000);

            // ShiptoAddress.SetRange("Customer No.", Customer."No.");
            // if ShiptoAddress.FindSet() then begin
            //     Clear(JArray);
            //     repeat
            //         Clear(ShiptoObject);
            //         ShiptoObject.Add('Code', ShiptoAddress.Code);
            //         ShiptoObject.Add('Address', ShiptoAddress.Address);
            //         ShiptoObject.Add('Address_2', ShiptoAddress."Address 2");
            //         ShiptoObject.Add('City', ShiptoAddress.City);
            //         ShiptoObject.Add('County', ShiptoAddress.County);
            //         ShiptoObject.Add('Post_Code', ShiptoAddress."Post Code");
            //         JArray.Add(ShiptoObject);
            //     until ShiptoAddress.Next() = 0;
            //     CustObject.Add('Ship-to', JArray);
            // end;

            JsonObject.Add('', CustObject);

            JsonObject.WriteTo(JsonData);
            JsonData := CopyStr(Jsondata, 5, StrLen(JsonData) - 5);
        end;

        if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::Modified then begin
            Clear(JsonObject);
            Clear(CustObject);

            CustObject.Add('id', Customer."PTE Opter ID");
            if "PTE WHS customer Export".currencyId <> 0 then
                CustObject.Add('currencyId', 0);
            if "PTE WHS customer Export".customerCategoryId <> 0 then
                CustObject.Add('customerCategoryId', 0);
            if "PTE WHS customer Export".regionId <> 0 then
                CustObject.Add('regionId', 0);
            if "PTE WHS customer Export".invoiceIntervalId <> 0 then
                CustObject.Add('invoiceIntervalId', 0);
            if "PTE WHS customer Export".invoiceFeeId <> 0 then
                CustObject.Add('invoiceFeeId', 0);
            if "PTE WHS customer Export".fuelExtraId <> 0 then
                CustObject.Add('fuelExtraId', 0);
            if "PTE WHS customer Export".currencyExtraId <> 0 then
                CustObject.Add('currencyExtraId', 0);
            if "PTE WHS customer Export".invoicePaymentConditionId <> 0 then
                CustObject.Add('invoicePaymentConditionId', "PTE WHS customer Export".invoicePaymentConditionId);
            if "PTE WHS customer Export".invoiceInterestRateId <> 0 then
                CustObject.Add('invoiceInterestRateId', 0);
            if "PTE WHS customer Export".vatRateId <> 0 then
                CustObject.Add('vatRateId', 0);
            if "PTE WHS customer Export".customerCode <> '' then
                CustObject.Add('customerCode', "PTE WHS customer Export".customerCode);
            if "PTE WHS customer Export"."Customer No." <> '' then
                CustObject.Add('customerNumber', "PTE WHS customer Export"."Customer No.");
            if "PTE WHS customer Export".name <> '' then
                CustObject.Add('name', "PTE WHS customer Export".name);
            if "PTE WHS customer Export".companyVisit <> '' then
                CustObject.Add('companyVisit', "PTE WHS customer Export".companyVisit);
            if "PTE WHS customer Export".addressLine1Visit <> '' then
                CustObject.Add('addressLine1Visit', "PTE WHS customer Export".addressLine1Visit);
            if "PTE WHS customer Export".addressLine2Invoice <> '' then
                CustObject.Add('addressLine2Visit', '');
            if "PTE WHS customer Export".addressLine3Visit <> '' then
                CustObject.Add('addressLine3Visit', '');
            if "PTE WHS customer Export".streetVisit <> '' then
                CustObject.Add('streetVisit', '');
            if "PTE WHS customer Export".streetNoVisit <> '' then
                CustObject.Add('streetNoVisit', '');
            if "PTE WHS customer Export".zipCodeVisit <> '' then
                CustObject.Add('zipCodeVisit', "PTE WHS customer Export".zipCodeVisit);
            if "PTE WHS customer Export".cityVisit <> '' then
                CustObject.Add('cityVisit', "PTE WHS customer Export".cityVisit);
            if "PTE WHS customer Export".stateVisit <> '' then
                CustObject.Add('stateVisit', "PTE WHS customer Export".stateVisit);
            //CustObject.Add('countryIdVisit', 0);
            if "PTE WHS customer Export".informationVisit <> '' then
                CustObject.Add('informationVisit', '');
            if "PTE WHS customer Export".entreCodeVisit <> '' then
                CustObject.Add('entreCodeVisit', '');
            if "PTE WHS customer Export".companyInvoice <> '' then
                CustObject.Add('companyInvoice', "PTE WHS customer Export".companyInvoice);
            if "PTE WHS customer Export".addressLine1Invoice <> '' then
                CustObject.Add('addressLine1Invoice', "PTE WHS customer Export".addressLine1Invoice);
            if "PTE WHS customer Export".addressLine2Invoice <> '' then
                CustObject.Add('addressLine2Invoice', "PTE WHS customer Export".addressLine2Invoice);
            if "PTE WHS customer Export".addressLine3Invoice <> '' then
                CustObject.Add('addressLine3Invoice', '');
            if "PTE WHS customer Export".streetInvoice <> '' then
                CustObject.Add('streetInvoice', '');
            if "PTE WHS customer Export".streetNoInvoice <> '' then
                CustObject.Add('streetNoInvoice', '');
            if "PTE WHS customer Export".zipCodeInvoice <> '' then
                CustObject.Add('zipCodeInvoice', "PTE WHS customer Export".zipCodeInvoice);
            if "PTE WHS customer Export".cityInvoice <> '' then
                CustObject.Add('cityInvoice', "PTE WHS customer Export".cityInvoice);
            if "PTE WHS customer Export".stateInvoice <> '' then
                CustObject.Add('stateInvoice', "PTE WHS customer Export".stateInvoice);
            //CustObject.Add('countryIdInvoice', 0);
            if "PTE WHS customer Export".informationInvoice <> '' then
                CustObject.Add('informationInvoice', '');
            if Customer.Blocked <> customer.Blocked::" " then
                CustObject.Add('active', false)
            else
                CustObject.Add('active', true);
            CustObject.Add('changed', FORMAT(Customer."Last Modified Date Time", 0, '<Year4>-<Month,2>-<Day,2>T<Hours24,2>:<Minutes,2>:<Seconds,2>.000'));
            if "PTE WHS customer Export".emailAdress <> '' then
                CustObject.Add('emailAddress', "PTE WHS customer Export".emailAdress);
            if "PTE WHS customer Export".emailAdressInvoice <> '' then
                CustObject.Add('emailAddressInvoice', "PTE WHS customer Export".emailAdressInvoice);
            if "PTE WHS customer Export".organizationNumber <> '' then
                CustObject.Add('organizationNumber', '');
            if "PTE WHS customer Export".vatNumber <> '' then
                CustObject.Add('vatNumber', "PTE WHS customer Export".vatNumber);
            if "PTE WHS customer Export".bankAccountNumber <> '' then
                CustObject.Add('bankAccountNumber', "PTE WHS customer Export".bankAccountNumber);
            if "PTE WHS customer Export".iban <> '' then
                CustObject.Add('iban', '');
            if "PTE WHS customer Export".bic <> '' then
                CustObject.Add('bic', '');
            if "PTE WHS customer Export".phone1 <> '' then
                CustObject.Add('phone1', "PTE WHS customer Export".phone1);
            if "PTE WHS customer Export".phone2 <> '' then
                CustObject.Add('phone2', "PTE WHS customer Export".phone2);
            if "PTE WHS customer Export".information <> '' then
                CustObject.Add('information', '');
            if "PTE WHS customer Export".dispatchInformation <> '' then
                CustObject.Add('dispatchInformation', '');
            if "PTE WHS customer Export".driverInformation <> '' then
                CustObject.Add('driverInformation', '');
            if "PTE WHS customer Export".orderAllowed = true then
                CustObject.Add('orderAllowed', true)
            else
                CustObject.Add('orderAllowed', false);

            if "PTE WHS customer Export"."Opter Credit Limit" > 0 then
                CustObject.Add('creditLimit', "PTE WHS customer Export"."Opter Credit Limit")
            else begin
                if "PTE WHS customer Export"."Opter Credit Limit" < 0 then begin
                    CustObject.Add('creditLimit', 0)
                end
            end;

            if "PTE WHS customer Export".invoiceReference <> '' then
                CustObject.Add('invoiceReference', "PTE WHS customer Export".invoiceReference);
            if "PTE WHS customer Export".noFuelExtra = true then
                CustObject.Add('noFuelExtra', true)
            else
                CustObject.Add('noFuelExtra', false);
            if "PTE WHS customer Export".latitude <> 0 then
                CustObject.Add('latitude', 0.000000);
            if "PTE WHS customer Export".longitude <> 0 then
                CustObject.Add('longitude', 0.000000);

            // ShiptoAddress.SetRange("Customer No.", Customer."No.");
            // if ShiptoAddress.FindSet() then begin
            //     Clear(JArray);
            //     repeat
            //         Clear(ShiptoObject);
            //         ShiptoObject.Add('Code', ShiptoAddress.Code);
            //         ShiptoObject.Add('Address', ShiptoAddress.Address);
            //         ShiptoObject.Add('Address_2', ShiptoAddress."Address 2");
            //         ShiptoObject.Add('City', ShiptoAddress.City);
            //         ShiptoObject.Add('County', ShiptoAddress.County);
            //         ShiptoObject.Add('Post_Code', ShiptoAddress."Post Code");
            //         JArray.Add(ShiptoObject);
            //     until ShiptoAddress.Next() = 0;
            //     CustObject.Add('Ship-to', JArray);
            // end;

            JsonObject.Add('', CustObject);

            JsonObject.WriteTo(JsonData);
            JsonData := CopyStr(Jsondata, 5, StrLen(JsonData) - 5);
        end;

        if "PTE WHS customer Export"."Export status" = "PTE WHS customer Export"."Export status"::Deleted then begin
            Clear(JsonObject);
            Clear(CustObject);
            CustObject.Add('id', Customer."PTE Opter ID");
            CustObject.Add('active', false);

            JsonObject.Add('', CustObject);

            JsonObject.WriteTo(JsonData);
            JsonData := CopyStr(Jsondata, 5, StrLen(JsonData) - 5);
        end;

    end;

    #endregion

    internal procedure GetLastErrorMsg() Result: Text
    begin
        exit(LastErrorMsg);
    end;

    internal procedure SetupConnection(var Setup: Record "PTE WSHelper Setup"): Boolean
    begin
        if not HasCredentials(Setup) then
            Error(MissingWSHelperFieldsErr);
        exit(true);
    end;

    local procedure HasCredentials(Setup: Record "PTE WSHelper Setup"): Boolean
    begin
        exit(
          Setup.Get() and
          (Setup."WSHelper Base URL" <> '') and
          (Setup."WSHelper User Name" <> '') and
          Setup.HasPassword(Setup."WSHelper Password Key Basic"));
    end;

    local procedure RemoveCharacters(Incode: Code[50]): integer;
    var
        integerVar: integer;
    begin
        Incode := DelChr(Incode, '=', 'abcdefghijklmnopqrstuvwxyzåöABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ');
        evaluate(integervar, incode);
        exit(integerVar);
    end;


    #region globals
    var
        SOrderHeader: Record "PTE WSHelper Order Header";
        SOrderLine: Record "PTE WSHelper Order Line";
        SOrderSerialLine: Record "PTE WSHelper Serial Line";
        POrderHeader: Record "PTE WSHelper Purch. Order Hdr";
        MissingWSHelperFieldsErr: Label 'You must complete the fields for WSHelper.';
        VendorNoFoundErr: Label 'Vendor %1 not found, id = %2', Comment = '%1 = Vendor Code, %2 = Vendor Id';
        LastErrorMsg: Text;
        SalesOrderListEndpointLbl: Label '/salesorderlist', Locked = true;
        SalesOrderEndpointLbl: Label '/salesorder', Locked = true;
        PurchaseOrderListEnpointLbl: Label '/purchaseorderlist', Locked = true;
        PurchaseOrderEnpointLbl: Label '/purchaseorder', Locked = true;
        CustomerEnpointLblFTPLbl: Label '/customer', Locked = true;
        CustomerEnpointLblWSLbl: Label '/Customers', Locked = true;
    #endregion
}
