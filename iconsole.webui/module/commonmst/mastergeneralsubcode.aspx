<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="mastergeneralsubcode.aspx.cs" Inherits="module_commonmst_mastergeneralsubcode" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">

    <section class="panel">
        <header class="panel-heading">
          <span>General SubCode Info</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="" ID="btnSave"   runat="server" CssClass="btn btn-primary"  OnClick="btnSave_Click" CausesValidation="true"><i class="icon-save"></i>  Save</asp:LinkButton>
                    <asp:LinkButton RoleCode="" ID="btnChangeStatus"   runat="server" CssClass="btn btn-primary"  OnClick="btnChangeStatus_Click" CausesValidation="true"></i> Change Status</asp:LinkButton>
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
                                <label class="col-sm-2">Code</label>
                                    <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="*" ControlToValidate="txtCode" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-4">
                                 <cc1:XUITextBox ID="txtCode" runat="server" DBColumnName="CODE" SPParameterName="p_code" CssClass="form-control" DataType="String" MaxLength="20"  BindType="Both" ></cc1:XUITextBox>
                              </div>
                            </div>                            
                        </div>
                     </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-2">Description</label>
                                    <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ErrorMessage="*" ControlToValidate="txtDescriptionName" Display="Dynamic"></asp:RequiredFieldValidator>                                    
                                <div class="col-sm-8">
                                    <cc1:XUITextBox ID="txtDescriptionName" runat="server" DBColumnName="DESCRIPTION" SPParameterName="p_description" DataType="String" MaxLength="50" BindType="Both" CssClass="form-control"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                     </div>
                    <div class="row" style="display:none">
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label class="col-sm-2">General Code</label>
                                <div class="col-sm-2">
                                    <cc1:XUITextBox ID="txtGeneralCode" runat="server" Visible="false" DBColumnName="GENERAL_CODE" SPParameterName="p_general_code" DataType="String" BindType="Both" CssClass="form-control"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                     </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-2">Status</label>
                                <div class="col-sm-2">
                                    <cc1:XUILabel ID="txtStatus" runat="server" DBColumnName="IS_ACTIVE" SPParameterName="p_is_active" DataType="String"  BindType="Both"></cc1:XUILabel>
                                </div>
                            </div>                            
                        </div>
                     </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnChangeStatus" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
       </div>
    </section>
</asp:Content>

