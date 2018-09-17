<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wcheader.ascx.cs" Inherits="wcheader" %>
<div class="sidebar-toggle-box">
    <div data-original-title="Toggle Navigation" data-placement="right" class="icon-reorder tooltips">
    </div>
</div>
<!--logo start-->
<a href="../module/dashboard/default.aspx" target='ifr' class="logo">i<span>Console</span></a>
<!--logo end-->
<div class="nav notify-row" id="top_menu">
    <!--  notification start -->
    <ul class="nav top-menu" id="notif">
        <!-- notification dropdown start-->
        
        <!-- notification dropdown end -->
    </ul>
    <!--  notification end -->
</div>
<div class="top-nav">
    <!--search & user info start-->
    <ul class="nav pull-right top-menu">
        <%--<li>
            <input type="text" class="form-control search" placeholder="Search">
        </li>--%>
        <!-- user login dropdown start-->
        <li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle" href="#">
            <img alt="" src="../img/avatar1_small.jpg">
            <%--<span class="username">{{user.fullname}}</span> <b class="caret"></b></a>--%>
            <span class="username">
                <asp:Label ID="lblFullname" runat="server" Text="-"></asp:Label></span> <b class="caret">
                </b></a>
            <ul class="dropdown-menu extended logout">
                <div class="log-arrow-up">
                </div>
                <li><a href="../module/shared/profile.aspx" target="ifr"><i class="icon-suitcase"></i>Profile</a></li>
                <li><a href="../module/shared/setting.aspx" target="ifr"><i class="icon-cog"></i>Settings</a></li>
                <li><a href="../module/shared/notification.aspx" target="ifr"><i class="icon-bell-alt"></i>Notification</a></li>
                <li><a href="logout.aspx"><i class="icon-key"></i>Log Out</a></li>
            </ul>
        </li>
        <!-- user login dropdown end -->
    </ul>
    <!--search & user info end-->
</div>
