# Trip-Planner
![Trip-Planner Logo](/assets/images/my_logo.png)
Format: ![Alt Text](url)

## Plan your trips
This Rails project was created for my Rails assessment at FlatIron's [Learn.co](https://learn.co). It allows users to create a profile or use facebook credentials to log in. Once logged in, a user can create a Trip to plan objectives for and these objectives accept locations and display them on a map.

### Purpose
Map out your trips with objectives and see them on a map for user-friendly access. It is very easy to use.

`1. Sign Up or Sign In`

`2. Click your Username to create first trip!`

`3. Create New Objective for your trip and add a location`

You can add or modify objectives. Have fun!

### Getting Started

To get started, please install the gems for this app by running

`bundle`

After you run bundle to install all the gems. Make sure you run the server locally by using 

`rails server`

Additionally, in order to run this locally you will have to get your own api key from facebook as well as a google maps javascript api key. A good gem that handles the environment variables which store these api keys is 'dotenv' which should be installed after running bundle.

If you do not already have a file in the root directory of the app, create one called .env and inside it include

`FACEBOOK_APP_ID=APP_ID_GOES_HERE`
`FACEBOOK_SECRET=SECRET_GOES_HERE`
`GOOGLE_MAPS_KEY=MAPS_KEY_GOES_HERE`

### Notes

Might not be able to use APIs because of the restriction on requests by IP

### Contributing

Feel free to pull request or report any bugs on github at http://www.github.com/jrodr4544/Trip-Planner . Please also check out the code of conduct at http://contributor-covenant.org/ , this project is welcome to any collaborations under the specifications in the covenant.