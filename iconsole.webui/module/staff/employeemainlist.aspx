<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="employeemainlist.aspx.cs" Inherits="module_staff_employeemainlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Employee List</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-8 ">
                    <asp:LinkButton RoleCode="R02001C" ID="btnAddEmployee" runat="server" CssClass="btn btn-primary" OnClick="btnAddEmployee_Click"><i class="icon-plus"></i>  Create</asp:LinkButton>
                </div>
                <div class="col-sm-4 ">
                    <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearchEmployee" class="input-group">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                        <div class="input-group-btn">
                            <asp:LinkButton ID="btnSearchEmployee" runat="server" CssClass="btn btn-info" OnClick="btnSearchEmployee_Click"><i class="icon-search"></i>  Search</asp:LinkButton>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                        AllowPaging="true" PageSize="10" DataKeyNames="EMP_CODE" OnPageIndexChanging="gvwListEmployee_PageIndexChanging" 
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
                            <asp:BoundField DataField="EMP_CODE" HeaderText="Code">
                                <ItemStyle Width="10%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EMP_NAME" HeaderText="Name">
                                <ItemStyle Width="40%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="POSITION" HeaderText="Position">
                                <ItemStyle Width="30%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="STATUS_DESCRIPTION" HeaderText="Status">
                                <ItemStyle Width="20%" HorizontalAlign="Center"/>
                            </asp:BoundField>
                            <asp:CommandField ShowSelectButton="true" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearchEmployee" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </section> 
</asp:Content>

