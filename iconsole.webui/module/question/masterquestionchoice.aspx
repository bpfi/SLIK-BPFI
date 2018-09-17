<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="masterquestionchoice.aspx.cs" Inherits="module_question_masterquestionchoice" Title="Master Question Choice" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Question Choice Info</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                 <div class="col-sm-12">
                  <asp:LinkButton RoleCode="" ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" CausesValidation="false"><i class="icon-save"></i>  Save</asp:LinkButton>
                  <asp:LinkButton RoleCode="" ID="btnCancel" runat="server" CssClass="btn btn-danger" OnClick="btnCancel_Click" CausesValidation="false"><i class="icon-remove"></i>Cancel</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="panel-body form-horizontal">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <div class="row" style="display:none">
                        <div class="col-sm-7">       
                            <div class="form-group">
                                <label class="col-sm-2">ID *</label>
                                <asp:RequiredFieldValidator ID="rfvId" runat="server" ErrorMessage="*" ControlToValidate="txtId" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-2">
                                    <cc1:XUITextBox ID="txtId" runat="server" Enabled="false" CssClass="form-control" DBColumnName="ID" SPParameterName="p_id" DataType="String" BindType="Both" MaxLength="50"></cc1:XUITextBox>
                                </div>
                            </div> 
                        </div>
                    </div>
                    <div class="row" style="display:none">
                        <div class="col-sm-7">
                            <div class="form-group">
                                <label class="col-sm-3">Code_Question</label>
                                <cc1:XUITextBox ID="txtCode" runat="server"  CssClass="form-control" DBColumnName="CODE_QUESTION" SPParameterName="p_code_question"  DataType="String" BindType="Both" ></cc1:XUITextBox>
                            </div>
                        </div>                            
                    </div>
                    <div class="row">
                        <div class="col-sm-7">
                           <div class="form-group">
                                <label class="col-sm-2">Description</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtDescription" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtDescription" runat="server" CssClass="form-control" DBColumnName="DESCRIPTION" SPParameterName="p_description" DataType="String" BindType="Both" MaxLength="50"></cc1:XUITextBox>
                                </div>
                            </div> 
                         </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-7">
                            <div class="form-group">
                                <label class="col-sm-2">Scoring</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtScoring" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtScoring" runat="server" CssClass="form-control" DBColumnName="SCORING" SPParameterName="p_scoring" DataType="String" BindType="Both" MaxLength="50"></cc1:XUITextBox>
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


