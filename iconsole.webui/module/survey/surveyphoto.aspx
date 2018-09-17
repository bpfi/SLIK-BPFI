<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="surveyphoto.aspx.cs" Inherits="module_survey_surveyphoto" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Survey Photo Info</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="" ID="btnCancel" runat="server" CssClass="btn btn-danger" OnClick="btnCancel_Click" CausesValidation="false"><i class="icon-remove"></i>  Cancel</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="panel-body form-horizontal">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-sm-6" style="display:none">
                            <div class="form-group">
                                <label class="col-sm-4">ID *</label>
                                <div class="col-sm-3">
                                    <cc1:XUITextBox ID="txtId" runat="server" DBColumnName="ID" SPParameterName="p_id" CssClass="form-control"  DataType="Integer" BindType="Both" ></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6" style="display:none">
                            <div class="form-group">
                                <label class="col-sm-4">TRX No</label>
                                <div class="col-sm-6">
                                    <cc1:XUITextBox ID="txtTrxNo" runat="server" DBColumnName="TRX_NO" SPParameterName="p_trx_no" CssClass="form-control" DataType="String" BindType="Both" ></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                     </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">File Name</label>
                                <div class="col-sm-6">
                                    <cc1:XUILabel ID="txtFileName" runat="server" DBColumnName="FILE_NAME" SPParameterName="p_file_name" DataType="String" BindType="Both" CssClass="form-control"></cc1:XUILabel>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Latitute Coordinate</label>
                                <div class="col-sm-6">
                                    <cc1:XUILabel ID="txtLatCoord" runat="server" DBColumnName="LAT_COORD" SPParameterName="p_lat_coord" DataType="String" BindType="Both" CssClass="form-control"></cc1:XUILabel>
                                </div>
                            </div>                            
                        </div>
                     </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Longitude Coordinate</label>
                                <div class="col-sm-6">
                                    <cc1:XUILabel ID="txtLongCoord" runat="server" DBColumnName="LONG_COORD" SPParameterName="p_long_coord" DataType="String" BindType="Both" CssClass="form-control"></cc1:XUILabel>
                                </div>
                            </div>                            
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
       </div>
    </section>
</asp:Content>

