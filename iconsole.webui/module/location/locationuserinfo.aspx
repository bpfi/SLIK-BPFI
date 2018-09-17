<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="locationuserinfo.aspx.cs" Inherits="module_location_locationuserinfo" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.11&sensor=false" type="text/javascript"></script>

    <script type="text/javascript">
        var a = [
                    <asp:Repeater ID="rptMarkers" runat="server">
                        <ItemTemplate>
                            {
                                "title" : '<%# Eval("emp_code")%>',
                                "lat": '<%# DataBinder.Eval(Container.DataItem,"lat_coord","{0:N2}")%>',
                                "lng": '<%# DataBinder.Eval(Container.DataItem,"long_coord","{0:N2}")%>',
                                "log_date": '<%# Eval("log_date","{0:dd/MM/yyyy}")%>',
                                "emp_code": '<%# Eval("emp_code")%>',
                                "emp_name": '<%# Eval("emp_name")%>',
                                "activity": '<%# Eval("activity")%>'
                            }
                        </ItemTemplate>
                        <SeparatorTemplate>
                        ,
                        </SeparatorTemplate>
                    </asp:Repeater>
                ];
        var baseIconUrl = "http://chart.apis.google.com/chart?chst=";

        function setInfoWindow(map,marker,infoContent)
        {
            google.maps.event.addListener(marker, 'click', function(){
                infowindow = new google.maps.InfoWindow({content: infoContent});
                infowindow.open(map, marker);
            });
        }

        // check DOM Ready
        $(document).ready(function() 
        {
            // execute
            (function()
            {
                // map options
                var options = 
                {
                    zoom: 18,
                    center: new google.maps.LatLng(parseFloat(a[0].lat), parseFloat(a[0].lng)), 
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    mapTypeControl: false
                };
                
                // init map
                var map = new google.maps.Map(document.getElementById('map_canvas'), options);
                
                // set markers colors
                var pinColorR = "FF0000";
                var pinColorG = "00FF00";
                var pinColorB = "0000FF";

                var pinImageR = new google.maps.MarkerImage(baseIconUrl + "d_map_pin_letter&chld=%E2%80%A2|" + pinColorR,
                    new google.maps.Size(21, 34),
                    new google.maps.Point(0,0),
                    new google.maps.Point(10, 34));

                var pinImageG = new google.maps.MarkerImage(baseIconUrl + "d_map_pin_letter&chld=%E2%80%A2|" + pinColorG,
                    new google.maps.Size(21, 34),
                    new google.maps.Point(0,0),
                    new google.maps.Point(10, 34));

                var pinImageB = new google.maps.MarkerImage(baseIconUrl + "d_map_pin_letter&chld=%E2%80%A2|" + pinColorB,
                    new google.maps.Size(21, 34),
                    new google.maps.Point(0,0),
                    new google.maps.Point(10, 34));

                var pinShadow = new google.maps.MarkerImage(baseIconUrl + "d_map_pin_shadow",
                    new google.maps.Size(40, 37),
                    new google.maps.Point(0, 0),
                    new google.maps.Point(12, 35));

                var flightPlanCoordinates = [];

                // set multiple marker
                for (var i = 0; i < a.length; i++) 
                {
                    var data = a[i];
                    var max = i.length;

                    flightPlanCoordinates.splice(i,0,{lat: parseFloat(data.lat), lng: parseFloat(data.lng)});

                    if (i==0)
                    {
                        marker = new google.maps.Marker({
                            position: new google.maps.LatLng(parseFloat(data.lat), parseFloat(data.lng)),
                            map: map,
                            title: 'Click for details!',
                            icon : pinImageB,
                            shadow: pinShadow
                        });
                    }

                    var marker = new google.maps.Marker
                    ({
                        position: new google.maps.LatLng(parseFloat(data.lat), parseFloat(data.lng)),
                        map: map,
                        title: 'Click for details!',
                        icon : pinImageR,
                        shadow: pinShadow
                    });

                    if (i==(a.length-1) && a.length > 1)
                    {
                        marker = new google.maps.Marker({
                            position: new google.maps.LatLng(parseFloat(data.lat), parseFloat(data.lng)),
                            map: map,
                            title: 'Click for details!',
                            icon : pinImageG,
                            shadow: pinShadow
                        });
                    }
                    
                    // process multiple info windows
                    setInfoWindow(map,marker , "<h5>"+data.emp_name+"</h5></br>Log Date : "+data.log_date+"</br>Activity : "+data.activity);
                }

                var flightPath = new google.maps.Polyline({
                    path: flightPlanCoordinates,
                    geodesic: true,
                    strokeColor: '#FF0000',
                    strokeOpacity: 1.0,
                    strokeWeight: 5
                });

                flightPath.setMap(map);

            })();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
    <section class="panel">
        <header class="panel-heading">
            <span>Location User : </span>
            <asp:Label ID="lblUserName" runat="server"></asp:Label>
        </header>                                                  
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-2">
                     <asp:LinkButton RoleCode="" ID="btnCancel" runat="server" CssClass="btn btn-danger" OnClick="btnCancel_Click" CausesValidation="false"><i class="icon-remove"></i>Back</asp:LinkButton>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control default-date-picker"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control default-date-picker"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:LinkButton RoleCode="" ID="btnRefresh" runat="server" CssClass="btn btn-info" OnClick="btnRefresh_Click" CausesValidation="false"><i class="icon-refresh"></i>  Refresh</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <div id="map_canvas" style="width: auto; height:410px;"></div>
       </div>
    </section>
</asp:Content>