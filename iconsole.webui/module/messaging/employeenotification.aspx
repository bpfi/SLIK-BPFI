<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="employeenotification.aspx.cs" Inherits="module_messaging_employeenotification" Title="Push Notification" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Push Notification</span>
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
                                <label class="col-sm-4">Subject *</label>
                                <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ErrorMessage="*" ControlToValidate="txtNotifiSubject" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtId" runat="server" CssClass="form-control" DBColumnName="ID" SPParameterName="p_id" DataType="Integer" BindType="Both" Visible="false"></cc1:XUITextBox>
                                    <cc1:XUITextBox ID="txtNotifiSubject" runat="server" CssClass="form-control" DBColumnName="NOTIFI_SUBJECT" SPParameterName="p_notifi_subject" DataType="String" BindType="Both" MaxLength="100"></cc1:XUITextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Employee *</label>
                                <asp:RequiredFieldValidator ID="rfvEmpCode" runat="server" ErrorMessage="*" ControlToValidate="txtEmpCode" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-7">
                                    <asp:LinkButton ID="btnLookUpEmp" runat="server" class="btn btn-primary" data-togel="modal" CausesValidation="false"><i class="icon-table"></i> </asp:LinkButton>
                                    <cc1:XUILabel ID="lblEmpName" runat="server" DBColumnName="EMP_CODE" DataType="String" BindType="DBToUIOnly" ></cc1:XUILabel>
                                    <cc1:XUITextBox ID="txtEmpCode" runat="server" CssClass="form-control" DBColumnName="EMP_CODE" SPParameterName="p_emp_code"  DataType="String" BindType="Both" style="display:none"></cc1:XUITextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Message</label>
                                <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ErrorMessage="*" ControlToValidate="txtMessage" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtMessage" runat="server" CssClass="form-control" DBColumnName="NOTIFI_MESSAGE" SPParameterName="p_notifi_message" DataType="String" BindType="Both" MaxLength="200" TextMode="MultiLine" Height="75px"></cc1:XUITextBox>
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