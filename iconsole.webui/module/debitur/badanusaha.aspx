<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="badanusaha.aspx.cs" Inherits="module_debitur_badanusaha" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>D02 - Debitur Badan Usaha</span>
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
                                <label class="col-sm-4">No. Identitas</label>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNOMOR_IDENTITAS" runat="server" DBColumnName="NOMOR_IDENTITAS" SPParameterName="p_nomor_identitas" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Nama</label>
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNAMA_BADAN_USAHA" runat="server" DBColumnName="NAMA_BADAN_USAHA" SPParameterName="p_nama_badan_usaha" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Jenis Usaha</label>
                                <div class="col-sm-7">
                                     <cc1:XUIDropDownList ID="ddlKODE_JENIS_USAHA" runat="server" DBColumnName="KODE_JENIS_USAHA" SPParameterName="p_kode_jenis_usaha" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="1" Text="Badan Usaha Unit Desa (BUUD)"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Commanditer Venotschap (CV)"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="Debitur Kelompok"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="Ekspedisi Muatan Kapal Laut (EMKL)"></asp:ListItem>
                                        <asp:ListItem Value="5" Text="FIRMA"></asp:ListItem>
                                        <asp:ListItem Value="6" Text="Gabungan Koperasi"></asp:ListItem>
                                        <asp:ListItem Value="7" Text="Induk Koperasi"></asp:ListItem>
                                        <asp:ListItem Value="8" Text="Koperasi"></asp:ListItem>
                                        <asp:ListItem Value="9" Text="Koperasi Unit Desa"></asp:ListItem>
                                        <asp:ListItem Value="10" Text="Limited"></asp:ListItem>
                                        <asp:ListItem Value="11" Text="Maskapai Andil Indonesia"></asp:ListItem>
                                        <asp:ListItem Value="12" Text="Namloose Venotschaap"></asp:ListItem>
                                        <asp:ListItem Value="13" Text="Perusahaan Daerah"></asp:ListItem>
                                        <asp:ListItem Value="14" Text="Persero"></asp:ListItem>
                                        <asp:ListItem Value="15" Text="Persekutuan Perdata"></asp:ListItem>
                                        <asp:ListItem Value="16" Text="Perusahaan Umum"></asp:ListItem>
                                        <asp:ListItem Value="17" Text="Primer Koperasi"></asp:ListItem>
                                        <asp:ListItem Value="18" Text="Perseroan Terbatas"></asp:ListItem>
                                        <asp:ListItem Value="19" Text="Pusat Koperasi"></asp:ListItem>
                                        <asp:ListItem Value="20" Text="Pusat Koperasi Unit Desa"></asp:ListItem>
                                        <asp:ListItem Value="21" Text="Usaha Dagang"></asp:ListItem>
                                        <asp:ListItem Value="22" Text="Unit Dagang Kredit Pedesaan"></asp:ListItem>
                                        <asp:ListItem Value="23" Text="Yayasan"></asp:ListItem>
                                        <asp:ListItem Value="99" Text="Lainnya"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Didirikan di</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtTEMPAT_PENDIRIAN" runat="server" DBColumnName="TEMPAT_PENDIRIAN" SPParameterName="p_tempat_pendirian" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">No. Akta</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNOMOR_AKTA_PENDIRIAN" runat="server" DBColumnName="NOMOR_AKTA_PENDIRIAN" SPParameterName="p_nomor_akta_pendirian" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Tanggal Akta</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtTANGGAL_AKTA_PENDIRIAN" runat="server" DBColumnName="TANGGAL_AKTA_PENDIRIAN" SPParameterName="p_tanggal_akta_pendirian" CssClass="form-control default-date-picker" Format="dd/MM/yyyy" DataType="DateTime" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">No. Perubahan Akta</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNOMOR_AKTA_PERUBAHAN_TERAKHIR" runat="server" DBColumnName="NOMOR_AKTA_PERUBAHAN_TERAKHIR" SPParameterName="p_nomor_akta_perubahan_terakhir" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Tanggal Perubahan Akta</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtTANGGAL_AKTA_PERUBAHAN_TERAKHIR" runat="server" CssClass="form-control default-date-picker" DBColumnName="TANGGAL_AKTA_PERUBAHAN_TERAKHIR" SPParameterName="p_tanggal_akta_perubahan_terakhir" BindType="Both" DataType="DateTime" Format="dd/MM/yyyy"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">No. HP</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNO_HP" runat="server" DBColumnName="NO_HP" SPParameterName="p_no_hp" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">No Selular</label>
                                
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
                                    <asp:DropDownList ID="txtKODE_SANDI_KOTA" runat="server" DBColumnName="KODE_SANDI_KOTA" SPParameterName="p_kode_sandi_kota" DataType="String" BindType="Both" CssClass="form-control">
                                        <%--<asp:ListItem Value="-" Text="Test"></asp:ListItem>--%>
                                    </asp:DropDownList>
                                    <%--<cc1:XUITextBox ID="txtKODE_SANDI_KOTA" runat="server" DBColumnName="KODE_SANDI_KOTA" SPParameterName="p_kode_sandi_kota" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>--%>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Kode Pos</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtKODE_POS" runat="server" DBColumnName="KODE_POS" SPParameterName="p_kode_pos" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Negara</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="XUIDropDownList1" runat="server" DBColumnName="KODE_JENIS_USAHA" SPParameterName="p_kode_jenis_usaha" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="AF" Text="Afghanistan"></asp:ListItem>
                                        <asp:ListItem Value="AL" Text="Albania"></asp:ListItem>
                                        <asp:ListItem Value="DZ" Text="Algeria/Aljazair"></asp:ListItem>
                                        <asp:ListItem Value="AS" Text="America Samoa"></asp:ListItem>
                                        <asp:ListItem Value="AD" Text="Andorra"></asp:ListItem>
                                        <asp:ListItem Value="AO" Text="Angola"></asp:ListItem>
                                        <asp:ListItem Value="AI" Text="Anguilla"></asp:ListItem>
                                        <asp:ListItem Value="AQ" Text="Antartica"></asp:ListItem>
                                        <asp:ListItem Value="AG" Text="Antigua and Barbuda"></asp:ListItem>
                                        <asp:ListItem Value="AR" Text="Argentina"></asp:ListItem>
                                        <asp:ListItem Value="AM" Text="Armenia"></asp:ListItem>
                                        <asp:ListItem Value="AW" Text="Aruba"></asp:ListItem>
                                        <asp:ListItem Value="AU" Text="Australia"></asp:ListItem>
                                        <asp:ListItem Value="AT" Text="Austria"></asp:ListItem>
                                        <asp:ListItem Value="AZ" Text="Azerbaijan"></asp:ListItem>
                                        <asp:ListItem Value="BS" Text="Bahamas"></asp:ListItem>
                                        <asp:ListItem Value="BH" Text="Bahrain"></asp:ListItem>
                                        <asp:ListItem Value="BD" Text="Bangladesh"></asp:ListItem>
                                        <asp:ListItem Value="BB" Text="Barbados"></asp:ListItem>
                                        <asp:ListItem Value="BY" Text="Belarus"></asp:ListItem>
                                        <asp:ListItem Value="BE" Text="Belgium "></asp:ListItem>
                                        <asp:ListItem Value="BJ" Text="Benin"></asp:ListItem>
                                        <asp:ListItem Value="BZ" Text="Belize"></asp:ListItem>
                                        <asp:ListItem Value="BM" Text="Bermuda"></asp:ListItem>
                                        <asp:ListItem Value="BT" Text="Bhutan"></asp:ListItem>
                                        <asp:ListItem Value="BO" Text="Bolivia"></asp:ListItem>
                                        <asp:ListItem Value="BA" Text="Bosnia-Herzegowina"></asp:ListItem>
                                        <asp:ListItem Value="BW" Text="Botswana"></asp:ListItem>
                                        <asp:ListItem Value="BV" Text="Bouvet Island"></asp:ListItem>
                                        <asp:ListItem Value="BR" Text="Brazil"></asp:ListItem>
                                        <asp:ListItem Value="IO" Text="British Indian Ocean Territory"></asp:ListItem>
                                        <asp:ListItem Value="BN" Text="Brunei Darussalam"></asp:ListItem>
                                        <asp:ListItem Value="BG" Text="Bulgaria"></asp:ListItem>
                                        <asp:ListItem Value="BF" Text="Burkina Faso"></asp:ListItem>
                                        <asp:ListItem Value="BI" Text="Burundi"></asp:ListItem>
                                        <asp:ListItem Value="KH" Text="Cambodia"></asp:ListItem>
                                        <asp:ListItem Value="CM" Text="Cameroon"></asp:ListItem>
                                        <asp:ListItem Value="CA" Text="Canada"></asp:ListItem>
                                        <asp:ListItem Value="CV" Text="Cape Verde"></asp:ListItem>
                                        <asp:ListItem Value="KY" Text="Cayman Islands"></asp:ListItem>
                                        <asp:ListItem Value="CF" Text="Central African Republic"></asp:ListItem>
                                        <asp:ListItem Value="TD" Text="Chad"></asp:ListItem>
                                        <asp:ListItem Value="CL" Text="Chile"></asp:ListItem>
                                        <asp:ListItem Value="CN" Text="China"></asp:ListItem>
                                        <asp:ListItem Value="CX" Text="Christmas Islands"></asp:ListItem>
                                        <asp:ListItem Value="CC" Text="Cocos (Keeling) Island"></asp:ListItem>
                                        <asp:ListItem Value="CO" Text="Clombia"></asp:ListItem>
                                        <asp:ListItem Value="KM" Text="Comoros"></asp:ListItem>
                                        <asp:ListItem Value="CG" Text="Congo"></asp:ListItem>
                                        <asp:ListItem Value="CD" Text="Congo, The Democratic Republic of The"></asp:ListItem>
                                        <asp:ListItem Value="CK" Text="Cook Island"></asp:ListItem>
                                        <asp:ListItem Value="CR" Text="Costa Rica"></asp:ListItem>
                                        <asp:ListItem Value="HR" Text="Croatia"></asp:ListItem>
                                        <asp:ListItem Value="CU" Text="Cuba"></asp:ListItem>
                                        <asp:ListItem Value="CY" Text="Cyprus"></asp:ListItem>
                                        <asp:ListItem Value="CZ" Text="Czech Republic"></asp:ListItem>
                                        <asp:ListItem Value="DK" Text="Denmark"></asp:ListItem>
                                        <asp:ListItem Value="DJ" Text="Djibouti "></asp:ListItem>
                                        <asp:ListItem Value="DO" Text="Dominican Republic"></asp:ListItem>
                                        <asp:ListItem Value="DM" Text="Domonica"></asp:ListItem>
                                        <asp:ListItem Value="EC" Text="Ecuador"></asp:ListItem>
                                        <asp:ListItem Value="EG" Text="Egypt"></asp:ListItem>
                                        <asp:ListItem Value="SV" Text="El Salvador"></asp:ListItem>
                                        <asp:ListItem Value="GQ" Text="Equatorial Guinea"></asp:ListItem>
                                        <asp:ListItem Value="ER" Text="Eritrea "></asp:ListItem>
                                        <asp:ListItem Value="EE" Text="Estonia"></asp:ListItem>
                                        <asp:ListItem Value="ET" Text="Ethiopia"></asp:ListItem>
                                        <asp:ListItem Value="EUR" Text="Europan Community"></asp:ListItem>
                                        <asp:ListItem Value="FK" Text="Falkland Islands (Malvinas)"></asp:ListItem>
                                        <asp:ListItem Value="FO" Text="Faroe Islands"></asp:ListItem>
                                        <asp:ListItem Value="FJ" Text="Fiji"></asp:ListItem>
                                        <asp:ListItem Value="FI" Text="Finland"></asp:ListItem>
                                        <asp:ListItem Value="FR" Text="France"></asp:ListItem>
                                        <asp:ListItem Value="FX" Text="France, Metropolitan"></asp:ListItem>
                                        <asp:ListItem Value="GF" Text="French Guiana"></asp:ListItem>
                                        <asp:ListItem Value="PF" Text="French Polynesia"></asp:ListItem>
                                        <asp:ListItem Value="TF" Text="French Southern Territories"></asp:ListItem>
                                        <asp:ListItem Value="GA" Text="Gabon"></asp:ListItem>
                                        <asp:ListItem Value="GM" Text="Gambia"></asp:ListItem>
                                        <asp:ListItem Value="GE" Text="Georgia"></asp:ListItem>
                                        <asp:ListItem Value="DE" Text="Germany"></asp:ListItem>
                                        <asp:ListItem Value="GH" Text="Ghana"></asp:ListItem>
                                        <asp:ListItem Value="GI" Text="Gibraltar"></asp:ListItem>
                                        <asp:ListItem Value="GL" Text="Greenland"></asp:ListItem>
                                        <asp:ListItem Value="GD" Text="Grenada"></asp:ListItem>
                                        <asp:ListItem Value="GP" Text="Guadeloupe"></asp:ListItem>
                                        <asp:ListItem Value="GU" Text="Guam"></asp:ListItem>
                                        <asp:ListItem Value="GT" Text="Guatemala"></asp:ListItem>
                                        <asp:ListItem Value="GN" Text="Guinea "></asp:ListItem>
                                        <asp:ListItem Value="GW" Text="Guinea Bissau"></asp:ListItem>
                                        <asp:ListItem Value="GY" Text="Guyana"></asp:ListItem>
                                        <asp:ListItem Value="HT" Text="Haiti"></asp:ListItem>
                                        <asp:ListItem Value="HM" Text="Heard and McDonald Island"></asp:ListItem>
                                        <asp:ListItem Value="HN" Text="Honduras"></asp:ListItem>
                                        <asp:ListItem Value="HK" Text="Hongkong"></asp:ListItem>
                                        <asp:ListItem Value="HU" Text="Hungary"></asp:ListItem>
                                        <asp:ListItem Value="IS" Text="Iceland"></asp:ListItem>
                                        <asp:ListItem Value="IN" Text="India"></asp:ListItem>
                                        <asp:ListItem Value="ID" Text="Indonesia" Selected="true"></asp:ListItem>
                                        <asp:ListItem Value="IR" Text="Iran"></asp:ListItem>
                                        <asp:ListItem Value="IQ" Text="Iraq"></asp:ListItem>
                                        <asp:ListItem Value="IE" Text="Ireland"></asp:ListItem>
                                        <asp:ListItem Value="IL" Text="Israel"></asp:ListItem>
                                        <asp:ListItem Value="IT" Text="Italia"></asp:ListItem>
                                        <asp:ListItem Value="CI" Text="Ivory Coast"></asp:ListItem>
                                        <asp:ListItem Value="JM" Text="Jamaica"></asp:ListItem>
                                        <asp:ListItem Value="JP" Text="Japan "></asp:ListItem>
                                        <asp:ListItem Value="JO" Text="Jordan"></asp:ListItem>
                                        <asp:ListItem Value="KZ" Text="Kazakhstan"></asp:ListItem>
                                        <asp:ListItem Value="KE" Text="Kenya"></asp:ListItem>
                                        <asp:ListItem Value="KI" Text="Kiribati"></asp:ListItem>
                                        <asp:ListItem Value="KR" Text="Korea Selatan"></asp:ListItem>
                                        <asp:ListItem Value="KP" Text="Korea Utara"></asp:ListItem>
                                        <asp:ListItem Value="KW" Text="Kuwait"></asp:ListItem>
                                        <asp:ListItem Value="KG" Text="Kyrgyzstan"></asp:ListItem>
                                        <asp:ListItem Value="LA" Text="Lao People's Democ.Rep."></asp:ListItem>
                                        <asp:ListItem Value="LV" Text="Latvia"></asp:ListItem>
                                        <asp:ListItem Value="LB" Text="Lebanon"></asp:ListItem>
                                        <asp:ListItem Value="LS" Text="Lesotho"></asp:ListItem>
                                        <asp:ListItem Value="LR" Text="Liberia"></asp:ListItem>
                                        <asp:ListItem Value="LY" Text="Libyan Arab Jamahiriya"></asp:ListItem>
                                        <asp:ListItem Value="LI" Text="Liechtenstein"></asp:ListItem>
                                        <asp:ListItem Value="LT" Text="Lithuania"></asp:ListItem>
                                        <asp:ListItem Value="LU" Text="Luxembourg"></asp:ListItem>
                                        <asp:ListItem Value="MO" Text="Macau"></asp:ListItem>
                                        <asp:ListItem Value="MK" Text="Macedonia"></asp:ListItem>
                                        <asp:ListItem Value="MG" Text="Madagascar"></asp:ListItem>
                                        <asp:ListItem Value="MW" Text="Malawi "></asp:ListItem>
                                        <asp:ListItem Value="MY" Text="Malaysia"></asp:ListItem>
                                        <asp:ListItem Value="MV" Text="Maldivies"></asp:ListItem>
                                        <asp:ListItem Value="ML" Text="Mali"></asp:ListItem>
                                        <asp:ListItem Value="MT" Text="Malta"></asp:ListItem>
                                        <asp:ListItem Value="MH" Text="Marshall Islands"></asp:ListItem>
                                        <asp:ListItem Value="MQ" Text="Martinique"></asp:ListItem>
                                        <asp:ListItem Value="MR" Text="Mauritania"></asp:ListItem>
                                        <asp:ListItem Value="MU" Text="Mauritius"></asp:ListItem>
                                        <asp:ListItem Value="YT" Text="Mayotte"></asp:ListItem>
                                        <asp:ListItem Value="MX" Text="Mexico"></asp:ListItem>
                                        <asp:ListItem Value="FM" Text="Micronesia, Federated State of"></asp:ListItem>
                                        <asp:ListItem Value="MD" Text="Maldova, Republic of"></asp:ListItem>
                                        <asp:ListItem Value="MC" Text="Monaco"></asp:ListItem>
                                        <asp:ListItem Value="MN" Text="Mongolia"></asp:ListItem>
                                        <asp:ListItem Value="MS" Text="Montserrat"></asp:ListItem>
                                        <asp:ListItem Value="MA" Text="Morocco"></asp:ListItem>
                                        <asp:ListItem Value="MZ" Text="Mozambique"></asp:ListItem>
                                        <asp:ListItem Value="MM" Text="Myanmar (Burma)"></asp:ListItem>
                                        <asp:ListItem Value="NA" Text="Namibia"></asp:ListItem>
                                        <asp:ListItem Value="NR" Text="Nauru"></asp:ListItem>
                                        <asp:ListItem Value="NP" Text="Nepal"></asp:ListItem>
                                        <asp:ListItem Value="NL" Text="Netherlands"></asp:ListItem>
                                        <asp:ListItem Value="AN" Text="Netherlands Antilles"></asp:ListItem>
                                        <asp:ListItem Value="NC" Text="New Caledonia"></asp:ListItem>
                                        <asp:ListItem Value="NZ" Text="New Zealand"></asp:ListItem>
                                        <asp:ListItem Value="NI" Text="Nicaragua"></asp:ListItem>
                                        <asp:ListItem Value="NU" Text="Nieue"></asp:ListItem>
                                        <asp:ListItem Value="NE" Text="Niger"></asp:ListItem>
                                        <asp:ListItem Value="NG" Text="Nigeria"></asp:ListItem>
                                        <asp:ListItem Value="NF" Text="Norfolk Islands"></asp:ListItem>
                                        <asp:ListItem Value="MP" Text="Northern Mariana Island"></asp:ListItem>
                                        <asp:ListItem Value="NO" Text="Norway"></asp:ListItem>
                                        <asp:ListItem Value="OM" Text="Oman"></asp:ListItem>
                                        <asp:ListItem Value="PK" Text="Pakistan"></asp:ListItem>
                                        <asp:ListItem Value="PW" Text="Palau"></asp:ListItem>
                                        <asp:ListItem Value="PA" Text="Panama"></asp:ListItem>
                                        <asp:ListItem Value="PG" Text="Papua New Guinea"></asp:ListItem>
                                        <asp:ListItem Value="PY" Text="Paraguay"></asp:ListItem>
                                        <asp:ListItem Value="PE" Text="Peru"></asp:ListItem>
                                        <asp:ListItem Value="PH" Text="Philippines"></asp:ListItem>
                                        <asp:ListItem Value="PN" Text="Pitcairn"></asp:ListItem>
                                        <asp:ListItem Value="PL" Text="Poland"></asp:ListItem>
                                        <asp:ListItem Value="PT" Text="Portugal"></asp:ListItem>
                                        <asp:ListItem Value="PR" Text="Puerto Rico"></asp:ListItem>
                                        <asp:ListItem Value="QA" Text="Qatar"></asp:ListItem>
                                        <asp:ListItem Value="RE" Text="Reunion"></asp:ListItem>
                                        <asp:ListItem Value="RO" Text="Romania"></asp:ListItem>
                                        <asp:ListItem Value="RU" Text="Russian Federation"></asp:ListItem>
                                        <asp:ListItem Value="RW" Text="Rwanda"></asp:ListItem>
                                        <asp:ListItem Value="LC" Text="Saint Lucia"></asp:ListItem>
                                        <asp:ListItem Value="WS" Text="Samoa"></asp:ListItem>
                                        <asp:ListItem Value="SM" Text="San Marino"></asp:ListItem>
                                        <asp:ListItem Value="ST" Text="Sao Tome & Principe"></asp:ListItem>
                                        <asp:ListItem Value="SA" Text="Saudi Arabia"></asp:ListItem>
                                        <asp:ListItem Value="SN" Text="Senegal"></asp:ListItem>
                                        <asp:ListItem Value="SC" Text="Seychelles"></asp:ListItem>
                                        <asp:ListItem Value="SL" Text="Siera Leoner"></asp:ListItem>
                                        <asp:ListItem Value="SG" Text="Singapore"></asp:ListItem>
                                        <asp:ListItem Value="SK" Text="Slovakia (Slovak Republic)"></asp:ListItem>
                                        <asp:ListItem Value="SI" Text="Slovenia"></asp:ListItem>
                                        <asp:ListItem Value="SB" Text="Solomon Islands"></asp:ListItem>
                                        <asp:ListItem Value="SO" Text="Somalia"></asp:ListItem>
                                        <asp:ListItem Value="ZA" Text="South Africa"></asp:ListItem>
                                        <asp:ListItem Value="GS" Text="South Georgia and The South"></asp:ListItem>
                                        <asp:ListItem Value="ES" Text="Spain"></asp:ListItem>
                                        <asp:ListItem Value="LK" Text="Sri Langka / Ceylon"></asp:ListItem>
                                        <asp:ListItem Value="SH" Text="St. Helena"></asp:ListItem>
                                        <asp:ListItem Value="KN" Text="St. Kittand Nevis/Saint Kitts C.and Nevis"></asp:ListItem>
                                        <asp:ListItem Value="PM" Text="St. Pierre & Miquelon"></asp:ListItem>
                                        <asp:ListItem Value="VC" Text="St. Vincent & The Grenades"></asp:ListItem>
                                        <asp:ListItem Value="SD" Text="Sudan"></asp:ListItem>
                                        <asp:ListItem Value="SR" Text="Suriname"></asp:ListItem>
                                        <asp:ListItem Value="SJ" Text="Svalbard and Jan Mayen Island"></asp:ListItem>
                                        <asp:ListItem Value="SZ" Text="Swaziland"></asp:ListItem>
                                        <asp:ListItem Value="SE" Text="Swedia/Sweden"></asp:ListItem>
                                        <asp:ListItem Value="CH" Text="Swiss/Switzerland"></asp:ListItem>
                                        <asp:ListItem Value="SY" Text="Syrian Arab Republic"></asp:ListItem>
                                        <asp:ListItem Value="TW" Text="Taiwan / Re. Of China/ Province of China"></asp:ListItem>
                                        <asp:ListItem Value="TJ" Text="Tajikistan"></asp:ListItem>
                                        <asp:ListItem Value="TZ" Text="Tanzania (Taganzica&Zanzibar)"></asp:ListItem>
                                        <asp:ListItem Value="TH" Text="Thailand"></asp:ListItem>
                                        <asp:ListItem Value="TL" Text="Timor Leste"></asp:ListItem>
                                        <asp:ListItem Value="TK" Text="Tokelau"></asp:ListItem>
                                        <asp:ListItem Value="TO" Text="Tonga"></asp:ListItem>
                                        <asp:ListItem Value="TT" Text="Trinidad&Tobago"></asp:ListItem>
                                        <asp:ListItem Value="TN" Text="Tunisia "></asp:ListItem>
                                        <asp:ListItem Value="TR" Text="Turkey"></asp:ListItem>
                                        <asp:ListItem Value="TM" Text="Turkmenistan"></asp:ListItem>
                                        <asp:ListItem Value="TC" Text="Turks&Caicos Island"></asp:ListItem>
                                        <asp:ListItem Value="TV" Text="Tuvalu"></asp:ListItem>
                                        <asp:ListItem Value="UG" Text="Uganda"></asp:ListItem>
                                        <asp:ListItem Value="UA" Text="Ukraine"></asp:ListItem>
                                        <asp:ListItem Value="AE" Text="United Arab Emirat"></asp:ListItem>
                                        <asp:ListItem Value="GB" Text="United Kingdom (Inggris)"></asp:ListItem>
                                        <asp:ListItem Value="US" Text="United States of America"></asp:ListItem>
                                        <asp:ListItem Value="UY" Text="Uruguay"></asp:ListItem>
                                        <asp:ListItem Value="UM" Text="US Minor Outlying Islands"></asp:ListItem>
                                        <asp:ListItem Value="UZ" Text="Uzbekistan"></asp:ListItem>
                                        <asp:ListItem Value="VU" Text="Vanuatu"></asp:ListItem>
                                        <asp:ListItem Value="VA" Text="Vatican City State (Holy See)"></asp:ListItem>
                                        <asp:ListItem Value="VE" Text="Venezuela"></asp:ListItem>
                                        <asp:ListItem Value="VN" Text="Vietnam"></asp:ListItem>
                                        <asp:ListItem Value="VG" Text="Virgin Islands (British)"></asp:ListItem>
                                        <asp:ListItem Value="VI" Text="Virgin Islands (US)"></asp:ListItem>
                                        <asp:ListItem Value="WF" Text="Walls and Futuna Islands"></asp:ListItem>
                                        <asp:ListItem Value="XO" Text="West Africa"></asp:ListItem>
                                        <asp:ListItem Value="EH" Text="Western Sahara"></asp:ListItem>
                                        <asp:ListItem Value="YE" Text="Yemen"></asp:ListItem>
                                        <asp:ListItem Value="YU" Text="Yugoslavia"></asp:ListItem>
                                        <asp:ListItem Value="GR" Text="Yunani "></asp:ListItem>
                                        <asp:ListItem Value="ZM" Text="Zambia"></asp:ListItem>
                                        <asp:ListItem Value="ZW" Text="Zimbabwe "></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                    <%--<cc1:XUITextBox ID="txtKODE_NEGARA_DOMISILI" runat="server" DBColumnName="KODE_NEGARA_DOMISILI" SPParameterName="p_kode_negara_domisili" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>--%>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Bidang Usaha</label>
                                <div class="col-sm-7">
                                    <asp:DropDownList ID="txtKODE_BIDANG_USAHA" runat="server" DBColumnName="KODE_BIDANG_USAHA" SPParameterName="p_kode_bidang_usaha" DataType="String" BindType="Both" CssClass="form-control">
                                         <%--<asp:ListItem Value="-" Text="Test"></asp:ListItem>--%>
                                    </asp:DropDownList>
                                    <%--<cc1:XUITextBox ID="txtKODE_BIDANG_USAHA" runat="server" DBColumnName="KODE_BIDANG_USAHA" SPParameterName="p_kode_bidang_usaha" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>--%>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Hubungan Pelapor</label>
                                
                                <div class="col-sm-7">
                                     <cc1:XUIDropDownList ID="ddlKODE_HUBUNGAN_DENGAN_PELAPOR" runat="server" DBColumnName="KODE_HUBUNGAN_DENGAN_PELAPOR" SPParameterName="p_kode_hubungan_dengan_pelapor" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="0110" Text="Pengendali dan atau keluarga pengendali Pelapor"></asp:ListItem>
                                        <asp:ListItem Value="0120" Text="Perusahaan/badan dimana Pelapor bertindak sebagai pengendali (subsidiary)"></asp:ListItem>
                                        <asp:ListItem Value="0130" Text="Pengendali lain dari anak perusahaan/subsidiary Pelapor"></asp:ListItem>
                                        <asp:ListItem Value="0140" Text="Perusahaan dimana pihak sebagaimana dimaksud pada angka 1 (sandi 0110) bertindak sebagai pengendali "></asp:ListItem>
                                        <asp:ListItem Value="0150" Text="Perusahaan dimana pihak sebagaimana dimaksud pada angka 3 (sandi 0130) bertindak sebagai pengendali"></asp:ListItem>
                                        <asp:ListItem Value="0210" Text="Pengurus Pelapor dan atau keluarga pengurus Pelapor"></asp:ListItem>
                                        <asp:ListItem Value="0220" Text="Pengurus dari perusahaan-perusahaan sebagaimana dimaksud pada angka 1 s.d. 5 (sandi 0110, 0120, 0130, 0140, dan 0150)"></asp:ListItem>
                                        <asp:ListItem Value="0230" Text="Perusahaan yang pengurusnya merupakan pengurus Pelapor"></asp:ListItem>
                                        <asp:ListItem Value="0240" Text="Perusahaan yang pengurusnya merupakan pengurus dari perusahaan-perusahaan sebagaimana dimaksud pada angka 1 s.d. 5 (sandi 0110, 0120, 0130, 0140, dan 0150)"></asp:ListItem>
                                        <asp:ListItem Value="0250" Text="Perusahaan dimana pengurus Pelapor bertindak sebagai pengendali "></asp:ListItem>
                                        <asp:ListItem Value="0260" Text="Perusahaan dimana pengurus dari perusahaanperusahaan sebagaimana dimaksud pada angka 1 s.d. 5 (sandi 0110, 0120, 0130, 0140, dan 0150) bertindak sebagai pengendali"></asp:ListItem>
                                        <asp:ListItem Value="0310 " Text="Ketergantungan keuangan (financial interdependence)"></asp:ListItem>
                                        <asp:ListItem Value="0320" Text="Kontrak Investasi Kolektif (KIK dimana pihak-pihak sebagaimana dimaksud pada angka 1 s.d 11 (sandi 0110, 0120, 0130, 0140, 0150, 0210, 0220, 0230, 0240, 0250, dan 0260) memiliki 10% atau lebih saham pada manajer investasi kolektif tersebut"></asp:ListItem>
                                        <asp:ListItem Value="0330" Text="Penjaminan"></asp:ListItem>
                                        <asp:ListItem Value="9900" Text="Tidak terkait dengan Pelapor"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
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
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Melampaui BMPK</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUIDropDownList ID="ddlMELAMPAUI_BMPK" runat="server" DBColumnName="MELAMPAUI_BMPK" SPParameterName="p_melampaui_bmpk" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="Y" Text="Melampaui BMPK/BMPD/BMPP"></asp:ListItem>
                                        <asp:ListItem Value="T" Text="Tidak melampaui BMPK/BMPD/BMPP"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Go Public</label>
                                
                                <div class="col-sm-7">
                                     <cc1:XUIDropDownList ID="ddlGO_PUBLIC" runat="server" DBColumnName="GO_PUBLIC" SPParameterName="p_go_public" DataType="String" BindType="Both" CssClass="form-control">
                                        <asp:ListItem Value="Y" Text="Go Public"></asp:ListItem>
                                        <asp:ListItem Value="T" Text="Tidak Go Public"></asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Golongan</label>
                                
                                <div class="col-sm-7">
                                     <cc1:XUIDropDownList ID="txtKODE_GOLONGAN" runat="server" DBColumnName="KODE_GOLONGAN" SPParameterName="p_kode_golongan" DataType="String" BindType="Both" CssClass="form-control">
                                            <asp:ListItem Value="0010" Text="Kantor Perbendaharaan dan Kas Negara (KPKN) "></asp:ListItem>
                                            <asp:ListItem Value="0020" Text="Departemen Keuangan"></asp:ListItem>
                                            <asp:ListItem Value="0030" Text="Departemen Pertahanan"></asp:ListItem>
                                            <asp:ListItem Value="0040" Text="Departemen Kehutanan"></asp:ListItem>
                                            <asp:ListItem Value="0050" Text="Departemen Pertanian"></asp:ListItem>
                                            <asp:ListItem Value="0060" Text="Departemen Pertambangan dan Energi"></asp:ListItem>
                                            <asp:ListItem Value="0070" Text="Departemen Agama"></asp:ListItem>
                                            <asp:ListItem Value="0080" Text="Kementerian Negara BUMN"></asp:ListItem>
                                            <asp:ListItem Value="0090" Text="Kementerian Kebudayaan, Pendidikan Dasar dan Menengah"></asp:ListItem>
                                            <asp:ListItem Value="0100" Text="Kementerian Pekerjaan Umum dan perumahan Rakyat"></asp:ListItem>
                                            <asp:ListItem Value="0110" Text="Kementerian Kesehatan"></asp:ListItem>
                                            <asp:ListItem Value="0120" Text="Kementerian Perhubungan"></asp:ListItem>
                                            <asp:ListItem Value="0999" Text="Kementerian Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="0131" Text="Badan Layanan Umum Kesehatan"></asp:ListItem>
                                            <asp:ListItem Value="0132" Text="Badan Layanan Umum Pendidikan"></asp:ListItem>
                                            <asp:ListItem Value="0199" Text="Badan Layanan Umum Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="1010" Text="Pemerintah Daerah (Provinsi)"></asp:ListItem>
                                            <asp:ListItem Value="1020" Text="Pemerintah Daerah (Pemerintah Kota)"></asp:ListItem>
                                            <asp:ListItem Value="1030" Text="Pemerintah Daerah (Pemerintah Kabupaten)"></asp:ListItem>
                                            <asp:ListItem Value="1041" Text="Badan Layanan Umum Daerah (Propinsi)"></asp:ListItem>
                                            <asp:ListItem Value="1042" Text="Badan Layanan Umum Daerah (Kota/Kabupaten)"></asp:ListItem>
                                            <asp:ListItem Value="2090" Text="Badan dan Lembaga Pemerintah"></asp:ListItem>
                                            <asp:ListItem Value="2020" Text="Lembaga Penjamin Simpanan"></asp:ListItem>
                                            <asp:ListItem Value="2030" Text="Otoritas Jasa Keuangan"></asp:ListItem>
                                            <asp:ListItem Value="0001" Text="Bank Indonesia"></asp:ListItem>
                                            <asp:ListItem Value="4111" Text="Badan Penyelenggara Jaminan Sosial Ketenagakerjaan"></asp:ListItem>
                                            <asp:ListItem Value="4117" Text="Badan Penyelenggara Jaminan Sosial Kesehatan"></asp:ListItem>
                                            <asp:ListItem Value="4112" Text="Taspen"></asp:ListItem>
                                            <asp:ListItem Value="4113" Text="Jiwasraya"></asp:ListItem>
                                            <asp:ListItem Value="4114" Text="Jasa Raharja"></asp:ListItem>
                                            <asp:ListItem Value="4115" Text="Jasindo"></asp:ListItem>
                                            <asp:ListItem Value="4116" Text="ASABRI"></asp:ListItem>
                                            <asp:ListItem Value="4119" Text="Perusahaan Asuransi Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="4120" Text="Dana Pensiun"></asp:ListItem>
                                            <asp:ListItem Value="4130" Text="Modal Ventura"></asp:ListItem>
                                            <asp:ListItem Value="4140" Text="Perusahaan Pembiayaan"></asp:ListItem>
                                            <asp:ListItem Value="4151" Text="Perusahaan sekuritas yang tidak melakukan kegiatan usaha Reksadana"></asp:ListItem>
                                            <asp:ListItem Value="4152" Text="Perusahaan sekuritas yang melakukan kegiatan usaha Reksadana"></asp:ListItem>
                                            <asp:ListItem Value="4153" Text="Perusahaan Reksadana"></asp:ListItem>
                                            <asp:ListItem Value="4154" Text="Manajer Investasi"></asp:ListItem>
                                            <asp:ListItem Value="4155" Text="PT Danareksa"></asp:ListItem>
                                            <asp:ListItem Value="4159" Text="Perusahaan Sekuritas dan Reksadana Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="4171" Text="Perum Pegadaian"></asp:ListItem>
                                            <asp:ListItem Value="4173" Text="Lembaga Pembiayaan Ekspor Indonesia"></asp:ListItem>
                                            <asp:ListItem Value="4179" Text="Lembaga Keuangan Non Bank Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="4501" Text="PT Kereta Api Indonesia "></asp:ListItem>
                                            <asp:ListItem Value="4502" Text="PT Pelayaran Nasional Indonesia (PELNI)"></asp:ListItem>
                                            <asp:ListItem Value="4503" Text="PT Pelabuhan Laut Indonesia (Pelindo)"></asp:ListItem>
                                            <asp:ListItem Value="4517" Text="PT Dirgantara Indonesia "></asp:ListItem>
                                            <asp:ListItem Value="4518" Text="PT Industri Kapal Indonesia"></asp:ListItem>
                                            <asp:ListItem Value="4519" Text="PT PAL Indonesia "></asp:ListItem>
                                            <asp:ListItem Value="4520" Text="PT Sucofindo"></asp:ListItem>
                                            <asp:ListItem Value="4504" Text="PT Angkutan Sungai, Danau dan Penyeberangan (ASDP)"></asp:ListItem>
                                            <asp:ListItem Value="4505" Text="PT Angkasa Pura"></asp:ListItem>
                                            <asp:ListItem Value="4506" Text="PT Perkebunan Nusantara"></asp:ListItem>
                                            <asp:ListItem Value="4521" Text="PT Rajawali Nusantara Indonesia"></asp:ListItem>
                                            <asp:ListItem Value="4507" Text="PT Pertamina"></asp:ListItem>
                                            <asp:ListItem Value="4508" Text="PT Perusahaan Listrik Negara (PLN)"></asp:ListItem>
                                            <asp:ListItem Value="4522" Text="PT Perusahaan Gas Negara (PGN)"></asp:ListItem>
                                            <asp:ListItem Value="4509" Text="PT Krakatau Steel"></asp:ListItem>
                                            <asp:ListItem Value="4510" Text="PT Garuda Indonesia"></asp:ListItem>
                                            <asp:ListItem Value="4511" Text="PT Telkom"></asp:ListItem>
                                            <asp:ListItem Value="4513" Text="PT Jasa Marga"></asp:ListItem>
                                            <asp:ListItem Value="4514" Text="PT Timah"></asp:ListItem>
                                            <asp:ListItem Value="4515" Text="PT Aneka Tambang"></asp:ListItem>
                                            <asp:ListItem Value="4523" Text="PT Bukit Asam Tbk"></asp:ListItem>
                                            <asp:ListItem Value="4516" Text="Perusahaan Jasa Konstruksi"></asp:ListItem>
                                            <asp:ListItem Value="4172" Text="PT Pos Indonesia"></asp:ListItem>
                                            <asp:ListItem Value="4524" Text="PT Pupuk Sriwijaya"></asp:ListItem>
                                            <asp:ListItem Value="2010" Text="Badan Urusan Logistik"></asp:ListItem>
                                            <asp:ListItem Value="4599" Text="Bukan Lembaga Keuangan Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="5110" Text="Badan Usaha Milik Daerah - Perusahaan Asuransi"></asp:ListItem>
                                            <asp:ListItem Value="5120" Text="Badan Usaha Milik Daerah - Dana Pensiun"></asp:ListItem>
                                            <asp:ListItem Value="5130" Text="Badan Usaha Milik Daerah - Modal Ventura"></asp:ListItem>
                                            <asp:ListItem Value="5140" Text="Badan Usaha Milik Daerah - Perusahaan Pembiayaan"></asp:ListItem>
                                            <asp:ListItem Value="5151" Text="Badan Usaha Milik Daerah -  Perusahaan Sekuritas yang tidak melakukan kegiatan usaha reksadana"></asp:ListItem>
                                            <asp:ListItem Value="5152" Text="Badan Usaha Milik Daerah - Perusahaan Sekuritas yang melakukan kegiatan usaha reksadana"></asp:ListItem>
                                            <asp:ListItem Value="5153" Text="Badan Usaha Milik Daerah - Perusahaan Reksadana"></asp:ListItem>
                                            <asp:ListItem Value="5154" Text="Badan Usaha Milik Daerah - Manajer Investasi"></asp:ListItem>
                                            <asp:ListItem Value="5159" Text="Badan Usaha Milik Daerah - Lembaga Keuangan Non Bank Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="5199" Text="Badan Usaha Milik Daerah Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="5501" Text="Badan Usaha Milik Daerah Bukan Lembaga Keuangan - PDAM"></asp:ListItem>
                                            <asp:ListItem Value="5502" Text="Badan Usaha Milik Daerah Bukan Lembaga Keuangan - PD PASAR"></asp:ListItem>
                                            <asp:ListItem Value="5599" Text="Badan Usaha Milik Daerah - Bukan Lembaga Keuangan Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="7110" Text="Sektor Swasta - Lembaga Keuangan Non Bank Nasional - Perusahaan Asuransi"></asp:ListItem>
                                            <asp:ListItem Value="7120" Text="Sektor Swasta - Lembaga Keuangan Non Bank Nasional - Dana Pensiun"></asp:ListItem>
                                            <asp:ListItem Value="7130" Text="Sektor Swasta Nasional - Lembaga Keuangan Non Bank - Modal Ventura"></asp:ListItem>
                                            <asp:ListItem Value="7140" Text="Sektor Swasta Nasional - Lembaga Keuangan Non Bank - Perusahaan Pembiayaan"></asp:ListItem>
                                            <asp:ListItem Value="7151" Text="Sektor Swasta Nasional -Lembaga Keuangan Non Bank - Perusahaan sekuritas yang tidak melakukan kegiatan usaha reksadana"></asp:ListItem>
                                            <asp:ListItem Value="7152" Text="Sektor Swasta Nasional - Lembaga Keuangan Non Bank - Perusahaan sekuritas yang melakukan kegiatan usaha Reksadana"></asp:ListItem>
                                            <asp:ListItem Value="7153" Text="Sektor Swasta Nasional - Lembaga Keuangan Non Bank - Perusahaan Reksadana"></asp:ListItem>
                                            <asp:ListItem Value="7154" Text="Sektor Swasta Nasional - Lembaga Keuangan Non Bank - Manajer Investasi"></asp:ListItem>
                                            <asp:ListItem Value="7159" Text="Sektor Swasta Nasional - Lembaga Keuangan Non Bank Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="7172" Text="Sektor Swasta Nasional - Baitul Maal Wa Tamwil "></asp:ListItem>
                                            <asp:ListItem Value="7173" Text="Sektor Swasta Nasional - Koperasi Simpan Pinjam Primer"></asp:ListItem>
                                            <asp:ListItem Value="7174" Text="Sektor Swasta Nasional - Koperasi Simpan Pinjam Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="7190" Text="Sektor Swasta Nasional - Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="7210" Text="Sektor Swasta Campuran Perusahaan Asuransi"></asp:ListItem>
                                            <asp:ListItem Value="7220" Text="Sektor Swasta Campuran Dana Pensiun"></asp:ListItem>
                                            <asp:ListItem Value="7230" Text="Sektor Swasta Campuran Modal Ventura"></asp:ListItem>
                                            <asp:ListItem Value="7240" Text="Sektor Swasta Campuran Perusahaan Pembiayaan"></asp:ListItem>
                                            <asp:ListItem Value="7251" Text="Sektor Swasta Campuran Perusahaan Sekuritas yang tidak melakukan kegiatan usaha reksadana"></asp:ListItem>
                                            <asp:ListItem Value="7252" Text="Sektor Swasta Campuran Perusahaan Sekuritas yang melakukan kegiatan usaha reksadana"></asp:ListItem>
                                            <asp:ListItem Value="7253" Text="Sektor Swasta Campuran Perusahaan Reksadana"></asp:ListItem>
                                            <asp:ListItem Value="7254" Text="Sektor Swasta Campuran Manajer Investasi"></asp:ListItem>
                                            <asp:ListItem Value="7259" Text="Sektor Swasta Campuran Perusahaan Sekuritas dan reksadana lainnya"></asp:ListItem>
                                            <asp:ListItem Value="7272" Text="Sektor Swasta Campuran Baitul Maal Wa Tamwil"></asp:ListItem>
                                            <asp:ListItem Value="7273" Text="Sektor Swasta Campuran Kantor Perwakilan Lembaga Milik Asing di Indonesia Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="7290" Text="Sektor Swasta Campuran Lembaga Keuangan Non Bank Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="7310" Text="Sektor Swasta Asing Perusahaan Asuransi"></asp:ListItem>
                                            <asp:ListItem Value="7320" Text="Sektor Swasta Asing Dana Pensiun"></asp:ListItem>
                                            <asp:ListItem Value="7330" Text="Sektor Swasta Asing Modal Ventura"></asp:ListItem>
                                            <asp:ListItem Value="7340" Text="Sektor Swasta Asing Perusahaan Pembiayaan"></asp:ListItem>
                                            <asp:ListItem Value="7351" Text="Sektor Swasta Asing Perusahaan Sekuritas yang tidak melakukan kegiatan usaha reksadana"></asp:ListItem>
                                            <asp:ListItem Value="7352" Text="Sektor Swasta Asing Perusahaan Sekuritas yang melakukan kegiatan usaha reksadana"></asp:ListItem>
                                            <asp:ListItem Value="7353" Text="Sektor Swasta Asing Perusahaan Reksadana"></asp:ListItem>
                                            <asp:ListItem Value="7354" Text="Sektor Swasta Asing Manajer Investasi"></asp:ListItem>
                                            <asp:ListItem Value="7359" Text="Sektor Swasta Asing Perusahaan Sekuritas dan Reksadana Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="7372" Text="Sektor Swasta Asing Baitul Maal Wa Tamwil (BMT)"></asp:ListItem>
                                            <asp:ListItem Value="7379" Text="Sektor Swasta Asing Kantor Perwakilan Lembaga Milik Asing di Indonesia Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="7390" Text="Sektor Swasta Asing Lembaga Keuangan Non Bank Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="8111" Text="Sektor Swasta Nasional Perusahaan Otomotif"></asp:ListItem>
                                            <asp:ListItem Value="8112" Text="Sektor Swasta Nasional Perusahaan Perminyakan"></asp:ListItem>
                                            <asp:ListItem Value="8113" Text="Sektor Swasta Nasional Perusahaan Tekstil"></asp:ListItem>
                                            <asp:ListItem Value="8114" Text="Sektor Swasta Nasional Perusahaan perkayuan (HPH)"></asp:ListItem>
                                            <asp:ListItem Value="8120" Text="Sektor Swasta Nasional Perusahaan Properti dan Real Estate"></asp:ListItem>
                                            <asp:ListItem Value="8121" Text="Sektor Swasta Nasional Perusahaan Jasa Konstruksi Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="8116" Text="Sektor Swasta Nasional Perusahaan Industri Rokok"></asp:ListItem>
                                            <asp:ListItem Value="8117" Text="Sektor Swasta Nasional Perusahaan Industri Makanan"></asp:ListItem>
                                            <asp:ListItem Value="8118" Text="Sektor Swasta Nasional Perusahaan Agrobisnis"></asp:ListItem>
                                            <asp:ListItem Value="8119" Text="Sektor Swasta Nasional Perusahaan Telekomonikasi"></asp:ListItem>
                                            <asp:ListItem Value="8139" Text="Sektor Swasta Nasional Perusahaan Jasa Konstruksi Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="8141" Text="Sektor Swasta Nasional Koperasi Primer"></asp:ListItem>
                                            <asp:ListItem Value="8149" Text="Sektor Swasta Nasional Koperasi Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="8151" Text="Sektor Swasta Nasional Badan Amil Zakat Infaq dan Shadaqah "></asp:ListItem>
                                            <asp:ListItem Value="8152" Text="Sektor Swasta Nasional Lembaga Pendidikan"></asp:ListItem>
                                            <asp:ListItem Value="8159" Text="Sektor Swasta Nasional Yayasan, Badan Sosial dan Organisasi Kemasyarakatan Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="8411" Text="Sektor Swasta Campuran Perusahaan Otomotif"></asp:ListItem>
                                            <asp:ListItem Value="8412" Text="Sektor Swasta Campuran Perusahaan Perminyakan"></asp:ListItem>
                                            <asp:ListItem Value="8413" Text="Sektor Swasta Campuran Perusahaan Tekstil"></asp:ListItem>
                                            <asp:ListItem Value="8414" Text="Sektor Swasta Campuran Perusahaan Perkayuan"></asp:ListItem>
                                            <asp:ListItem Value="8420" Text="Sektor Swasta Campuran Perusahaan Properti dan Real Estate"></asp:ListItem>
                                            <asp:ListItem Value="8421" Text="Sektor Swasta Campuran Perusahaan Jasa Konstruksi Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="8416" Text="Sektor Swasta Campuran Perusahaan Industri Rokok"></asp:ListItem>
                                            <asp:ListItem Value="8417" Text="Sektor Swasta Campuran Perusahaan Industri Makanan"></asp:ListItem>
                                            <asp:ListItem Value="8418" Text="Sektor Swasta Campuran Perusahaan Agrobisnis"></asp:ListItem>
                                            <asp:ListItem Value="8419" Text="Sektor Swasta Campuran Perusahaan Telekomonikasi"></asp:ListItem>
                                            <asp:ListItem Value="8449" Text="Sektor Swasta Campuran Perusahaan -Perusahaan Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="8451" Text="Sektor Swasta Campuran Badan Amil Zakat Infaq dan Shadaqah"></asp:ListItem>
                                            <asp:ListItem Value="8452" Text="Sektor Swasta Campuran Lembaga Pendidikan"></asp:ListItem>
                                            <asp:ListItem Value="8469" Text="Sektor Swasta Campuran yayasan, Badan Sosial dan Organisasi Kemasyarakatan Lainna"></asp:ListItem>
                                            <asp:ListItem Value="8480" Text="Sektor Swasta Campuran Kantor Perwakilan Lembaga Milik Asing di Indonesia Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="8611" Text="Sektor Swasta Asing Perusahaan Otomotif"></asp:ListItem>
                                            <asp:ListItem Value="8612" Text="Sektor Swasta Asing Perusahaan Perminyakan"></asp:ListItem>
                                            <asp:ListItem Value="8613" Text="Sektor Swasta Asing Perusahaan Tekstil"></asp:ListItem>
                                            <asp:ListItem Value="8614" Text="Sektor Swasta Asing Perusahaan Perkayuan"></asp:ListItem>
                                            <asp:ListItem Value="8620" Text="Sektor Swasta Asing Perusahaan Properti dan Real Estate"></asp:ListItem>
                                            <asp:ListItem Value="8621" Text="Sektor Swasta Asing Perusahaan Jasa Konstruksi Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="8616" Text="Sektor Swasta Asing Perusahaan Industri Rokok"></asp:ListItem>
                                            <asp:ListItem Value="8617" Text="Sektor Swasta Asing Perusahaan Industri Makanan"></asp:ListItem>
                                            <asp:ListItem Value="8618" Text="Sektor Swasta Asing Perusahaan Agrobisnis"></asp:ListItem>
                                            <asp:ListItem Value="8619" Text="Sektor Swasta Asing Perusahaan - Perusahaan Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="8651" Text="Sektor Swasta Asing Badan Amil Zakat Infaq dan Shadaqah"></asp:ListItem>
                                            <asp:ListItem Value="8652" Text="Sektor Swasta Asing Lembaga Pendidikan"></asp:ListItem>
                                            <asp:ListItem Value="8659" Text="Sektor Swasta Asing Yayasan, Badan Sosial dan Organisasi Kemasyarakatan Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="8670" Text="Sektor Swasta Asing Kantor Perwakilan Lembaga Milik Asing di Indonesia Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="8900" Text="Sektor Swasta Lainnya (perusahaan/Bank Dilikuidasi)"></asp:ListItem>
                                            <asp:ListItem Value="9000" Text="Perseorangan"></asp:ListItem>
                                            <asp:ListItem Value="9100" Text="Pemerintah Pusat"></asp:ListItem>
                                            <asp:ListItem Value="9110" Text="Pemerintah Daerah"></asp:ListItem>
                                            <asp:ListItem Value="9200" Text="Perwakilan Negara-Negara Asing dan Stafnya"></asp:ListItem>
                                            <asp:ListItem Value="9300" Text="BUMN Milik negara Asing"></asp:ListItem>
                                            <asp:ListItem Value="9400" Text="Lembaga-lembaga keuangan bukan bank yang beroperasi di luar Indonesia"></asp:ListItem>
                                            <asp:ListItem Value="9410" Text="Lembaga-lembaga keuangan bukan bank milik negara asing"></asp:ListItem>
                                            <asp:ListItem Value="9501" Text="Swasta Patuangan Indonesia dan Negara Asing"></asp:ListItem>
                                            <asp:ListItem Value="9502" Text="Swasta Milik Indonesia"></asp:ListItem>
                                            <asp:ListItem Value="9519" Text="Swasta Lainnya - Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="9611" Text="Islamic Development Bank (IDB)"></asp:ListItem>
                                            <asp:ListItem Value="9612" Text="Asian Development Bank (ADB)"></asp:ListItem>
                                            <asp:ListItem Value="9613" Text="World Bank Group"></asp:ListItem>
                                            <asp:ListItem Value="9614" Text="African Development Bank Group"></asp:ListItem>
                                            <asp:ListItem Value="9615" Text="European Bank for Reconstruction and Development"></asp:ListItem>
                                            <asp:ListItem Value="9616" Text="Inter - American Development Bank Group"></asp:ListItem>
                                            <asp:ListItem Value="9617" Text="European Investment Bank"></asp:ListItem>
                                            <asp:ListItem Value="9618" Text="European Investment Fund"></asp:ListItem>
                                            <asp:ListItem Value="9619" Text="Nordic Investmen Bank"></asp:ListItem>
                                            <asp:ListItem Value="9620" Text="Caribbean Development Bank"></asp:ListItem>
                                            <asp:ListItem Value="9621" Text="Council of Europe Development Bank"></asp:ListItem>
                                            <asp:ListItem Value="9629" Text="Bank Pembangunan Multiteral Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="9690" Text="Lembaga Internasional Lainnya"></asp:ListItem>
                                            <asp:ListItem Value="9700" Text="Bukan Penduduk - Perseorangan"></asp:ListItem>
                                            <asp:ListItem Value="0002" Text="Perbankan"></asp:ListItem>

                                    </cc1:XUIDropDownList>
                                    <%--<cc1:XUITextBox ID="txtKODE_GOLONGAN" runat="server" DBColumnName="KODE_GOLONGAN" SPParameterName="p_kode_golongan" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>--%>
                                </div>
                            </div>                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Peringkat</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtPERINGKAT" runat="server" DBColumnName="PERINGKAT" SPParameterName="p_peringkat" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Lembaga Pemeringkat</label>
                                
                                <div class="col-sm-7">
                                     <cc1:XUIDropDownList ID="ddlLEMBAGA_PEMERINGKAT" runat="server" DBColumnName="LEMBAGA_PEMERINGKAT" SPParameterName="p_lembaga_pemeringkat" DataType="String" BindType="Both" CssClass="form-control">
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
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Tanggal Pemeringkat</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtTANGGAL_PEMERINGKAT" runat="server" DBColumnName="TANGGAL_PEMERINGKAT" SPParameterName="p_tanggal_pemeringkat" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4">Group</label>
                                
                                <div class="col-sm-7">
                                    <cc1:XUITextBox ID="txtNAMA_GROUP" runat="server" DBColumnName="NAMA_GROUP" SPParameterName="p_nama_group" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
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

