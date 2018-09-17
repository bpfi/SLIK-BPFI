<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="masterusermaingroupsec.aspx.cs" Inherits="module_user_masterusermaingroupsec" Title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>User Group Security</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="R010031E" ID="btnSaveUserGroupsec" runat="server" CssClass="btn btn-primary" OnClick="btnSaveUserGroupsec_Click" CausesValidation="true"><i class="icon-save"></i>  Save</asp:LinkButton>
                    <asp:LinkButton RoleCode="" ID="btnCancelUserGroupsec" runat="server" CssClass="btn btn-danger" OnClick="btnCancelUserGroupsec_Click" CausesValidation="false"><i class="icon-remove"></i>  Cancel</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="panel-body form-horizontal">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">User</label>
                                <asp:RequiredFieldValidator ID="rvf" runat="server" ErrorMessage="*" ControlToValidate="txtUser" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-3">
                                    <cc1:XUITextBox ID="txtUser" runat="server" CssClass="form-control" DBColumnName="UID" SPParameterName="p_uid" ReadOnly="true" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                     </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Code</label>
                                <asp:RequiredFieldValidator ID="rvfBranchCode" runat="server" ErrorMessage="*" ControlToValidate="txtUserGroupsecCode" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-3">
                                    <asp:LinkButton ID="btnLookUpUserGroupsecCode" runat="server" class="btn btn-primary" data-togel="modal" CausesValidation="false"><i class = "icon-table"></i> </asp:LinkButton>
                                    <cc1:XUILabel ID="lblName" runat="server" DBColumnName="NAME" DataType="String" BindType="DBToUIOnly" ></cc1:XUILabel>
                                    <cc1:XUITextBox ID="txtUserGroupsecCode" runat="server" CssClass="form-control" DBColumnName="GROUP_CODE" SPParameterName="p_group_code"  DataType="String" BindType="Both" style="display:none"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                     </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSaveUserGroupsec" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnCancelUserGroupsec" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
       </div>
    </section>
</asp:Content>

