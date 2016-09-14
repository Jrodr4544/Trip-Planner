# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show page rendered using jQuery and an Active Model Serialization JSON backend.
  - Used a nested ajax to render details from a trips#show action with a delegated event handler. AMS works in the backend to serialize a trip

- [x] Include an index page rendered using jQuery and an Active Model Serialization JSON backend.
  - Used an ajax request to the trips#index action to pull all of a user's trips and render them using jQuery with Active Model Serialization

- [x] Include at least one has_many relationship in information rendered via JSON
  - added the following line to trip_serializer 
  has_many :objectives, serializer: ObjectiveSerializer

- [x] Include at least one link that loads or updates a resource without reloading the page
  - clicking new objective in the show page renders the objective#new form which creates new objectives

- [x] Translate JSON responses into js model objects
  - converting JSON response into JS model objects via an ajax get request to the trips#state action

- [ ] At least one of the js model objects must have at least one method added by your code to the prototype

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
