<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="applicationcustomerlist.aspx.cs" Inherits="module_application_applicationcustomerlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
<section class="panel">
        <header class="panel-heading">
          <span>Customer List</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-8 ">
                    <asp:LinkButton ID="btnAddApplicationCustomer" runat="server" CssClass="btn btn-primary" OnClick="btnAddApplicationCustomer_Click"><i class="icon-plus"></i>  Create</asp:LinkButton>
                    <asp:LinkButton ID="btnDeleteApplicationCustomer" runat="server" CssClass="btn btn-danger" OnClick="btnDeleteApplicationCustomer_Click"><i class="icon-trash"></i>  Delete</asp:LinkButton>
                </div>
                <div class="col-sm-4 ">
                     <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearchApplicationCustomer" class="input-group">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                        <div class="input-group-btn">
                            <asp:LinkButton ID="btnSearchApplicationCustomer" runat="server" CssClass="btn btn-info" OnClick="btnSearchApplicationCustomer_Click"><i class="icon-search"></i>  Search</asp:LinkButton>
                        </div>
                     </asp:Panel>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                    AllowPaging="true" PageSize="10" DataKeyNames="APPLICATION_NO"
                        OnPageIndexChanging="gvwListApplicationCustomer_PageIndexChanging" Onselectedindexchanged="SelectedIndexChanged" EmptyDataText="There is no data">
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
                                    <asp:CheckBox runat="server" ID="chbCheckedAll" AutoPostBack="true" OnCheckedChanged="chbCheckedAll_CheckedChanged"/>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox runat="server" ID="chbChecked"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="APPLICATION_NO" HeaderText="Application No">
                                <ItemStyle Width="10%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="NAME" HeaderText="Name">
                                <ItemStyle Width="40%" HorizontalAlign="left"/>
                            </asp:BoundField>       
                            <asp:BoundField DataField="ID_NO" HeaderText="ID No">
                                <ItemStyle Width="20%" HorizontalAlign="left"/>
                            </asp:BoundField>   
                            <asp:BoundField DataField="MOTHER_NAME" HeaderText="Mother Name">
                                <ItemStyle Width="30%" HorizontalAlign="left"/>
                            </asp:BoundField>                                                                                                     
                            <asp:CommandField ShowSelectButton="true"/>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnDeleteApplicationCustomer"  EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnAddApplicationCustomer"     EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnSearchApplicationCustomer"  EventName="Click" />              
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </section> 

</asp:Content>

