<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="viewimage.aspx.cs" Inherits="module_location_locationcurrentlylist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.11&sensor=false" type="text/javascript"></script>

     <script type="text/javascript">

        var attachment = [
            <asp:Repeater ID="attachment" runat="server">
                <ItemTemplate>
                    {
                        "description" : '<%# Eval("description")%>',
                        "remark" : '<%# Eval("remark")%>',
                        "emp_name" : '<%# Eval("emp_name")%>',
                        "mod_date" : '<%# Eval("mod_date","{0:dd/MM/yyyy HH:mm}")%>',
                        "lat_coord" : '<%# DataBinder.Eval(Container.DataItem,"lat_coord","{0:N2}")%>',
                        "long_coord" : '<%# DataBinder.Eval(Container.DataItem,"long_coord","{0:N2}")%>'
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
                    icon: pinImage, //'http://localhost:57567/iconsole.webui/Upload/Pin/Pin Red.png',
                    shadow: pinShadow
                });
                
                 // var circle = new google.maps.Circle({
                 // map: map,
                 // radius: 20,    // 10 miles in metres
                 // fillColor: '#26ace2',
                 // strokeColor: '#FF0000',
                 // strokeOpacity: 0,
                 // strokeWeight: 0,
                 // fillOpacity: 0.35
                 // });
                
                //circle.bindTo('center', marker, 'position');
                
                setInfoWindow(map, marker,   "<h6><label style='width : 100%; text-align : center; border-bottom : blueviolet; border-bottom-style : groove; padding-bottom : 5px;' >" + attachment[0].emp_name + "</label></h6></br>" +
                       "<table style='width:100%'>" +
                       "<tr><td width='100px'>Date</td><td width='10px'>:</td><td>" + attachment[0].mod_date + "</td>" +
                       "<tr><td width='100px'>Description</td><td width='10px'>:</td><td>" + attachment[0].description + "</td>" +
                       "<tr><td width='100px'>Note</td><td width='10px'>:</td><td>" + attachment[0].remark + "</td></table>");
            })();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>View Image Survey : </span>
            <asp:Label ID="lblPhotoView" runat="server"></asp:Label>
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
                <asp:Image ID="viewImage" runat="server" Width="100%" Height="410px"></asp:Image>
                <asp:Label ID="lblRemark" runat="server"/>
            </div>
            <div class="col-sm-6">
                <div id="map_canvas" style="width: auto; height:410px;"></div>
            </div>
        </div>

    </section>
</asp:Content>

