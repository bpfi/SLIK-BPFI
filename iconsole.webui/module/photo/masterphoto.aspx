<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="masterphoto.aspx.cs" Inherits="module_photo_masterphoto" Title="Master Photo" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Photo Info</span>
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
                                <label class="col-sm-4">Code *</label>
                                <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="*" ControlToValidate="txtCode" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-3">
                                    <cc1:XUITextBox ID="txtCode" runat="server" CssClass="form-control" DataType="String" BindType="Both" MaxLength="10"></cc1:XUITextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4">Description *</label>
                                <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ErrorMessage="*" ControlToValidate="txtDescription" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtDescription" runat="server" CssClass="form-control" DBColumnName="DESCRIPTION" SPParameterName="p_description" DataType="String" BindType="Both" MaxLength="50"></cc1:XUITextBox>
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