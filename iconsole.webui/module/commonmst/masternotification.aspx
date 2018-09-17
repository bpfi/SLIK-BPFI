<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="masternotification.aspx.cs" Inherits="module_commonmst_masternotification" Title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Notification Info</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="R03003E" ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" CausesValidation="true"><i class="icon-add"></i>  Save</asp:LinkButton>
                    <asp:LinkButton RoleCode="" ID="btnChangeStatus" runat="server" CssClass="btn btn-primary" OnClick="btnChangeStatus_Click" CausesValidation="false"><i class="icon-click"></i>  Change Status</asp:LinkButton>                    
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
                                <label class="col-sm-4">Code</label>
                                    <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="*" ControlToValidate="txtNotificationCode" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-4">
                                    <cc1:XUITextBox ID="txtNotificationCode" runat="server" CssClass="form-control" DBColumnName="CODE" SPParameterName="p_code" DataType="String" BindType="Both" MaxLength="10"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                     </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Description</label>
                                    <asp:RequiredFieldValidator ID="rfvDes" runat="server" ErrorMessage="*" ControlToValidate="txtNotificationDescription" Display="Dynamic"></asp:RequiredFieldValidator>                                    
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNotificationDescription" CssClass="form-control" runat="server" SPParameterName="p_description" DBColumnName="DESCRIPTION" DataType="String" BindType="Both" MaxLength="50" TextMode="MultiLine"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                     </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Message</label>
                                    <asp:RequiredFieldValidator ID="rfvMess" runat="server" ErrorMessage="*" ControlToValidate="txtMessage" Display="Dynamic"></asp:RequiredFieldValidator>                                                                        
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtMessage" SPParameterName="p_message" runat="server" CssClass="form-control"  DBColumnName="MESSAGE" BindType="Both" DataType="String" MaxLength="1000" TextMode="MultiLine"></cc1:XUITextBox>
                                </div>
                            </div>    
                        </div>                        
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Type</label>
                                    <asp:RequiredFieldValidator ID="rfvType" runat="server" ErrorMessage="*" ControlToValidate="ddlType" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="ddlType" runat="server" CssClass="form-control" DBColumnName="NOTIFI_TYPE" SPParameterName="p_notifi_type" DataType="String" BindType="Both">
                                        <asp:ListItem Value="E" Text="Employee"></asp:ListItem>
                                        <asp:ListItem Value="A" Text="Admin"></asp:ListItem>
                                    </cc1:XUIDropDownList>       
                                </div>
                             </div>
                         </div>
                     </div>
                    <div class="row">
                         <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Is Active</label>
                                <div class="col-sm-7">
                                    <cc1:XUILabel ID="lblIsActive" runat="server" DBColumnName="IS_ACTIVE" SPParameterName="p_is_active"  DataType="String" BindType="Both"> </cc1:XUILabel>                                    
                                </div>  
                            </div>
                          </div>                            
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnChangeStatus" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
       </div>
    </section>
</asp:Content>

