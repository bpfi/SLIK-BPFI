<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main_027.aspx.cs" Inherits="branch_main_027" %>



<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Src="wcmenu.ascx" TagName="wcmenu" TagPrefix="uc1" %>
<%@ Register Src="wcheader.ascx" TagName="wcheader" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>iConsole</title>
    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/bootstrap-reset.css" rel="stylesheet">
   
    <!--external css-->
    <link href="../assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="../assets/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css" />
    
    
    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/style-responsive.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->

</head>
<body>
    <form id="form1" runat="server">
    <section id="container">
      <!--header start-->
      <header class="header white-bg">
        <uc2:wcheader ID="wcheader" runat="server" />      
      </header>
      <!--header end-->
      <!--sidebar start-->
      <aside>
        <uc1:wcmenu ID="wcmenu" runat="server" />
      </aside>
      <!--main content start-->
      <section id="main-content">
          
        <section class="wrapper">
             <iframe id="ifr" src="../module/dashboard/default.aspx" frameborder="0" name="ifr" width="100%"  height="800px"
                scrolling="auto"></iframe>
            
        </section>
        <!--footer start-->
        <footer class="site-footer">
          <div class="text-center">
              2018 &copy; PT.Batavia Prosperindo Finance, tbk - Cabang Bengkulu
              <a href="#" class="go-top">
                  <i class="icon-angle-up"></i>
              </a>
          </div>
        </footer>
        <!--footer end-->
      </section>
        <!--main content end-->
<%--        <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              2015 &copy; PT. Inovasi Mitra Sejati.
              <a href="#" class="go-top">
                  <i class="icon-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->--%>
     
    </section>          
    
    <script src="../js/jquery.js"></script>

    <script src="../js/jquery-1.8.3.min.js"></script>

    <script src="../js/bootstrap.min.js"></script>
    
    <script class="include" src="../js/jquery.dcjqaccordion.2.7.js" type="text/javascript" ></script>

    <script src="../js/jquery.scrollTo.min.js"></script>

    <script src="../js/jquery.nicescroll.js" type="text/javascript"></script>
    
    <script src="../js/respond.min.js" ></script>
    
    <script src="../assets/gritter/js/jquery.gritter.min.js" type="text/javascript"></script>

    
    
    <!--common script for all pages-->

    <script src="../js/common-scripts.js"></script>
    
    
    <script type="text/javascript">
        $(function() {
            $.post("menu.ashx", function(response) {
                $("#sidebar").html(response);
                $("#sidebar").dcAccordion();
                $("#nav-accordian").show(); // Add By RV
            });

            $.post("notification.ashx", function(response) {
                $("#notif").html(response);
            });

            var timer = setInterval(function() {
                $.post("notification.ashx", function(response) {
                    $("#notif").html(response);
                });

            }, 20000)

        });
    </script>
    
    </form>
</body>
</html>


