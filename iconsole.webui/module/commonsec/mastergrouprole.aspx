<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="mastergrouprole.aspx.cs" Inherits="module_commonsec_mastergrouprole" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Group Role Info</span>
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
                        <div class="col-sm-0">
                            <div class="form-group">
                                <label class="col-sm-0"></label>
                                <div class="col-sm-0">
                                    <cc1:XUITextBox ID="txtGroupCode" runat="server" CssClass="form-control" DBColumnName="GROUP_CODE" SPParameterName="p_group_code" DataType="String" MaxLength="8" BindType="Both" Visible="false"></cc1:XUITextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-7">
                            <div class="form-group">
                                <label class="col-sm-2">Code *</label>
                                    <asp:RequiredFieldValidator ID="rvfRoleCode" runat="server" ErrorMessage="*" ControlToValidate="txtRoleCode" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-4">
                                    <asp:LinkButton ID="btnLookUpRoleCode" runat="server" class="btn btn-primary" data-togel="modal" CausesValidation="false"><i class = "icon-table"></i> </asp:LinkButton>
                                    <cc1:XUILabel ID="lblName" runat="server" horizontalAlign="center" DBColumnName="DESCRIPTION" DataType="String"  BindType="DBToUIOnly" ></cc1:XUILabel>
                                    <cc1:XUITextBox ID="txtRoleCode" runat="server" CssClass="form-control" DBColumnName="ROLE_CODE" SPParameterName="p_role_code"  DataType="String" BindType="Both" style="display:none"></cc1:XUITextBox>
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
</asp:Content>

