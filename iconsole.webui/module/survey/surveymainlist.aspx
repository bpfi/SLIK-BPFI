<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="surveymainlist.aspx.cs" Inherits="module_survey_surveymainlist" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Survey Main List</span>
        </header>
        <div class="panel-heading">
            <div class="row">
            
                <label id="lblFilterSurvey" runat="server" class="col-sm-2">Survey Status</label>
                <div class="col-sm-2">
                    <cc1:XUIDropDownList ID="dllFilterSurvey" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlFilterSurvey_Changed" CssClass="form-control" DataType="String" BindType="None">
                        <asp:ListItem Text="All" Value="All" Selected="True"/>
                        <asp:ListItem Text="On Progress" Value="2"/>
                        <asp:ListItem Text="Finished" Value="3"/>
                    </cc1:XUIDropDownList>
                </div>
                
                <label id="lblFilterConsole" runat="server" class="col-sm-2">Console Status</label>
                <div class="col-sm-2">
                    <cc1:XUIDropDownList ID="ddlFilterStatus" AutoPostBack="true" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlFilterStatus_Changed" DataType="String" BindType="None">
                        <asp:ListItem Text="All" Value="All" Selected="True"/>
                        <asp:ListItem Text="New" Value="1"/>
                        <asp:ListItem Text="Picked Device" Value="2"/>
                        <asp:ListItem Text="Synchronized Device" Value="3"/>
                        <asp:ListItem Text="Synchronized Production" Value="4"/>
                    </cc1:XUIDropDownList>
                </div>
                
                <div class="col-sm-4" style="float:right; display:inline;">
                    <asp:Panel ID="pnlSearchSurveyMain" runat="server" DefaultButton="btnSearchSurveyMain" class="input-group">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Keywords">  </asp:TextBox>  
                        <div class="input-group-btn">
                            <asp:LinkButton ID="btnSearchSurveyMain" runat="server" CssClass="btn btn-info" OnClick="btnSearchSurveyMain_Click" CausesValidation="false"><i class="icon-search"></i>  Search</asp:LinkButton>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                        AllowPaging="true" PageSize="10" DataKeyNames="TRX_NO" OnPageIndexChanging="gvwListSurveyMain_PageIndexChanging" 
                        Onselectedindexchanged="SelectedIndexChanged" EmptyDataText="There is no data">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <span>No</span>
                                </HeaderTemplate> 
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <span>Trx. No</span>
                                </HeaderTemplate> 
                                <ItemStyle Width="15%"/>
                                <ItemTemplate>
                                    <asp:Label ID="lblTrxNo" runat="server" Text='<%# Eval("TRX_NO")%>' Font-Bold="true"/><br />
                                    <asp:Label ID="lblTrxDate" runat="server" Text='<%# Eval("TRX_DATE", "{0:dd/MM/yyyy}")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <HeaderTemplate>
                                    <span>Agreement</span>
                                </HeaderTemplate> 
                                <ItemStyle Width="12%"/>
                                <ItemTemplate>
                                    <asp:Label ID="lblAgreementNo" runat="server" Text='<%# Eval("AGREEMENT_NO")%>' Font-Bold="true"/><br />
                                    <asp:Label ID="lblCustomerName" runat="server" Text='<%# Eval("CUSTOMER_NAME")%>'/><br />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <span>Address</span>
                                </HeaderTemplate>
                                <ItemStyle Width="20%" /> 
                                <ItemTemplate>
                                    <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("SURVEY_ADDRESS")%>' TextMode="MultiLine" BorderStyle="None" ReadOnly="true" Width="100%" Height="75px"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>  
                             <asp:BoundField DataField="QUESTION_GROUP" HeaderText="Survey Type">
                                <ItemStyle Width="15%" HorizontalAlign="Left"/>
                            </asp:BoundField>  
                            <asp:BoundField DataField="CONSOLE_STATUS" HeaderText="Console Status">
                                <ItemStyle Width="10%" HorizontalAlign="Left"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="SURVEY_STATUS" HeaderText="Survey Status">
                                <ItemStyle Width="10%" HorizontalAlign="Left"/>
                            </asp:BoundField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <span>Surveyor</span>
                                </HeaderTemplate> 
                                <ItemStyle Width="15%"/>
                                <ItemTemplate>
                                    <asp:Label ID="lblSurveyorCode" runat="server" Text='<%# Eval("SURVEYOR_CODE")%>' Font-Bold="true"/><br />
                                    <asp:Label ID="lblPhoneNo" runat="server" Text='<%# Eval("PHONE_NO")%>'/><br />
                                </ItemTemplate>
                            </asp:TemplateField>                                                             
                            <asp:CommandField ShowSelectButton="true" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearchSurveyMain" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </section>
</asp:Content>

