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

var post = function(values) {
  debugger
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
      $('#objective').append('<li>'+objective.title+'</li><li>'+objective.notes+'</li>');
      objective.alertMe();
      // resetting form fields and submit button
      $("input[type=submit]").removeAttr("disabled");
      document.getElementById("new_objective").reset();
    }).error( function(data) {
      debugger
      alert("Objective: "+this.title+"; "+this.notes+", failed");
    });
  }
  posting(url, values);
}

$(function () {

  $('form#new_objective').submit(function(event) {
  //prevent form from submitting the default way
    event.preventDefault();
    var values  = $(this).serialize();
    post(values);
   });

});

var resetElement = function(element1, element2, window) {
    // removing the element1 if it exists to avoid adding duplicates
    $(element1).remove();
    // adding element2 to the current window
    window.after(element2);
}  

var bool  = true;

$(function () {

  $("#new-objective").click(function() {
      var trip_id             = window.location.pathname.match(/[^/]+$/)[0];
      var objectiveFields     = '<div class="field"><label for="objective_title">Title</label><br><input autofocus="autofocus" type="text" name="objective[title]" id="objective_title"></div><div class="field"><label for="objective_notes">Notes</label><br><input type="text" name="objective[notes]" id="objective_notes"></div>'
      var tripsDropDown       = '<div><select name="objective[trip_id]" id="objective_trip_id"><option value="'+trip_id+'">'+trip_id+'</option></select></div>'
      var locationsDropDown   = '<div><select name="objective[location_id]" id="objective_location_id"><option value="">Please Select</option></select></div>'
      var submit              = '<div class="objectives new" id="jquery-submit"><input type="submit" name="commit" value="Submit" class="btn btn-primary"></div>';
      var form                = '<form class="new_objective" id="new_objective" action="/objectives" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">'+tripsDropDown+'</br>'+objectiveFields+'</br>'+locationsDropDown+'</br>'+submit+'</form>';
      var domForm             = document.getElementById("new_objective");

      // If the form doesn't exist, populate it.
      if (domForm == null) {
        $("#new-objective").after(form);
      
      // Populating list of Locations for drop down
        $.get('/locations.json',function(data){
          $.each(data, function(index,key) {
            $('select#objective_location_id').append('<option value='+data[index].location.id+'>'+data[index].location.city+'</option>');
          })
        })
      } else {
        bool ? $("#new_objective").hide() : $("#new_objective").show();
        bool  = !bool;
      }
      
      document.getElementById("new_objective").addEventListener("submit", function(e) {
        debugger
        e.preventDefault();
        var values  = $(this).serialize();
        post(values);
      })

    });

})


