var geocoder;
var map;
var resultsMap;
var places;
var marker;
var markers = [];
var address;
var infoWindows = [];
var infowindow;
var equipmentSearchForm;
var pos;
var iconBase;
var image;

function initMap() {
  // evt.preventDefault();
  var sflatlng = new google.maps.LatLng(37.7749295, -122.4194155);
  var mapOptions = {
    center: sflatlng,
    scrollWheel: false,
    zoom: 11
  };
  
  map = new google.maps.Map(document.getElementById("search-map"), mapOptions);
  geocoder = new google.maps.Geocoder();
  infoWindow = new google.maps.InfoWindow;
  iconBase = '../static/images/';
  //HTML5 geolocation for current location
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      pos = {
      lat: position.coords.latitude,
      lng: position.coords.longitude
      };
      // console.log(pos);

      infoWindow.setPosition(pos);
      infoWindow.setContent('Found you!');
      infoWindow.open(map);
      map.setCenter(pos);
      

      marker = new google.maps.Marker({
        position: pos,
        map: map,
        icon: iconBase + 'campfire_sm.png',
        animation: google.maps.Animation.DROP
        // shape: shape,
        // title: "Current Location"
      });
      marker.setMap(map);
    });
  }
}

// google.maps.event.addDomListener(window, 'load', initMap);

$('#search-gear').submit(getSearchResults);

function getSearchResults(evt) {
  evt.preventDefault();
  // get values from search form
  equipmentSearchForm = {
    "gear_name" : $("#gear-name-field").val(),
    "brand" : $("#brand-type-field").val(),
    "category" : $("#category-type-field").val(),
    
  }; 
  // zipcode = $("#pac-input").val();
  // map.center()
  console.log("user entered location = " + $("#pac-input").val());

  $.post('/gear.json', equipmentSearchForm, fetchResults);
}

function fetchResults(equipment) {
  // console.log(equipment);
  // debugger
  // console.log('got to fetchResults');
  deleteMarkers();
  for (var i = 0; i < equipment.length; i++){
    // debugger
    console.log(i);
    var e = equipment[i];
    geocodeAddress(e);
  }
}
function geocodeAddress(gear) {
  resultsMap = map;
  // console.log(map);
  // console.log("gear:");
  // console.log(gear);
  iconBase = '../static/images/';
  var latlng;
  geocoder.geocode({'address': String(gear.zipcode)}, function(results, status) {
    if (status === 'OK') {  
      // console.log("result ")  
      // console.log(results)    
      resultsMap.setCenter(results[0].geometry.location);
      latlng = results[0].geometry.location;
      // console.log(results[0].geometry.location);
      // .gear_id, String(equipment[i].zipcode), equipment[i].gear_name, equipment[i].gear_photo_url, equipment[i].category, equipment[i].brand, equipment[i].lender_email)
      createMarkers(latlng, gear.gear_id, gear.zipcode, gear.gear_name, gear.gear_photo_url, gear.category, gear.brand, gear.lender_email)
    }
    // } else {
    //   alert('Geocode was not successful for the following reason: ' + status);
    // }
  });
  // return latlng;
}

function createMarkers(position, gear_id, zip, gear_name, photo, category, brand, lender_email) {
  // console.log(resultsMap);
  // console.log(position);
  marker = new google.maps.Marker({
    map: resultsMap,
    position: position,
    icon: iconBase + 'tent_sm.png'

  });
  markers.push(marker);
  console.log("it is creating")

  var gearhtml = '<div id="content">'+
                  '<div id="siteNotice">'+
                  '</div>'+
                  '<h1 id="firstHeading" class="firstHeading">' + gear_name + '</h1>'+
                  '<div id="bodyContent">'+
                  '<img src="' + photo + '" width="150" height="150"/>' +
                  '<p><b>Available</b> in ' + zip +'</p>'+
                  '<p><b>Category: </b> '+category +'</p>' +
                  '<p><b>Brand:</b> ' + brand +'</p>' +
                  '<p><b>Email Lender: </b>' + lender_email +'</p>' +
                  '<p><a href="/equipment_details/'+gear_id+'">'+
                  '<b><h3>Borrow Me!</h3></b></a></p>'+
                  '</div>'+
                  '</div>';
  marker.content = gearhtml;
  infoWindow = new google.maps.InfoWindow({
    position: position
  });
  infoWindows.push(infoWindow);

  (function (marker, gearhtml) {
    google.maps.event.addListener(marker, 'click', function(e) {
      infoWindow.setContent(gearhtml);
      infoWindow.open(resultsMap, marker);
    });
  }) (marker, gearhtml);
}
function setMapOnAll(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}
function deleteMarkers() {
  (function () {
    setMapOnAll(null);
  })();
  markers = [];
}

