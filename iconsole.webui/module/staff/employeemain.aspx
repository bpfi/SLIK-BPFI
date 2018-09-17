<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="employeemain.aspx.cs" Inherits="module_staff_employeemain" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Employee</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="R02001E" ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" CausesValidation="true"><i class="icon-click"></i>Save</asp:LinkButton>
                    <asp:LinkButton RoleCode="" ID="btnCancel" runat="server" CssClass="btn btn-danger" OnClick="btnCancel_Click" CausesValidation="false"><i class="icon-remove"></i>Cancel</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="panel-body form-horizontal">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-sm-6" style="display:none">
                            <div class="form-group">
                                <label class="col-sm-4">Code *</label>
                                <div class="col-sm-4">
                                    <cc1:XUILabel ID="lblEmployeeCode" runat="server" CssClass="form-control" DBColumnName="EMP_CODE" SPParameterName="p_emp_code" DataType="String" BindType="Both" MaxLength="10"></cc1:XUILabel>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Name *</label>
                                <asp:RequiredFieldValidator ID="rfvEmployeeName" runat="server" ErrorMessage="*" ControlToValidate="txtEmployeeName" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtEmployeeName" runat="server" CssClass="form-control" DBColumnName="EMP_NAME" SPParameterName="p_emp_name" DataType="String" BindType="Both" MaxLength="50"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Phone Number *</label>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtPhoneNo" runat="server" CssClass="form-control" DBColumnName="PHONE_NO" SPParameterName="p_phone_no" DataType="String" BindType="Both" MaxLength="15"></cc1:XUITextBox>
                                    <cc2:FilteredTextBoxExtender ID="FilteredtxtPhoneNo" runat="server" Enabled="True" TargetControlID="txtPhoneNo" FilterType="Numbers" FilterMode="ValidChars"></cc2:FilteredTextBoxExtender>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Date of Birth</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtDateOfBirth" Display="Dynamic"></asp:RequiredFieldValidator>                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtDateOfBirth" runat="server" CssClass="form-control default-date-picker" DBColumnName="DATE_OF_BIRTH" SPParameterName="p_date_of_birth" BindType="Both" DataType="DateTime" Format="dd/MM/yyyy"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Mobile Number *</label>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtHandphoneNo" runat="server" CssClass="form-control" DBColumnName="HANDPHONE_NO" SPParameterName="p_handphone_no" DataType="String" BindType="Both" MaxLength="15"></cc1:XUITextBox>
                                    <cc2:FilteredTextBoxExtender ID="FilteredtxtHandphoneNo" runat="server" Enabled="True" TargetControlID="txtHandphoneNo" FilterType="Numbers" FilterMode="ValidChars"></cc2:FilteredTextBoxExtender>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                         <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Address</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtAddress" Display="Dynamic"></asp:RequiredFieldValidator>                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtAddress" runat="server" CssClass="form-control" DBColumnName="ADDRESS" SPParameterName="p_address" DataType="String" BindType="Both" TextMode="MultiLine" MaxLength="400"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Personal Info</label>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtPersonalInfo" runat="server" CssClass="form-control" DBColumnName="PERSONAL_INFO" SPParameterName="p_personal_info" TextMode="MultiLine" DataType="String" BindType="Both" MaxLength="400"></cc1:XUITextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">City *</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtCity" Display="Dynamic"></asp:RequiredFieldValidator>                                                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtCity" runat="server" CssClass="form-control" DBColumnName="CITY" SPParameterName="p_city" DataType="String" BindType="Both" MaxLength="20"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Email 1</label>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtEmail" runat="server" CssClass="form-control" DBColumnName="EMAIL" SPParameterName="p_email" DataType="String" BindType="Both" MaxLength="200"></cc1:XUITextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=row>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Post Code</label>
                                <div class="col-sm-7">
                                    <asp:LinkButton ID="btnLookupZipCode" runat="server" class="btn btn-primary" data-togel="modal" CausesValidation="false"><i class="icon-table"></i> </asp:LinkButton>
                                    <cc1:XUILabel ID="lblZipCodeDescription" runat="server" DBColumnName="ZIP_CODE_DESCRIPTION" DataType="String" BindType="DBToUIOnly" ></cc1:XUILabel>
                                    <cc1:XUITextBox ID="txtPostCode" runat="server" CssClass="form-control" DBColumnName="POST_CODE" SPParameterName="p_post_code" DataType="String" BindType="Both" MaxLength="10" style="display:none;"></cc1:XUITextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Email 2</label>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtEmail2" runat="server" CssClass="form-control" DBColumnName="EMAIL2" SPParameterName="p_email2" DataType="String" BindType="Both" MaxLength="200"></cc1:XUITextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=row>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Status</label>
                                <div class="col-sm-7">
                                    <cc1:XUILabel ID="lblStatus" runat="server" DBColumnName="STATUS" SPParameterName="p_status" DataType="String" BindType="Both"></cc1:XUILabel>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Position</label>
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="ddlPosition" runat="server" DBColumnName="POSITION" SPParameterName="p_position" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="COLLECTOR" Text="COLLECTOR"></asp:ListItem>
                                        <asp:ListItem Value="SURVEYOR" Text="SURVEYOR"></asp:ListItem>
                                        <asp:ListItem Value="MARKETING" Text="MARKETING"></asp:ListItem>
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
        <header class="panel-heading tab-bg-dark-navy-blue">
            <asp:TextBox ID="txtTabCode" runat="server" style="display:none"></asp:TextBox>
            <ul class="nav nav-tabs nav-justified">
                <li class="active">
                    <a href="#Branch" id="emp_branch" onclick="javascript:fnSetTab('emp_branch');" data-toggle="tab">
                        Branch
                    </a>
                  </li>
                <li class="">
                    <a href="#Device" id="emp_device" onclick="javascript:fnSetTab('emp_device');" data-toggle="tab">
                        Device
                    </a>
                </li>
                <li class="">
                    <a href="#Geotag" id="emp_geotag_log" onclick="javascript:fnSetTab('emp_geotag_log');" data-toggle="tab">
                        Geotag
                    </a>
                </li>
            </ul>
        </header>
        <div class="panel-body">
            <div class="tab-content tasi-tab">
            
                <div class="tab-pane active" id="Branch">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-sm-8 ">
                                <asp:LinkButton ID="btnAddEmployeeBranch" RoleCode="R020011C" runat="server" CssClass="btn btn-primary" OnClick="btnAddEmployeeBranch_Click"><i class="icon-plus"></i>  Create</asp:LinkButton>
                                <asp:LinkButton ID="btnDeleteEmployeeBranch" RoleCode="R020011D" runat="server" CssClass="btn btn-danger" OnClick="btnDeleteEmployeeBranch_Click"><i class="icon-trash"></i>  Delete</asp:LinkButton>
                            </div>
                            <div class="col-sm-4 ">
                                <asp:Panel ID="pnlSearchEMPBranch" runat="server" DefaultButton="btnSearchEmployeeBranch" class="input-group">
                                    <asp:TextBox ID="txtSearchEMPBranch" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                                        <div class="input-group-btn">
                                            <asp:LinkButton ID="btnSearchEmployeeBranch" runat="server" CssClass="btn btn-info" OnClick="btnSearchEmployeeBranch_Click"><i class="icon-search"></i>  Search</asp:LinkButton>
                                        </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <asp:UpdatePanel ID="updEMPBranch" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListEmployeeBranch" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                                    AllowPaging="true" PageSize="10" DataKeyNames="EMP_CODE,BRANCH_CODE" OnPageIndexChanging="gvwListEmployeeBranch_PageIndexChanging" 
                                    Onselectedindexchanged="gvwListEmployeeBranch_SelectedIndexChanged" EmptyDataText="There is no data">
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
                                        <asp:BoundField DataField="BRANCH_CODE" HeaderText="Code">
                                            <ItemStyle Width="10%" HorizontalAlign="Center"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DESCRIPTION" HeaderText="Description">
                                            <ItemStyle Width="90%" HorizontalAlign="Left" />
                                        </asp:BoundField>                                    
                                        <asp:CommandField ShowSelectButton="true" />
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnAddEmployeeBranch" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnDeleteEmployeeBranch" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnSearchEmployeeBranch" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
                
                <div class="tab-pane" id="Device">
                    <div class =" panel-heading">
                        <div class="row">
                            <div class="col-sm-8 ">
                                <asp:LinkButton ID="btnAddEmployeeDevice" RoleCode="R020012C" runat="server" CssClass="btn btn-primary" OnClick="btnAddEmployeeDevice_Click"><i class="icon-plus"></i>  Create</asp:LinkButton>
                                <asp:LinkButton ID="btnDeleteEmployeeDevice" RoleCode="R020012D" runat="server" CssClass="btn btn-danger" OnClick="btnDeleteEmployeeDevice_Click"><i class="icon-trash" ></i>  Delete</asp:LinkButton>
                            </div>
                            <div class="col-sm-4 ">
                                <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearchEmployeeDevice" class="input-group">
                                <asp:TextBox ID="txtSearchEmployeeDevice" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                                    <div class="input-group-btn">
                                        <asp:LinkButton ID="btnSearchEmployeeDevice" runat="server" CssClass="btn btn-info" OnClick="btnSearchEmployeeDevice_Click"><i class="icon-search"></i>  Search</asp:LinkButton>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListEmployeeDevice" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                                    AllowPaging="true" PageSize="10" DataKeyNames="ID"
                                    Onselectedindexchanged="gvwListEmployeeDevice_SelectedIndexChanged" EmptyDataText="There is no data">
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
                                            <asp:CheckBox runat="server" ID="chbCheckedAllDevice" AutoPostBack="true" OnCheckedChanged="chbCheckedAll_CheckedChanged"/>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" ID="chbChecked"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CODE" HeaderText="Code">
                                        <ItemStyle Width="10%" HorizontalAlign="Center"/>
                                    </asp:BoundField>     
                                    <asp:BoundField DataField="SPECIFICATION" HeaderText="Specification">
                                        <ItemStyle Width="40%" HorizontalAlign="Left"/>
                                    </asp:BoundField>            
                                    <asp:BoundField DataField="EFF_DATE" HeaderText="Effective Date" DataFormatString="{0:dd/MM/yyyy}">
                                        <ItemStyle Width="25%" HorizontalAlign="Center"/>
                                    </asp:BoundField> 
                                    <asp:BoundField DataField="LAST_DATE" HeaderText="Last Date" DataFormatString="{0:dd/MM/yyy}">
                                        <ItemStyle Width="25%" HorizontalAlign="Center"/>
                                    </asp:BoundField>                      
                                    <asp:CommandField ShowSelectButton="true" />
                                </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnAddEmployeeDevice" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnDeleteEmployeeDevice" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnSearchEmployeeDevice" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div> 
                </div>
                
                <div class="tab-pane" id="Geotag">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-sm-8 ">     
                            </div>
                            <div class="col-sm-4 ">
                                <asp:Panel ID="pnlGeotag" runat="server" DefaultButton="btnSearchGeotag" class="input-group">
                                    <asp:TextBox ID="txtSearchGeotag" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                                        <div class="input-group-btn">
                                            <asp:LinkButton ID="btnSearchGeotag" runat="server" CssClass="btn btn-info" OnClick="btnSearchGeotag_Click"><i class="icon-search"></i>  Search</asp:LinkButton>
                                        </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <asp:UpdatePanel ID="updGeotag" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListGeotag" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                                    AllowPaging="true" PageSize="10" DataKeyNames="EMP_CODE"
                                    OnPageIndexChanging="gvwListGeotag_PageIndexChanging" 
                                    Onselectedindexchanged="gvwListGeotag_SelectedIndexChanged" EmptyDataText="There is no data">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <span>No</span>
                                            </HeaderTemplate> 
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="LOG_DATE" HeaderText="Log Date" DataFormatString="{0:dd/MM/yyyy}">
                                            <ItemStyle Width="40%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LAT_COORD" HeaderText="Latitute Coordinate">
                                            <ItemStyle Width="30%" HorizontalAlign="Center"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LONG_COORD" HeaderText="Longitude Coordinate">
                                            <ItemStyle Width="30%" HorizontalAlign="Center"/>
                                        </asp:BoundField>                                       
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSearchGeotag" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>   
            </div>
        </div>
    </section>      
</asp:Content>