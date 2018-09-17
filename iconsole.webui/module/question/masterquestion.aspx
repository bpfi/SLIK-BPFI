<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="masterquestion.aspx.cs" Inherits="module_question_masterquestionmain" Title="Master Question" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Question Info</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="" ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" CausesValidation="true"><i class="icon-save"></i>  Save</asp:LinkButton>
                    <asp:LinkButton RoleCode="" ID="btnCancel" runat="server" CssClass="btn btn-danger" OnClick="btnCancel_Click" CausesValidation="false"><i class="icon-remove"></i>Cancel</asp:LinkButton>
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
                                <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="*" ControlToValidate="txtCode" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-3">
                                    <cc1:XUITextBox ID="txtCode" runat="server" CssClass="form-control" DBColumnName="CODE" SPParameterName="p_code" DataType="String" BindType="Both" MaxLength="10"></cc1:XUITextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4">Description *</label>
                                <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ErrorMessage="*" ControlToValidate="txtDescription" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtDescription" runat="server" CssClass="form-control" DBColumnName="DESCRIPTION" SPParameterName="p_description" DataType="String" BindType="Both" MaxLength="50"></cc1:XUITextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4">Type</label>
                                <div class="col-sm-6">
                                    <cc1:XUIDropDownList ID="ddlQuestionType" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlQuestionType_Changed" CssClass="form-control" DBColumnName="QUESTION_TYPE" SPParameterName="p_question_type" DataType="String" BindType="Both">
                                        <asp:ListItem Value="CHOICE" Text="CHOICE"></asp:ListItem>
                                        <asp:ListItem Value="TEXT" Text="TEXT"></asp:ListItem>
                                        <asp:ListItem Value="NUMBER" Text="NUMBER"></asp:ListItem>
                                        <asp:ListItem Value="MONEY" Text="MONEY"></asp:ListItem>
                                        <asp:ListItem Value="DATE" Text="DATE"></asp:ListItem>
                                    </cc1:XUIDropDownList>
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
    
    <section class="panel">
        <header class="panel-heading">
            <span>Question Choice List</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-8 ">
                    <asp:LinkButton ID="btnAddQuestionChoice" runat="server" CssClass="btn btn-primary" OnClick="btnAddQuestionChoice_Click"><i class="icon-plus"></i>  Create</asp:LinkButton>
                    <asp:LinkButton ID="btnDeleteQuestionChoice" runat="server" CssClass="btn btn-danger" OnClick="btnDeleteQuestionChoice_Click"><i class="icon-trash"></i>  Delete</asp:LinkButton>
                </div>
                <div class="col-sm-4 ">
                     <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearchQuestionChoice" class="input-group">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                        <div class="input-group-btn">
                               <asp:LinkButton ID="btnSearchQuestionChoice" runat="server" CssClass="btn btn-info" OnClick="btnSearchQuestionChoice_Click" CausesValidation="false"><i class="icon-search"></i>  Search</asp:LinkButton>
                            </div>
                     </asp:Panel>
                </div>
            </div>
        </div>
        <div class="panel-body">
          <asp:UpdatePanel ID="updQuestionChoice" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvwListQuestionChoice" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                    AllowPaging="true" PageSize="10" DataKeyNames="ID"
                        OnPageIndexChanging="gvwListQuestionChoice_PageIndexChanging" Onselectedindexchanged="gvwListQuestionChoice_SelectedIndexChanged" EmptyDataText="There is no data">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <span>No</span>
                                </HeaderTemplate> 
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox runat="server" ID="chbCheckedAll" AutoPostBack="true" OnCheckedChanged="chbCheckedAll_CheckedChanged"/>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox runat="server" ID="chbChecked"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="DESCRIPTION" HeaderText="Description">
                                <ItemStyle Width="70%" HorizontalAlign="left"/>
                            </asp:BoundField>          
                            <asp:BoundField DataField="SCORING" HeaderText="Scoring">
                                <ItemStyle Width="30%" HorizontalAlign="center"/>
                                </asp:BoundField>                        
                            <asp:CommandField ShowSelectButton="true" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnAddQuestionChoice" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnDeleteQuestionChoice" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnSearchQuestionChoice" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </section> 
   
</asp:Content>