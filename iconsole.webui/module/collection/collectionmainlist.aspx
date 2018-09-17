<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="collectionmainlist.aspx.cs" Inherits="module_collection_collectionmainlist" Title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Collection List</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <label id="lblFilterResult" runat="server" class="col-sm-2">Result Status</label>
                <div class="col-sm-2">
                    <cc1:XUIDropDownList ID="dllFilterResult" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlFilterResult_Changed" CssClass="form-control" DataType="String" BindType="None">
                        <asp:ListItem Text="All" Value="All" Selected="True"/>
                        <asp:ListItem Text="Unprocess" Value="1"/>
                        <asp:ListItem Text="Onprogress" Value="2"/>
                        <asp:ListItem Text="Paid by Cash" Value="3"/>
                        <asp:ListItem Text="Paid by Transfer" Value="4"/>
                        <asp:ListItem Text="Promise Paying" Value="5"/>
                        <asp:ListItem Text="Unpaid" Value="6"/>
                    </cc1:XUIDropDownList>
                </div>

                <label id="lblFilterConsole" runat="server" class="col-sm-2">Console Status</label>
                <div class="col-sm-2">
                    <cc1:XUIDropDownList ID="ddlFilterStatus" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlFilterStatus_Changed" CssClass="form-control" DataType="String" BindType="None">
                        <asp:ListItem Text="All" Value="All" Selected="True"/>
                        <asp:ListItem Text="New" Value="1"/>
                        <asp:ListItem Text="Picked Device" Value="2"/>
                        <asp:ListItem Text="Synchronized Device" Value="3"/>
                        <asp:ListItem Text="Synchronized Production" Value="4"/>
                    </cc1:XUIDropDownList>
                </div>
               
                <div class="col-sm-4" style="float:right; display:inline;">
                     <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearchCollection" class="input-group">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                        <div class="input-group-btn">
                            <asp:LinkButton ID="btnSearchCollection" runat="server" CssClass="btn btn-info" OnClick="btnSearchCollection_Click"><i class="icon-search"></i>  Search</asp:LinkButton>
                        </div>
                     </asp:Panel>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                        AllowPaging="true" PageSize="10" DataKeyNames="TRX_NO" OnPageIndexChanging="gvwListCollection_PageIndexChanging" 
                        onselectedindexchanged="SelectedIndexChanged" EmptyDataText="There is no data">
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
                                <ItemStyle Width="15%"/>
                                <ItemTemplate>
                                    <asp:Label ID="lblAgreementNo" runat="server" Text='<%# Eval("AGREEMENT_NO")%>' Font-Bold="true"/><br />
                                    <asp:Label ID="lblCustomerName" runat="server" Text='<%# Eval("CUSTOMER_NAME")%>'/><br />
                                    <asp:Label ID="lblAgreement" runat="server" Text='<%# Eval("INSTALLMENT","{0:N2}")%>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="COLLECTION_ADDRESS" HeaderText="Address">
                                <ItemStyle Width="25%" HorizontalAlign="Left"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="COLLECTOR" HeaderText="Collector">
                                <ItemStyle Width="15%" HorizontalAlign="Left"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="CONSOLE_STATUS" HeaderText="Console Status">
                                <ItemStyle Width="15%" HorizontalAlign="Left"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="RESULT_STATUS" HeaderText="Result Status">
                                <ItemStyle Width="15%" HorizontalAlign="Left"/>
                            </asp:BoundField>
                            <asp:CommandField ShowSelectButton="true"/>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </section> 
</asp:Content>

