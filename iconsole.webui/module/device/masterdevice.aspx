<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="masterdevice.aspx.cs" Inherits="module_commonmst_masterdevice" Title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Device Info</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="R040010E" ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" CausesValidation="true"><i class="icon-add"></i>  Save</asp:LinkButton>
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
                                <label class="col-sm-4">Code *</label>
                                <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="*" ControlToValidate="txtDeviceCode" Display="Dynamic"></asp:RequiredFieldValidator>                                                                
                                <div class="col-sm-4">
                                    <cc1:XUITextBox ID="txtDeviceCode" runat="server" CssClass="form-control" DBColumnName="CODE" SPParameterName="p_code" DataType="String" BindType="Both" MaxLength="10" placeholder="Max 10 Character"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Purchase Date</label>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtPurchaseDate" SPParameterName="p_purchase_date" runat="server" CssClass="form-control default-date-picker" DBColumnName="PURCHASE_DATE" BindType="Both" DataType="DateTime" Format="dd/MM/yyyy" ></cc1:XUITextBox>
                                </div>
                             </div>
                         </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">IMEI</label>
                                    <asp:RequiredFieldValidator ID="rfvImei" runat="server" ErrorMessage="*" ControlToValidate="txtImei" Display="Dynamic"></asp:RequiredFieldValidator>                                                                                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtImei" CssClass="form-control" runat="server" SPParameterName="p_imei" DBColumnName="IMEI" DataType="String" BindType="Both" ></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Purchase Amount</label>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtPurchaseAmount" SPParameterName="p_purchase_amount" runat="server" CssClass="form-control" DBColumnName="PURCHASE_AMOUNT" BindType="Both" DataType="Number" Format="N2" ></cc1:XUITextBox>
                                </div>
                            </div>
                        </div>     
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Merk</label>
                                    <asp:RequiredFieldValidator ID="rfvMerek" runat="server" ErrorMessage="*" ControlToValidate="txtMerkCode" Display="Dynamic"></asp:RequiredFieldValidator>                                                                                                                            
                                <div class="col-sm-4">
                                    <asp:LinkButton ID="btnLookUpMerk" runat="server" class="btn btn-primary" data-togel="modal" CausesValidation="false"><i class="icon-table"></i> </asp:LinkButton>
                                    <cc1:XUILabel ID="lblMerkDescription" runat="server" DBColumnName="MEREK_DESCRIPTION" DataType="String" BindType="DBToUIOnly" ></cc1:XUILabel>
                                    <cc1:XUITextBox ID="txtMerkCode" runat="server" CssClass="form-control" DBColumnName="MEREK_CODE" SPParameterName="p_merek_code"  DataType="String" BindType="Both" style="display:none"></cc1:XUITextBox>
                                </div>
                            </div>
                        </div> 
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">OS Type</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtOsType" Display="Dynamic"></asp:RequiredFieldValidator>                                                                                                                                                        
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtOsType" SPParameterName="p_os_type" runat="server" CssClass="form-control" DBColumnName="OS_TYPE" BindType="Both" DataType="String" ></cc1:XUITextBox>
                                </div>
                            </div>
                        </div>                     
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Type</label>
                                    <asp:RequiredFieldValidator ID="rfvType" runat="server" ErrorMessage="*" ControlToValidate="txtTypeCode" Display="Dynamic"></asp:RequiredFieldValidator>                                                                                                                                                        
                                <div class="col-sm-4">
                                    <asp:LinkButton ID="btnLookUpType" runat="server" class="btn btn-primary" data-togel="modal" CausesValidation="false"><i class = "icon-table"></i> </asp:LinkButton>
                                    <cc1:XUILabel ID="lblTypeDescription" runat="server" DBColumnName="TYPE_DESCRIPTION" DataType="String" BindType="DBToUIOnly"></cc1:XUILabel>
                                    <cc1:XUITextBox ID="txtTypeCode" runat="server" CssClass="form-control" DBColumnName="TYPE_CODE" SPParameterName="p_type_code"  DataType="String" BindType="Both" style="display:none"></cc1:XUITextBox>
                                </div>
                             </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Specification</label>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtSpecification" SPParameterName="p_specification" runat="server" CssClass="form-control" DBColumnName="SPECIFICATION" BindType="Both" DataType="String" TextMode="MultiLine"></cc1:XUITextBox>
                                </div>
                             </div>
                        </div>    
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Screen Size</label>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtScreenSize" SPParameterName="p_screen_size" runat="server" CssClass="form-control" DBColumnName="SCREEN_SIZE" BindType="Both" DataType="String" ></cc1:XUITextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Status</label>
                                <div class="col-sm-7">
                                    <cc1:XUILabel ID="lblIsActive" runat="server" SPParameterName="p_is_active" DBColumnName="IS_ACTIVE" DataType="String" BindType="DBToUIOnly"></cc1:XUILabel>
                                </div>  
                            </div>
                        </div>          
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Memory Size</label>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtMemorySize" SPParameterName="p_memory_size" runat="server" CssClass="form-control" DBColumnName="MEMORY_SIZE" BindType="Both" DataType="String" ></cc1:XUITextBox>
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



