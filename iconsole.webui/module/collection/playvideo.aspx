<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="playvideo.aspx.cs" Inherits="module_location_locationcurrentlylist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.11&sensor=false" type="text/javascript"></script>

    <script type="text/javascript">
        var videoUrl = "<%= VIDEO_URL %>";
        var attachment = [
            <asp:Repeater ID="attachment" runat="server">
                <ItemTemplate>
                    {
                        "result_reason" : '<%# Eval("result_reason")%>',
                        "result_status" : '<%# Eval("result_status")%>',
                        "emp_name": '<%# Eval("emp_name")%>',
                        "result_date": '<%# Eval("result_date","{0:dd/MM/yyyy}")%>',
                        "lat_coord": '<%# DataBinder.Eval(Container.DataItem,"lat_coord","{0:N2}")%>',
                        "long_coord": '<%# DataBinder.Eval(Container.DataItem,"long_coord","{0:N2}")%>'
                    }
                </ItemTemplate>
                <SeparatorTemplate>
                ,
                </SeparatorTemplate>
            </asp:Repeater>
        ];

        function setInfoWindow(map, marker, infoContent) {
            google.maps.event.addListener(marker, 'click', function() {
                infowindow = new google.maps.InfoWindow({ content: infoContent });
                infowindow.open(map, marker);
            });
        }

        $(document).ready(function() {
            (function() {
                var myVideo = document.getElementById("vidContainer");
                myVideo.src = videoUrl;
                myVideo.load();
                myVideo.play();

                var options =
                {
                    zoom: 18,
                    center: new google.maps.LatLng(parseFloat(attachment[0].lat_coord), parseFloat(attachment[0].long_coord)),
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    mapTypeControl: false
                };

                var map = new google.maps.Map(document.getElementById('map_canvas'), options);

                var pinColor = "FF0000";
                var pinImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor,
                    new google.maps.Size(21, 34),
                    new google.maps.Point(0, 0),
                    new google.maps.Point(10, 34));

                var pinShadow = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
                    new google.maps.Size(40, 37),
                    new google.maps.Point(0, 0),
                    new google.maps.Point(12, 35));

                marker = new google.maps.Marker({
                    position: new google.maps.LatLng(parseFloat(attachment[0].lat_coord), parseFloat(attachment[0].long_coord)),
                    map: map,
                    title: 'Click for details!',
                    icon: pinImage,
                    shadow: pinShadow
                });
                setInfoWindow(map, marker, "<h5>" + attachment[0].result_status + "</h5></br>Reason / Notes : " + attachment[0].result_reason + "</br>Collector : " + attachment[0].emp_name);
            })();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">                
    <section class="panel">
        <header class="panel-heading">
            <span>View Image Result : </span>
            <asp:Label ID="lblResultView" runat="server"></asp:Label>
        </header>

        <div class="col-sm-12 panel-body">
            <div class="col-sm-12">
                <asp:LinkButton RoleCode="" ID="btnBack" runat="server" CssClass="btn btn-danger" OnClick="btnBack_Click" CausesValidation="false"><i class="icon-remove"></i>Back</asp:LinkButton>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnBack" EventName="Click" /> 
                </Triggers>
            </div>
        </div>

        <div class="col-sm-12 panel-body">
            <div class="col-sm-6">
                <video id="vidContainer" style="width: auto; height:410px;" controls/>
                <asp:Label ID="lblResultReason" runat="server"/>
            </div>
            <div class="col-sm-6">
                <div id="map_canvas" style="width: auto; height:410px;"></div>
            </div>
        </div>

    </section>
</asp:Content>