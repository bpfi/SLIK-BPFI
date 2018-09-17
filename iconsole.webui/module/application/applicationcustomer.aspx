<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="applicationcustomer.aspx.cs" Inherits="module_application_applicationcustomer" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">

    <div class="row">
        <div class="col-sm-12">
            <asp:LinkButton RoleCode="" ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" CausesValidation="true"><i class="icon-save"></i>  Save</asp:LinkButton>
            <asp:LinkButton RoleCode="" ID="btnCancel" runat="server" CssClass="btn btn-danger" OnClick="btnCancel_Click" CausesValidation="false"><i class="icon-remove"></i>Cancel</asp:LinkButton>
        </div>
    </div>

    <div class="row">        
        <div class="col-sm-6">
            <div class="panel-heading">     
            </div>            
             <section class="panel col-sm-12">
                <header class="panel-heading">
                    <span>Customer</span>
                </header>
                <div class="panel-body form-horizontal">
                    <asp:UpdatePanel ID="upd" runat="server">
                        <ContentTemplate>        
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="col-sm-4">Application No</label>
                                            <asp:RequiredFieldValidator ID="rfvApplicationNoCustomer" runat="server" ErrorMessage="*" ControlToValidate="txtApplicationNoCustomer" Display="Dynamic"></asp:RequiredFieldValidator>                                                               
                                         <div class="col-sm-4">
                                            <cc1:XUITextBox ID="txtApplicationNoCustomer" runat="server" CssClass="form-control" DBColumnName="APPLICATION_NO" SPParameterName="p_application_no" DataType="String" MaxLength="10" BindType="Both"></cc1:XUITextBox>
                                         </div>
                                    </div>
                                </div>
                            </div>   
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label class="col-sm-4">Name</label>
                                                <asp:RequiredFieldValidator ID="rfvNameCustomer" runat="server" ErrorMessage="*" ControlToValidate="txtNameCustomer" Display="Dynamic"></asp:RequiredFieldValidator>                                                               
                                             <div class="col-sm-7">
                                                <cc1:XUITextBox ID="txtNameCustomer" runat="server" CssClass="form-control" DBColumnName="NAME" SPParameterName="p_name" DataType="String" MaxLength="50" BindType="Both"></cc1:XUITextBox>
                                            </div>
                                        </div>                            
                                    </div>
                                </div>                  
                               <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label class="col-sm-4">ID No</label>
                                                <asp:RequiredFieldValidator ID="rfvIdNoCustomer" runat="server" ErrorMessage="*" ControlToValidate="txtIdNoCustomer" Display="Dynamic"></asp:RequiredFieldValidator>                                                               
                                             <div class="col-sm-7">
                                                <cc1:XUITextBox ID="txtIdNoCustomer" runat="server" CssClass="form-control" DBColumnName="ID_NO" SPParameterName="p_id_no" DataType="String" MaxLength="20" BindType="Both"></cc1:XUITextBox>
                                            </div>
                                        </div>                            
                                    </div>
                                </div>                            
                               <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label class="col-sm-4">Mother Name</label>
                                                <asp:RequiredFieldValidator ID="rfvMotherNameCustomer" runat="server" ErrorMessage="*" ControlToValidate="txtMotherNameCustomer" Display="Dynamic"></asp:RequiredFieldValidator>                                                               
                                             <div class="col-sm-7">
                                                <cc1:XUITextBox ID="txtMotherNameCustomer" runat="server" CssClass="form-control" DBColumnName="MOTHER_NAME" SPParameterName="p_mother_name" DataType="String" MaxLength="50" BindType="Both"></cc1:XUITextBox>
                                            </div>
                                        </div>                            
                                    </div>
                                </div>                                
                               <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label class="col-sm-4">Gender</label>
                                                <asp:RequiredFieldValidator ID="rfvGenderCustomer" runat="server" ErrorMessage="*" ControlToValidate="ddlGenderCustomer" Display="Dynamic"></asp:RequiredFieldValidator>                                                               
                                             <div class="col-sm-4">
                                                  <cc1:XUIDropDownList ID="ddlGenderCustomer" runat="server" CssClass="form-control" DBColumnName="GENDER" SPParameterName="p_gender" DataType="String" BindType="Both">
                                                    <asp:ListItem Value="F" Text="FEMALE"></asp:ListItem>    
                                                    <asp:ListItem Value="M" Text="MALE"></asp:ListItem>                                                                                                                                                                                                                            
                                                </cc1:XUIDropDownList>
                                            </div>
                                        </div>                            
                                    </div>
                              </div>                          
                              <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                          <label class="col-sm-4">Date Of Birth</label>
                                           <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ErrorMessage="*" ControlToValidate="txtDOBCustomer" Display="Dynamic"></asp:RequiredFieldValidator>                                                               
                                           <div class="col-sm-4">
                                               <cc1:XUITextBox ID="txtDOBCustomer" runat="server" CssClass="form-control default-date-picker"  DBColumnName="DATE_OF_BIRTH" SPParameterName="p_date_of_birth" DataType="DateTime" BindType="Both" Format="dd/MM/yyyy"> </cc1:XUITextBox>
                                           </div>
                                        </div>                            
                                    </div>
                             </div>                                
                              <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label class="col-sm-4">Address</label>
                                                <asp:RequiredFieldValidator ID="rfvAddressCustomer" runat="server" ErrorMessage="*" ControlToValidate="txtAddressCustomer" Display="Dynamic"></asp:RequiredFieldValidator>                                                               
                                             <div class="col-sm-7">
                                                <cc1:XUITextBox ID="txtAddressCustomer" runat="server" CssClass="form-control" DBColumnName="ADDRESS" SPParameterName="p_address" DataType="String" MaxLength="200" TextMode="MultiLine"  BindType="Both"></cc1:XUITextBox>
                                            </div>
                                        </div>                            
                                    </div>
                              </div>                                
                              <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label class="col-sm-4">Phone No</label>
                                                <asp:RequiredFieldValidator ID="rfvPhoneNoCustomer"  runat="server" ErrorMessage="*" ControlToValidate="txtPhoneNoCustomer" Display="Dynamic"> </asp:RequiredFieldValidator>                                                               
                                             <div class="col-sm-7">
                                                <cc1:XUITextBox ID="txtPhoneNoCustomer" runat="server" CssClass="form-control" DBColumnName="PHONE_NO" SPParameterName="p_phone_no" DataType="String" MaxLength="12"  BindType="Both"></cc1:XUITextBox>
                                            </div>
                                        </div>                            
                                    </div>
                              </div>                                
                              <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label class="col-sm-4">Mobile No</label>
                                                <asp:RequiredFieldValidator ID="rfvMobileNoCustomer" runat="server" ErrorMessage="*" ControlToValidate="txtMobileNoCustomer" Display="Dynamic"></asp:RequiredFieldValidator>                                                               
                                             <div class="col-sm-5">
                                                <cc1:XUITextBox ID="txtMobileNoCustomer" runat="server" CssClass="form-control" DBColumnName="MOBILE_NO" SPParameterName="p_mobile_no" DataType="String" MaxLength="20"  BindType="Both"></cc1:XUITextBox>
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
        </div>
        
        <div class="col-sm-6">
            <div class="panel-heading">     
            </div>        
            <section class="panel col-sm-12">
                <header class="panel-heading">
                    <span>Object</span>
                </header>
                <div class="panel-body form-horizontal">
                    <asp:UpdatePanel ID="updApplicationObject" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group" style="display:none">
                                        <label class="col-sm-4">Customer</label>
                                        <div class="col-sm-4">
                                            <asp:LinkButton ID="btnLookUpApplicationObject" runat="server" class="btn btn-primary" data-togel="modal" CausesValidation="false"><i class="icon-table"></i> </asp:LinkButton>
                                            <cc1:XUILabel ID="lblNameObject" runat="server" DBColumnName="NAME" DataType="String" BindType="DBToUIOnly" ></cc1:XUILabel>
                                            <cc1:XUITextBox ID="txtApplicationNoObject" runat="server" CssClass="form-control" DBColumnName="APPLICATION_NO" SPParameterName="p_application_no"  DataType="String" BindType="Both" style="display:none"></cc1:XUITextBox>
                                        </div>
                                    </div>
                                </div>
                             </div>
                             <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="col-sm-3">Type</label>
                                            <asp:RequiredFieldValidator ID="rfvTypeObject" runat="server" ErrorMessage="*" ControlToValidate="txtTypeObject" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <div class="col-sm-7">
                                            <cc1:XUITextBox ID="txtTypeObject" runat="server" CssClass="form-control" DBColumnName="OBJECT_TYPE" SPParameterName="p_object_type" DataType="String" BindType="Both" MaxLength="50"></cc1:XUITextBox>
                                        </div>
                                    </div>                            
                                </div>
                             </div>
                             <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="col-sm-3">Info</label>
                                            <asp:RequiredFieldValidator ID="rfvInfoObject" runat="server" ErrorMessage="*" ControlToValidate="txtInfoObject" Display="Dynamic"></asp:RequiredFieldValidator>                                    
                                        <div class="col-sm-7">
                                            <cc1:XUITextBox ID="txtInfoObject" runat="server" CssClass="form-control" DBColumnName="OBJECT_INFO" SPParameterName="p_object_info" DataType="String" BindType="Both" TextMode="MultiLine"></cc1:XUITextBox>
                                        </div>
                                    </div>
                                </div>
                             </div>
                             <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="col-sm-3">Amount</label>
                                            <asp:RequiredFieldValidator ID="rfvAmountObject" runat="server" ErrorMessage="*" ControlToValidate="txtAmountObject" Display="Dynamic"></asp:RequiredFieldValidator>                                
                                        <div class="col-sm-7">
                                            <cc1:XUITextBox ID="txtAmountObject" runat="server" CssClass="form-control" DBColumnName="OBJECT_AMOUNT" SPParameterName="p_object_amount" BindType="Both" DataType="Number" Format="N2"></cc1:XUITextBox>
                                        </div>
                                    </div>                            
                                 </div>
                             </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </section>
        </div>
        
        <div class="col-sm-6">
            <div class="panel-heading">     
            </div>      
            <section class="panel col-sm-12">
                <header class="panel-heading">
                    <span>TC</span>
                </header>
                <div class="panel-body form-horizontal">
                    <asp:UpdatePanel ID="updApplicationTc" runat="server">
                        <ContentTemplate>        
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group" style="display:none">
                                        <label class="col-sm-3">Application No</label>
                                        <div class="col-sm-3">
                                            <asp:LinkButton ID="btnLookUpApplicationNoTc" runat="server" class="btn btn-primary" data-togel="modal" ><i class = "icon-table"></i> </asp:LinkButton>  
                                            <cc1:XUILabel ID="lblNameTc" runat="server" DBColumnName="NAME" DataType="String" BindType="DBToUIOnly" ></cc1:XUILabel>
                                            <cc1:XUITextBox ID="txtApplicationNoTc" runat="server" DBColumnName="APPLICATION_NO" SPParameterName="p_application_no" CssClass="form-control" MaxLength="10" DataType="String" BindType="Both" style="display:none"></cc1:XUITextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="col-sm-3"></label>
                                         <div class="col-sm-5">
                                        </div>
                                    </div>                            
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="col-sm-3">Tenor</label>
                                            <asp:RequiredFieldValidator ID="rfvTenorTc" runat="server" ErrorMessage="*" ControlToValidate="txtTenorTc" Display="Dynamic"></asp:RequiredFieldValidator>                                                               
                                        <div class="col-sm-5">
                                            <cc1:XUITextBox ID="txtTenorTc" runat="server" CssClass="form-control" DBColumnName="TENOR" SPParameterName="p_tenor" DataType="Integer" BindType="Both"></cc1:XUITextBox>
                                        </div>
                                    </div>                            
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="col-sm-3">Rate</label>
                                            <asp:RequiredFieldValidator ID="rfvRateTc" runat="server" ErrorMessage="*" ControlToValidate="txtRateTc" Display="Dynamic"></asp:RequiredFieldValidator>                                                               
                                         <div class="col-sm-5">
                                            <cc1:XUITextBox ID="txtRateTc" runat="server" CssClass="form-control" DBColumnName="RATE" SPParameterName="p_rate" DataType="Number"  BindType="Both"></cc1:XUITextBox>
                                        </div>
                                    </div>                            
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="col-sm-3"></label>
                                         <div class="col-sm-5">
                                        </div>
                                    </div>                            
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="col-sm-3"></label>
                                         <div class="col-sm-5">
                                        </div>
                                    </div>                            
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>  
            </section>
        </div>        
    </div>
                   
    <section class="panel">
        <header class="panel-heading">
            <span>Collateral</span>
        </header>
        <div class="panel-body form-horizontal">
            <asp:UpdatePanel ID="updApplicationCollateral" runat="server">
                <ContentTemplate>  
                    <div class="row">
                        <div class="col-sm-7">
                            <div class="form-group" style="display:none">
                                <label class="col-sm-3">Application No</label>
                                <div class="col-sm-3">                                    
                                    <asp:LinkButton ID="btnLookUpApplicationNoCollateral" runat="server" class="btn btn-primary" data-togel="modal" CausesValidation="false"><i class="icon-table"></i> </asp:LinkButton>
                                    <cc1:XUILabel ID="lblNameCollateral" runat="server" DBColumnName="NAME" DataType="String" BindType="DBToUIOnly" ></cc1:XUILabel>                                    
                                    <cc1:XUITextBox ID="txtApplicationNoCollateral" runat="server" CssClass="form-control" DBColumnName="APPLICATION_NO" SPParameterName="p_application_no"  DataType="String" BindType="Both" style="display:none"></cc1:XUITextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="form-group">
                                <label class="col-sm-3">Type</label>
                                    <asp:RequiredFieldValidator ID="rfvTypeCollateral" runat="server" ErrorMessage="*" ControlToValidate="txtTypeCollateral" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-5">
                                    <cc1:XUITextBox ID="txtTypeCollateral" runat="server" CssClass="form-control" DBColumnName="COLLATERAL_TYPE" SPParameterName="p_collateral_type" DataType="String" BindType="Both" MaxLength="50"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="form-group">
                                <label class="col-sm-3">Info</label>
                                    <asp:RequiredFieldValidator ID="rfvInfoCollateral" runat="server" ErrorMessage="*" ControlToValidate="txtInfoCollateral" Display="Dynamic"></asp:RequiredFieldValidator>                                    
                                <div class="col-sm-5">
                                    <cc1:XUITextBox ID="txtInfoCollateral" runat="server" CssClass="form-control" DBColumnName="COLLATERAL_INFO" SPParameterName="p_collateral_info" DataType="String" BindType="Both" TextMode="MultiLine"></cc1:XUITextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="form-group">
                                <label class="col-sm-3">Amount</label>
                                    <asp:RequiredFieldValidator ID="rfvAmountCollateral" runat="server" ErrorMessage="*" ControlToValidate="txtAmountCollateral" Display="Dynamic"></asp:RequiredFieldValidator>                                
                                <div class="col-sm-3">
                                    <cc1:XUITextBox ID="txtAmountCollateral" runat="server" CssClass="form-control" DBColumnName="COLLATERAL_AMOUNT" SPParameterName="p_collateral_amount" BindType="Both" DataType="Number" Format="N2"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>   
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </section>
                
    <section class="panel">
        <header class="panel-heading">
            <span>Document List</span>
        </header>
        <div class="panel">
            <div class="row">
                <div class="col-sm-8">
                </div>
                <div class="col-sm-4 ">
                    <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearchApplicationDocument" class="input-group">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                        <div class="input-group-btn">
                            <asp:LinkButton ID="btnSearchApplicationDocument" runat="server" CssClass="btn btn-info" OnClick="btnSearchApplicationDocument_Click"><i class="icon-search"></i>  Search</asp:LinkButton>
                        </div>
                    </asp:Panel>
                </div> 
            </div>    
            <div class="panel-body">      
                <asp:UpdatePanel ID="updDocumentList" runat="server">
                    <ContentTemplate> 
                        <asp:GridView ID="gvwListApplicationDocument" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                            AllowPaging="true" PageSize="10" DataKeyNames="ID,APPLICATION_NO" OnPageIndexChanging="gvwListApplicationDocument_PageIndexChanging" Onselectedindexchanged="gvwListApplicationDocument_SelectedIndexChanged" EmptyDataText="There is no data">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <span>No</span>
                                    </HeaderTemplate> 
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ID" HeaderText="ID">
                                    <ItemStyle Width="20%" HorizontalAlign="center"/>
                                </asp:BoundField>  
                                <asp:BoundField DataField="NAME" HeaderText="Name">
                                    <ItemStyle Width="30%" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="FILE_NAME" HeaderText="File Name">
                                    <ItemStyle Width="40%" HorizontalAlign="left"/>
                                </asp:BoundField>                                                                                                     
                                <asp:CommandField ShowSelectButton="true"/>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </section>  
</asp:Content>

