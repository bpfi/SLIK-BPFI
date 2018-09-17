<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="masterbranch.aspx.cs" Inherits="module_commonmst_masterbranch" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Branch Info</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="R03001E" ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" CausesValidation="true"><i class="icon-save"></i>  Save</asp:LinkButton>
                    <asp:LinkButton RoleCode="" ID="btnChangeStatus" runat="server" CssClass="btn btn-primary" OnClick="btnChangeStatus_Click" CausesValidation="true"><i class="icon-active"></i>  Change Status</asp:LinkButton>                    
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
                                <label class="col-sm-2">Code</label>
                                <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="*" ControlToValidate="lblCode" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-2">
                                    <cc1:XUITextBox ID="lblCode" runat="server" DBColumnName="CODE" SPParameterName="p_code" MaxLength="3" CssClass="form-control" DataType="String" BindType="Both" placeholder="Max 3 Character"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Description</label>
                                <div class="col-sm-4">
                                    <cc1:XUITextBox ID="lblDescriptionName" runat="server" DBColumnName="DESCRIPTION" MaxLength="50" SPParameterName="p_description" DataType="String" BindType="Both" CssClass="form-control"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                     </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Address</label>
                                <div class="col-sm-4">
                                    <cc1:XUITextBox ID="lblAddress" DBColumnName="ADDRESS" runat="server" TextMode="MultiLine" BindType="Both" MaxLength="400" SPParameterName="p_address" CssClass="form-control" DataType="String" ></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">City</label>
                                <div class="col-sm-2">
                                    <cc1:XUITextBox ID="lblCity" runat="server" DBColumnName="CITY" DataType="String" MaxLength="20" SPParameterName="p_city" BindType="Both" CssClass="form-control"></cc1:XUITextBox>
                                </div>
                             </div>
                         </div>
                     </div>
                    <div class="row">
                         <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Post Code</label>
                                <div class="col-sm-2">
                                    <asp:LinkButton ID="btnLookupPostCode" runat="server" class="btn btn-primary" data-togel="modal" CausesValidation="false"><i class="icon-table"></i> </asp:LinkButton>
                                    <cc1:XUILabel ID="lblPostCodeDescription" runat="server" DBColumnName="status_description" DataType="String" BindType="DBToUIOnly" ></cc1:XUILabel>
                                    <cc1:XUITextBox ID="txtPostCode" runat="server" CssClass="form-control" DBColumnName="POST_CODE" SPParameterName="p_post_code" DataType="String" BindType="Both" MaxLength="10" style="display:none;"></cc1:XUITextBox>
                                </div>
                            </div>                            
                         </div>
                         <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Phone No</label>
                                <div class="col-sm-2">
                                    <cc1:XUITextBox ID="lblPhoneNo" runat="server" DBColumnName="PHONE_NO" MaxLength="15" DataType="String" BindType="Both" SPParameterName="p_phone_no"  CssClass="form-control"></cc1:XUITextBox>
                                </div>
                            </div>                            
                         </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Fax No</label>
                                <div class="col-sm-2">
                                    <cc1:XUITextBox ID="lblFaxNo" runat="server" DBColumnName="FAX_NO" DataType="String" MaxLength="15" BindType="Both" SPParameterName="p_fax_no" CssClass="form-control"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Status</label>
                                <div class="col-sm-2">
                                    <cc1:XUILabel ID="lblIsActive" runat="server" DBColumnName="IS_ACTIVE" SPParameterName="p_is_active"  DataType="String" BindType="Both"> </cc1:XUILabel>
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

