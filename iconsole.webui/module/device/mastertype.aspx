<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="mastertype.aspx.cs" Inherits="module_commonmst_mastertype" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
<section class="panel">
        <header class="panel-heading">
            <span>Type Info</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="R040021E" ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" CausesValidation="true"><i class="icon-save"></i>  Save</asp:LinkButton>
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
                                    <cc1:XUITextBox ID="txtCode" runat="server" DBColumnName="CODE" SPParameterName="p_code" CssClass="form-control" DataType="String" BindType="Both" ></cc1:XUITextBox>
                                    <cc1:XUITextBox ID="txtMerkCode" runat="server" CssClass="form-control" DBColumnName="MEREK_CODE" SPParameterName="p_merek_code" DataType="String" MaxLength="10"  Visible="false" BindType="Both" ></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-2">Description</label>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="lblDescriptionName" runat="server" DBColumnName="DESCRIPTION" SPParameterName="p_description"  MaxLength="50" DataType="String" BindType="Both" CssClass="form-control"></cc1:XUITextBox>
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

