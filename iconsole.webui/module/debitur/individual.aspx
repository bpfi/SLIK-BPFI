<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="individual.aspx.cs" Inherits="module_debitur_individual" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>D01 - Debitur Individual</span>
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
                                <label class="col-sm-4">Jenis Identitas</label>
                                
                                <div class="col-sm-7">
                                     <cc1:XUIDropDownList ID="ddlJ_IDENTITY" runat="server" DBColumnName="J_IDENTITY" SPParameterName="p_j_identity" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="1" Text="KTP"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="PASSPOR"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">NIK</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNIK" runat="server" DBColumnName="NIK" SPParameterName="p_nik" CssClass="form-control" DataType="String" BindType="Both" Enabled="false"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Nama</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNama" runat="server" DBColumnName="NAMA" SPParameterName="p_nama" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
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
                                <label class="col-sm-4">Gelar</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="ddlGELAR" runat="server" DBColumnName="GELAR" SPParameterName="p_gelar" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="00" Text="TANPA GELAR"></asp:ListItem>
                                        <asp:ListItem Value="01" Text="DIPLOMA 1"></asp:ListItem>
                                        <asp:ListItem Value="02" Text="DIPLOMA 2"></asp:ListItem>
                                        <asp:ListItem Value="03" Text="DIPLOMA 3"></asp:ListItem>
                                        <asp:ListItem Value="04" Text="S-1"></asp:ListItem>
                                        <asp:ListItem Value="05" Text="S-2"></asp:ListItem>
                                        <asp:ListItem Value="06" Text="S-3"></asp:ListItem>
                                        <asp:ListItem Value="99" Text="LAINNYA"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Jenis Kelamin</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="ddlJENIS_KELAMIN" runat="server" DBColumnName="JENIS_KELAMIN" SPParameterName="p_jenis_kelamin" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="L" Text="LAKI-LAKI"></asp:ListItem>
                                        <asp:ListItem Value="P" Text="PEREMPUAN"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Tempat Lahir</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtTEMPAT_LAHIR" runat="server" DBColumnName="TEMPAT_LAHIR" SPParameterName="p_tempat_lahir" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Tanggal Lahir</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtTANGGAL_LAHIR" runat="server" CssClass="form-control default-date-picker" DBColumnName="TANGGAL_LAHIR" SPParameterName="p_tanggal_lahir" BindType="Both" DataType="DateTime" Format="dd/MM/yyyy"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">NPWP</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNPWP" runat="server" DBColumnName="NPWP" SPParameterName="p_npwp" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Alamat</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtALAMAT" runat="server" DBColumnName="ALAMAT" SPParameterName="p_alamat" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Kelurahan</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtKELURAHAN" runat="server" DBColumnName="KELURAHAN" SPParameterName="p_kelurahan" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Kecamatan</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtKECAMATAN" runat="server" DBColumnName="KECAMATAN" SPParameterName="p_kecamatan" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Kota</label>
                                
                                <div class="col-sm-7">
                                    <asp:DropDownList ID="txtKODE_KOTA" runat="server" DBColumnName="KODE_KOTA" SPParameterName="p_kode_kota" DataType="String" BindType="Both" CssClass="form-control">
                                        <%--<asp:ListItem Value="-" Text="Test"></asp:ListItem>--%>
                                    </asp:DropDownList>
                                    <%--<cc1:XUITextBox ID="txtKODE_KOTA" runat="server" DBColumnName="KODE_KOTA" SPParameterName="p_kode_kota" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>--%>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Pos</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtKODE_POS" runat="server" DBColumnName="KODE_POS" SPParameterName="p_kode_pos" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">No. Telpon</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNO_TELEPON" runat="server" DBColumnName="NO_TELEPON" SPParameterName="p_no_telepon" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">HP</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNO_SELULAR" runat="server" DBColumnName="NO_SELULAR" SPParameterName="p_no_selular" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Email</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtALAMAT_EMAIL" runat="server" DBColumnName="ALAMAT_EMAIL" SPParameterName="p_alamat_email" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Domisili</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtKODE_NEGARA_DOMISILI" runat="server" DBColumnName="KODE_NEGARA_DOMISILI" SPParameterName="p_kode_negara_domisili" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Pekerjaan</label>
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="txtKODE_PEKERJAAN" runat="server" DBColumnName="KODE_PEKERJAAN" SPParameterName="p_kode_pekerjaan" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="001" Text="Accounting/Finance Officer"></asp:ListItem>
                                        <asp:ListItem Value="002" Text="Customer service "></asp:ListItem>
                                        <asp:ListItem Value="003" Text="Engineering"></asp:ListItem>
                                        <asp:ListItem Value="004" Text="Eksekutif"></asp:ListItem>
                                        <asp:ListItem Value="005" Text="Administrasi umum"></asp:ListItem>
                                        <asp:ListItem Value="006" Text="Teknologi Informasi"></asp:ListItem>
                                        <asp:ListItem Value="007" Text="Konsultan/Analis"></asp:ListItem>
                                        <asp:ListItem Value="008" Text="Marketing"></asp:ListItem>
                                        <asp:ListItem Value="009" Text="Pengajar (Guru, Dosen)"></asp:ListItem>
                                        <asp:ListItem Value="010" Text="Militer"></asp:ListItem>
                                        <asp:ListItem Value="011" Text="Pensiunan"></asp:ListItem>
                                        <asp:ListItem Value="012" Text="Pelajar/Mahasiswa"></asp:ListItem>
                                        <asp:ListItem Value="013" Text="Wiraswasta"></asp:ListItem>
                                        <asp:ListItem Value="014" Text="Polisi"></asp:ListItem>
                                        <asp:ListItem Value="015" Text="Petani"></asp:ListItem>
                                        <asp:ListItem Value="016" Text="Nelayan"></asp:ListItem>
                                        <asp:ListItem Value="017" Text="Peternak"></asp:ListItem>
                                        <asp:ListItem Value="018" Text="Dokter"></asp:ListItem>
                                        <asp:ListItem Value="019" Text="Tenaga Medis (Perawat, Bidan, dsb)"></asp:ListItem>
                                        <asp:ListItem Value="020" Text="Hukum (Pengacara, Notaris)"></asp:ListItem>
                                        <asp:ListItem Value="021" Text="Perhotelan & Restoran (Koki, Bartender, dsb)"></asp:ListItem>
                                        <asp:ListItem Value="022" Text="Peneliti"></asp:ListItem>
                                        <asp:ListItem Value="023" Text="Desainer"></asp:ListItem>
                                        <asp:ListItem Value="024" Text="Arsitek"></asp:ListItem>
                                        <asp:ListItem Value="025" Text="Pekerja Seni (Artis, Musisi, Pelukis, dsb)"></asp:ListItem>
                                        <asp:ListItem Value="026" Text="Pengamanan"></asp:ListItem>
                                        <asp:ListItem Value="027" Text="Pialang/Broker"></asp:ListItem>
                                        <asp:ListItem Value="028" Text="Distributor"></asp:ListItem>
                                        <asp:ListItem Value="029" Text="Transportasi Udara (Pilot, Pramugari)"></asp:ListItem>
                                        <asp:ListItem Value="030" Text="Transportasi Laut (Nahkoda, ABK)"></asp:ListItem>
                                        <asp:ListItem Value="031" Text="Transportasi Darat (Masinis, Sopir, Kondektur)"></asp:ListItem>
                                        <asp:ListItem Value="032" Text="Buruh (Buruh Pabrik, Buruh Bangunan, Buruh Tani)"></asp:ListItem>
                                        <asp:ListItem Value="033" Text="Pertukangan & Pengrajin (Tukang Kayu, Pengrajin Kulit, dll)"></asp:ListItem>
                                        <asp:ListItem Value="034" Text="Ibu Rumah Tangga "></asp:ListItem>
                                        <asp:ListItem Value="035" Text="Pekerja Informal (Asisten Rumah Tangga, Asongan, dll)"></asp:ListItem>
                                        <asp:ListItem Value="036" Text="Pejabat Negara/Penyelenggara Negara "></asp:ListItem>
                                        <asp:ListItem Value="037" Text="Pegawai Pemerintahan/Lembaga Negara (selain Pejabat/Penyelenggara Negara) "></asp:ListItem>
                                        <asp:ListItem Value="099" Text="Lain-lain"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                                <%--<div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtKODE_PEKERJAAN" runat="server" DBColumnName="KODE_PEKERJAAN" SPParameterName="p_kode_pekerjaan" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>--%>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Tempat Bekerja</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtTEMPAT_BEKERJA" runat="server" DBColumnName="TEMPAT_BEKERJA" SPParameterName="p_tempat_bekerja" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Bidang Usaha</label>
                                <div class="col-sm-7">
                                    <asp:DropDownList ID="txtKODE_BIDANG_USAHA" runat="server" DBColumnName="KODE_BIDANG_USAHA" SPParameterName="p_kode_bidang_usaha" DataType="String" BindType="Both" CssClass="form-control">
                                         <%--<asp:ListItem Value="-" Text="Test"></asp:ListItem>--%>
                                    </asp:DropDownList>
                                </div>
