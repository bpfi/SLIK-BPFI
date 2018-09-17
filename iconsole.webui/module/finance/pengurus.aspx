<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="pengurus.aspx.cs" Inherits="module_finance_pengurus" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>M01 - Pengurus</span>
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
                                <label class="col-sm-4">Identitas</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNO_IDENTITAS_PENGURUSAN" runat="server" DBColumnName="NO_IDENTITAS_PENGURUSAN" SPParameterName="p_no_identitas_pengurusan" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                                   
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Kode Identitas</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="ddlKD_JS_IDENTITAS" runat="server" DBColumnName="KD_JS_IDENTITAS" SPParameterName="p_kd_js_identitas" DataType="String" BindType="Both" CssClass="form-control">
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
                                    <cc1:XUITextBox ID="txtNAMA_PENGURUS" runat="server" DBColumnName="NAMA_PENGURUS" SPParameterName="p_nama_pengurus" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Gender</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtJS_KELAMIN" runat="server" DBColumnName="JS_KELAMIN" SPParameterName="p_js_kelamin" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Alamat</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtALAMAT" runat="server" DBColumnName="ALAMAT" SPParameterName="p_alamat" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Kelurahan</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtKELURAHAN" runat="server" DBColumnName="KELURAHAN" SPParameterName="p_kelurahan" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Kecamatan</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtKECAMATAN" runat="server" DBColumnName="KECAMATAN" SPParameterName="p_kecamatan" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Kota</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtKD_SANDI_KOTA" runat="server" DBColumnName="KD_SANDI_KOTA" SPParameterName="p_kd_sandi_kota" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Jabatan</label>
                                
                                <div class="col-sm-7">
                                     <cc1:XUIDropDownList ID="ddlKD_JABATAN" runat="server" DBColumnName="KD_JABATAN" SPParameterName="p_kd_jabatan" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="01" Text="PEMILIK - Direktur Utama / Pres. Dir"></asp:ListItem>
                                        <asp:ListItem Value="02" Text="PEMILIK – Direktur"></asp:ListItem>
                                        <asp:ListItem Value="03" Text="PEMILIK - Komisaris Utama / Pres. Kom"></asp:ListItem>
                                        <asp:ListItem Value="04" Text="PEMILIK – Komisaris"></asp:ListItem>
                                        <asp:ListItem Value="06" Text="PEMILIK - Kuasa Direksi"></asp:ListItem>
                                        <asp:ListItem Value="07" Text="PEMILIK - Pemilik Bukan Pengurus"></asp:ListItem>
                                        <asp:ListItem Value="09" Text="PEMILIK – Masyarakat"></asp:ListItem>
                                        <asp:ListItem Value="10" Text="PEMILIK - Ketua Umum"></asp:ListItem>
                                        <asp:ListItem Value="11" Text="PEMILIK – Ketua"></asp:ListItem>
                                        <asp:ListItem Value="12" Text="PEMILIK – Sekretaris"></asp:ListItem>
                                        <asp:ListItem Value="13" Text="PEMILIK - Bendahara"></asp:ListItem>
                                        <asp:ListItem Value="19" Text="PEMILIK - Lainnya"></asp:ListItem>
                                        <asp:ListItem Value="51" Text="BUKAN PEMILIK - Direktur Utama / Pres. Dir"></asp:ListItem>
                                        <asp:ListItem Value="52" Text="BUKAN PEMILIK - Direktur"></asp:ListItem>
                                        <asp:ListItem Value="53" Text="BUKAN PEMILIK - Komisaris Utama / Pres. Kom"></asp:ListItem>
                                        <asp:ListItem Value="54" Text="BUKAN PEMILIK - Komisaris"></asp:ListItem>
                                        <asp:ListItem Value="55" Text="BUKAN PEMILIK - Kuasa Direksi"></asp:ListItem>
                                        <asp:ListItem Value="57" Text="BUKAN PEMILIK - Ketua Umum "></asp:ListItem>
                                        <asp:ListItem Value="58" Text="BUKAN PEMILIK - Ketua"></asp:ListItem>
                                        <asp:ListItem Value="59" Text="BUKAN PEMILIK - Sekretaris"></asp:ListItem>
                                        <asp:ListItem Value="60" Text="BUKAN PEMILIK - Bendahara"></asp:ListItem>
                                        <asp:ListItem Value="69" Text="BUKAN PEMILIK - Lainnya"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Kepimilikan</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="ddlPANGSA_KEPEMILIKAN" runat="server" DBColumnName="PANGSA_KEPEMILIKAN" SPParameterName="p_pangsa_kepemilikan" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="1" Text="Aktif"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Telah Berakhir"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Status</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtSTATUS_PENGURUS" runat="server" DBColumnName="STATUS_PENGURUS" SPParameterName="p_status_pengurus" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
						<div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Cabang</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtKD_CABANG" runat="server" DBColumnName="KD_CABANG" SPParameterName="p_kd_cabang" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
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

