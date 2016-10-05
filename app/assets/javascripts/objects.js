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
  debugger
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
      $('#objective').append('<li>'+objective.title+'</li><li>'+objective.notes+'</li>');
      objective.alertMe();
      // $(this).reset();
    });
  }

  posting(url, values);
    // resetting form
   });
});

var resetElement = function(element1, element2, window) {
    // removing the element1 if it exists to avoid adding duplicates
    $(element1).remove();
    // adding element2 to the current window
    window.after(element2);
}  

$(function () {
  // $('form#new_objective').submit(function(event) {
  //   // thought of adding form event listener here, but it did not work either
  //   debugger
  //  });
  $("#new-objective").click(function() {
      debugger
      var path  = window.location.pathname,
          url   = path+'/objectives/new', 
       parser   = new DOMParser();

      $.get(url, function(data){
        // parsing data(page at /objectives/new) from text to html
        debugger
        var htmlDoc = parser.parseFromString(data, "text/html"),
            form    = htmlDoc.body.children[2].children[11];
        // adding the parsed out form
        $("#new-objective").after(form);
        var domForm =  document.getElementById("new_objective");
        debugger

        // domForm.addEventListener("Submit", function(e) {
        // thought of adding event listener upon form creation but did not work
        // })
      })
      
    });
})


