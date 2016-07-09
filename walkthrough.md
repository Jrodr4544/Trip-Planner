Trip Planner Walkthrough

I like including walkthrough's but not only because they are required but because they help my train of thought. I also think they're a great place to go back to once you've learned and improved from where you were once at.

For the Rails Assessment project at Flatiron's Learn full stack web development program, I decided to build an application called "Trip Planner". This was one of the ideas I thought of while brainstorming including a bucket list. I've planned trips in the past and I'm actually in the process of planning one now. I figured why not create an application based on the functionality I think would be cool to have.

Once I had the idea down I found it somewhat tricky to figure out the proper associations. After writing a tasklist with models and controllers along with everything else the app required, I had a better plan for taking down the deliverables. I also asked a learn expert to provide some suggestions and we reviewed the associations I had in mind, I was ready to go.

I wrote down the requirements for the project such as the models and their attributes along with associations. I included the controllers I would probably use and views. I knew I wanted to include some form of authentication and thought of using devise because that'd be perfect. I even thought that maybe I could include omniauth for this project, but figured I could leave this feature for last. 

The first tasks I took down were creating migrations, adding Devise, and models as well as associations. I generated the Rails environment for this application using the 'rails new' command. Once that was built out, I added some attributes to the migrations and tested out the associations. Afterwards I created a Welcome controller to start building out some actions and views. This lead me to add the bootstrap template, which was rather familiar to implement since I have already done this with my sinatra project.

I've realized that by starting out writing every step down and tackling them, you are able to code much more peaceful and quicker as opposed to just right out coding.

After I generated the views I wanted and I decided to add the google maps feature that would map out all the objectives for a trip. This was pretty challenging and I'm glad the learn experts helped me figure it out. After reading through the google maps documentations for markers and how to include the map on your page I looked through several resources including forums to see what would be the best option. I found some snippets online and started debugging to fit my code. The challenging part was figuring out the right way to geocode the addresses based off the current attributes (city, state, and country). I found a neat gem called 'geokit-rails' that was not so difficult to implement after understanding the docs. 

One of the learn experts suggested adding latitude and longitude columns so that the map would load faster by storing the locations in the database as opposed to making an api call per location. This worked fabulously. I created two methods, one to concatenate the string for the location and another that would geocode as well as store that location in the database.
 
I'll admit, the map was a great learning experience. I was able to call a ruby arrays and store them in javascript variables so that the map would render the information I wanted. Super cool!


