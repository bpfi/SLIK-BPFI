<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head id="Head1" runat="server">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="Mosaddek">
	<meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	<link rel="shortcut icon" href="img/favicon.png">

	<title>iConsole</title>

	<!-- Bootstrap core CSS -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-reset.css" rel="stylesheet">
	<!--external css-->
	<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
	<!-- Custom styles for this template -->
	<link href="css/style.css" rel="stylesheet">
	<link href="css/style-responsive.css" rel="stylesheet" />

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/hris.js"></script>
</head>
<body class="login-body">
	<div class="container">
	  <form id="Form1" class="form-signin" runat="server">
		<h2 class="form-signin-heading">sign in now</h2>
		<div class="login-wrap">
			<asp:TextBox ID="txtUID" runat="server" class="form-control" placeholder="User ID" MaxLength="200"></asp:TextBox>
			<asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
		   <%-- <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-control">
				<asp:ListItem Value="id-ID" Text="Bahasa Indonesia"></asp:ListItem>
				<asp:ListItem Value="en-US" Text="English"></asp:ListItem>
			</asp:DropDownList>--%>
			<%--<asp:DropDownList ID="txtBRANCH" runat="server" DBColumnName="BranchFullName" SPParameterName="p_branch" DataType="String" CssClass="form-control">
						<asp:ListItem Value="0" Text="-"></asp:ListItem>
						<asp:ListItem Value="000" Text="JAKARTA"></asp:ListItem>
						<asp:ListItem Value="001" Text="TANGERANG"></asp:ListItem>
						<asp:ListItem Value="002" Text="BEKASI"></asp:ListItem>
						<asp:ListItem Value="004" Text="SURABAYA"></asp:ListItem>
						<asp:ListItem Value="005" Text="BANDUNG"></asp:ListItem>
						<asp:ListItem Value="006" Text="PALEMBANG"></asp:ListItem>
						<asp:ListItem Value="007" Text="DENPASAR"></asp:ListItem>
						<asp:ListItem Value="008" Text="JAMBI"></asp:ListItem>
						<asp:ListItem Value="009" Text="MEDAN"></asp:ListItem>
						<asp:ListItem Value="010" Text="PEKANBARU"></asp:ListItem>
						<asp:ListItem Value="011" Text="MALANG"></asp:ListItem>
						<asp:ListItem Value="012" Text="BANJARMASIN"></asp:ListItem>
						<asp:ListItem Value="013" Text="SAMARINDA"></asp:ListItem>
						<asp:ListItem Value="014" Text="LAMPUNG"></asp:ListItem>
						<asp:ListItem Value="015" Text="MAKASAR"></asp:ListItem>
						<asp:ListItem Value="016" Text="MANADO"></asp:ListItem>
						<asp:ListItem Value="017" Text="BALIKPAPAN"></asp:ListItem>
						<asp:ListItem Value="018" Text="PONTIANAK"></asp:ListItem>
						<asp:ListItem Value="019" Text="LUBUK LINGGAU"></asp:ListItem>
						<asp:ListItem Value="020" Text="PANGKAL PINANG"></asp:ListItem>
						<asp:ListItem Value="021" Text="BANDA ACEH"></asp:ListItem>
						<asp:ListItem Value="022" Text="SEMARANG"></asp:ListItem>
						<asp:ListItem Value="023" Text="KENDARI"></asp:ListItem>
						<asp:ListItem Value="024" Text="YOGYAKARTA"></asp:ListItem>
						<asp:ListItem Value="025" Text="GORONTALO"></asp:ListItem>
						<asp:ListItem Value="026" Text="BATURAJA"></asp:ListItem>
						<asp:ListItem Value="027" Text="BENGKULU"></asp:ListItem>
						<asp:ListItem Value="028" Text="PALU"></asp:ListItem>
						<asp:ListItem Value="029" Text="LHOKSEUMAWE"></asp:ListItem>
						<asp:ListItem Value="030" Text="SOLO"></asp:ListItem>
						<asp:ListItem Value="031" Text="PURWOKERTO"></asp:ListItem>
						<asp:ListItem Value="032" Text="BOGOR"></asp:ListItem>
						<asp:ListItem Value="033" Text="PADANG"></asp:ListItem>
						<asp:ListItem Value="034" Text="PEMATANG SIANTAR"></asp:ListItem>
						<asp:ListItem Value="035" Text="PALANGKARAYA"></asp:ListItem>
						<asp:ListItem Value="036" Text="SIDOARDJO"></asp:ListItem>
						<asp:ListItem Value="037" Text="MATARAM"></asp:ListItem>
						<asp:ListItem Value="038" Text="DEPOK"></asp:ListItem>
						<asp:ListItem Value="039" Text="PAREPARE"></asp:ListItem>
						<asp:ListItem Value="040" Text="KUDUS"></asp:ListItem>
						<asp:ListItem Value="041" Text="SINTANG"></asp:ListItem>
						<asp:ListItem Value="042" Text="TEGAL"></asp:ListItem>
						<asp:ListItem Value="043" Text="SAMPIT"></asp:ListItem>
						<asp:ListItem Value="044" Text="METRO LAMPUNG"></asp:ListItem>
						<asp:ListItem Value="045" Text="SINGKAWANG"></asp:ListItem>
						<asp:ListItem Value="046" Text="PANGKALAN BUN"></asp:ListItem>
						<asp:ListItem Value="047" Text="BELITUNG"></asp:ListItem>
						<asp:ListItem Value="048" Text="LANGSA"></asp:ListItem>
						<asp:ListItem Value="049" Text="RANTAU PRAPAT"></asp:ListItem>
						<asp:ListItem Value="050" Text="AMBON"></asp:ListItem>
						<asp:ListItem Value="051" Text="SORONG"></asp:ListItem>
						<asp:ListItem Value="052" Text="JAYAPURA"></asp:ListItem>
						<asp:ListItem Value="053" Text="PALOPO"></asp:ListItem>
						<asp:ListItem Value="054" Text="PONTIANAK 2"></asp:ListItem>
						<asp:ListItem Value="055" Text="JAKARTA 1"></asp:ListItem>
						<asp:ListItem Value="056" Text="KARAWANG"></asp:ListItem>
						<asp:ListItem Value="057" Text="MEDAN 2"></asp:ListItem>
						<asp:ListItem Value="058" Text="PALEMBANG 2"></asp:ListItem>
						<asp:ListItem Value="059" Text="TASIKMALAYA"></asp:ListItem>
						<asp:ListItem Value="060" Text="CIAMIS"></asp:ListItem>
						<asp:ListItem Value="061" Text="SAMARINDA 2"></asp:ListItem>
						<asp:ListItem Value="062" Text="CIREBON"></asp:ListItem>
						<asp:ListItem Value="063" Text="PURWOKERTO 2"></asp:ListItem>
						<asp:ListItem Value="064" Text="BANJARNEGARA"></asp:ListItem>
						<asp:ListItem Value="065" Text="BANJARMASIN 2"></asp:ListItem>
						<asp:ListItem Value="066" Text="BEKASI 2"></asp:ListItem>
						<asp:ListItem Value="067" Text="BANDUNG 2"></asp:ListItem>
						<asp:ListItem Value="068" Text="PEKANBARU 2"></asp:ListItem>
						<asp:ListItem Value="069" Text="DURI"></asp:ListItem>
						<asp:ListItem Value="070" Text="UJUNG BATU"></asp:ListItem>
						<asp:ListItem Value="071" Text="RENGAT"></asp:ListItem>
						<asp:ListItem Value="072" Text="GARUT"></asp:ListItem>
						<asp:ListItem Value="073" Text="JAKARTA (MTF)"></asp:ListItem>
						<asp:ListItem Value="900" Text="KANTOR PUSAT"></asp:ListItem>
			</asp:DropDownList>--%>
			<label class="checkbox">
				<span class="pull-right">
					<a data-toggle="modal" href="#ModalForgetPassword"> Forgot Password?</a>
				</span>
			</label>
			<asp:Button ID="btnSignIn" runat="server" Text="Sign In" class="btn btn-lg btn-login btn-block" OnClick="btnSignIn_Click" />

		</div>

		  <!-- Modal -->
		  <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="ModalForgetPassword" class="modal fade">
			  <div class="modal-dialog">
				  <div class="modal-content">
					  <div class="modal-header">
						  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						  <h4 class="modal-title">Forgot Password ?</h4>
					  </div>
					  <div class="modal-body">
						  <p>Enter your User ID/Email to reset your password.</p>
						  <asp:TextBox ID="txtResetUID" runat="server" placeholder="User ID" autocomplete="off" class="form-control placeholder-no-fix"></asp:TextBox>
					  </div>
					  <div class="modal-footer">
						  <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
						  <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-success" OnClick="btnSubmit_Click" />
					  </div>
				  </div>
			  </div>
		  </div>
		  
		  
		  
		  <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="ModalChangePassword" class="modal fade">
			  <div class="modal-dialog">
				  <div class="modal-content">
					  <div class="modal-header">
						  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						  <h4 class="modal-title">Change Password ?</h4>
					  </div>
					  <div class="modal-body">
						  <p>Enter your new password.</p>
						  <asp:TextBox ID="txtNewPassword" runat="server" placeholder="New password" autocomplete="off" class="form-control placeholder-no-fix" TextMode="Password"></asp:TextBox>
							<p>Enter your new password again.</p>
						  <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder="Confirm password" autocomplete="off" class="form-control placeholder-no-fix" TextMode="Password"></asp:TextBox>

					  </div>
					  <div class="modal-footer">
						  <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
						  <asp:Button ID="btnChangePassword" runat="server" Text="Submit" class="btn btn-success" OnClick="btnChangePassword_Click" />
					  </div>
				  </div>
			  </div>
		  </div>
		  
	  <div class="modal fade" id="ErrorNotif" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		  aria-hidden="true">
		  <div class="modal-dialog">
			  <div class="modal-content">
				  <div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						  &times;</button>
					  <h4 class="modal-title">
						  Fail</h4>
				  </div>
				  <div class="modal-body">
					  <h4>
						  <i class="icon-thumbs-down-alt"></i>Oh no!!
					  </h4>
					  <p id="ErrorMsg">
					  </p>
					  <div class="panel panel-default" id="PanelTechMsg" style="display:none">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle" style="color:Red" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
									Technical Error </a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse">
							<div class="panel-body">
								<p id="ErrorTechMsg" style="color:Red"></p>
							</div>
						</div>
					  </div>
				  </div>
				  <div class="modal-footer">
					  <button data-dismiss="modal" class="btn btn-default" type="button">
						  OK</button>
				  </div>
			  </div>
		  </div>
	  </div>
	
	<div class="modal fade" id="SuccessNotif" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;</button>
					<h4 class="modal-title">
						Success</h4>
				</div>
				<div class="modal-body">
					<h4>
						<i class="icon-thumbs-up-alt"></i>  Horayyy!
					</h4>
					<p>Your data is at the safe place now</p>
				</div>
				<div class="modal-footer">
					<button data-dismiss="modal" class="btn btn-default" type="button">
						OK</button>
				</div>
			</div>
		</div>
	</div>
		  
		  <!-- modal -->

	  </form>

	</div>



	
	
</body>
</html>