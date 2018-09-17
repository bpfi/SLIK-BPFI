<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="employeenotificationlist.aspx.cs" Inherits="module_messaging_employeenotificationlist" Title="Push Notification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Notification List</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-8 ">
                    <asp:LinkButton ID="btnAddNotification" runat="server" CssClass="btn btn-primary" OnClick="btnAddNotification_Click"><i class="icon-plus"></i>  Create</asp:LinkButton>
<%--                    <asp:LinkButton ID="btnDeleteNotification" runat="server" CssClass="btn btn-danger" OnClick="btnDeleteNotification_Click"><i class="icon-trash"></i>  Delete</asp:LinkButton>--%>
                </div>
                <div class="col-sm-4 ">
                     <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearchNotification" class="input-group">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                        <div class="input-group-btn">
                            <asp:LinkButton ID="btnSearchNotification" runat="server" CssClass="btn btn-info" OnClick="btnSearchNotification_Click"><i class="icon-search"></i>  Search</asp:LinkButton>
                        </div>
                     </asp:Panel>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                        AllowPaging="true" PageSize="10" DataKeyNames="ID" OnPageIndexChanging="gvwListNotification_PageIndexChanging" 
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
<%--                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox runat="server" ID="chbCheckedAll" AutoPostBack="true" OnCheckedChanged="chbCheckedAll_CheckedChanged"/>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox runat="server" ID="chbChecked"/>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:BoundField DataField="NOTIFI_DATE" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy HH:mm}">
                                <ItemStyle Width="15%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EMP_NAME" HeaderText="To Employee">
                                <ItemStyle Width="15%" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="NOTIFI_SUBJECT" HeaderText="Subject">
                                <ItemStyle Width="15%" HorizontalAlign="Left"/>
                            </asp:BoundField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <span>Message</span>
                                </HeaderTemplate>
                                <ItemStyle Width="40%" /> 
                                <ItemTemplate>
                                    <asp:TextBox runat="server" Text='<%# Eval("NOTIFI_MESSAGE")%>' TextMode="MultiLine" BorderStyle="None" ReadOnly="true" Width="100%" Height="75px"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>    
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <span>Status</span>
                                </HeaderTemplate>
                                <ItemStyle Width="15%" /> 
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("STATUS_DESCRIPTION")%>' Font-Bold="true"/><br />
                                    <asp:Label runat="server" Text='<%# Eval("PICKED_DEVICE_DATE","{0:dd/MM/yyyy HH:mm}")%>' Visible='<%# Eval("IS_PICKED_DEVICE").ToString() == "1"%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
<%--                            <asp:CommandField ShowSelectButton="false"/>--%>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearchNotification" EventName="Click" />
                    <%--<asp:AsyncPostBackTrigger ControlID="btnDeleteNotification" EventName="Click" />--%>
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </section> 
</asp:Content>