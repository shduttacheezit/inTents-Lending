var dates;

$('#rent-form').submit(rentGear);
// console.log("got to rentgear")

  $("img#gearpic").click;

function rentGear(evt) {
	evt.preventDefault();
	// console.log("got to rentgear")

	var gearDetails = {
	"gear_id" : $("#gear_id").val(),
	"gear_name" : $("#gear_name").val(),
	"lender_email" : $("#lender-email").val(),
    "start_date" : $("#start-date").val(),
    "end_date" : $("#end-date").val()   
  }; 

	$.post('/renting.json', gearDetails, rentedSuccess);
}

function rentedSuccess(rentalInfo) {
	console.dir(rentalInfo);
	alert("Great! You are renting a " + rentalInfo['gear_name'] + " from " + rentalInfo['start_date'] + " to " + rentalInfo['end_date']);
}

$('#view').click(viewGear);

function viewGear() {
  $('.rentedgear').show();
}

var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}


$('.return').click(returnGear);

$(document).ready(function(){
  $("li img#gearpic").click(function() {
    $("li img#gearpic").animate({height: "500px"});
  });
});
function returnGear(evt) {
  evt.preventDefault();
  // debugger;
  var thisForm = $(this).parents('.returnform');

  rental = {
  "gear_id" : $("#gear_id").val(),
  }; 

  $.post('/rentals', rental, function(result) {
    alert(result);
    $(thisForm[0]).slideUp();
  });
}
