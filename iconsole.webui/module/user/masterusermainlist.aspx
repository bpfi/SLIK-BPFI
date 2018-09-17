<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="masterusermainlist.aspx.cs" Inherits="module_user_masterusermainlist" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>User List</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-8 ">
                </div>
                <div class="col-sm-4 ">
                     <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearchUser" class="input-group">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                        <div class="input-group-btn">
                            <asp:LinkButton ID="btnSearchUser" runat="server" CssClass="btn btn-info" OnClick="btnSearchUser_Click"><i class="icon-search"></i>  Search</asp:LinkButton>
                        </div>
                     </asp:Panel>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvwListUser" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                        AllowPaging="true" PageSize="10" DataKeyNames="ID" OnPageIndexChanging="gvwListUser_PageIndexChanging" 
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
                            <asp:BoundField DataField="ID" HeaderText="ID">
                                <ItemStyle Width="10%" HorizontalAlign="Center"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="EMP_NAME" HeaderText="Name">
                                <ItemStyle Width="30%" HorizontalAlign="Left"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="LAST_LOGIN_DATE" HeaderText="Last Login Date" DataFormatString="{0:dd/MM/yyyy hh:mm:ss}">
                                <ItemStyle Width="60%" HorizontalAlign="Center"/>
                            </asp:BoundField>
                            <asp:CommandField ShowSelectButton="true"/>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </section> 
</asp:Content>

