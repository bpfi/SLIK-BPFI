<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="locationuserinfolist.aspx.cs" Inherits="module_location_locationuser" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>User List</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-8">
                    <div class="form-group">
                        <label class="col-sm-2">Position</label>
                        <div class="col-sm-3">
                            <cc1:XUIDropDownList ID="ddlFilterPosition" runat="server" AutoPostBack="true" DataType="String" OnSelectedIndexChanged="ddlFilterPosisi_Changed"  BindType="DBToUIOnly" CssClass="form-control">
                                <asp:ListItem Value="ALL" Text="ALL"></asp:ListItem>
                                <asp:ListItem Value="COLLECTOR" Text="COLLECTOR"></asp:ListItem>
                                <asp:ListItem Value="SURVEYOR" Text="SURVEYOR"></asp:ListItem>
                                <asp:ListItem Value="MARKETING" Text="MARKETING"></asp:ListItem>
                            </cc1:XUIDropDownList>
                        </div>
                    </div>                            
                </div>
                <div class="col-sm-4 ">
                     <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearchLocationUser" class="input-group">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                        <div class="input-group-btn">
                            <asp:LinkButton ID="btnSearchLocationUser" runat="server" CssClass="btn btn-info" OnClick="btnSearchLocationUser_Click"><i class="icon-search"></i>Search</asp:LinkButton>
                        </div>
                     </asp:Panel>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <asp:UpdatePanel ID="updLocationUser" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                        AllowPaging="true" PageSize="10" DataKeyNames="ID,EMP_NAME" OnPageIndexChanging="gvwListLocationUser_PageIndexChanging" 
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
                            <asp:BoundField DataField="ID" HeaderText="User ID">
                                <ItemStyle Width="30%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EMP_NAME" HeaderText="Name">
                                <ItemStyle Width="70%" HorizontalAlign="left"/>
                            </asp:BoundField>       
                            <asp:CommandField ShowSelectButton="true"/>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </section> 
</asp:Content>

