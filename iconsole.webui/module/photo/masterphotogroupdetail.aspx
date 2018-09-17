<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="masterphotogroupdetail.aspx.cs" Inherits="module_question_masterphotogroupdetail" Title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1"%>

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
                    <asp:LinkButton RoleCode="" ID="btnCancel" runat="server" CssClass="btn btn-danger" OnClick="btnCancel_Click" CausesValidation="false"><i class="icon-remove"></i>  Cancel</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="panel-body form-horizontal">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Photo</label>
                                <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ErrorMessage="*" ControlToValidate="txtCode" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-2">
                                    <cc1:XUITextBox ID="txtID_Master_Photo_Group" runat="server" DBColumnName="GROUP_CODE" SPParameterName="p_group_code" DataType="String" BindType="Both" CssClass="form-control" Visible="false"></cc1:XUITextBox>
                                    <asp:LinkButton ID="btnLookUpMaster_Photo" runat="server" class="btn btn-primary" data-togel="modal" CausesValidation="false"><i class = "icon-table"></i> </asp:LinkButton>
                                    <cc1:XUILabel ID="lblDescription" runat="server" DBColumnName="PHOTO_DESCRIPTION" DataType="String" BindType="DBToUIOnly" ></cc1:XUILabel>
                                    <cc1:XUITextBox ID="txtCode" runat="server" CssClass="form-control" DBColumnName="PHOTO_CODE" SPParameterName="p_photo_code"  DataType="String" BindType="Both" style="display:none"></cc1:XUITextBox>
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