# OVERVIEW
This is a very first phase of building a Cinema Filming Management system, which would be a replacement for Megastar current website.

## DATABASE STRUCTURE
In this phase I implemented 3 models:
MOVIE, CITY, PLACE 

MOVIE can be filmed in multiple CITIES 
MOVIE can use multiple PLACES to film scenes. 

CITIES can be used in filming of multiple MOVIES 
CITIES have many PLACES to be used for filming scenes 

PLACES can in the filming of many MOVIES 
PLACES can be found in only 1 city 

MOVIES can be added stand alone 
CITIES can be added stand alone 
PLACES when added must be associated to a CITY, and a MOVIE 

After a MOVIE exists, a CITY can be associated to it (and vice versa) 
After a PLACE exists, an different MOVIE can be associated to it 

## FEATURES TO BE IMPLEMENTED

### BASIC

- App that supports necessary assocations/relations above 
- Page to Add MOVIE. MOVIE just has a Name (text) 
- Page to Add a CITY. CITY has a Name (text) 
- Page to add a PLACE. PLACE has a Name (text) 

- Ability to associate an existing PLACE to an existing MOVIE 
- Ability to associate PLACE to CITY (must be done at time of creation of a PLACE) 
- Ability to associate an existing CITY to an existing MOVIE 
- When viewing a MOVIE, need to see all the CITIES used for that movie and all of the PLACES used for that MOVIE 
- When viewing a CITY, need to see all of MOVIES hosted in that CITY and a list of 10 PLACES within that CITY 
- When viewing a PLACE, seeing the MOVIES being hosted there and CITY that the place lives within 
- When looking at a specific MOVIE, an "add Place" button is provided which the user can then do the following: 
  - Add a new PLACE which the user mut provide PLACE name and associated CITY 
  - Select an existing PLACE to associate to. 
- When looking at a specific CITY, an "add Place" button is provided which the user can then do the following: 
  - Add a new PLACE which the user mut provide PLACE name 
- Broad drill downs, user can select MOVIE, then select a CITY associated to that MOVIE to view, then select a PLACE used in that CITY for filming that MOVIE. 

### GOOGLE MAP INTEGRATED

View Movie - Brings map up with Cities for that movie 

View City - If no movie is selected, shows all places for that city, if a movie is selected, shows places for that movie in that city 

View Place - Shows location of that place.  If it was drilled down into from a movie, displays movie name and a section that shows "Other Movies Filmed Here..." which has the list of other movies (if any) filmed at that place.  If user goes directly to that place, the "Other Movies Filmed Here..." title changes to "Movies Filmed Here" and lists the movies filmed there.  In both cases, the city name is also displayed. 


## EXAMPLE

    "The Dark Knight" (MOVIE) was filmed in Hong Kong, Chicago, London, LA (CITIES). 
    In Hong Kong, it was filmed at the folloiwng Places (2 International Finance Centre, Queen's Road Central).  
    In Chicago it was filmed at the following places (Atwood Cafe - 1 Washington St, Brach's candy Factory - 401 N. Cicero Street) 
    In London, it was filmed at the following Places (Piccadilly Circus, St John Street) 
    In LA, it was filmed at the following Places (North Hollywod) 

    ---

    "Pineapple Express" (MOVIE) was filmed in Glendale California, LA, Downey California, Culver City California (CITIES). 
    Have no data yet for where exactly filmed in Glendale (no PLACE for this movie in Glendale) 
    In LA it was filmed at the following places (North Hollywood) 
    In Downey, it was filmed at the following Places (Rockwell Defence Plant - Bellflower and Imperial Highway) 
    In Culver, it was filmed at the following Places (Sony Pictures Studios - 10202 W. Washington Blvd) 
