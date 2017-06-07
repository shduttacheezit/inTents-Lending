$('.return').click(returnGear);


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