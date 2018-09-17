<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="surveymain.aspx.cs" Inherits="module_survey_surveymain" %>
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
            <div class="panel-heading">
                <div class="row">
                    <div class="col-sm-12">
                        <asp:LinkButton RoleCode="" ID="btnCancel" runat="server"  CssClass="btn btn-danger"   OnClick="btnCancel_Click" CausesValidation="false">  <i class="icon-remove"> </i>Cancel </asp:LinkButton>
                    </div>
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
        
                <section class="panel col-sm-12">   
                    <div class="row">
                        <div class="col-sm-12">
                                <header class="panel-heading">
                                    <span>Agreement</span>
                                </header>
                            <div class="panel-body form-horizontal">
                                <asp:UpdatePanel ID="PanelCustomer" runat="server">
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
                                                <label class="col-sm-4">Object</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="lblObject" runat="server" DBColumnName="OBJECT_INFO" SPParameterName="p_object_info" DataType="String" BindType="DBToUIOnly" MaxLength="500"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>
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
                                                <label class="col-sm-4">Survey Status</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="XUILabel6" runat="server" DBColumnName="SURVEY_STATUS" SPParameterName="p_result_status" DataType="String" BindType="DBToUIOnly"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
            <section class="panel col-sm-12">   
                    <div class="row">
                        <div class="col-sm-12">
                                <header class="panel-heading">
                                    <span>Customer</span>
                                </header>
                            <div class="panel-body form-horizontal">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Name</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="XUILabel1" runat="server" DBColumnName="CUSTOMER_NAME" SPParameterName="p_customer_name" DataType="String" BindType="DBToUIOnly" MaxLength="100"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Address</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="XUILabel2" runat="server" DBColumnName="SURVEY_ADDRESS" SPParameterName="p_survey_address" DataType="String" BindType="DBToUIOnly" MaxLength="200"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-12 form-group">
                                                <label class="col-sm-4">Phone No</label>
                                                <div class="col-sm-8">
                                                    <cc1:XUILabel ID="XUILabel3" runat="server" DBColumnName="SURVEY_PHONE_NUMBER" SPParameterName="p_survey_phone_number" DataType="String" BindType="DBToUIOnly"></cc1:XUILabel>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
   <div class="row">
        <section class="panel">
            <header class="panel-heading tab-bg-dark-navy-blue">
                <asp:TextBox ID="txtTabCode" runat="server" style="display:none"/>
                <ul class="nav nav-tabs nav-justified">
                    <li class="active">
                        <a href="#photo" id="survey_photo" onclick="javascript:fnSetTab('survey_photo');" data-toggle="tab">Survey Photo List</a>
                    </li>
                   <li class="">
                        <a href="#question" id="survey_question" onclick="javascript:fnSetTab('survey_question');" data-toggle="tab">Question</a>
                    </li>
                    <li class="">
                        <a href="#additional" id="survey_question_additional" onclick="javascript:fnSetTab('survey_question_additional');" data-toggle="tab">Question Additional</a>
                    </li>
                </ul>
            </header>
            
            <div class="panel-body">                    
                <div class="tab-content tasi-tab">
                
                    <div class="tab-pane active" id="photo">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-sm-8 ">
                                </div>
                                <div class="col-sm-4">
                                    <asp:Panel ID="pnlSearchSurveyPhoto" runat="server" DefaultButton="btnSearchItem" class="input-group">
                                        <asp:TextBox ID="txtSearchSurveyPhoto" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                                        <div class="input-group-btn">
                                            <asp:LinkButton ID="btnSearchItem" runat="server" CssClass="btn btn-info" OnClick="btnSearchSurveyPhoto_Click" CausesValidation="false"><i class="icon-search"></i>  Search</asp:LinkButton>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                        
                        <div class="panel-body">
                            <asp:UpdatePanel ID="upPhoto" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gvwListSurveyPhoto" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                                        AllowPaging="true" PageSize="10" DataKeyNames="ID" OnPageIndexChanging="gvwListSurveyPhoto_PageIndexChanging"
                                        OnSelectedIndexChanged="gvwListSurveyPhoto_SelectedIndexChanged" EmptyDataText="There is no data" ShowFooter="true"
                                        FooterStyle-HorizontalAlign="Right">
                                        <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <span>No</span>
                                            </HeaderTemplate> 
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="DESCRIPTION" HeaderText="Description">
                                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="REMARK" HeaderText="Note">
                                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="FILE_NAME" HeaderText="File Name">
                                            <ItemStyle Width="20%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                         <asp:TemplateField>
                                            <HeaderTemplate>
                                                <span>Image</span>
                                            </HeaderTemplate> 
                                            <ItemStyle Width="20%" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" ToolTip="View Location" runat="server" OnClick="imgBtnViewImage_Click" Height="30px" Width="30px" ImageUrl="../../img/image.png"/>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnSearchItem" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>
           
                    <div class="tab-pane" id="question">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-sm-8 ">
                                </div>
                                <div class="col-sm-4">
                                    <asp:Panel ID="pnlSearchQuestion" runat="server" DefaultButton="btnSearchQuestion" class="input-group">
                                        <asp:TextBox ID="txtQuestionSearch" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                                        <div class="input-group-btn">
                                            <asp:LinkButton ID="btnSearchQuestion" runat="server" CssClass="btn btn-info" OnClick="btnSearchQuestion_Click" CausesValidation="false"><i class="icon-search"></i>  Search</asp:LinkButton>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <asp:UpdatePanel ID="upQuestion" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gvwQuestion" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                                        AllowPaging="true" PageSize="10" DataKeyNames="TRX_NO" OnPageIndexChanging="gvwQuestion_PageIndexChanging"
                                        OnSelectedIndexChanged="gvwQuestion_SelectedIndexChanged" EmptyDataText="There is no data" ShowFooter="true"
                                        FooterStyle-HorizontalAlign="Right">
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <span>No</span>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="DESCRIPTION_QUESTION" HeaderText="Question">
                                                <ItemStyle Width="40%" HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="DESCRIPTION_ANSWER" HeaderText="Answer">
                                                <ItemStyle Width="60%" HorizontalAlign="Left" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                                <Triggers>
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    
                    <div class="tab-pane" id="additional">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-sm-8 ">
                                </div>
                                <div class="col-sm-4">
                                    <asp:Panel ID="pnl_additional" runat="server" DefaultButton="btnSearchQuestion" class="input-group">
                                        <asp:TextBox ID="txtSearchAdditional" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                                        <div class="input-group-btn">
                                            <asp:LinkButton ID="btnSearchAdditional" runat="server" CssClass="btn btn-info" OnClick="btnSearchQuestionAdditional_Click" CausesValidation="false"><i class="icon-search"></i>  Search</asp:LinkButton>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <asp:UpdatePanel ID="pnl_additional_detail" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gvwQuestionAdditional" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                                        AllowPaging="true" PageSize="10" DataKeyNames="TRX_NO" OnPageIndexChanging="gvwQuestionAdditional_PageIndexChanging"
                                        OnSelectedIndexChanged="gvwQuestionAdditional_SelectedIndexChanged" EmptyDataText="There is no data" ShowFooter="true"
                                        FooterStyle-HorizontalAlign="Right">
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <span>No</span>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="DESCRIPTION_QUESTION" HeaderText="Question">
                                                <ItemStyle Width="40%" HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="DESCRIPTION_ANSWER" HeaderText="Answer">
                                                <ItemStyle Width="60%" HorizontalAlign="Left" />
                                            </asp:BoundField>
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
    
</asp:Content>