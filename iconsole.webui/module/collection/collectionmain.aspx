<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="collectionmain.aspx.cs" Inherits="module_collection_collectionmain" Title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    
    <link href="../../css/step-wizard.css" rel="stylesheet">
    <script src="../../js/jquery.easyWizard.js" type="text/javascript"></script>
    
    <link href="../../css/tooltipster.bundle.min.css" rel="stylesheet">
    <script src="../../js/tooltipster.bundle.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            (function() {
                var primaryBtn = "btn btn-primary btn-circle";

                document.getElementById("btnGetFromCore").title = "Date : <%=From_Production%>";
                $('[data-toggle="tooltip1"]').tooltip();
                
                if ("<%=IS_PICKED_DEVICE %>" == "1") {
                    document.getElementById("btnSyncToDevice").className = primaryBtn;
                    document.getElementById("btnSyncToDevice").title = 'Date : <%=Picked_Device%>';
                    $('[data-toggle="tooltip2"]').tooltip();
                }
                if ("<%=IS_SYNC_DEVICE %>" == "1") {
                    document.getElementById("btnGetFromDevice").className = primaryBtn;
                    document.getElementById("btnGetFromDevice").title = 'Date : <%=Sync_Device%>';
                    $('[data-toggle="tooltip3"]').tooltip();
                }
                if ("<%=IS_SYNC_PRODUCTION %>" == "1") {
                    document.getElementById("btnSyncToProduction").className = primaryBtn;
                    document.getElementById("btnSyncToProduction").title = 'Date : <%=Sync_Production%>';
                    $('[data-toggle="tooltip4"]').tooltip();
                }
            })();
        });
    </script>

    <section class="panel">
        <header class="panel-heading">
            <span>Collection</span>
        </header>
        <div class="col-sm-12 panel-body">
            <div class="col-sm-12">
                <asp:LinkButton RoleCode="" ID="btnCollectionCancel" runat="server" CssClass="btn btn-danger" OnClick="btnCollectionCancel_Click" CausesValidation="false"><i class="icon-remove"></i>Back</asp:LinkButton>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnCollectionCancel" EventName="Click" /> 
                </Triggers>
            </div>
        </div>
        <div class="col-sm-12 panel-body">
            <div class="stepwizard">
                <div class="stepwizard-row">
                    <div class="stepwizard-step">
                        <button id="btnGetFromCore" type="button" class="btn btn-primary btn-circle" data-toggle="tooltip1">1</button>
                        <p>From Production</p>
                    </div>
                    <div class="stepwizard-step">
                        <button id="btnSyncToDevice" type="button" class="btn btn-default btn-circle" data-toggle="tooltip2">2</button>
                        <p>Sync to Device</p>
                    </div>
                    <div class="stepwizard-step">
                        <button id="btnGetFromDevice" type="button" class="btn btn-default btn-circle" data-toggle="tooltip3">3</button>
                        <p>Get From Device</p>
                    </div>
                    <div class="stepwizard-step">
                        <button id="btnSyncToProduction" type="button" class="btn btn-default btn-circle" data-toggle="tooltip4">4</button>
                        <p>Sync to Production</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="row">
        <div class="col-sm-12">
            <div class="col-sm-6">
                <div class="row">
                    <div class="col-sm-12">
                        <section class="panel col-sm-12">
                            <header class="panel-heading">
                                <span>Agreement</span>
                            </header>
                            <div class="panel-body form-horizontal">
                                <asp:UpdatePanel ID="PanelAgreement" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Trx. No</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="lblTrxNo" runat="server" DBColumnName="TRX_NO" SPParameterName="p_trx_no" DataType="String" BindType="DBToUIOnly" MaxLength="50"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Trx. Date</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="lblTrxDate" runat="server" DBColumnName="TRX_DATE" SPParameterName="p_trx_date" DataType="DateTime" BindType="DBToUIOnly" Format="dd/MM/yyyy"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Agreement No</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="lblAgreemmentNo" runat="server" DBColumnName="AGREEMENT_NO" SPParameterName="p_agreement_no" DataType="String" BindType="DBToUIOnly" MaxLength="50"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Billing Amount</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="lblInstallment" runat="server" DBColumnName="INSTALLMENT" SPParameterName="p_installment" DataType="Number" BindType="DBToUIOnly" Format="N2"></cc1:XUILabel>                                   
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Object</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="lblObject" runat="server" DBColumnName="OBJECT_INFO" SPParameterName="p_object_info" DataType="String" BindType="DBToUIOnly" MaxLength="500"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </section>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-sm-12">
                        <section class="panel col-sm-12">
                            <header class="panel-heading">
                                <span>Customer</span>
                            </header>
                            <div class="panel-body form-horizontal">
                                <asp:UpdatePanel ID="PanelCustomer" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Name</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="lblCustomerName" runat="server" DBColumnName="CUSTOMER_NAME" SPParameterName="p_customer_name" DataType="String" BindType="DBToUIOnly" MaxLength="100"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Address</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="lblCollectionAddresss" runat="server" DBColumnName="COLLECTION_ADDRESS" SPParameterName="p_collection_address" DataType="String" BindType="DBToUIOnly" MaxLength="200"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">   
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">City</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="lblCollectionCity" runat="server" DBColumnName="COLLECTION_ADDRESS_CITY" SPParameterName="p_collection_address_city" DataType="String" BindType="DBToUIOnly" MaxLength="50"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Post Code</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="lblcollectionPostCode" runat="server" DBColumnName="COLLECTION_ADDRESS_POSTCODE" SPParameterName="p_collection_address_postcode" DataType="String" BindType="DBToUIOnly" MaxLength="10"></cc1:XUILabel>                                    
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Phone No</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="lblCollectionPhoneNo" runat="server" DBColumnName="COLLECTION_PHONE_NO" SPParameterName="p_collection_phone_no" DataType="String" BindType="DBToUIOnly"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </section>
                    </div>
                </div>

            </div>
            <div class="col-sm-6">
                <div class="row">
                    <div class="col-sm-12">
                         <section class="panel col-sm-12">
                            <header class="panel-heading">
                                <span>Payment Information</span>
                            </header>
                            <div class="panel-body form-horizontal">
                                <asp:UpdatePanel ID="PanelPayment" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">DCR No</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="lblKwitansiNo" runat="server" DBColumnName="KWITANSI_NO" SPParameterName="p_kwitansi_no" DataType="String" BindType="DBToUIOnly" MaxLength="50"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">DCR Date</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="lblKwitansiDate" runat="server" DBColumnName="KWITANSI_DATE" SPParameterName="p_kwitansi_date" DataType="DateTime" BindType="DBToUIOnly" Format="dd/MM/yyyy"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">DCR Amount</label>
                                                <div class="col-sm-8">
                                                       <cc1:XUILabel ID="lblKwitansiAmount" runat="server" DBColumnName="KWITANSI_AMOUNT" SPParameterName="p_kwitansi_amount" DataType="Number" BindType="DBToUIOnly" Format="N2"></cc1:XUILabel>                                   
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Collector</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="lblCollector" runat="server" DBColumnName="COLLECTOR" SPParameterName="p_collector" DataType="String" BindType="DBToUIOnly"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </section>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <section class="panel col-sm-12">
                            <header class="panel-heading">
                                <span>Status Information</span>
                            </header>
                            <div class="panel-body form-horizontal">
                                <asp:UpdatePanel ID="PanelStatus" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Console Status</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="XUILabel5" runat="server" DBColumnName="CONSOLE_STATUS" SPParameterName="p_console_status" DataType="String" BindType="DBToUIOnly"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Result Status</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="XUILabel6" runat="server" DBColumnName="RESULT_STATUS" SPParameterName="p_result_status" DataType="String" BindType="DBToUIOnly"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Pull Date</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="XUILabel2" runat="server" DBColumnName="FROM_PRODUCTION_DATE" SPParameterName="p_from_production_date" DataType="DateTime" BindType="DBToUIOnly"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Picked Device Date</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="XUILabel1" runat="server" DBColumnName="PICKED_DEVICE_DATE" SPParameterName="p_picked_device_date" DataType="DateTime" BindType="DBToUIOnly"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Sync Device Date</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="XUILabel4" runat="server" DBColumnName="SYNC_DEVICE_DATE" SPParameterName="p_sync_device_date" DataType="DateTime" BindType="DBToUIOnly"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Sync Production Date</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="XUILabel3" runat="server" DBColumnName="SYNC_PRODUCTION_DATE" SPParameterName="p_sync_production_date" DataType="DateTime" BindType="DBToUIOnly"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <section class="panel">
            <header class="panel-heading tab-bg-dark-navy-blue">
                <asp:TextBox ID="txtTabCode" runat="server" style="display:none"/>
                <ul class="nav nav-tabs nav-justified">
                    <li class="active">
                        <a href="#item" id="collection_item" onclick="javascript:fnSetTab('collection_item');" data-toggle="tab">Item</a>
                    </li>
                    <li class="">
                        <a href="#results" id="collection_results" onclick="javascript:fnSetTab('collection_results');" data-toggle="tab">Results</a>
                    </li>
                </ul>
            </header>
            
            <div class="panel-body">                    
                <div class="tab-content tasi-tab">
                    <div class="tab-pane active" id="item">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-sm-8 ">
                                </div>
                                <div class="col-sm-4">
                                    <asp:Panel ID="pnlSearchItem" runat="server" DefaultButton="btnSearchItem" class="input-group">
                                        <asp:TextBox ID="txtSearchItem" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                                        <div class="input-group-btn">
                                            <asp:LinkButton ID="btnSearchItem" runat="server" CssClass="btn btn-info" OnClick="btnSearchItem_Click" CausesValidation="false"><i class="icon-search"></i>  Search</asp:LinkButton>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <asp:UpdatePanel ID="updItem" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gvwListItem" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                                        AllowPaging="true" PageSize="10" DataKeyNames="TRX_NO,TRX_CODE" OnPageIndexChanging="gvwListItem_PageIndexChanging"
                                        OnSelectedIndexChanged="gvwListItem_SelectedIndexChanged" EmptyDataText="There is no data" ShowFooter="true"
                                        OnRowDataBound="gvwListItem_OnRowDataBound" FooterStyle-HorizontalAlign="Right">
                                        <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <span>No</span>
                                            </HeaderTemplate> 
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="INSTALLMENT_NO" HeaderText="Installment No.">
                                            <ItemStyle Width="20%" HorizontalAlign="left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TRX_CODE" HeaderText="Trx. Code">
                                            <ItemStyle Width="10%" HorizontalAlign="left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TRX_DESCRIPTION" HeaderText="Description">
                                            <ItemStyle Width="40%" HorizontalAlign="left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TRX_AMOUNT" HeaderText="Amount" DataFormatString="{0:N2}">
                                            <ItemStyle Width="30%" HorizontalAlign="Right"/>
                                        </asp:BoundField>
                                        <%--<asp:CommandField ShowSelectButton="true" />--%>
                                    </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnSearchItem" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>
           
                    <div class="tab-pane" id="results">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-sm-8 ">
                                </div>
                                <div class="col-sm-4">
                                    <asp:Panel ID="pnlSearchResults" runat="server" DefaultButton="btnSearchResults" class="input-group">
                                        <asp:TextBox ID="txtResultsSearch" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                                        <div class="input-group-btn">
                                            <asp:LinkButton ID="btnSearchResults" runat="server" CssClass="btn btn-info" OnClick="btnSearchResults_Click" CausesValidation="false"><i class="icon-search"></i>  Search</asp:LinkButton>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <asp:UpdatePanel ID="updResults" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gvwResults" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                                        AllowPaging="true" PageSize="10" DataKeyNames="ID" OnPageIndexChanging="gvwResults_PageIndexChanging"
                                        OnSelectedIndexChanged="gvwResults_SelectedIndexChanged" EmptyDataText="There is no data">
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <span>No</span>
                                                </HeaderTemplate>
                                                <ItemStyle/> 
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <span>Result</span>
                                                </HeaderTemplate>
                                                <ItemStyle Width="20%" /> 
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Eval("RESULT")%>' Font-Bold="true"/><br />
                                                    <asp:Label runat="server" Text='<%# Eval("RESULT_DATE", "{0:dd/MM/yyyy}")%>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <span>Detail</span>
                                                </HeaderTemplate>
                                                <ItemStyle Width="40%" /> 
                                                <ItemTemplate>
                                                    <div runat="server" Visible='<%# Eval("RESULT_CODE").ToString() == "3" || Eval("RESULT_CODE").ToString() == "4" %>' >
                                                        <asp:Label runat="server" Text="DCR No. : " Font-Bold="true"/>
                                                        <asp:Label runat="server" Text='<%# Eval("KWITANSI_NO")%>'/><br />
                                                        <asp:Label runat="server" Text="Amount : " Font-Bold="true"/>
                                                        <asp:Label runat="server" Text='<%# Eval("PAYMENT_AMOUNT", "{0:N2}")%>'/>
                                                    </div>
                                                    <div runat="server" Visible='<%# Eval("RESULT_CODE").ToString() == "5" %>'>
                                                        <asp:Label runat="server" Text="Promise Date : " Font-Bold="true"/>
                                                        <asp:Label runat="server" Text='<%# Eval("PROMISE_DATE","{0:dd/MM/yyyy}")%>'/><br />
                                                    </div>
                                                    <asp:Label runat="server" Text="-" Font-Bold="true" Visible='<%# Eval("RESULT_CODE").ToString() == "6" %>'/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="RESULT_REASON" HeaderText="Reason / Notes">
                                                <ItemStyle Width="30%" HorizontalAlign="Left"/>
                                            </asp:BoundField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <span>Attachment</span>
                                                </HeaderTemplate>
                                                <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:ImageButton ToolTip="Open Image" runat="server" Visible='<%# !string.IsNullOrEmpty( Eval("IMAGE_ATTACHMENT").ToString() )%>' OnClick="imgBtnViewImage_Click" Height="30px" Width="30px" ImageUrl="~/img/image.png"/>
                                                    <asp:ImageButton ToolTip="Play Video" runat="server" Visible='<%# !string.IsNullOrEmpty( Eval("VIDEO_ATTACHMENT").ToString() )%>' OnClick="imgBtnPlayVideo_Click" Height="30px" Width="30px" ImageUrl="~/img/file_type_video.png"/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                                <Triggers>
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    
    <script type="text/javascript">
        function ResizePanel() {
            var PanelAgreement = $("#ctl00_cpb_PanelAgreement");
            var PanelPayment = $("#ctl00_cpb_PanelPayment");
            var panelCustomer = $("#ctl00_cpb_PanelCustomer");
            var panelStatus = $("#ctl00_cpb_PanelStatus");

            if (PanelAgreement.height() > PanelPayment.height()) {
                PanelPayment.height(PanelAgreement.height());
            } else {
                PanelAgreement.height(PanelPayment.height());
            }

            if (panelStatus.height() > panelCustomer.height()) {
                panelCustomer.height(panelStatus.height());
            } else {
                panelStatus.height(panelCustomer.height());
            }
        }

        $(document).ready( function(){ ResizePanel(); });

//        window.onresize = function(event) {
//            ResizePanel()
//        };
    </script>

</asp:Content>