<%--                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtKODE_BIDANG_USAHA" runat="server" DBColumnName="KODE_BIDANG_USAHA" SPParameterName="p_kode_bidang_usaha" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>--%>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Alamat Bekerja</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtALAMAT_TEMPAT_BEKERJA" runat="server" DBColumnName="ALAMAT_TEMPAT_BEKERJA" SPParameterName="p_alamat_tempat_bekerja" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Penghasilan Kotor</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtPENGHASILAN_KOTOR_TAHUNAN" runat="server" DBColumnName="PENGHASILAN_KOTOR_TAHUNAN" SPParameterName="p_penghasilan_kotor_tahunan" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Sumber Penghasilan</label>
                                
                                <div class="col-sm-7">
                                     <cc1:XUIDropDownList ID="ddlKODE_SUMBER_PENGHASILAN" runat="server" DBColumnName="KODE_SUMBER_PENGHASILAN" SPParameterName="p_kode_sumber_penghasilan" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="1" Text="GAJI"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="USAHA"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="LAINNYA"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Tanggungan</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtJUMLAH_TANGGUNGAN" runat="server" DBColumnName="JUMLAH_TANGGUNGAN" SPParameterName="p_jumlah_tanggungan" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Hubungan Pelapor</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="ddlKODE_HUBUNGAN_DENGAN_PELAPOR" runat="server" DBColumnName="KODE_HUBUNGAN_DENGAN_PELAPOR" SPParameterName="p_kode_hubungan_dengan_pelapor" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="0110" Text="Pengendali dan atau keluarga pengendali Pelapor"></asp:ListItem>
                                        <asp:ListItem Value="0120" Text="Perusahaan/badan dimana Pelapor bertindak sebagai pengendali (subsidiary) "></asp:ListItem>
                                        <asp:ListItem Value="0130" Text="Pengendali lain dari anak perusahaan/subsidiary Pelapor"></asp:ListItem>
                                        <asp:ListItem Value="0140" Text="Perusahaan dimana pihak sebagaimana dimaksud pada angka 1 (sandi 0110) bertindak sebagai pengendali"></asp:ListItem>
                                        <asp:ListItem Value="0150" Text="Perusahaan dimana pihak sebagaimana dimaksud pada angka 3 (sandi 0130) bertindak sebagai pengendali"></asp:ListItem>
                                        <asp:ListItem Value="0210" Text="Pengurus Pelapor dan atau keluarga pengurus Pelapor"></asp:ListItem>
                                        <asp:ListItem Value="0220" Text="Pengurus dari perusahaan-perusahaan sebagaimana dimaksud pada angka 1 s.d. 5 (sandi 0110, 0120, 0130, 0140, dan 0150)"></asp:ListItem>
                                        <asp:ListItem Value="0230" Text="Perusahaan yang pengurusnya merupakan pengurus Pelapor"></asp:ListItem>
                                        <asp:ListItem Value="0240" Text="Perusahaan yang pengurusnya merupakan pengurus dari perusahaan-perusahaan sebagaimana dimaksud pada angka 1 s.d. 5 (sandi 0110, 0120, 0130, 0140, dan 0150)"></asp:ListItem>
                                        <asp:ListItem Value="0250" Text="Perusahaan dimana pengurus Pelapor bertindak sebagai pengendali"></asp:ListItem>
                                        <asp:ListItem Value="0260" Text="Perusahaan dimana pengurus dari perusahaanperusahaan sebagaimana dimaksud pada angka 1 s.d. 5 (sandi 0110, 0120, 0130, 0140, dan 0150) bertindak sebagai pengendali"></asp:ListItem>
                                        <asp:ListItem Value="0310" Text="Ketergantungan keuangan (financial interdependence)"></asp:ListItem>
                                        <asp:ListItem Value="0320" Text="Kontrak Investasi Kolektif (KIK dimana pihak-pihak sebagaimana dimaksud pada angka 1 s.d 11 (sandi 0110, 0120, 0130, 0140, 0150, 0210, 0220, 0230, 0240, 0250, dan 0260) memiliki 10% atau lebih saham pada manajer investasi kolektif tersebut"></asp:ListItem>
                                        <asp:ListItem Value="0330" Text="Penjaminan"></asp:ListItem>
                                        <asp:ListItem Value="9900" Text="Tidak terkait dengan Pelapor"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Golongan</label>
                                
                                <div class="col-sm-7">
                                     <cc1:XUIDropDownList ID="ddlKODE_GOLONGAN" runat="server" DBColumnName="KODE_GOLONGAN" SPParameterName="p_kode_golongan" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="9000" Text="Perseorangan (Penduduk)"></asp:ListItem>
                                        <asp:ListItem Value="9700" Text="Perseorangan (Bukan Penduduk)"></asp:ListItem>
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
                                     <cc1:XUIDropDownList ID="ddlSTATUS_PERKAWINAN" runat="server" DBColumnName="STATUS_PERKAWINAN" SPParameterName="p_status_perkawinan" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="1" Text="Kawin"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Belum Kawin"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="Cerai"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Identitas Pasangan</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNOMOR_IDENTITAS_PASANGAN" runat="server" DBColumnName="NOMOR_IDENTITAS_PASANGAN" SPParameterName="p_nomor_identitas_pasangan" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Nama Pasangan</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNAMA_PASANGAN" runat="server" DBColumnName="NAMA_PASANGAN" SPParameterName="p_nama_pasangan" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Tanggal Lahir Pasangan</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtTANGGAL_LAHIR_PASANGAN" runat="server" CssClass="form-control default-date-picker" DBColumnName="TANGGAL_LAHIR_PASANGAN" SPParameterName="p_tanggal_lahir_pasangan" BindType="Both" DataType="DateTime" Format="dd/MM/yyyy"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">P. Pisah Harta</label>
                                
                                <div class="col-sm-7">
                                     <cc1:XUIDropDownList ID="ddlPERJANJIAN_PISAH_HARTA" runat="server" DBColumnName="PERJANJIAN_PISAH_HARTA" SPParameterName="p_perjanjian_pisah_harta" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="Y" Text="Terdapat perjanjian pisah harta antara debitur dengan suami/istri."></asp:ListItem>
                                        <asp:ListItem Value="T" Text="Tidak terdapat perjanjian pisah harta antara debitur dengan suami/istri. "></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Melanggar BMPK</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="ddlMELANGGAR_BMPK" runat="server" DBColumnName="MELANGGAR_BMPK" SPParameterName="p_melanggar_bmpk" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="Y" Text="Melanggar BMPK/BMPD/BMPP"></asp:ListItem>
                                        <asp:ListItem Value="T" Text="Tidak melanggar BMPK/BMPD/BMPP"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Melampui BMPK</label>
                                
                                <div class="col-sm-7">
                                     <cc1:XUIDropDownList ID="ddlMELAMPAUI_BMPK" runat="server" DBColumnName="MELAMPAUI_BMPK" SPParameterName="p_melampaui_bmpk" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="Y" Text="Melampaui BMPK/BMPD/BMPP"></asp:ListItem>
                                        <asp:ListItem Value="T" Text="Tidak melampauai BMPK/BMPD/BMPP"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Ibu Kandung</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNAMA_IBU_KANDUNG" runat="server" DBColumnName="NAMA_IBU_KANDUNG" SPParameterName="p_nama_ibu_kandung" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Cabang</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtKODE_CABANG" runat="server" DBColumnName="KODE_CABANG" SPParameterName="p_kode_cabang" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
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
                     <div class="row" style="display:none">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Cabang</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="lblcredate" runat="server" CssClass="form-control default-date-picker" DBColumnName="CRE_DATE" SPParameterName="p_cre_date" BindType="Both" DataType="DateTime" Format="dd/MM/yyyy"></cc1:XUITextBox>
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

