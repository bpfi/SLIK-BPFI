<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="masterquestionlist.aspx.cs" Inherits="module_question_masterquestionlist" Title="Master Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Question List</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-8 ">
                    <asp:LinkButton ID="btnAddQuestion" runat="server" CssClass="btn btn-primary" OnClick="btnAddQuestion_Click"><i class="icon-plus"></i>  Create</asp:LinkButton>
                    <asp:LinkButton ID="btnDeleteQuestion" runat="server" CssClass="btn btn-danger" OnClick="btnDeleteQuestion_Click"><i class="icon-trash"></i>  Delete</asp:LinkButton>
                </div>
                <div class="col-sm-4 ">
                     <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearchQuestion" class="input-group">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                        <div class="input-group-btn">
                            <asp:LinkButton ID="btnSearchQuestion" runat="server" CssClass="btn btn-info" OnClick="btnSearchQuestion_Click"><i class="icon-search"></i>  Search</asp:LinkButton>
                        </div>
                     </asp:Panel>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                        AllowPaging="true" PageSize="10" DataKeyNames="CODE" OnPageIndexChanging="gvwListQuestion_PageIndexChanging" 
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
                                    <asp:CheckBox runat="server" ID="chbCheckedAll" AutoPostBack="true" OnCheckedChanged="chbCheckedAll_CheckedChanged"/>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox runat="server" ID="chbChecked"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CODE" HeaderText="Code">
                                <ItemStyle Width="10%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DESCRIPTION" HeaderText="Description">
                                <ItemStyle Width="80%" HorizontalAlign="left"/>
                            </asp:BoundField>                        
                            <asp:CommandField ShowSelectButton="true"/>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearchQuestion" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnDeleteQuestion" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </section> 
</asp:Content>