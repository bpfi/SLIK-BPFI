<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="penjamin.aspx.cs" Inherits="module_finance_penjamin" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>P01 - Penjamin</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-6">
                    <asp:LinkButton RoleCode="R03001E" ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" CausesValidation="true"><i class="icon-save"></i>  Correction</asp:LinkButton>
                    <asp:LinkButton RoleCode="" ID="btnCancel" runat="server" CssClass="btn btn-danger" OnClick="btnCancel_Click" CausesValidation="false"><i class="icon-remove"></i>  Cancel</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="panel-body form-horizontal">
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <div class="row">
                       <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">CIF</label>
                                <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="*" ControlToValidate="txtCIF" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtCIF" runat="server" DBColumnName="CIF" Enabled ="false" SPParameterName="p_cif" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                       <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">No. Rek</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNO_REKENING" runat="server" DBColumnName="NO_REKENING" SPParameterName="p_no_rekening" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Identitas</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNO_IDENTITAS_PENJAMIN" runat="server" DBColumnName="NO_IDENTITAS_PENJAMIN" SPParameterName="p_no_identitas_penjamin" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Segmen Fasilitas</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="ddlKD_JS_SEGMEN_FASILITAS" runat="server" DBColumnName="KD_JS_SEGMEN_FASILITAS" SPParameterName="p_kd_js_segmen_fasilitas" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Text="Kredit" Value="F01"></asp:ListItem>
                                        <asp:ListItem Text="Kredit Joint Account" Value="F02"></asp:ListItem>
                                        <asp:ListItem Text="Surat Berharga" Value="F03"></asp:ListItem>
                                        <asp:ListItem Text="Irrevocable Letter of Credit" Value="F04"></asp:ListItem>
                                        <asp:ListItem Text="Bank Garansi" Value="F05"></asp:ListItem>
                                        <asp:ListItem Text="Fasilitas Lainnya" Value="F06"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Jenis Identitas</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="ddlKD_JS_IDENTITAS_PENJAMIN" runat="server" DBColumnName="KD_JS_IDENTITAS_PENJAMIN" SPParameterName="p_kd_js_identitas_penjamin" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="1" Text="KTP"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="PASSPOR"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="NPWP"></asp:ListItem>
                                        <asp:ListItem Value="9" Text="Lainnya"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Nama</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNAMA_PENJAMIN" runat="server" DBColumnName="NAMA_PENJAMIN" SPParameterName="p_nama_penjamin" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Nama Lengkap</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNAMA_LENGKAP" runat="server" DBColumnName="NAMA_LENGKAP" SPParameterName="p_nama_lengkap" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Gol. Penjamin</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtKD_GOL_PENJAMIN" runat="server" DBColumnName="KD_GOL_PENJAMIN" SPParameterName="p_kd_gol_penjamin" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Alamat</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtALAMAT_PENJAMIN" runat="server" DBColumnName="ALAMAT_PENJAMIN" SPParameterName="p_alamat_penjamin" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Presentase</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtPERSENTASE_DIJAMIN" runat="server" CssClass="form-control" DBColumnName="PERSENTASE_DIJAMIN" SPParameterName="p_persentase_dijamin" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Keterangan</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtKETERANGAN" runat="server" DBColumnName="KETERANGAN" SPParameterName="p_keterangan" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Cabang</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtKD_CABANG" runat="server" DBColumnName="KD_CABANG" SPParameterName="p_kd_cabang" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Operasi Data</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="ddlOPERASI_DATA" runat="server" DBColumnName="OPERASI_DATA" SPParameterName="p_operasi_data" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Text="Create" Value="C"></asp:ListItem>
                                        <asp:ListItem Text="Update" Value="U"></asp:ListItem>
                                        <asp:ListItem Text="Not change" Value="U"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-6" style="display:none">
                            <div class="form-group">
                                <label class="col-sm-4">Create Date</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtCRE_DATE" runat="server" DBColumnName="CRE_DATE" SPParameterName="p_cre_date" CssClass="form-control  default-date-picker" DataType="DateTime" BindType="Both" Format="dd/MM/yyyy"></cc1:XUITextBox>
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

