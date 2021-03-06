﻿<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="badanusahalist.aspx.cs" Inherits="module_debitur_badanusahalist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Badan Usaha List</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-4">
                    <asp:LinkButton ID="btnLookupSinkron" runat="server" class="btn btn-primary" data-togel="modal" CausesValidation="false"><i class="icon-table"></i> Tarik Data</asp:LinkButton>
                    <asp:LinkButton ID="btnExport" RoleCode="R03001D" runat="server" CssClass="btn btn-success" OnClick="btnExport_Click"><i class="icon-pencil"></i>  Export</asp:LinkButton>
                    <asp:LinkButton ID="btnUpload" RoleCode="R03001D" runat="server" CssClass="btn btn-info" data-togel="modal"><i class="icon-folder-open"></i>  Upload</asp:LinkButton>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                         <div class="col-sm-4">
                             <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                                      <asp:ListItem Text="Status" Value="Select Status"></asp:ListItem>
                                      <asp:ListItem Text="New" Value="0"></asp:ListItem>
                                      <asp:ListItem Text="Success" Value="1"></asp:ListItem>
                                      <asp:ListItem Text="Error" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                         </div>
                        <div class="col-sm-4">
                            <asp:DropDownList ID="ddlBulan" runat="server" CssClass="form-control">
                                      <asp:ListItem Text="Bulan" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-sm-4">
                            <asp:DropDownList ID="ddlTahun" runat="server" CssClass="form-control">
                                      <asp:ListItem Text="Tahun" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                 </div>
                 <div class="col-sm-4">
                     <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearch" class="input-group">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Keywords"></asp:TextBox>  
                        <div class="input-group-btn">
                            <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn btn-info" OnClick="btnSearch_Click"><i class="icon-search"></i>  Search</asp:LinkButton>
                        </div>
                     </asp:Panel>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                        AllowPaging="true" PageSize="10" DataKeyNames="CIF" OnPageIndexChanging="gvwList_PageIndexChanging" 
                        Onselectedindexchanged="SelectedIndexChanged" EmptyDataText="There is no data">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <span>No</span>
                                </HeaderTemplate> 
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CIF" HeaderText="CIF">
                                <ItemStyle Width="15%" HorizontalAlign="Center"  />
                            </asp:BoundField>
                            <asp:BoundField DataField="NAMA_BADAN_USAHA" HeaderText="Name">
                                <ItemStyle Width="20%" HorizontalAlign="left" />
                            </asp:BoundField>   
                            <asp:BoundField DataField="NOMOR_IDENTITAS" HeaderText="NO. IDENTITAS">
                                <ItemStyle Width="20%" HorizontalAlign="left" />
                            </asp:BoundField>   
                             <asp:TemplateField>
                                <HeaderTemplate>
                                    <span>Alamat</span>
                                </HeaderTemplate> 
                                <ItemStyle Width="60%"/>
                                <ItemTemplate>
                                    <asp:Label ID="lblAlamat" runat="server" Text='<%# Eval("ALAMAT")%>' Font-Bold="true"/><br />
                                    <asp:Label ID="lblKelurahan" runat="server" Text='<%# Eval("KELURAHAN")%>'/><br />
                                    <asp:Label ID="lblKecamatan" runat="server" Text='<%# Eval("KECAMATAN")%>'/><br />
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:BoundField DataField="NO_HP" HeaderText="No Telpon">
                                <ItemStyle Width="20%" HorizontalAlign="right" />
                            </asp:BoundField> 
                            <asp:BoundField DataField="CRE_DATE" HeaderText="DATE" DataFormatString="{0:dd/MM/yyyy}">
                                <ItemStyle Width="20%" HorizontalAlign="left"/>
                            </asp:BoundField> 
                            <asp:CommandField ShowSelectButton="true" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                      <asp:AsyncPostBackTrigger ControlID="btnExport" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </section> 
</asp:Content>

