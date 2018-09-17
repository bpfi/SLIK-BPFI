<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="masterwidget.aspx.cs" Inherits="module_commonmst_masterwidget" Title="Untitled Page" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Widget Info</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="R03004E" ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" CausesValidation="true"><i class="icon-add"></i>  Save</asp:LinkButton>
                    <asp:LinkButton RoleCode="" ID="btnChangeStatus" runat="server" CssClass="btn btn-primary" OnClick="btnChangeStatus_Click" CausesValidation="true"><i class="icon-click"></i>  Change Status</asp:LinkButton>                    
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
                                <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="*" ControlToValidate="txtWidgetCode" Display="Dynamic"></asp:RequiredFieldValidator>                                                                
                            <div class="col-sm-4">
                                <cc1:XUITextBox ID="txtWidgetCode" runat="server" CssClass="form-control" DBColumnName="CODE" SPParameterName="p_code" DataType="String" BindType="Both" MaxLength="10"></cc1:XUITextBox>
                            </div>
                        </div>                            
                    </div>
                 </div>
                 <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-4">Description</label>
                            <asp:RequiredFieldValidator ID="rfvDes" runat="server" ErrorMessage="*" ControlToValidate="txtWidgetDescription" Display="Dynamic"></asp:RequiredFieldValidator>                                                                                                
                            <div class="col-sm-7">
                                <cc1:XUITextBox ID="txtWidgetDescription" CssClass="form-control" runat="server" SPParameterName="p_description" DBColumnName="DESCRIPTION" DataType="String" BindType="Both" MaxLength="50" TextMode="MultiLine"></cc1:XUITextBox>
                            </div>
                        </div>                            
                    </div>
                 </div>
                 <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-4">File Name</label>
                            <asp:RequiredFieldValidator ID="rfvFileName" runat="server" ErrorMessage="*" ControlToValidate="txtFileName" Display="Dynamic"></asp:RequiredFieldValidator>                                                                                                                            
                            <div class="col-sm-7">
                                <cc1:XUITextBox ID="txtFileName" SPParameterName="p_file_name" runat="server" CssClass="form-control"  DBColumnName="FILE_NAME" BindType="Both" DataType="String" MaxLength="200" TextMode="MultiLine"></cc1:XUITextBox>
                            </div>
                        </div>    
                    </div>                        
                </div>
                 <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-4">Type</label>
                                <asp:RequiredFieldValidator ID="rfvType" runat="server" ErrorMessage="*" ControlToValidate="txtWidegetType" Display="Dynamic"></asp:RequiredFieldValidator>                                                                                                                                                        
                            <div class="col-sm-2">
                                <cc1:XUITextBox ID="txtWidegetType" SPParameterName="p_widget_type" runat="server" CssClass="form-control" DBColumnName="WIDGET_TYPE" BindType="Both" DataType="String" MaxLength="1"></cc1:XUITextBox>
                            </div>
                        </div>
                    </div>
                 </div>
                 <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-4">Is Active</label>
                                <div class="col-sm-7">
                                    <cc1:XUILabel ID="lblIsActive" SPParameterName="p_is_active" runat="server" DBColumnName="IS_ACTIVE" BindType="Both" DataType="String" ></cc1:XUILabel>                                    
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

