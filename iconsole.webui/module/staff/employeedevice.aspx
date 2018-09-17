<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="employeedevice.aspx.cs" Inherits="module_staff_employeedevice" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Employee Device Info</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="R020012E" ID="btnSaveEMPdevice" runat="server" CssClass="btn btn-primary" OnClick="btnSaveEMPdevice_Click" CausesValidation="true"><i class="icon-save"></i>  Save</asp:LinkButton>
                    <asp:LinkButton RoleCode="" ID="btnCancelEMPdevice" runat="server" CssClass="btn btn-danger" OnClick="btnCancelEMPdevice_Click" CausesValidation="false"><i class="icon-remove"></i>  Cancel</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="panel-body form-horizontal">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <div class="row" style="display:none">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">ID *</label>                                                   
                                <div class="col-sm-2">
                                    <cc1:XUITextBox ID="txtIdEMPDevice" runat="server" CssClass="form-control" DBColumnName="ID" SPParameterName="p_id" ReadOnly="true" DataType="Integer" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="display:none">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Employee</label>
                                <div class="col-sm-2">
                                    <cc1:XUITextBox ID="txtEmployeeCode" runat="server" DBColumnName="EMPLOYEE_CODE" SPParameterName="p_employee_code" CssClass="form-control" DataType="String" BindType="Both" style="display:none;"></cc1:XUITextBox> 
                                    <cc1:XUILabel ID="lblEMPName" runat="server" DBColumnName="EMP_NAME" SPParameterName="p_emp_name" DataType="String" BindType="Both"></cc1:XUILabel>                                     
                                </div>
                            </div>                            
                        </div>
                     </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Device *</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtDeviceCode" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-3">
                                    <asp:LinkButton ID="btnLookUpDevice" runat="server" class="btn btn-primary" data-togel="modal" CausesValidation="false"><i class="icon-table"></i> </asp:LinkButton>
                                    <cc1:XUILabel ID="lblIMEI" runat="server" DBColumnName="IMEI" DataType="String" BindType="DBToUIOnly" ></cc1:XUILabel>
                                    <cc1:XUITextBox ID="txtDeviceCode" runat="server" CssClass="form-control" DBColumnName="DEVICE_CODE" SPParameterName="p_device_code"  DataType="String" BindType="Both" style="display:none"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div> 
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Effective Date *</label>
                                    <asp:RequiredFieldValidator ID="rfvEffDate" runat="server" ErrorMessage="*" ControlToValidate="txtEffDate" Display="Dynamic"></asp:RequiredFieldValidator>                                                               
                                <div class="col-sm-6">
                                    <cc1:XUITextBox ID="txtEffDate" runat="server" CssClass="form-control default-date-picker"  DBColumnName="EFF_DATE" SPParameterName="p_eff_date" DataType="DateTime" BindType="Both" Format="dd/MM/yyyy"></cc1:XUITextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Last Date</label>
                                <div class="col-sm-6">
                                    <cc1:XUITextBox ID="txtLastDate" runat="server" CssClass="form-control default-date-picker" Format="dd/MM/yyyy" DBColumnName="LAST_DATE" SPParameterName="p_last_date" DataType="DateTime" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>
                        </div>
                    </div> 
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSaveEMPdevice" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnCancelEMPdevice" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </section>
</asp:Content>

