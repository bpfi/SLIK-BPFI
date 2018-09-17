<%@ Page Title="" Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="locationcurrently.aspx.cs" Inherits="module_location_locationcurrentlylist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.11&sensor=false" type="text/javascript"></script>
    <script type="text/javascript">
        var a = [
                    <asp:Repeater ID="rptMarkers" runat="server">
                        <ItemTemplate>
                             {
                                "emp_name" : '<%# Eval("emp_name")%>',
                                "position" : '<%# Eval("position")%>',
                                "handphone_no" : '<%# Eval("handphone_no")%>',
                                "installment": '<%# DataBinder.Eval(Container.DataItem,"installment","{0:N2}")%>',
                                "paid_by_cash": '<%# DataBinder.Eval(Container.DataItem,"paid_by_cash","{0:N2}")%>',
                                "paid_by_transfer": '<%# DataBinder.Eval(Container.DataItem,"paid_by_transfer","{0:N2}")%>',
                                "total_paid": '<%# DataBinder.Eval(Container.DataItem,"total_paid","{0:N2}")%>',
                                "total_unpaid": '<%# DataBinder.Eval(Container.DataItem,"total_unpaid","{0:N2}")%>',
                                "lat": '<%# DataBinder.Eval(Container.DataItem,"lat_coord","{0:N2}")%>',
                                "lng": '<%# DataBinder.Eval(Container.DataItem,"long_coord","{0:N2}")%>'
                            }
                        </ItemTemplate>
                        <SeparatorTemplate>
                            ,
                        </SeparatorTemplate>
                    </asp:Repeater>
                ];

        function setInfoWindow(map,marker,infoContent)
        {
            google.maps.event.addListener(marker, 'click', function(){
                infowindow = new google.maps.InfoWindow({content: infoContent});
                infowindow.open(map, marker);
            });
        }

        $(document).ready(function() 
        {
            (function() 
            {
                var options = 
                {
                    zoom: 14,
                    center: new google.maps.LatLng(parseFloat(a[0].lat), parseFloat(a[0].lng)), 
                    mapTypeId: google.maps.MapTypeId.TERRAIN,
                    mapTypeControl: false
                };
                
                var base_url = "<%=BASE_URL %>";
                var map = new google.maps.Map(document.getElementById('map_canvas'), options);
                
                var pinColorR = "FF0000";
			    var pinColorG = "26F002";
			    var pinColorB = "002FFF";
			    var pinColorY = "FFFB00";

                var pinShadow = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
                    new google.maps.Size(40, 37),
                    new google.maps.Point(0, 0),
                    new google.maps.Point(12, 35));
                
                for (var i = 0; i < a.length; i++) 
                {
                    var data = a[i];
                    var pinColor = "";

                    switch(data.position.trim()) {
                        case "SURVEYOR":
                            pinColor = pinColorR ;
                            break;
                        case "COLLECTOR":
                            pinColor = pinColorG ;
                            break;
                        case "MARKETING":
                            pinColor = pinColorB ;
                            break;
                        default:
                            pinColor = pinColorR ;
                    }

//                    var marker = new google.maps.Marker
//                    ({
//                        position: new google.maps.LatLng(parseFloat(data.lat), parseFloat(data.lng)),
//                        map     : map,
//                        title   : 'Click for details!',
//                        icon    : new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor,
//                                        new google.maps.Size(21, 34),
//                                        new google.maps.Point(0,0),
//                                        new google.maps.Point(10, 34)),
//                        shadow  : pinShadow
//                    });

                    var marker = new google.maps.Marker
                    ({
                        position: new google.maps.LatLng(parseFloat(data.lat), parseFloat(data.lng)),
                        map     : map,
                        title   : 'Click for details!',
                        icon    : new google.maps.MarkerImage(base_url+"/img/pegman-yellow.png",new google.maps.Size(45,66))
                    });

                    var additionalInfo = "";

                    if(data.position.trim() == "COLLECTOR")
                    {
                        additionalInfo = "<tr><td width='100px'>Total Installment</td><td width='10px'>:</td><td align='right'>" + data.installment + "</td>" +
                        "<tr><td width='100px'>Paid by Cash</td><td width='10px'>:</td><td align='right'>" + data.paid_by_cash + "</td>" +
                        "<tr><td width='100px'>Paid by Transfer</td><td width='10px'>:</td><td align='right'>" + data.paid_by_transfer +
                        "<tr><td width='100px'><b>Total Paid</b></td><td width='10px'>:</td><td align='right' style='border-top: thin solid;'>" + data.total_paid +
                        "<tr style='border-bottom : thin solid;'><td width='100px'><b>Total Unpaid</b></td><td width='10px'>:</td><td align='right' style='border-top: thin solid;'>" + data.total_unpaid ;
                    }

                    setInfoWindow(map,marker , "<label style='width : 100%; text-align : center; padding-bottom : 5px;' >" + data.emp_name + "</label></br>" +
                        "<table style='width:100%'>" +
                        "<tr style='border-top : thin solid;'><td width='100px'>Contact</td><td width='10px'>:</td><td>" + data.handphone_no + "</td>" +
                        "<tr style='border-bottom : thin solid;'><td width='100px'>Position</td><td width='10px'>:</td><td>" + data.position + "</td>" + additionalInfo + "</table>"
                    );
                 } 
            })();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">                
    <section class="panel">
        <header class="panel-heading">
            <span>Location Currently</span>
        </header>
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <asp:LinkButton RoleCode="" ID="btnRefresh" runat="server" CssClass="btn btn-info" OnClick="btnRefresh_Click" CausesValidation="true"><i class="icon-refresh"></i>Refresh</asp:LinkButton>
                    <label class="col-sm-1">Position</label>
                    <div class="col-sm-2">
                        <asp:DropDownList  ID="ddlPosition" runat="server" CssClass="form-control"  DBColumnName="POSITION" SPParameterName="p_position" DataType="String" BindType="Both" >
                            <asp:ListItem Value="ALL" Text="ALL"></asp:ListItem> 
                            <asp:ListItem Value="COLLECTOR" Text="COLLECTOR"></asp:ListItem> 
                            <asp:ListItem Value="SURVEYOR" Text="SURVEYOR"></asp:ListItem>   
                            <asp:ListItem Value="MARKETING" Text="MARKETING"></asp:ListItem>                                                                                                                                                                                                                                                                                                                                                                                                                       
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
                <div class="panel-body">
                    <div id="map_canvas" style="width: auto; height:480px;">
                </div>
            </div>
        </div>
    </asp:panel>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnRefresh EventName="Click" />
    </Triggers>           
    </section>
</asp:Content>

