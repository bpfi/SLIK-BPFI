<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="agunan.aspx.cs" Inherits="module_finance_agunan" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>A01 - Agunan</span>
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
                                    <cc1:XUITextBox ID="txtNO_REKENING_FASILITAS" runat="server" DBColumnName="NO_REKENING_FASILITAS" SPParameterName="p_no_rekening_fasilitas" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Registrasi</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtKD_REGISTRASI" runat="server" DBColumnName="KD_REGISTRASI" SPParameterName="p_kd_registrasi" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Segmen Fasilitas</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="ddlKD_JS_SEGMEN_FASILITAS" runat="server" DBColumnName="KD_JS_SEGMEN_FASILITAS" SPParameterName="p_kd_js_segmen_fasilitas" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="F01" Text="Kredit "></asp:ListItem>
                                        <asp:ListItem Value="F02" Text="Kredit Joint Account"></asp:ListItem>
                                        <asp:ListItem Value="F03" Text="Surat Berharga"></asp:ListItem>
                                        <asp:ListItem Value="F04" Text="Irrevocable Letter of Credit  "></asp:ListItem>
                                        <asp:ListItem Value="F05" Text="Bank Garansi"></asp:ListItem>
                                        <asp:ListItem Value="F06" Text="Fasilitas Lainnya"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Status</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="ddlKD_STATUS_AGUNAN" runat="server" DBColumnName="KD_STATUS_AGUNAN" SPParameterName="p_kd_status_agunan" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="1" Text="Tersedia"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Indent"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Jenis Agunan</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="ddlKD_JENIS_AGUNAN" runat="server" DBColumnName="KD_JENIS_AGUNAN" SPParameterName="p_kd_jenis_agunan" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="010" Text="Giro"></asp:ListItem>
                                        <asp:ListItem Value="020" Text="Tabungan"></asp:ListItem>
                                        <asp:ListItem Value="041" Text="Simpanan Berjangka"></asp:ListItem>
                                        <asp:ListItem Value="042" Text="Sertifikat Bank Indonesia (SBI)"></asp:ListItem>
                                        <asp:ListItem Value="043" Text="Surat Perbendaharaan Negara (SPN)"></asp:ListItem>
                                        <asp:ListItem Value="044" Text="Sertifikat Deposito Bank Indonesia"></asp:ListItem>
                                        <asp:ListItem Value="045" Text="Surat Berharga Bank Indonesia dalam valuta Asing (SBBI Valas)"></asp:ListItem>
                                        <asp:ListItem Value="086" Text="Obligasi Negara (ON)"></asp:ListItem>
                                        <asp:ListItem Value="087" Text="Obligasi Ritel Indonesia (ORI)"></asp:ListItem>
                                        <asp:ListItem Value="091" Text="Saham"></asp:ListItem>
                                        <asp:ListItem Value="081" Text="Reksadana"></asp:ListItem>
                                        <asp:ListItem Value="092" Text="Resi Gudang"></asp:ListItem>
                                        <asp:ListItem Value="099" Text="Surat Berharga Lainnya"></asp:ListItem>
                                        <asp:ListItem Value="040" Text="Standby Letter of Credit (SBLC)"></asp:ListItem>
                                        <asp:ListItem Value="161" Text="Gedung"></asp:ListItem>
                                        <asp:ListItem Value="162" Text="Gudang"></asp:ListItem>
                                        <asp:ListItem Value="163" Text="Rumah Toko/Rumah Kantor/Kios"></asp:ListItem>
                                        <asp:ListItem Value="164" Text="Hotel"></asp:ListItem>
                                        <asp:ListItem Value="175" Text="Properti Komersial Lainnya"></asp:ListItem>
                                        <asp:ListItem Value="176" Text="Rumah Tinggal"></asp:ListItem>
                                        <asp:ListItem Value="177" Text="Apartemen/Rumah Susun"></asp:ListItem>
                                        <asp:ListItem Value="187" Text="Tanah"></asp:ListItem>
                                        <asp:ListItem Value="189" Text="Kendaraan Bermotor"></asp:ListItem>
                                        <asp:ListItem Value="190" Text="Mesin"></asp:ListItem>
                                        <asp:ListItem Value="191" Text="Pesawat Udara"></asp:ListItem>
                                        <asp:ListItem Value="192" Text="Kapal Laut"></asp:ListItem>
                                        <asp:ListItem Value="193" Text="Persediaan"></asp:ListItem>
                                        <asp:ListItem Value="250" Text="Agunan Lainnya"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Lembaga Pemeringkat</label>
                                
                                <div class="col-sm-7">
                                     <cc1:XUIDropDownList ID="ddlPERINGKAT_AGUNAN" runat="server" DBColumnName="PERINGKAT_AGUNAN" SPParameterName="p_peringkat_agunan" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="10" Text="MOODY'S"></asp:ListItem>
                                        <asp:ListItem Value="11" Text="STANDARD AND POOR'S"></asp:ListItem>
                                        <asp:ListItem Value="12" Text="FITCH RATING"></asp:ListItem>
                                        <asp:ListItem Value="13" Text="PEFINDO"></asp:ListItem>
                                        <asp:ListItem Value="14" Text="ICRA INDONESIA"></asp:ListItem>
                                        <asp:ListItem Value="15" Text="FITCH INDONESIA"></asp:ListItem>
                                        <asp:ListItem Value="99" Text="LAINNYA"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Lembaga Pemeringkat</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtKD_LEMBAGA_PEMERINGKAT" runat="server" DBColumnName="KD_LEMBAGA_PEMERINGKAT" SPParameterName="p_kd_lembaga_pemeringkat" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>

                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Jenis Pengikatan</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="ddlKD_JENIS_PENGIKATAN" runat="server" DBColumnName="KD_JENIS_PENGIKATAN" SPParameterName="p_kd_jenis_pengikatan" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="01" Text="Hak Tanggungan"></asp:ListItem>
                                        <asp:ListItem Value="02" Text="Gadai"></asp:ListItem>
                                        <asp:ListItem Value="03" Text="Fiduciare Eigendom Overdracht (FEO)"></asp:ListItem>
                                        <asp:ListItem Value="04" Text="Surat Kuasa Membebankan Hak Tanggungan (SKMHT)"></asp:ListItem>
                                        <asp:ListItem Value="05" Text="Cessie"></asp:ListItem>
                                        <asp:ListItem Value="06" Text="Belum Diikat"></asp:ListItem>
                                        <asp:ListItem Value="99" Text="Lainnya"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Tanggal Pengikatan</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtTGL_PENGIKATAN" runat="server" CssClass="form-control default-date-picker" DBColumnName="TGL_PENGIKATAN" SPParameterName="p_tgl_pengikatan" BindType="Both" DataType="DateTime" Format="dd/MM/yyyy"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Nama Pemilik</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNAMA_PEMILIK_AGUNAN" runat="server" DBColumnName="NAMA_PEMILIK_AGUNAN" SPParameterName="p_nama_pemilik_agunan" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Bukti Kepimilikan</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtBUKTI_KEPEMILIKAN" runat="server" DBColumnName="BUKTI_KEPEMILIKAN" SPParameterName="p_bukti_kepemilikan" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Alamat Agunan</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtALAMAT_AGUNAN" runat="server" DBColumnName="ALAMAT_AGUNAN" SPParameterName="p_alamat_agunan" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Kota</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtKD_KOTA" runat="server" DBColumnName="KD_KOTA" SPParameterName="p_kd_kota" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Nilai JOP</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNILAI_AGUNAN_NJOP" runat="server" DBColumnName="NILAI_AGUNAN_NJOP" SPParameterName="p_nilai_agunan_njop" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Nilai LJK</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNILAI_AGUNAN_LJK" runat="server" DBColumnName="NILAI_AGUNAN_LJK" SPParameterName="p_nilai_agunan_ljk" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Tanggal Penilaian</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtTGL_PENILAIAN_LJK" runat="server" DBColumnName="TGL_PENILAIAN_LJK" SPParameterName="p_tgl_penilaian_ljk" CssClass="form-control default-date-picker" DataType="DateTime" BindType="Both" Format="dd/MM/yyyy"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Anggunan Independen</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNILAI_AGUNAN_INDEPENDEN" runat="server" DBColumnName="NILAI_AGUNAN_INDEPENDEN" SPParameterName="p_nilai_agunan_independen" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Independen</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNAMA_INDEPENDEN" runat="server" DBColumnName="NAMA_INDEPENDEN" SPParameterName="p_nama_independen" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Tanggal Penilaian</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtTGL_PENILAIAN_INDEPENDEN" runat="server" DBColumnName="TGL_PENILAIAN_INDEPENDEN" SPParameterName="p_tgl_penilaian_independen" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Status Paripasu</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="ddlSTATUS_PARIPASU" runat="server" DBColumnName="STATUS_PARIPASU" SPParameterName="p_status_paripasu" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="Y" Text="Iya"></asp:ListItem>
                                        <asp:ListItem Value="T" Text="Tidak"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Persentase</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtPERSENTASE_PARIPASU" runat="server" DBColumnName="PERSENTASE_PARIPASU" SPParameterName="p_persentase_paripasu" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Status Kredit Join</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="ddlSTATUS_KREDIT_JOIN" runat="server" DBColumnName="STATUS_KREDIT_JOIN" SPParameterName="p_status_kredit_join" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="Y" Text="Iya"></asp:ListItem>
                                        <asp:ListItem Value="T" Text="Tidak"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Di Asuransi</label>
                                
                                <div class="col-sm-7">
                                     <cc1:XUIDropDownList ID="ddlDI_ASURANSIKAN" runat="server" DBColumnName="DI_ASURANSIKAN" SPParameterName="p_di_asuransikan" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="Y" Text="Iya"></asp:ListItem>
                                        <asp:ListItem Value="T" Text="Tidak"></asp:ListItem>
                                    </cc1:XUIDropDownList>
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

