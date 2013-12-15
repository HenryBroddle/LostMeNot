<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="RouteDetail.aspx.vb" Inherits="LostMeNot.RouteDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Route History</title>
    <style>
        #map-canvas
        {
            width: 800px;
            margin: 0px;
            padding: 0px;
            height: 600px;
        }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script type="text/javascript">
        var geocoder;
        var map;
        var infowindow = new google.maps.InfoWindow();
        var marker;

        function codeLatLng(coord) {

            var latlng = coord;
            geocoder.geocode({ 'latLng': latlng }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[1]) {
                        marker = new google.maps.Marker({
                            position: latlng,
                            map: map
                        });
                        infowindow.setContent(results[1].formatted_address);
                        infowindow.open(map, marker);
                    } else {
                        alert('No results found');
                    }
                } else {
                    alert('Geocoder failed due to: ' + status);
                }
            });
        }

        function initialize(flightPlanCoordinates) {
            geocoder = new google.maps.Geocoder();
            var bounds = new google.maps.LatLngBounds();
            for (var i = 0; i < flightPlanCoordinates.length; i++) {
                bounds.extend(flightPlanCoordinates[i]);
            }

            var GLOBE_WIDTH = 256; // a constant in Google's map projection
            var lngAngle = bounds.getNorthEast().lat() - bounds.getSouthWest().lat();
            if (lngAngle < 0) {
                lngAngle += 360;
            }
            var latAngle = bounds.getNorthEast().lng() - bounds.getSouthWest().lng();
            if (latAngle < 0) {
                latAngle += 360;
            }
            var angle = Math.max(lngAngle, latAngle);
            var zoom = Math.round(Math.log(800 * 360 / angle / GLOBE_WIDTH) / Math.LN2) - 1;

            var mapOptions = {
                zoom: zoom,
                center: bounds.getCenter(),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            map = new google.maps.Map(document.getElementById('map-canvas'),
                  mapOptions);

            var route = new google.maps.Polyline({
                path: flightPlanCoordinates,
                geodesic: true,
                strokeColor: '#FF0000',
                strokeOpacity: 1.0,
                strokeWeight: 2
            });

            route.setMap(map);

            var start = flightPlanCoordinates[0];
            var end = flightPlanCoordinates[flightPlanCoordinates.length - 1];

            //alert(distance(start, end) * 0.000621371);

            codeLatLng(end);
        }

        google.maps.event.addDomListener(window, 'load', initialize);

        $(function () {
            $("li").on("click", function () {
                //initialize(this.value);
                initialize(eval(this.id));
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="leftColumn">
        <div id="map-canvas">
        </div>
    </div>
    <div class="rightColumn">
        <asp:LoginView ID="MainLoginView" runat="server">
                    <AnonymousTemplate>
                        <asp:Login ID="Login2" runat="server" >
                            <LayoutTemplate>
                                <fieldset style="padding: 5px; height: 50px;">
                                    <div class="group">
                                        <label>
                                            User Name<br />
                                            <asp:TextBox ID="UserName" runat="server" Width="60px" style="margin-bottom: 0px; min-height: 0px; height: 10px; " />
                                        </label>
                                        <label>
                                            Password:<br />
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="60px" style="margin-bottom: 0px; min-height: 0px; height: 10px;" />
                                        </label>
                                        <label>
                                            <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me" />
                                        </label>                                        
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        <asp:LinkButton CssClass="SmallCommandButton" ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="ctl00$ctl00$Login2" />
                                    </div>
                                </fieldset>
                            </LayoutTemplate>
                        </asp:Login>
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        <fieldset style="padding: 5px;">
                            <asp:LoginName ID="LoginName1" Font-Bold="true" runat="server" SkinID="LoginName"></asp:LoginName>
                            <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutPageUrl="~/Account/Login.aspx"
                                SkinID="LoginStatus" Font-Bold="True" Font-Size="Small" ForeColor="#6a6a6a" />
                        </fieldset>
                    </LoggedInTemplate>
                </asp:LoginView>
        <asp:HyperLink runat="server" CssClass="NavLink" ID="RouteHistoryLink" Text="Route History" NavigateUrl="~/RouteManager/RouteDetail.aspx" />
        <div id="RouteList">
            <ul>
                <li id=" [new google.maps.LatLng(40.03640, -105.28205 ),  
            new google.maps.LatLng(40.03361, -105.28209 ),  
            new google.maps.LatLng(40.02906, -105.28213 ),  
            new google.maps.LatLng(40.02454, -105.28209 ),  
            new google.maps.LatLng(40.02144, -105.28125 ), 
            new google.maps.LatLng(40.01879, -105.28029 ),  
            new google.maps.LatLng(40.01612, -105.27941 ), 
            new google.maps.LatLng(40.01347, -105.27853 ),  
            new google.maps.LatLng(40.01085, -105.27728 ),  
            new google.maps.LatLng(40.00941, -105.27630 ),  
            new google.maps.LatLng(40.00794, -105.27527 ),  
            new google.maps.LatLng(40.00732, -105.27477 ),  
            new google.maps.LatLng(40.00648, -105.27327 ),  
            new google.maps.LatLng(40.00564, -105.27177 ),  
            new google.maps.LatLng(40.00475, -105.27031 ),  
            new google.maps.LatLng(40.00380, -105.26876 ),  
            new google.maps.LatLng(40.00336, -105.26773 ),
            new google.maps.LatLng(40.00273, -105.26595 ),  
            new google.maps.LatLng(40.00175, -105.26499 ), 
            new google.maps.LatLng(40.00070, -105.26413 ), 
            new google.maps.LatLng(39.99963, -105.26342 ), 
            new google.maps.LatLng(39.99856, -105.26271 ), 
            new google.maps.LatLng(39.99501, -105.26012 ),
            new google.maps.LatLng(39.99204, -105.25804 ), 
            new google.maps.LatLng(39.99013, -105.25678 ),
            new google.maps.LatLng(39.98914, -105.25561 ),  
            new google.maps.LatLng(39.98742, -105.25226 ), 
            new google.maps.LatLng(39.98588, -105.25029 ),  
            new google.maps.LatLng(39.98551, -105.25029 ), 
            new google.maps.LatLng(39.98521, -105.25075 ),  
            new google.maps.LatLng(39.98440, -105.25201 ),
            new google.maps.LatLng(39.98490, -105.25244 ),  
            new google.maps.LatLng(39.98534, -105.25316 ), 
            new google.maps.LatLng(39.98608, -105.25309 )] ">Dec 11, 2013 7:25 PM</li>
                <li id="[new google.maps.LatLng(40.02525, -105.26001 ),
             new google.maps.LatLng(40.02426, -105.25992 ),
             new google.maps.LatLng(40.02380, -105.26164 ), 
             new google.maps.LatLng(40.02328, -105.26396 ), 
             new google.maps.LatLng(40.02241, -105.26756 ), 
             new google.maps.LatLng(40.02229, -105.27005 ), 
             new google.maps.LatLng(40.02196, -105.27057 ), 
             new google.maps.LatLng(40.02084, -105.27022 ), 
             new google.maps.LatLng(40.02032, -105.26954 ), 
             new google.maps.LatLng(40.01927, -105.26919 ), 
             new google.maps.LatLng(40.01861, -105.27031 ), 
             new google.maps.LatLng(40.01730, -105.27220 ), 
             new google.maps.LatLng(40.01690, -105.27409 ), 
             new google.maps.LatLng(40.01630, -105.27683 ), 
             new google.maps.LatLng(40.01572, -105.27958 ), 
             new google.maps.LatLng(40.01509, -105.28370 ), 
             new google.maps.LatLng(40.01476, -105.28649 )]">Dec 11, 2013 5:12 PM</li>
                <li id="[
                new google.maps.LatLng(37.772323, -122.214897),
                new google.maps.LatLng(21.291982, -157.821856),
                new google.maps.LatLng(-18.142599, 178.431),
                new google.maps.LatLng(-27.46758, 153.027892)]">Nov 3, 2013 7:25 AM</li>
            </ul>
        </div>
        <asp:HyperLink runat="server" CssClass="NavLink" ID="DeviceLink" Text="Device Management" NavigateUrl="~/Account/Devices/DeviceDetail.aspx" />
        <asp:HyperLink ID="HyperLink1" class="top-item pageTitle NavLink" runat="server" NavigateUrl="~/Front/Default.aspx" >Lost Me Not</asp:HyperLink>
        
    </div>
</asp:Content>
