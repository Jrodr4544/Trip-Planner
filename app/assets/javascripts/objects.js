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

Objective.prototype.alertMe = function() {
  alert("Objective: "+this.title+"; "+this.notes+", created!");
}

// The trips show does not like the event handler below for some reason
$(function () {

  $('form#new_objective').submit(function(event) {
  //prevent form from submitting the default way
  event.preventDefault();
  var values  = $(this).serialize();
  var trip_id = $('select#objective_trip_id').val();
  var url     = '/trips/'+trip_id+'/objectives';
  
  var posting = function(url, values){
    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'json',
      data: values
    }).done( function(data) {
      var objective = new Objective(data["id"], data["title"], data["notes"]);
      objective.alertMe();
    });
  }

  posting(url, values);
  debugger
  $(this).reset();
 });
});

