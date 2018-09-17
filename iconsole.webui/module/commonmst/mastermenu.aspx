<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="mastermenu.aspx.cs" Inherits="module_commonmst_mastermenu" Title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Menu Info</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="" ID="btnSaveMenu" runat="server" CssClass="btn btn-primary" OnClick="btnSaveMenu_Click" CausesValidation="true"><i class="icon-add"></i>  Save</asp:LinkButton>
                    <asp:LinkButton RoleCode="" ID="btnCancelMenu" runat="server" CssClass="btn btn-danger" OnClick="btnCancelMenu_Click" CausesValidation="false"><i class="icon-remove"></i>  Cancel</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="panel-body form-horizontal">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-sm-6" style="display:none">
                            <div class="form-group">
                                <label class="col-sm-4">ID</label>
                                <div class="col-sm-4">
                                    <cc1:XUITextBox ID="txtId" runat="server" CssClass="form-control" DBColumnName="ID" SPParameterName="p_id" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Code</label>
                                    <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="*" ControlToValidate="txtCode" Display="Dynamic"></asp:RequiredFieldValidator>                                                                
                                <div class="col-sm-4">
                                    <cc1:XUITextBox ID="txtCode" runat="server" CssClass="form-control" DBColumnName="CODE" SPParameterName="p_code" DataType="String" BindType="Both" MaxLength="8" placeholder="Max 8 Character"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Name</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtName" Display="Dynamic"></asp:RequiredFieldValidator>                                                                                                                                                        
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtName" SPParameterName="p_name" runat="server" CssClass="form-control" DBColumnName="NAME" BindType="Both" DataType="String" MaxLength="50"></cc1:XUITextBox>
                                </div>
                             </div>
                        </div>   
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Parent Menu</label>
                                <div class="col-sm-4">
                                    <asp:LinkButton ID="btnLookupMenu" runat="server" class="btn btn-primary" data-togel="modal" CausesValidation="false"><i class="icon-table"></i> </asp:LinkButton>
                                    <cc1:XUILabel ID="lblMenuName" runat="server" DBColumnName="PARENT_NAME" DataType="String" BindType="DBToUIOnly" ></cc1:XUILabel>
                                    <cc1:XUITextBox ID="txtParentId" runat="server" CssClass="form-control" DBColumnName="PARENT_ID" SPParameterName="p_parent_id"  DataType="Integer" BindType="Both" style="display:none"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">CSS Class</label>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtCssClass" SPParameterName="p_css_class" runat="server" CssClass="form-control" DBColumnName="CSS_CLASS" BindType="Both" DataType="String" MaxLength="200"></cc1:XUITextBox>
                                </div>
                             </div>
                        </div>     
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Role Code</label>
                                <div class="col-sm-4">
                                    <asp:LinkButton ID="btnLookUpRoleCode" runat="server" class="btn btn-primary" data-togel="modal" CausesValidation="false"><i class="icon-table"></i> </asp:LinkButton>
                                    <cc1:XUILabel ID="lblName" runat="server" DBColumnName="ROLE_NAME" DataType="String" BindType="DBToUIOnly" ></cc1:XUILabel>
                                    <cc1:XUITextBox ID="txtRoleCode" SPParameterName="p_role_code" runat="server" CssClass="form-control" DBColumnName="ROLE_CODE" BindType="Both" DataType="String" style="display:none"></cc1:XUITextBox>
                                </div>
                           </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Order No</label>
                                <div class="col-sm-4">
                                    <cc1:XUITextBox ID="txtOrderNo" SPParameterName="p_order_no" runat="server" CssClass="form-control" DBColumnName="ORDER_NO" BindType="Both" DataType="Integer"></cc1:XUITextBox>
                                </div>
                             </div>
                        </div> 
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">URL</label>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtURL" runat="server" CssClass="form-control" DBColumnName="URL" SPParameterName="p_url"  DataType="String" BindType="Both" TextMode="MultiLine" ></cc1:XUITextBox>                                    
                                </div>
                            </div>
                         </div>          
                     </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnCancelMenu" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnSaveMenu" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </section>
</asp:Content>

