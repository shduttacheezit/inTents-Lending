var geocoder;
var map;
var places;
var marker;
var markers = [];
var address;
var infoWindow;
var equipmentSearchForm;

function initMap() {
  // evt.preventDefault();
  var mapOptions = {
    center: pos,
    scrollWheel: false,
    zoom: 13
  
  map = new google.maps.Map(document.getElementById("search-map"), mapOptions);
  geocoder = new google.maps.Geocoder();
  infoWindow = new google.maps.InfoWindow;

  //HTML5 geolocation for current location
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
      lat: position.coords.latitude,
      lng: position.coords.longitude
      };

      infoWindow.setPosition(pos);
      infoWindow.setContent('Location found.');
      infoWindow.open(map);
      map.setCenter(pos);
      

      marker = new google.maps.Marker({
        position: pos,
        map: map,
        animation: google.maps.Animation.DROP
      });
      marker.setMap(map);
    });
  }
  fetchPlaces();
}

google.maps.event.addDomListener(window, 'load', initMap);

$('#search-gear').submit(getSearchResults)

function getSearchResults(evt) {
  evt.preventDefault();
  // get values from search form
  equipmentSearchForm = {
  "gear_name" : $("#gear-name-field").val(),
  "brand" : $("#brand-type-field").val(),
  "category" : $("#category-type-field").val(),
  "zipcode" : $("#pac-input").val()
  }; 
  console.log("user entered location = " + zip);

  for (i = 0; i < equipment.length; i++){
    if ("{{ zipcode }}" === point[i]['zipcode']) {
      var latitude = point[i]['properties']['latitude']
      var longitude = point[i]['properties']['longitude'];
      var latlng = new google.maps.LatLng(latitude, longitude);
    }

    geocoder.geocode( { 'address': zip }, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      // log out results from geocoding
      console.log("geocoding results");
      console.log("results");

    // reposition map to the first returned location
    map.setCenter(results[0].geometry.location);

    // put marker on map
    marker = new google.maps.Marker({
    map: map,
    position: results[0].geometry.location
    });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
    });
  // preparing data for form posting
  var lat = results[0].geometry.location.lat();
  var lng = results[0].geometry.location.lng();
  var loc_name = results[0].formatted_address;
  }
}

var fetchPlaces = function() {
  infowindow = new google.maps.InfoWindow({
  content: ''
});

  $.post('/camper/<camper_id>', equipment, function(response) {
    if (response.status == 'OK') {
      places = response.places;
      // loop through places and add markers
      for (p in places) {
        //create gmap latlng obj
        tmpLatLng = new google.maps.LatLng( places[p].geo[0], places[p].geo[1]);
        // make and place map maker.
        marker = new google.maps.Marker({
          map: map,
          position: tmpLatLng,
          title : places[p].name + "<br>" + places[p].geo_name
          });
        bindInfoWindow(marker, map, infowindow, '<b>'+places[p].name + "</b><br>" + places[p].geo_name);
        // not currently used but good to keep track of markers
        markers.push(marker);
      }
    }
  });
}
$.post('/gear.json', equipmentSearchForm, function(results) {
  console.log(results);
});


