    var map;
    var geocoder;
    var marker;
    var newLatLng;
    var lastAddrGeocoded = "";

    function initializeMarker() {
            var lat = $("#map_lat").val();
            var lng = $("#map_lng").val();

            if(lat.length == 0 || lng.length == 0) {
                    return;
            }

            newLatLng = new google.maps.LatLng(lat,lng);
            if(newLatLng.lat().toString() != "NaN" && newLatLng.lng().toString() != "NaN") {
                    if(marker != null) {
                            marker.setMap(null);
                    }
                    marker = new google.maps.Marker({draggable: true, map: map, position: newLatLng });
                    google.maps.event.addListener(marker,'dragend', function(){
                            updateCoords(marker.getPosition().lat(), marker.getPosition().lng());
                    });
                    google.maps.event.addListener(marker,'position_changed', function(){
                            map.setCenter(marker.getPosition());
                    });
                    map.setCenter(marker.getPosition());
                    map.setZoom(19);
            }
    }

    function updateCoords(newLat,newLng) {
            $("#map_lat").val(newLat);
            $("#map_lng").val(newLng);
    }

    function bindAddressInputs() {
            $("#street_address").focus(function(){doAddrGeocoding()});
            $("#street_address").blur(function(){doAddrGeocoding()});
            $("#suburb").focus(function(){doAddrGeocoding()});
            $("#suburb").blur(function(){doAddrGeocoding()});
            $("#state").focus(function(){doAddrGeocoding()});
            $("#state").blur(function(){doAddrGeocoding()});
            $("#state").change(function(){doAddrGeocoding()});
            $("#postcode_quote").click(function(){doAddrGeocoding()});
            $("#postcode_quote").click(function(){doAddrGeocoding()});
    }

    function doAddrGeocoding() {
            var addr = "";
            var addr1 = "";
            var addr2 = "";
            var addr3 = "Australia";

            if($("#street_address").val().trim().length > 0) {
                    addr1 = $("#street_address").val().trim();
            }

            if($("#suburb").val().trim().length > 0) {
                    addr2 += $("#suburb").val().trim();
            }
            if($("#state").val().trim().length > 0) {
                    if(addr2.length > 0) {
                            addr2 += " ";
                    }
                    addr2 += $("#state").val().trim();
            }
            if($("#postcode_quote").val().trim().length > 0) {
                    if(addr2.length > 0) {
                            addr2 += " ";
                    }
                    addr2 += $("#postcode_quote").val().trim();
            }

            addr += addr1;

            if(addr.length > 0) {
                    addr += ", ";
            }
            addr += addr2;

            if(addr.length > 0) {
                    addr += ", ";
            }
            addr += addr3;

            if(addr != lastAddrGeocoded && (addr1+addr2).length > 0) {
                    geocoder.geocode( { 'address': addr}, function(results, status) {
                            if (status == google.maps.GeocoderStatus.OK) {
                                    if(results != null && results[0] != null && results[0].geometry != null && results[0].geometry.location != null) {
                                            updateCoords(results[0].geometry.location.lat(), results[0].geometry.location.lng());
                                            initializeMarker();
                                    }
                            }
                    });
            }
            lastAddrGeocoded = addr;

    }

    $(document).ready(function() {
            // Center of Australia
            var latlng = new google.maps.LatLng(-26.564946,135.336912);
            //extra added
            //var mapDiv = $('#map_container');
            //var lat1 = mapDiv.data('latitude'),
               // lng1 = mapDiv.data('longitude');
            //var latlng = new google.maps.LatLng(lat1, lng1);
            //upto here
            var myOptions = {
                            zoom: 4,
                            center: latlng,
                            mapTypeId: google.maps.MapTypeId.HYBRID
            };
            map = new google.maps.Map(document.getElementById("map_container"),myOptions);

            geocoder = new google.maps.Geocoder();

            initializeMarker();

            bindAddressInputs();
    });
