<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="masterrolesec.aspx.cs" Inherits="module_commonsec_masterrole" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Role Info</span>
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
                                    <label class="col-sm-2">Code *</label>
                                        <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="*" ControlToValidate="txtCode" Display="Dynamic"></asp:RequiredFieldValidator>                                                               
                                    <div class="col-sm-2">
                                        <cc1:XUITextBox ID="txtCode" runat="server" DBColumnName="CODE" SPParameterName="p_code" CssClass="form-control" DataType="String" BindType="Both" MaxLength="8"></cc1:XUITextBox>
                                    </div>
                                </div>
                            <div class="form-group">
                                    <label class="col-sm-2">Action Code</label>
                                    <div class="col-sm-2">
                                        <cc1:XUIDropDownList ID="ddlActionCode" runat="server" CssClass="form-control" DBColumnName="ACTION_CODE" SPParameterName="p_action_code" DataType="String" BindType="Both">
                                            <asp:ListItem Value="" Text="NULL"></asp:ListItem>                                        
                                            <asp:ListItem Value="C" Text="CREATE"></asp:ListItem>
                                            <asp:ListItem Value="D" Text="DELETE"></asp:ListItem>
                                            <asp:ListItem Value="E" Text="EDIT"></asp:ListItem>
                                            <asp:ListItem Value="O" Text="PROSES"></asp:ListItem>
                                            <asp:ListItem Value="P" Text="PRINT"></asp:ListItem>                                                                                
                                        </cc1:XUIDropDownList>
                                    </div>
                                </div>                              
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Description *</label>
                                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="*" ControlToValidate="lblName" Display="Dynamic"></asp:RequiredFieldValidator>                                                                                                     
                                <div class="col-sm-4">
                                    <cc1:XUITextBox ID="lblName" runat="server" DBColumnName="NAME" SPParameterName="p_name" DataType="String" BindType="Both" CssClass="form-control" MaxLength="50"></cc1:XUITextBox>
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

