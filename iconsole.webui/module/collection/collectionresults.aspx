<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="collectionresults.aspx.cs" Inherits="module_collection_collectionresults" Title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Results Info</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="" ID="btnCancelResults" runat="server" CssClass="btn btn-danger" OnClick="btnCancelResults_Click" CausesValidation="false"><i class="icon-remove"></i>  Cancel</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="panel-body form-horizontal">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
<%--                    <div class="row">
                        <div class="col-sm-12" style="display:none">
                            <div class="form-group">
                                <label class="col-sm-2">ID</label>
                                <div class="col-sm-2">
                                    <cc1:XUILabel ID="txtID" runat="server" CssClass="form-control" DBColumnName="ID" SPParameterName="p_id" ReadOnly="true" DataType="Integer" BindType="Both"></cc1:XUILabel>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12" style="display:none">
                            <div class="form-group">
                                <label class="col-sm-2">TRX No</label>
                                <div class="col-sm-3">
                                       <cc1:XUILabel ID="txtTrxNo" runat="server" CssClass="form-control" DBColumnName="TRX_NO" SPParameterName="p_trx_no" DataType="String" BindType="Both" MaxLength="50"></cc1:XUILabel>
                                </div>
                            </div>                            
                        </div>
                     </div>--%>
<%--                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Results Code</label>
                                <div class="col-sm-3">
                                       <cc1:XUILabel ID="txtResultsCode" runat="server" CssClass="form-control" DBColumnName="RESULT_CODE" SPParameterName="p_result_code" DataType="String" BindType="Both" MaxLength="10"></cc1:XUILabel>                                   
                                </div>
                            </div>                            
                        </div>
                     </div>--%>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Reason</label>
                                <div class="col-sm-3">
                                       <cc1:XUILabel ID="txtReason" runat="server" DBColumnName="RESULT_REASON" SPParameterName="p_result_reason" DataType="String" BindType="Both" MaxLength="500"></cc1:XUILabel>                                                                       
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2">Promise Date</label>
                                <div class="col-sm-3">                                                                      
                                    <cc1:XUILabel ID="txtPromiseDate" runat="server" DBColumnName="PROMISE_DATE" SPParameterName="p_promise_date" DataType="DateTime" BindType="Both" Format="dd/MM/yyyy"></cc1:XUILabel>                                       
                                </div>
                            </div>                            
                        </div>
                    </div>
<%--                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2"> Latitude Coordinate</label>
                                <div class="col-sm-3">
                                       <cc1:XUILabel ID="txtLatCoord" runat="server" CssClass="form-control" DBColumnName="LAT_COORD" SPParameterName="p_lat_coord" DataType="String" BindType="Both" MaxLength="500"></cc1:XUILabel>                                                                       
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2"> Longitude Coordinate</label>
                                <div class="col-sm-3">
                                       <cc1:XUILabel ID="txtLongCoord" runat="server" CssClass="form-control" DBColumnName="LONG_COORD" SPParameterName="p_long_coord" DataType="String" BindType="Both" MaxLength="500"></cc1:XUILabel>                                                                       
                                </div>
                            </div>                            
                        </div>
                    </div>--%>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnCancelResults" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </section>
</asp:Content>

