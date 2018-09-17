<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="mastermerek.aspx.cs" Inherits="module_commonmst_mastermerek" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Merk</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="R040020E" ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" CausesValidation="true"><i class="icon-save"></i>  Save</asp:LinkButton>
                    <asp:LinkButton RoleCode="" ID="btnCancel" runat="server" CssClass="btn btn-danger" OnClick="btnCancel_Click" CausesValidation="false"><i class="icon-remove"></i>  Cancel</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="panel-body form-horizontal">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-2">Code *</label>
                                    <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="*" ControlToValidate="txtCode" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-3">
                                    <cc1:XUITextBox ID="txtCode" runat="server" DBColumnName="CODE" SPParameterName="p_code" CssClass="form-control" DataType="String" MaxLength="10" BindType="Both" ></cc1:XUITextBox>
                                </div>                            
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-2">Description</label>
                                    <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ErrorMessage="*" ControlToValidate="txtDescription" Display="Dynamic"></asp:RequiredFieldValidator>                                    
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtDescription" runat="server" DBColumnName="DESCRIPTION" SPParameterName="p_description" DataType="String" MaxLength="50" BindType="Both" CssClass="form-control"></cc1:XUITextBox>
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
            <span>Type List</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-8 ">
                    <asp:LinkButton ID="btnAddType" runat="server" CssClass="btn btn-primary" OnClick="btnAddType_Click"><i class="icon-plus"></i>  Create</asp:LinkButton>
                    <asp:LinkButton ID="btnDeleteType" runat="server" CssClass="btn btn-danger" OnClick="btnDeleteType_Click"><i class="icon-trash"></i>  Delete</asp:LinkButton>
                </div>
                <div class="col-sm-4 ">
                     <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearchType" class="input-group">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                        <div class="input-group-btn">
                            <asp:LinkButton ID="btnSearchType" runat="server" CssClass="btn btn-info" OnClick="btnSearchType_Click" CausesValidation="false"><i class="icon-search"></i>  Search</asp:LinkButton>
                        </div>
                     </asp:Panel>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <asp:UpdatePanel ID="updType" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvwListType" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                        AllowPaging="true" PageSize="10" DataKeyNames="CODE,MEREK_CODE"
                        OnPageIndexChanging="gvwListType_PageIndexChanging" Onselectedindexchanged="gvwListType_SelectedIndexChanged" EmptyDataText="There is no data">
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
                                <ItemStyle Width="20%" HorizontalAlign="Center"/>
                            </asp:BoundField>   
                            <asp:BoundField DataField="DESCRIPTION" HeaderText="Description">
                                <ItemStyle Width="80%" HorizontalAlign="left"/>
                            </asp:BoundField>                                     
                            <asp:CommandField ShowSelectButton="true" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnAddType" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnSearchType" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnDeleteType" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </section> 
</asp:Content>

