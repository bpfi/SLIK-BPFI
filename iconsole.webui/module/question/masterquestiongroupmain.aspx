<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="masterquestiongroupmain.aspx.cs" Inherits="module_question_masterquestiongroupmain" Title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
          <span>Question Group Info</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="" ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" CausesValidation="true"><i class="icon-save"></i>  Save</asp:LinkButton>
                    <asp:LinkButton RoleCode="" ID="btnCancel" runat="server" CssClass="btn btn-danger" OnClick="btnCancel_Click" CausesValidation="false"><i class="icon-remove"></i>  Cancel</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="panel-body form-horizontal">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Code *</label>
                                <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="*" ControlToValidate="txtCode" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-2">
                                    <cc1:XUITextBox ID="txtCode" runat="server" DBColumnName="CODE" SPParameterName="p_code" CssClass="form-control" DataType="String" BindType="Both" MaxLength="10"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Description</label>
                                <div class="col-sm-5">
                                    <cc1:XUITextBox ID="lblName" runat="server" DBColumnName="DESCRIPTION" SPParameterName="p_description" DataType="String" BindType="Both" CssClass="form-control" MaxLength="50"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                     </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
       </div>
    </section>

    <section class="panel">
        <header class="panel-heading">
            <span>Question Group Detail List</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-8 ">
                    <asp:LinkButton ID="btnAddGroupRole" runat="server" CssClass="btn btn-primary" OnClick="btnAddGroupRole_Click"><i class="icon-plus"></i>  Create</asp:LinkButton>
                    <asp:LinkButton ID="btnDeleteGroupRole" runat="server" CssClass="btn btn-danger" OnClick="btnDeleteGroupRole_Click"><i class="icon-trash"></i>  Delete</asp:LinkButton>
                </div>
                <div class="col-sm-4 ">
                     <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearchGroupRole" class="input-group">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                        <div class="input-group-btn">
                            <asp:LinkButton ID="btnSearchGroupRole" runat="server" CssClass="btn btn-info" OnClick="btnSearchGroupRole_Click" CausesValidation="false"><i class="icon-search"></i>  Search</asp:LinkButton>
                        </div>
                     </asp:Panel>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <asp:UpdatePanel ID="updGroupRole" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvwListGroupRole" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                        AllowPaging="true" PageSize="10" DataKeyNames="CODE_QUESTION" OnPageIndexChanging="gvwListGroupRole_PageIndexChanging" 
                        Onselectedindexchanged="gvwListGroupRole_SelectedIndexChanged" EmptyDataText="There is no data">
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
                            <asp:BoundField DataField="CODE_QUESTION" HeaderText="Code">
                                <ItemStyle Width="20%" HorizontalAlign="Center"/>
                            </asp:BoundField>   
                            <asp:BoundField DataField="question_descripton" HeaderText="Description">
                                <ItemStyle Width="80%" HorizontalAlign="left"/>
                            </asp:BoundField>                                    
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnAddGroupRole" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnDeleteGroupRole" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnSearchGroupRole" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </section> 
</asp:Content>
