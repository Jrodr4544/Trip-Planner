function Trip(id, title, description) {
  this.id          = id;
  this.title       = title;
  this.description = description;
}

function Objective(id, title, notes) {
  this.id     = id;
  this.title  = title;
  this.notes  = notes;
}
// The trips show does not like the event handler below for some reason
$(function () {

  $('.objectives.new').click(function(event) {
  //prevent form from submitting the default way
  event.preventDefault();

  var values = $(this).serialize();
  var trip_id = $('select#objective_trip_id').val();

  // make sure that values is set properly, otherwise grab each individual value from the input fields. Maybe use the trip id field to send a post to /trips/:trip_id/objectives  
  var posting = $.post('/trips/'+trip_id+'/objectives', values);
  
  posting.done(function(data){
    debugger
  })

 });
});

