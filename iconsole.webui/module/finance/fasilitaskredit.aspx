<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="fasilitaskredit.aspx.cs" Inherits="module_finance_fasilitaskredit" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
	<section class="panel">
		<header class="panel-heading">
			<span>F01 - Keredit yang diberikan</span>
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
								<label class="col-sm-4">Sifat Kredit</label>
								
								<div class="col-sm-7">
									<cc1:XUIDropDownList ID="ddlKD_SIFAT_KREDIT" runat="server" DBColumnName="KD_SIFAT_KREDIT" SPParameterName="p_kd_sifat_kredit" DataType="String" BindType="Both" CssClass="form-control">
										<asp:ListItem Value="1" Text="Kredit/pembiayaan yang direstrukturisasi"></asp:ListItem>
										<asp:ListItem Value="2" Text="Pengambilalihan kredit/pembiayaan"></asp:ListItem>
										<asp:ListItem Value="3" Text="Kredit/pembiayaan subordinasi"></asp:ListItem>
										<asp:ListItem Value="9" Text="Lainnya"></asp:ListItem>
									</cc1:XUIDropDownList>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Jenis Kredit</label>
								
								<div class="col-sm-7">
									<cc1:XUIDropDownList ID="ddlKD_JENIS_KREDIT" runat="server" DBColumnName="KD_JENIS_KREDIT" SPParameterName="p_kd_jenis_kredit" DataType="String" BindType="Both" CssClass="form-control">
										<asp:ListItem Value="05" Text="Kredit/pembiayaan  yang diberikan"></asp:ListItem>
										<asp:ListItem Value="10" Text="Kredit/pembiayaan  dalam rangka pembiayaan bersama (sindikasi)"></asp:ListItem>
										<asp:ListItem Value="20" Text="Kredit/pembiayaan kepada pihak ketiga melalui lembaga lain secara channeling"></asp:ListItem>
										<asp:ListItem Value="26" Text="Kredit/pembiayaan kepada UMKM melalui lembaga lain secara executing"></asp:ListItem>
										<asp:ListItem Value="27" Text="Kredit/pembiayaan kepada Non-UMKM melalui lembaga lain secara executing "></asp:ListItem>
										<asp:ListItem Value="30" Text="Kartu Kredit"></asp:ListItem>
										<asp:ListItem Value="45" Text="Surat berharga dengan Note Purchase Agreement (NPA)"></asp:ListItem>
										<asp:ListItem Value="80" Text="Giro bersaldo debet"></asp:ListItem>
										<asp:ListItem Value="85" Text="Tagihan atas transaksi perdagangan"></asp:ListItem>
										<asp:ListItem Value="99" Text="Lainnya"></asp:ListItem>
									</cc1:XUIDropDownList>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Skim</label>
								
								<div class="col-sm-7">
									 <cc1:XUIDropDownList ID="ddlKD_SKIM" runat="server" DBColumnName="KD_SKIM" SPParameterName="p_kd_skim" DataType="String" BindType="Both" CssClass="form-control">
										<asp:ListItem Value="00" Text="Konvensional"></asp:ListItem>
										<asp:ListItem Value="01" Text="Murabahah"></asp:ListItem>
										<asp:ListItem Value="02" Text="Istishna"></asp:ListItem>
										<asp:ListItem Value="03" Text="Salam"></asp:ListItem>
										<asp:ListItem Value="04" Text="Qard"></asp:ListItem>
										<asp:ListItem Value="05" Text="Mudharabah"></asp:ListItem>
										<asp:ListItem Value="06" Text="Musyarakah"></asp:ListItem>
										<asp:ListItem Value="07" Text="Ijarah"></asp:ListItem>
										<asp:ListItem Value="08" Text="Mudharabah Muqayyadah"></asp:ListItem>
										<asp:ListItem Value="09" Text="Ijarah Muntahiya Bitamlik"></asp:ListItem>
										<asp:ListItem Value="99" Text="Skim/Akad Syariah Lainnya"></asp:ListItem>
									</cc1:XUIDropDownList>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">No. Akad</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtNO_AKAD_AWAL" runat="server" DBColumnName="NO_AKAD_AWAL" SPParameterName="p_no_akad_awal" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Tanggal Akad</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtTGL_AKAD_AWAL" runat="server" DBColumnName="TGL_AKAD_AWAL" SPParameterName="p_tgl_akad_awal" CssClass="form-control default-date-picker" DataType="DateTime" BindType="Both" Format="dd/MM/yyyy"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">No. Perubahan Akad</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtNO_AKAD_AKHIR" runat="server" DBColumnName="NO_AKAD_AKHIR" SPParameterName="p_no_akad_akhir" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Tanggal Perubahan akad</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtTGL_AKAD_AKHIR" runat="server" CssClass="form-control default-date-picker" DBColumnName="TGL_AKAD_AKHIR" SPParameterName="p_tgl_akad_akhir" BindType="Both" DataType="DateTime" Format="dd/MM/yyyy"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Baru</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtBARU" runat="server" DBColumnName="BARU" SPParameterName="p_baru" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Tanggal Kredit</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtTGL_AWAL_KREDIT" runat="server" DBColumnName="TGL_AWAL_KREDIT" SPParameterName="p_tgl_awal_kredit" CssClass="form-control default-date-picker" DataType="DateTime" BindType="Both" Format="dd/MM/yyyy"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Tanggal Mulai</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtTGL_MULAI" runat="server" DBColumnName="TGL_MULAI" SPParameterName="p_tgl_mulai" CssClass="form-control default-date-picker" DataType="DateTime" BindType="Both" Format="dd/MM/yyyy"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Tanggal Tatuh Tempo</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtTGL_JATUH_TEMPO" runat="server" DBColumnName="TGL_JATUH_TEMPO" SPParameterName="p_tgl_jatuh_tempo" CssClass="form-control default-date-picker" DataType="DateTime" BindType="Both" Format="dd/MM/yyyy"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Kategori Debitur</label>
								
								<div class="col-sm-7">
									<cc1:XUIDropDownList ID="ddlKD_KATEGORI_DEBITUR" runat="server" DBColumnName="KD_KATEGORI_DEBITUR" SPParameterName="p_kd_kategori_debitur" DataType="String" BindType="Both" CssClass="form-control">
										<asp:ListItem Value="10" Text="Debitur UMKM – Dengan Penjaminan/Asuransi Kredit - Penjamin Tertentu – Mikro"></asp:ListItem>
										<asp:ListItem Value="20" Text="Debitur UMKM - Dengan Penjaminan/Asuransi Kredit - Penjamin Tertentu – Kecil"></asp:ListItem>
										<asp:ListItem Value="30" Text="Debitur UMKM - Dengan Penjaminan/Asuransi Kredit - Penjamin Tertentu – Menengah"></asp:ListItem>
										<asp:ListItem Value="40" Text="Debitur UMKM - Dengan Penjaminan/Asuransi Kredit - Penjamin Lainnya – Mikro"></asp:ListItem>
										<asp:ListItem Value="50" Text="Debitur UMKM - Dengan Penjaminan/Asuransi Kredit - Penjamin Lainnya – Kecil"></asp:ListItem>
										<asp:ListItem Value="60" Text="Debitur UMKM - Dengan Penjaminan/Asuransi Kredit - Penjamin Lainnya – Menengah"></asp:ListItem>
										<asp:ListItem Value="70" Text="Debitur UMKM - UMKM Lainnya – Mikro"></asp:ListItem>
										<asp:ListItem Value="80" Text="Debitur UMKM - UMKM Lainnya – Kecil"></asp:ListItem>
										<asp:ListItem Value="90" Text="Debitur UMKM - UMKM Lainnya – Menengah"></asp:ListItem>
										<asp:ListItem Value="99" Text="Bukan Debitur Usaha Mikro, Kecil, dan Menengah"></asp:ListItem>
									</cc1:XUIDropDownList>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Jenis Penggunaan</label>
								
								<div class="col-sm-7">
									<cc1:XUIDropDownList ID="ddlKD_JENIS_PENGGUNAAN" runat="server" DBColumnName="KD_JENIS_PENGGUNAAN" SPParameterName="p_kd_jenis_penggunaan" DataType="String" BindType="Both" CssClass="form-control">
										<asp:ListItem Value="1" Text="Modal Kerja"></asp:ListItem>
										<asp:ListItem Value="2" Text="Investasi"></asp:ListItem>
										<asp:ListItem Value="3" Text="Konsumsi"></asp:ListItem>
									</cc1:XUIDropDownList>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Orientasi Pengguna</label>
								
								<div class="col-sm-7">
									<cc1:XUIDropDownList ID="ddlKD_ORIENTASI_PENGGUNAAN" runat="server" DBColumnName="KD_ORIENTASI_PENGGUNAAN" SPParameterName="p_kd_orientasi_penggunaan" DataType="String" BindType="Both" CssClass="form-control">
										<asp:ListItem Value="1" Text="Ekspor"></asp:ListItem>
										<asp:ListItem Value="2" Text="Impor"></asp:ListItem>
										<asp:ListItem Value="3" Text="Lainnya"></asp:ListItem>
									</cc1:XUIDropDownList>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Ekonomi</label>
								
								<div class="col-sm-7">
									 <asp:DropDownList ID="txtKD_SEKTOR_EKONOMI" runat="server" DBColumnName="KD_SEKTOR_EKONOMI" SPParameterName="p_kd_sektor_ekonomi" DataType="String" BindType="Both" CssClass="form-control">
										 <%--<asp:ListItem Value="-" Text="Test"></asp:ListItem>--%>
									</asp:DropDownList>
									<%--<cc1:XUITextBox ID="txtKD_SEKTOR_EKONOMI" runat="server" DBColumnName="KD_SEKTOR_EKONOMI" SPParameterName="p_kd_sektor_ekonomi" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>--%>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Kab.</label>
								
								<div class="col-sm-7">
									<asp:DropDownList ID="txtKD_KAB" runat="server" DBColumnName="KD_KAB" SPParameterName="p_kd_kab" DataType="String" BindType="Both" CssClass="form-control">
										 <%--<asp:ListItem Value="-" Text="Test"></asp:ListItem>--%>
									</asp:DropDownList>
									<%--<cc1:XUITextBox ID="txtKD_KAB" runat="server" DBColumnName="KD_KAB" SPParameterName="p_kd_kab" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>--%>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Nilai Proyek</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtNILAI_PROYEK" runat="server" DBColumnName="NILAI_PROYEK" SPParameterName="p_nilai_proyek" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Valuta</label>
								
								<div class="col-sm-7">
									<cc1:XUIDropDownList ID="txtKD_VALUTA" runat="server" DBColumnName="KD_VALUTA" SPParameterName="p_kd_valuta" DataType="String" BindType="Both" CssClass="form-control">
										<asp:ListItem Value="AFN" Text="Afghanistan Afghani"></asp:ListItem>
										<asp:ListItem Value="ALL" Text="Albanian Lek"></asp:ListItem>
										<asp:ListItem Value="DZD" Text="Algerian Dinar"></asp:ListItem>
										<asp:ListItem Value="USD" Text="US Dollar"></asp:ListItem>
										<asp:ListItem Value="ADP" Text="Andorran Peseta"></asp:ListItem>
										<asp:ListItem Value="FRF" Text="French Franc"></asp:ListItem>
										<asp:ListItem Value="ESO" Text="Spanish Peseta"></asp:ListItem>
										<asp:ListItem Value="AOA" Text="Angokan Kwanza"></asp:ListItem>
										<asp:ListItem Value="XCD" Text="East Caribbean Dollar"></asp:ListItem>
										<asp:ListItem Value="NOK" Text="Norwegian Krone"></asp:ListItem>
										<asp:ListItem Value="ARS" Text="Argentine Peso"></asp:ListItem>
										<asp:ListItem Value="AMD" Text="Armenia Dram"></asp:ListItem>
										<asp:ListItem Value="AWG" Text="Aruban Guider"></asp:ListItem>
										<asp:ListItem Value="AUD" Text="Australian Dollar"></asp:ListItem>
										<asp:ListItem Value="ATS" Text="Asutrian Schilling"></asp:ListItem>
										<asp:ListItem Value="AZM" Text="Azerbaijan Mant"></asp:ListItem>
										<asp:ListItem Value="BSD" Text="Bahamas Dollar"></asp:ListItem>
										<asp:ListItem Value="BHD" Text="Bahraini Dinar"></asp:ListItem>
										<asp:ListItem Value="BDT" Text="Bangladesh Taka"></asp:ListItem>
										<asp:ListItem Value="BBD" Text="Bardados Dollar"></asp:ListItem>
										<asp:ListItem Value="BYR" Text="Belarus Rouble"></asp:ListItem>
										<asp:ListItem Value="BEF" Text="Belgian Franc"></asp:ListItem>
										<asp:ListItem Value="BZD" Text="Belize Dollar"></asp:ListItem>
										<asp:ListItem Value="XOF" Text="CFA Franc BCEAO"></asp:ListItem>
										<asp:ListItem Value="BMD" Text="Bermudian Dollar"></asp:ListItem>
										<asp:ListItem Value="INR" Text="Indian Rupee"></asp:ListItem>
										<asp:ListItem Value="BTN" Text="Bhutan Ngultrum"></asp:ListItem>
										<asp:ListItem Value="BOB" Text="Bolivian Boliviano"></asp:ListItem>
										<asp:ListItem Value="BAM" Text="Bosnia-Herze Conv Marka"></asp:ListItem>
										<asp:ListItem Value="BWP" Text="Botswana Pula"></asp:ListItem>
										<asp:ListItem Value="BRL" Text="Brazilian Real"></asp:ListItem>
										<asp:ListItem Value="GBP" Text="Pound Sterling (United Kingdom Pound)"></asp:ListItem>
										<asp:ListItem Value="SCR" Text="Seychelles Rupee"></asp:ListItem>
										<asp:ListItem Value="BND" Text="Brunei Dollar"></asp:ListItem>
										<asp:ListItem Value="BEN" Text="Bulgarian Lev"></asp:ListItem>
										<asp:ListItem Value="BIF" Text="Burundi Franc"></asp:ListItem>
										<asp:ListItem Value="KHR" Text="Cambodia Riel"></asp:ListItem>
										<asp:ListItem Value="XAF" Text="Franc de la Communaute finaniere Africaine"></asp:ListItem>
										<asp:ListItem Value="CLP" Text="Chilean Peso"></asp:ListItem>
										<asp:ListItem Value="CLF" Text="Chilean Fomento"></asp:ListItem>
										<asp:ListItem Value="CNY" Text="China Renminbi"></asp:ListItem>
										<asp:ListItem Value="CNH" Text="China Offshore Yuan"></asp:ListItem>
										<asp:ListItem Value="COP" Text="Colombian Peso"></asp:ListItem>
										<asp:ListItem Value="KMF" Text="Comoros Franc"></asp:ListItem>
										<asp:ListItem Value="CDF" Text="Democratic Rep. Congo Franc"></asp:ListItem>
										<asp:ListItem Value="NZD" Text="New Zealand Dollar"></asp:ListItem>
										<asp:ListItem Value="CRC" Text="Costa Rican Colon"></asp:ListItem>
										<asp:ListItem Value="HRK" Text="Croatian Kuna"></asp:ListItem>
										<asp:ListItem Value="CUP" Text="Cuban Peso"></asp:ListItem>
										<asp:ListItem Value="CYP" Text="Cypriot Pound"></asp:ListItem>
										<asp:ListItem Value="CZK" Text="Czech Koruna"></asp:ListItem>
										<asp:ListItem Value="DKK" Text="Danish Krone"></asp:ListItem>
										<asp:ListItem Value="DJF" Text="Djibouti Franc"></asp:ListItem>
										<asp:ListItem Value="DOP" Text="Dominican Republic Peso"></asp:ListItem>
										<asp:ListItem Value="ECS" Text="Ecuaderean Sucre"></asp:ListItem>
										<asp:ListItem Value="EGP" Text="Egyptian Pound"></asp:ListItem>
										<asp:ListItem Value="SVC" Text="El Savador Colon "></asp:ListItem>
										<asp:ListItem Value="ERN" Text="Eritreian Nakfa"></asp:ListItem>
										<asp:ListItem Value="EEK" Text="Estonian Kroon"></asp:ListItem>
										<asp:ListItem Value="ETB" Text="Ethiopian Birr"></asp:ListItem>
										<asp:ListItem Value="EURO" Text="European Community"></asp:ListItem>
										<asp:ListItem Value="FKP" Text="Falkland Islandss Pound"></asp:ListItem>
										<asp:ListItem Value="FJD" Text="Fiji Dollar"></asp:ListItem>
										<asp:ListItem Value="FIM" Text="Finnis Markka"></asp:ListItem>
										<asp:ListItem Value="XPF" Text="Franc Pacific Is.Fran"></asp:ListItem>
										<asp:ListItem Value="GMD" Text="Gambian Dalasi"></asp:ListItem>
										<asp:ListItem Value="GEL" Text="Georgian Lari"></asp:ListItem>
										<asp:ListItem Value="DEM" Text="Geerman Mark"></asp:ListItem>
										<asp:ListItem Value="GHC" Text="Ghana Cedi"></asp:ListItem>
										<asp:ListItem Value="GIP " Text="Gibraltar Pound"></asp:ListItem>
										<asp:ListItem Value="GTQ" Text="Guatemala Quetzal"></asp:ListItem>
										<asp:ListItem Value="GNF" Text="Guinea Franc"></asp:ListItem>
										<asp:ListItem Value="GYD" Text="Guyana Dollar"></asp:ListItem>
										<asp:ListItem Value="HTG" Text="Haiti Gourde"></asp:ListItem>
										<asp:ListItem Value="HNL" Text="Honduras Lempira"></asp:ListItem>
										<asp:ListItem Value="HKD" Text="Hong Kong Dollar"></asp:ListItem>
										<asp:ListItem Value="HUF" Text="Hungarian Forint"></asp:ListItem>
										<asp:ListItem Value="ISK" Text="Icelandic Krona"></asp:ListItem>
										<asp:ListItem Value="IDR" Text="Indonesian Rupiah "></asp:ListItem>
										<asp:ListItem Value="IRR" Text="Iranian Rial"></asp:ListItem>
										<asp:ListItem Value="IQD" Text="Iraqi Dinar"></asp:ListItem>
										<asp:ListItem Value="IEP" Text="Irish Punt"></asp:ListItem>
										<asp:ListItem Value="ILS" Text="Israeli Shekel"></asp:ListItem>
										<asp:ListItem Value="ITL" Text="Italian Lira"></asp:ListItem>
										<asp:ListItem Value="JMD" Text="Jamaican Dollar"></asp:ListItem>
										<asp:ListItem Value="JPY" Text="Japanese Yen"></asp:ListItem>
										<asp:ListItem Value="JOD" Text="Jordanian Dinar"></asp:ListItem>
										<asp:ListItem Value="KZT" Text="Kazakhstan Tenge"></asp:ListItem>
										<asp:ListItem Value="KES" Text="Kenyan Shilling"></asp:ListItem>
										<asp:ListItem Value="KRW" Text="Korean Won"></asp:ListItem>
										<asp:ListItem Value="KPW" Text="North Korean Won"></asp:ListItem>
										<asp:ListItem Value="KWD" Text="Kuwaiti Dinar"></asp:ListItem>
										<asp:ListItem Value="KGS" Text="Kyrgyzstan Som"></asp:ListItem>
										<asp:ListItem Value="LAK" Text="Laos New Kip"></asp:ListItem>
										<asp:ListItem Value="LVL" Text="Latvian Lats"></asp:ListItem>
										<asp:ListItem Value="LBP" Text="Lebanese Pound"></asp:ListItem>
										<asp:ListItem Value="LSL" Text="Loti Lesatho"></asp:ListItem>
										<asp:ListItem Value="LRD" Text="Liberian Dollar"></asp:ListItem>
										<asp:ListItem Value="LYD" Text="Libyan Dinar"></asp:ListItem>
										<asp:ListItem Value="CHF" Text="Liechtenstein Franc"></asp:ListItem>
										<asp:ListItem Value="LTL" Text="Lithuanian Litas"></asp:ListItem>
										<asp:ListItem Value="LUF" Text="Luxembourg Franc"></asp:ListItem>
										<asp:ListItem Value="MOP" Text="Macau Pataca"></asp:ListItem>
										<asp:ListItem Value="MKD" Text="Macedonian Denar"></asp:ListItem>
										<asp:ListItem Value="MGF" Text="Madagascar Franc"></asp:ListItem>
										<asp:ListItem Value="MWK" Text="Malawi Kwacha"></asp:ListItem>
										<asp:ListItem Value="MYR" Text="Malaysian Ringgit"></asp:ListItem>
										<asp:ListItem Value="MVR" Text="Maldives Rufiyaa"></asp:ListItem>
										<asp:ListItem Value="MLF" Text="Malian Franc"></asp:ListItem>
										<asp:ListItem Value="MTL" Text="Maltese Lira"></asp:ListItem>
										<asp:ListItem Value="MRO" Text="Mauritania Ouguiya"></asp:ListItem>
										<asp:ListItem Value="MUR" Text="Maurutius Rupee"></asp:ListItem>
										<asp:ListItem Value="MXN" Text="Mexican Peso"></asp:ListItem>
										<asp:ListItem Value="MDL" Text="Moldova Lei"></asp:ListItem>
										<asp:ListItem Value="MNT" Text="Mongolia Tugrik"></asp:ListItem>
										<asp:ListItem Value="MAD" Text="Moroccan Dirham"></asp:ListItem>
										<asp:ListItem Value="MZM" Text="Mozambique Metical"></asp:ListItem>
										<asp:ListItem Value="MMK" Text="Myanmar Kyat"></asp:ListItem>
										<asp:ListItem Value="NAD" Text="Namibia Dollar"></asp:ListItem>
										<asp:ListItem Value="ZAR" Text="Rand (South African Rand)"></asp:ListItem>
										<asp:ListItem Value="NPR" Text="Nepalese Rupee"></asp:ListItem>
										<asp:ListItem Value="ANG" Text="Netherlands Guilder/Gulden/Florin"></asp:ListItem>
										<asp:ListItem Value="NGN" Text="Nigeria Naira"></asp:ListItem>
										<asp:ListItem Value="OMR" Text="Omani Rial"></asp:ListItem>
										<asp:ListItem Value="PKR" Text="Pakistan Rupee"></asp:ListItem>
										<asp:ListItem Value="PAB" Text="Panamanian Balboa"></asp:ListItem>
										<asp:ListItem Value="PGK" Text="Papua New Guinea Kina"></asp:ListItem>
										<asp:ListItem Value="PYG" Text="Paraguayan Guarani"></asp:ListItem>
										<asp:ListItem Value="PEN" Text="Peruvian Nuevo"></asp:ListItem>
										<asp:ListItem Value="PHP" Text="Philippines Peso"></asp:ListItem>
										<asp:ListItem Value="PLN" Text="Polis Zloty/New Zloty"></asp:ListItem>
										<asp:ListItem Value="PTE" Text="Portuguese Escudo"></asp:ListItem>
										<asp:ListItem Value="QAR" Text="Qatari Rial"></asp:ListItem>
										<asp:ListItem Value="ROL" Text="Romanian Leu"></asp:ListItem>
										<asp:ListItem Value="RUB" Text="Russian Rouble"></asp:ListItem>
										<asp:ListItem Value="RWF" Text="Rwanda Franc"></asp:ListItem>
										<asp:ListItem Value="WST" Text="Samoan (West) Tala"></asp:ListItem>
										<asp:ListItem Value="STD" Text="Sao Tome Dobra"></asp:ListItem>
										<asp:ListItem Value="SAR" Text="Saudi Riyal"></asp:ListItem>
										<asp:ListItem Value="SLL" Text="Sierra Leone Leone"></asp:ListItem>
										<asp:ListItem Value="SGD" Text="Singapore Dollar"></asp:ListItem>
										<asp:ListItem Value="SKK" Text="Slovakian Koruna"></asp:ListItem>
										<asp:ListItem Value="SIT" Text="Slovenia Tolar"></asp:ListItem>
										<asp:ListItem Value="SBD" Text="Solomon Islands Dollar"></asp:ListItem>
										<asp:ListItem Value="SOS" Text="Somali Schilling"></asp:ListItem>
										<asp:ListItem Value="ESP" Text="Spanish Peseta (convertiable Peseta Acc)"></asp:ListItem>
										<asp:ListItem Value="ESB" Text="Spanish Peseta"></asp:ListItem>
										<asp:ListItem Value="LKR" Text="Sri Langka Rupee"></asp:ListItem>
										<asp:ListItem Value="SHP" Text="St. Helena Pound"></asp:ListItem>
										<asp:ListItem Value="SDP" Text="Sudanese Pound"></asp:ListItem>
										<asp:ListItem Value="SDD" Text="Sudanese Dinar"></asp:ListItem>
										<asp:ListItem Value="SRG" Text="Surinam Guilder"></asp:ListItem>
										<asp:ListItem Value="SRD" Text="Surinam Dollar "></asp:ListItem>
										<asp:ListItem Value="SZL" Text="Swaziland Lilangeni"></asp:ListItem>
										<asp:ListItem Value="SEK" Text="Swedish Krone"></asp:ListItem>
										<asp:ListItem Value="SYP" Text="Syrian Pound"></asp:ListItem>
										<asp:ListItem Value="TWD" Text="Taiwan Dollar"></asp:ListItem>
										<asp:ListItem Value="TJS" Text="Tajikistan Somoni"></asp:ListItem>
										<asp:ListItem Value="TZS" Text="Tanzanian Shilling"></asp:ListItem>
										<asp:ListItem Value="THB" Text="Thai Bath"></asp:ListItem>
										<asp:ListItem Value="TOP" Text="Tonga Pa'anga"></asp:ListItem>
										<asp:ListItem Value="TTD" Text="Trinidad & Tobago Dollar"></asp:ListItem>
										<asp:ListItem Value="TND" Text="Tunisian Dinar"></asp:ListItem>
										<asp:ListItem Value="TRY" Text="Turkish Lira"></asp:ListItem>
										<asp:ListItem Value="TMM" Text="Turkmenistan Manat"></asp:ListItem>
										<asp:ListItem Value="UGX" Text="Ugandan Shilling"></asp:ListItem>
										<asp:ListItem Value="UAH" Text="Ukrainian Hryvna"></asp:ListItem>
										<asp:ListItem Value="AED" Text="UAE Dirham"></asp:ListItem>
										<asp:ListItem Value="UYU" Text="Uruguay Peso"></asp:ListItem>
										<asp:ListItem Value="UZS" Text="Uzbekistan Sum"></asp:ListItem>
										<asp:ListItem Value="VUV" Text="Vanuatu Vatu"></asp:ListItem>
										<asp:ListItem Value="VEB" Text="Venezuelan Bolivar"></asp:ListItem>
										<asp:ListItem Value="VND" Text="Vietnam Dong"></asp:ListItem>
										<asp:ListItem Value="YER" Text="Yemeni Rial"></asp:ListItem>
										<asp:ListItem Value="YUM" Text="Yugoslav Dinar"></asp:ListItem>
										<asp:ListItem Value="GRD" Text="Greek Drachma"></asp:ListItem>
										<asp:ListItem Value="ZMK" Text="Zambian Kwacha"></asp:ListItem>
										<asp:ListItem Value="ZWD" Text="Zimbabwe Dollar"></asp:ListItem>
										<asp:ListItem Value="XDR" Text="Special Drawing Right"></asp:ListItem>
										<asp:ListItem Value="XAG" Text="Silver"></asp:ListItem>
										<asp:ListItem Value="XAU" Text="Gold"></asp:ListItem>

									</cc1:XUIDropDownList>
									<%--<cc1:XUITextBox ID="txtKD_VALUTA" runat="server" DBColumnName="KD_VALUTA" SPParameterName="p_kd_valuta" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>--%>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Suku Bunga</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtPRS_SUKU_BUNGA" runat="server" DBColumnName="PRS_SUKU_BUNGA" SPParameterName="p_prs_suku_bunga" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Jenis Suku Bunga</label>
								
								<div class="col-sm-7">
									<cc1:XUIDropDownList ID="ddlJNS_SUKU_BUNGA" runat="server" DBColumnName="JNS_SUKU_BUNGA" SPParameterName="p_jns_suku_bunga" DataType="String" BindType="Both" CssClass="form-control">
										<asp:ListItem Value="1" Text="Suku Bunga Fixed"></asp:ListItem>
										<asp:ListItem Value="2" Text="Suku Bunga Floating"></asp:ListItem>
										<asp:ListItem Value="3" Text="Margin"></asp:ListItem>
										<asp:ListItem Value="4" Text="Bagi Hasil"></asp:ListItem>
										<asp:ListItem Value="5" Text="Ujroh"></asp:ListItem>
										<asp:ListItem Value="9" Text="Lainnya"></asp:ListItem>
									</cc1:XUIDropDownList>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Program Pemerintah</label>
								
								<div class="col-sm-7">
									<cc1:XUIDropDownList ID="ddlKRDT_PRORAM_PEMERINTAH" runat="server" DBColumnName="KRDT_PRORAM_PEMERINTAH" SPParameterName="p_krdt_proram_pemerintah" DataType="String" BindType="Both" CssClass="form-control">
										<asp:ListItem Value="001" Text="Kredit Bukan Program Pemerintah"></asp:ListItem>
										<asp:ListItem Value="002" Text="Kredit Usaha Rakyat"></asp:ListItem>
										<asp:ListItem Value="003" Text="Kredit Pemilikan Rumah Bersubsidi"></asp:ListItem>
										<asp:ListItem Value="900" Text="Kredit Program Pemerintah Lainnya"></asp:ListItem>
									</cc1:XUIDropDownList>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Take Over</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtTAKE_OVER_DARI" runat="server" DBColumnName="TAKE_OVER_DARI" SPParameterName="p_take_over_dari" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Sumber Dana</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtSUMBER_DANA" runat="server" DBColumnName="SUMBER_DANA" SPParameterName="p_sumber_dana" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Plafon Awal</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtPLAFON_AWAL" runat="server" DBColumnName="PLAFON_AWAL" SPParameterName="p_plafon_awal" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Plafon</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtPLAFON" runat="server" DBColumnName="PLAFON" SPParameterName="p_plafon" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Realisasi</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtREALISASI_BULAN" runat="server" DBColumnName="REALISASI_BULAN" SPParameterName="p_realisasi_bulan" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Denda</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtDENDA" runat="server" DBColumnName="DENDA" SPParameterName="p_denda" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Baki</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtBAKI_DENDA" runat="server" DBColumnName="BAKI_DENDA" SPParameterName="p_baki_denda" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Nilai Uang Asal</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtNILAI_UANG_ASAL" runat="server" DBColumnName="NILAI_UANG_ASAL" SPParameterName="p_nilai_uang_asal" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Kode Kolektabilitas</label>
								
								<div class="col-sm-7">
									<cc1:XUIDropDownList ID="ddlKODE_KOLEKTIBILITAS" runat="server" DBColumnName="KODE_KOLEKTIBILITAS" SPParameterName="p_kode_kolektibilitas" DataType="String" BindType="Both" CssClass="form-control">
										<asp:ListItem Value="1" Text="Lancar"></asp:ListItem>
										<asp:ListItem Value="2" Text="Dalam Perhatian Khusus"></asp:ListItem>
										<asp:ListItem Value="3" Text="Kurang Lancar"></asp:ListItem>
										<asp:ListItem Value="4" Text="Diragukan"></asp:ListItem>
										<asp:ListItem Value="5" Text="Macet"></asp:ListItem>
									</cc1:XUIDropDownList>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Tanggal Macet</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtTGL_MACET" runat="server" DBColumnName="TGL_MACET" SPParameterName="p_tgl_macet" CssClass="form-control default-date-picker" DataType="DateTime" BindType="Both" Format="dd/MM/yyyy"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Sebab Macet</label>
								
								<div class="col-sm-7">
									<cc1:XUIDropDownList ID="ddlKD_SEBAB_MACET" runat="server" DBColumnName="KD_SEBAB_MACET" SPParameterName="p_kd_sebab_macet" DataType="String" BindType="Both" CssClass="form-control">
										<asp:ListItem Value="01" text="Kesulitan Pemasaran"></asp:ListItem>
										<asp:ListItem Value="02" text="Kesulitan Manajemen dan Permasalahan Tenaga Kerja"></asp:ListItem>
										<asp:ListItem Value="03" text="Perusahaan Grup/Afiliasi yang Sangat Merugikan Debitur"></asp:ListItem>
										<asp:ListItem Value="04" text="Permasalahan Terkait Pengelolaan Lingkungan Hidup"></asp:ListItem>
										<asp:ListItem Value="05" text="Penggunaan Dana Tidak Sesuai dengan Perjanjian Kredit"></asp:ListItem>
										<asp:ListItem Value="06" text="Kelemahan Dalam Analisa Kredit"></asp:ListItem>
										<asp:ListItem Value="07" text="Fluktuasi Nilai Tukar"></asp:ListItem>
										<asp:ListItem Value="08" text="Itikad Tidak Baik"></asp:ListItem>
										<asp:ListItem Value="09" text="Force Majeur"></asp:ListItem>
										<asp:ListItem Value="10" text="Pailit"></asp:ListItem>
										<asp:ListItem Value="11" text="Uniform Classification"></asp:ListItem>
										<asp:ListItem Value="99" text="Lainnya"></asp:ListItem>
									</cc1:XUIDropDownList>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Tunggakan Pokok</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtTUNGGAKAN_POKOK" runat="server" DBColumnName="TUNGGAKAN_POKOK" SPParameterName="p_tunggakan_pokok" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Tunggakan Bunga</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtTUNGGAKAN_BUNGA" runat="server" DBColumnName="TUNGGAKAN_BUNGA" SPParameterName="p_tunggakan_bunga" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Jumlah Hari</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtJUMLAH_HARI_TUNGGAKAN" runat="server" DBColumnName="JUMLAH_HARI_TUNGGAKAN" SPParameterName="p_jumlah_hari_tunggakan" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Frk. Tunggakan</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtFRK_TUNGGAKAN" runat="server" DBColumnName="FRK_TUNGGAKAN" SPParameterName="p_frk_tunggakan" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Frk. Rest</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtFRK_REST" runat="server" DBColumnName="FRK_REST" SPParameterName="p_frk_rest" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Tanggal Rest</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtTGL_REST_AWAL" runat="server" DBColumnName="TGL_REST_AWAL" SPParameterName="p_tgl_rest_awal" CssClass="form-control default-date-picker" DataType="DateTime" BindType="Both" Format="dd/MM/yyyy"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Tanggal Rest Akhir</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtTGL_REST_AKHIR" runat="server" DBColumnName="TGL_REST_AKHIR" SPParameterName="p_tgl_rest_akhir" CssClass="form-control default-date-picker" DataType="DateTime" BindType="Both" Format="dd/MM/yyyy"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Cara Rest</label>
								
								<div class="col-sm-7">
									 <cc1:XUIDropDownList ID="ddlKD_CARA_REST" runat="server" DBColumnName="KD_CARA_REST" SPParameterName="p_kd_cara_rest" DataType="String" BindType="Both" CssClass="form-control">
										<asp:ListItem Value="01" Text="Penurunan suku bunga kredit"></asp:ListItem>
										<asp:ListItem Value="02" Text="Perpanjangan jangka waktu kredit"></asp:ListItem>
										<asp:ListItem Value="03" Text="Pengurangan tunggakan pokok kredit"></asp:ListItem>
										<asp:ListItem Value="04" Text="Pengurangan tunggakan bunga kredit"></asp:ListItem>
										<asp:ListItem Value="05" Text="Penambahan fasilitas kredit"></asp:ListItem>
										<asp:ListItem Value="06" Text="Konversi kredit menjadi penyertaan modal sementara"></asp:ListItem>
										<asp:ListItem Value="07" Text="Penambahan fasilitas kredit dan pengurangan tunggakan bunga kredit"></asp:ListItem>
										<asp:ListItem Value="08" Text="Penambahan fasilitas kredit dan perpanjangan jangka waktu kredit"></asp:ListItem>
										<asp:ListItem Value="09" Text="Penambahan fasilitas kredit dan penurunan suku bunga kredit"></asp:ListItem>
										<asp:ListItem Value="10" Text="Penambahan fasilitas kredit, pengurangan tunggakan bunga kedit dan penurunan suku bunga kredit"></asp:ListItem>
										<asp:ListItem Value="11" Text="Penambahan fasilitas kredit, pengurangan tunggakan bunga kredit dan perpanjangan jangka waktu kredit"></asp:ListItem>
									</cc1:XUIDropDownList>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Kondisi</label>
								
								<div class="col-sm-7">
									<cc1:XUIDropDownList ID="ddlKD_KONDISI" runat="server" DBColumnName="KD_KONDISI" SPParameterName="p_kd_kondisi" DataType="String" BindType="Both" CssClass="form-control">
										<asp:ListItem Value="00" Text="Fasilitas Aktif"></asp:ListItem>
										<asp:ListItem Value="01" Text="Dibatalkan"></asp:ListItem>
										<asp:ListItem Value="02" Text="Lunas"></asp:ListItem>
										<asp:ListItem Value="03" Text="Dihapusbukukan "></asp:ListItem>
										<asp:ListItem Value="04" Text="Hapus Tagih"></asp:ListItem>
										<asp:ListItem Value="05" Text="Lunas karena pengambilalihan agunan"></asp:ListItem>
										<asp:ListItem Value="06" Text="Lunas karena diselesaikan melalui pengadilan "></asp:ListItem>
										<asp:ListItem Value="07" Text="Dialihkan ke Pelapor lain"></asp:ListItem>
										<asp:ListItem Value="08" Text="Dialihkan ke Fasilitas lain"></asp:ListItem>
										<asp:ListItem Value="09" Text="Dialihkan/dijual kepada pihak lain non pelapor"></asp:ListItem>
										<asp:ListItem Value="10" Text="Disekuritisasi (Kreditur Asal sebagai Servicer)"></asp:ListItem>
										<asp:ListItem Value="11" Text="Disekuritisasi (Kreditur Asal tidak sebagai Servicer)"></asp:ListItem>
										<asp:ListItem Value="12" Text="Lunas Dengan Diskon"></asp:ListItem>
										<asp:ListItem Value="13" Text="Diblokir Sementara"></asp:ListItem>
										<asp:ListItem Value="14" Text="Berhenti Dari Keanggotaan Kredit Join"></asp:ListItem>
									</cc1:XUIDropDownList>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Tanggal Kondisi</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtTGL_KONDISI" runat="server" DBColumnName="TGL_KONDISI" SPParameterName="p_tgl_kondisi" CssClass="form-control default-date-picker" DataType="DateTime" BindType="Both" Format="dd/MM/yyyy"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Keterangan</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtKET" runat="server" DBColumnName="KET" SPParameterName="p_ket" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
								</div>
							</div>                            
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4">Cabang</label>
								
								<div class="col-sm-7">
									<cc1:XUITextBox ID="txtKODE_CABANG" runat="server" DBColumnName="KODE_CABANG" SPParameterName="p_kode_cabang" CssClass="form-control" DataType="String" BindType="Both"></cc1:XUITextBox>
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

