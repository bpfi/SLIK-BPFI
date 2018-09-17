<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="collectionmainquickviewdetail.aspx.cs" Inherits="module_collection_collectionmainquickviewdetail" Title="Quick View Detail" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Quick View Detail</span>
            <center><asp:Label ID="lblFilterQuickView" runat="server" Font-Bold="true"/></center>
        </header>
        <div class="panel-body">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                        AllowPaging="true" PageSize="10" DataKeyNames="TRX_NO" OnPageIndexChanging="gvwList_PageIndexChanging" 
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
