<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="mastergeneralcode.aspx.cs" Inherits="module_commonmst_mastergeneralcode" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
          <span>General Code</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                   <asp:LinkButton RoleCode="" ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" CausesValidation="true"><i class="icon-save"></i>  Save</asp:LinkButton>
                   <asp:LinkButton RoleCode="" ID="btnCancel" runat="server" CssClass="btn btn-danger" OnClick="btnCancel_Click" CausesValidation="false"><i class="icon-remove"></i>Cancel</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="panel-body form-horizontal">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-2">Code</label>
                                    <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="*" ControlToValidate="txtCode" Display="Dynamic"></asp:RequiredFieldValidator>                                                               
                                <div class="col-sm-3">
                                    <cc1:XUITextBox ID="txtCode" runat="server" CssClass="form-control" DBColumnName="CODE" SPParameterName="p_code" DataType="String" MaxLength="10" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-2">Description</label>
                                    <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ErrorMessage="*" ControlToValidate="txtDescription" Display="Dynamic"></asp:RequiredFieldValidator>                                                                                                   
                                <div class="col-sm-9">
                                    <cc1:XUITextBox ID="txtDescription" runat="server" CssClass="form-control" DBColumnName="DESCRIPTION" SPParameterName="p_description" DataType="String" MaxLength="50"  BindType="Both"></cc1:XUITextBox>
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
          <span>General Sub-Code List</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-8 ">
                     <asp:LinkButton ID="btnAddSubCode" runat="server" CssClass="btn btn-primary" OnClick="btnAddSubCode_Click"><i class="icon-plus"></i>  Create</asp:LinkButton>
                    <asp:LinkButton ID="btnDeleteSubCode" runat="server" CssClass="btn btn-danger" OnClick="btnDeleteSubCode_Click"><i class="icon-trash"></i>  Delete</asp:LinkButton>
                </div>
                <div class="col-sm-4">
                    <asp:Panel ID="pnlSearchSubCode" runat="server" DefaultButton="btnSearchSubCode" class="input-group">
                        <asp:TextBox ID="txtSearchSubCode" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                        <div class="input-group-btn">
                            <asp:LinkButton ID="btnSearchSubCode" runat="server" CssClass="btn btn-info" OnClick="btnSearchSubCode_Click" CausesValidation="false"><i class="icon-search"></i>  Search</asp:LinkButton>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <asp:UpdatePanel ID="updSubCode" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvwListSubCode" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                        AllowPaging="true" PageSize="10" DataKeyNames="CODE" OnPageIndexChanging="gvwListSubCode_PageIndexChanging" 
                        OnSelectedIndexChanged="gvwListSubCode_SelectedIndexChanged" EmptyDataText="There is no data">
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
                                <ItemStyle Width="80%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="STATUS" HeaderText="Status">
                                <ItemStyle Width="10%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:CommandField ShowSelectButton="true" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearchSubCode" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnAddSubCode" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnDeleteSubCode" EventName="Click" />  
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </section>
    
</asp:Content>