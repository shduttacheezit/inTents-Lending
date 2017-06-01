var dates;

$('#rent-form').submit(rentGear);
// console.log("got to rentgear")

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
	alert("Great! You are renting " + rentalInfo['gear_name'] + "from " + rentalInfo['start_date'] + " to " + rentalInfo['end_date']);

	rentallisting(rentalInfo['gear_name'], rentalInfo['start_date'], rentalInfo['end_date'], rentalInfo['lender_email']);

}

function rentallisting(gear_name, start_date, end_date, lender_email) {

}
