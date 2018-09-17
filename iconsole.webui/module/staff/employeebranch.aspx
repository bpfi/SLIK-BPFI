<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="employeebranch.aspx.cs" Inherits="module_staff_employeebranch" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Employee Branch Info</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="R020011E" ID="btnSaveEMPBranch" runat="server" CssClass="btn btn-primary" OnClick="btnSaveEMPBranch_Click" CausesValidation="true"><i class="icon-save"></i>  Save</asp:LinkButton>
                    <asp:LinkButton RoleCode="" ID="btnCancelEMPBranch" runat="server" CssClass="btn btn-danger" OnClick="btnCancelEMPBranch_Click" CausesValidation="false"><i class="icon-remove"></i>  Cancel</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="panel-body form-horizontal">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <div class="row" style="display:none">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Employee Code *</label>
                                <asp:RequiredFieldValidator ID="rfvEmployeeCode" runat="server" ErrorMessage="*" ControlToValidate="txtEmployeeCode" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-2">
                                    <cc1:XUITextBox ID="txtEmployeeCode" runat="server" CssClass="form-control" DBColumnName="EMP_CODE"  SPParameterName="p_emp_code" ReadOnly="true" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Branch *</label>
                                 <asp:RequiredFieldValidator ID="rvfBranchCode" runat="server" ErrorMessage="*" ControlToValidate="txtBranchCode" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-3">
                                    <asp:LinkButton ID="btnLookUpBranchCode" runat="server" class="btn btn-primary" data-togel="modal" CausesValidation="false"><i class = "icon-table"></i> </asp:LinkButton>
                                    <cc1:XUILabel ID="lblDescription" runat="server" DBColumnName="DESCRIPTION" DataType="String" BindType="DBToUIOnly" ></cc1:XUILabel>
                                    <cc1:XUITextBox ID="txtBranchCode" runat="server" CssClass="form-control" DBColumnName="BRANCH_CODE" SPParameterName="p_branch_code"  DataType="String" BindType="Both" style="display:none"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Is Home Base</label>
                                <div class="col-sm-3">
                                    <cc1:XUICheckBox ID="ckhIsHomeBase" DBColumnName="IS_HOME_BASE" runat="server" BindType="Both" SPParameterName="p_is_home_base" DataType="String" ></cc1:XUICheckBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSaveEMPBranch" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnCancelEMPBranch" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </section>
</asp:Content>

