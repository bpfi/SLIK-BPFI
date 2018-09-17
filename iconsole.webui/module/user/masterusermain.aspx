<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="masterusermain.aspx.cs" Inherits="module_user_masterusermain" Title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>User Info</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="" ID="btnChangeStatus" runat="server" CssClass="btn btn-primary" OnClick="btnChangeStatus_Click" CausesValidation="false"><i class="icon-click"></i>Change Status</asp:LinkButton> 
                    <asp:LinkButton RoleCode="" ID="btnResetPassword" runat="server" CssClass="btn btn-primary" OnClick="btnResetPassword_Click" CausesValidation="false"><i class="icon-click"></i>Reset Password</asp:LinkButton>                     
                    <asp:LinkButton RoleCode="" ID="btnResetLoginCount" runat="server" CssClass="btn btn-primary" OnClick="btnResetLoginCount_Click" CausesValidation="false"><i class="icon-click"></i>Reset Fail Login Count</asp:LinkButton> 
                    <asp:LinkButton RoleCode="" ID="btnUserMainCancel" runat="server" CssClass="btn btn-danger" OnClick="btnUserMainCancel_Click" CausesValidation="false"><i class="icon-remove"></i>Cancel</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="panel-body form-horizontal">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-sm-6"><!--style="display:none" CssClass="form-control" -->
                            <div class="form-group">
                                <label class="col-sm-5">ID</label>
                                <div class="col-sm-6">
                                    <cc1:XUILabel ID="lblId" runat="server" DBColumnName="ID" SPParameterName="p_id"  DataType="String" BindType="Both" MaxLength="10"></cc1:XUILabel>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-5">Name</label>
                                <div class="col-sm-3">
                                    <cc1:XUILabel ID="lblName" runat="server" DBColumnName="EMP_NAME" SPParameterName="p_emp_name"  DataType="String" BindType="Both"></cc1:XUILabel>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6" style="display:none">
                            <div class="form-group">
                                <label class="col-sm-5">Password</label>
                                <div class="col-sm-6">
                                    <cc1:XUILabel ID="lblPassword" runat="server" CssClass="form-control" DBColumnName="UPASS" SPParameterName="p_upass" DataType="String" BindType="Both" MaxLength="20" placeholder="Max 20 Character"></cc1:XUILabel>
                                    <cc1:XUILabel ID="lblUsertype" runat="server" CssClass="form-control" DBColumnName="USER_TYPE" SPParameterName="p_user_type" DataType="String" style="display:none" BindType="Both"></cc1:XUILabel>                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-5">Next Change Password Date</label>
                                <div class="col-sm-6">
                                    <cc1:XUILabel ID="lblNextChangePassDate" runat="server" DBColumnName="NEXT_CHANGE_PASS" SPParameterName="p_next_change_pass" DataType="DateTime" Format="dd/MM/yyyy" BindType="DBToUIOnly"></cc1:XUILabel>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-5">Last Fail Login Count</label>
                                <div class="col-sm-6">
                                    <cc1:XUILabel ID="lblLastFailCount" runat="server" DBColumnName="LAST_FAIL_COUNT" SPParameterName="p_last_fail_count" DataType="Integer" BindType="DBToUIOnly"></cc1:XUILabel>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-5">Status</label>
                                <div class="col-sm-6">
                                    <cc1:XUILabel ID="lblStatus" runat="server" DBColumnName="IS_ACTIVE" SPParameterName="p_is_active" DataType="String" BindType="DBToUIOnly"></cc1:XUILabel>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-5">Last Login Date</label>
                                <div class="col-sm-6">
                                    <cc1:XUILabel ID="lblLastLoginDate" runat="server" DBColumnName="LAST_LOGIN_DATE" SPParameterName="p_last_login_date" DataType="DateTime" Format="dd/MM/yyyy hh:mm:ss" BindType="DBToUIOnly"></cc1:XUILabel>
                                </div>
                            </div>
                        </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnUserMainCancel" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnChangeStatus" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnResetPassword" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnResetLoginCount" EventName="Click" /> 
                </Triggers>
            </asp:UpdatePanel>
       </div>
    </section>
    
    <section class="panel">
        <header class="panel-heading tab-bg-dark-navy-blue">
            <asp:TextBox ID="txtTabCode" runat="server" style="display:none"></asp:TextBox>
            <ul class="nav nav-tabs nav-justified">
                  <li class="active">
                      <a href="#Login" id="userlogin" onclick="javascript:fnSetTab('userlogin');" data-toggle="tab">
                          Login Log
                      </a>
                  </li>
                  <li class="">
                      <a href="#Activity" id="useractivity" onclick="javascript:fnSetTab('useractivity');" data-toggle="tab">
                          Activity
                      </a>
                  </li>
                  <li class="">
                      <a href="#Groupsec" id="usergroupsec" onclick="javascript:fnSetTab('usergroupsec');" data-toggle="tab">
                          Group Security
                      </a>
                  </li>
                </ul>
        </header>
        <div class="panel-body">                    
            <div class="tab-content tasi-tab">
                
                <div class="tab-pane active" id="Login">
                    <header class="panel-heading">
                    </header>
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-sm-8 ">
                            </div>
                            <div class="col-sm-4">
                                <asp:Panel ID="pnlSearchUserLogin" runat="server" DefaultButton="btnSearchUserLogin" class="input-group">
                                    <asp:TextBox ID="txtSearchUserLogin" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                                    <div class="input-group-btn">
                                        <asp:LinkButton ID="btnSearchUserLogin" runat="server" CssClass="btn btn-info" OnClick="btnSearchUserLogin_Click" CausesValidation="false"><i class="icon-search"></i>  Search</asp:LinkButton>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <asp:UpdatePanel ID="updUserLogin" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListUserLogin" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                                    AllowPaging="true" PageSize="10" DataKeyNames="ID"
                                    OnPageIndexChanging="gvwListUserLogin_PageIndexChanging" EmptyDataText="There is no data">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <span>No</span>
                                            </HeaderTemplate> 
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="LOGIN_DATE" HeaderText="Login Date" DataFormatString = "{0:dd/MM/yyyy hh:mm:ss}">
                                            <ItemStyle Width="40%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="FLAG_CODE" HeaderText="Flag Code">
                                            <ItemStyle Width="60%" HorizontalAlign="left" />
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSearchUserLogin" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
       
                <div class="tab-pane" id="Activity">
                    <header class="panel-heading">
                    </header>
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-sm-8 ">
                            </div>
                            <div class="col-sm-4">
                                <asp:Panel ID="pnlSearchUserActivity" runat="server" DefaultButton="btnSearchUserAvtivity" class="input-group">
                                    <asp:TextBox ID="txtActivitySearch" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                                    <div class="input-group-btn">
                                        <asp:LinkButton ID="btnSearchUserAvtivity" runat="server" CssClass="btn btn-info" OnClick="btnSearchActivity_Click" CausesValidation="false"><i class="icon-search"></i>  Search</asp:LinkButton>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <asp:UpdatePanel ID="updUserActivity" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwUserActivity" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                                    AllowPaging="true" PageSize="10" DataKeyNames="ID"
                                    OnPageIndexChanging="gvwUserActivity_PageIndexChanging" OnSelectedIndexChanged="gvwUserActivity_SelectedIndexChanged" EmptyDataText="There is no data">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <span>No</span>
                                            </HeaderTemplate> 
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ACTIVITY_DATE" HeaderText="Activity Date" DataFormatString="{0:dd/MM/yyyy hh:mm:ss}">
                                            <ItemStyle Width="40%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ACTIVITY_TYPE_CODE" HeaderText="Activity Type Code">
                                            <ItemStyle Width="30%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="REMARK" HeaderText="Remark">
                                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            
                <div class="tab-pane" id="Groupsec">
                    <header class="panel-heading">
                    </header>
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-sm-8 ">
                                <asp:LinkButton ID="btnAddUserGroupsec" runat="server" CssClass="btn btn-primary" OnClick="btnAddUserGroupsec_Click" CausesValidation="false"><i class="icon-plus"></i>  Create</asp:LinkButton>
                                <asp:LinkButton ID="btnDeleteUserGroupsec" runat="server" CssClass="btn btn-danger" OnClick="btnDeleteUserGroupsec_Click"><i class="icon-trash"></i>  Delete</asp:LinkButton>
                            </div>
                            <div class="col-sm-4">
                                <asp:Panel ID="pnlSeachUserGroupsec" runat="server" DefaultButton="btnSearchUserGroupsec" class="input-group">
                                    <asp:TextBox ID="txtSearchUserGroupsec" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                                    <div class="input-group-btn">
                                        <asp:LinkButton ID="btnSearchUserGroupsec" runat="server" CssClass="btn btn-info" OnClick="btnSearchUserGroupsec_Click" CausesValidation="false"><i class="icon-search"></i>  Search</asp:LinkButton>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <asp:UpdatePanel ID="updUserGroupsec" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListUserGroupsec" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                                    AllowPaging="true" PageSize="10" DataKeyNames="UID,GROUP_CODE"
                                    OnPageIndexChanging="gvwListUserGroupsec_PageIndexChanging" OnSelectedIndexChanged="gvwListUserGroupsec_SelectedIndexChanged" EmptyDataText="There is no data">
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
                                        <asp:BoundField DataField="GROUP_CODE" HeaderText="Code">
                                            <ItemStyle Width="20%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="UID" HeaderText="UID" Visible="false">
                                            <ItemStyle Width="80%" HorizontalAlign="left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="NAME" HeaderText="Name">
                                            <ItemStyle Width="80%" HorizontalAlign="left" />
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnAddUserGroupsec" EventName="Click"/>
                                <asp:AsyncPostBackTrigger ControlID="btnDeleteUserGroupsec" EventName="Click"/>
                                <asp:AsyncPostBackTrigger ControlID="btnSearchUserGroupsec" EventName="Click"/>
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            
            </div>
        </div>
    </section>
</asp:Content>

