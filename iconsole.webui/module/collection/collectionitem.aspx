<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="collectionitem.aspx.cs" Inherits="module_collection_collectionitem" Title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Collection Item Info</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="" ID="btnCancelItem" runat="server" CssClass="btn btn-danger" OnClick="btnCancelItem_Click" CausesValidation="false"><i class="icon-remove"></i>  Cancel</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="panel-body form-horizontal">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">TRX No</label>
                                <div class="col-sm-3">
                                    <cc1:XUILabel ID="txtTRXNo" runat="server" CssClass="form-control" DBColumnName="TRX_NO" SPParameterName="p_trx_no" DataType="String" BindType="Both" MaxLength="50"></cc1:XUILabel>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Installment No</label>
                                <div class="col-sm-3">
                                    <cc1:XUILabel ID="txtInstallment" runat="server" CssClass="form-control" DBColumnName="INSTALLMENT_NO" SPParameterName="p_installment_no" DataType="String" BindType="Both" MaxLength="50"></cc1:XUILabel>                                   
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">TRX Code</label>
                                <div class="col-sm-3">
                                    <cc1:XUILabel ID="txtTRXCode" runat="server" CssClass="form-control" DBColumnName="TRX_CODE" SPParameterName="p_trx_code" DataType="String" BindType="Both" MaxLength="50"></cc1:XUILabel>                                   
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Description</label>
                                <div class="col-sm-3">
                                    <cc1:XUILabel ID="txtDescription" runat="server" CssClass="form-control" DBColumnName="TRX_DESCRIPTION" SPParameterName="p_trx_description" DataType="String" BindType="Both" MaxLength="200"></cc1:XUILabel>
                                </div>
                            </div>                            
                        </div>       
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Amount</label>
                                <div class="col-sm-3">
                                    <cc1:XUILabel ID="txtTRXAmount" runat="server" CssClass="form-control" DBColumnName="TRX_AMOUNT" SPParameterName="p_trx_amount" DataType="String" BindType="Both"></cc1:XUILabel>                                                                       
                                </div>
                            </div>                            
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnCancelItem" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </section>
</asp:Content>

