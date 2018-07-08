# know Your Hood

_**know Your Hood**_ is a website that gives you information about any neighbourhood or suburb in New South Wales in Australia. Consider 'know Your Hood' as your neighbourhood dashboard.

This site was built as a final project at the end of a 12-week web development course (see [WDi from General Assembly](https://generalassemb.ly/education/web-development-immersive?where=sydney))). It was built over 6 and a half days.

The site presents data from:
* [The Australian Bureau of Statics](http://www.abs.gov.au/) - for statistical and demographic information
* [My School](https://www.myschool.edu.au/) - for schools profile and location information
* [Mapbox](https://www.mapbox.com/) - for address and driving times information

## Getting Started

The site is available live via the following Heroku link:

<https://know-your-hood.herokuapp.com/>

## Site Features
![alt text](https://github.com/Groo-The-Wanderer/knowYourHood/blob/master/public/knowYourHood_screenshot.png "know Your Hood screenshot")

* The screen is configured as a dashboard with tiles (or panels) that present different types of information. The entire screen comprises 12 tiles with some components taking up more than a single tile. For example, the map component takes up 4 tiles. The layout of the screen and use of tiles is configuration driven (see below).
* The top left of the screen is the map. There is a search screen on the map to search for any address in New South Wales. The map uses [Mapbox](https://www.mapbox.com/) and the address search utilises Mapbox's [geocoding API](https://www.mapbox.com/api-documentation/#introduction) 
* As you enter an address autocompletion will try to make suggestions about what you are looking for. Select the desired address from the suggested items.
* Once selected the site will determine the actual neighbourhood or suburb of the search. So if you search for a specific street address (such as your own home address) the suburb where your home is located will drive the rest of the information shown.
* The remaining components displayed are:
  * Postcode - this tile shows the Australian postcode (zip code equivalent) for the suburb. This tile also shows the area of the suburb (derived from ABS data)
  * Suburb Snapshot - information from the ABS census of 2017 including; median age of residents, median individual and household incomes, median mortgage or rental payments information, and the average household size
  * Dwellings - information about the types of dwellings in the suburb; freestanding houses, townhouses or semi-detached dwellings and apartments or flats. From the ABS census of 2017.
  * Family Makeup - families in the area - and whether they have children and the age brackets of the children. From the ABS census of 2017.
  * Home Ownership - information about home ownership - whether residents own their homes, are paying a mortgage, or are renting.
  * Schools Nearby - information is from [ACARA My School](https://www.myschool.edu.au/) - the Australian Curriculum, Assessment and Reporting Authority
    * Schools are within a 2km radius of the searched location. So if you've searched for your own home then it's a 2km radius of your home.
    * Schools are highlighted on the map using various coloured dots based on the type of school.
    * If you hover over a dot on the map a popup is displaye with the name and type of school.
    * If you click the show / hide links that appear in the title bar of the "Schools Nearby" tile the display list and the coloured dots on the map will show or hide accordingly.
    * For each school, the site derives whether it is boys only, girls only or co-ed using enrolments information.
    * The site also derives the teaching ratio of teachers to students from the enrolments and teaching information.
  * Travel Times - information about travel times and distances to the Sydney Domestic and International Airports. Travel time information is real time and uses Mapbox's [Directions API](https://www.mapbox.com/api-documentation/#directions) for this data.

## Feature Wishlist
The site was built in 6 and a half days and is therefore the MVP (Minimum Viable Product) of what is possible. Features to add in future include:

* User logins so that users can bookmark various neighbourhoods and compare them.
* Use of visualisations and percentages instead of pure numerical data.
* Adding weather information, crime statistics, housing affordability and numerous other types of data.
* Incorporating live real estate listings information from a site such as [Domain](https://www.domain.com.au/).
* Instead of just restricting travel times to Sydney's domestic and international airports, enhance the geocoding to find the nearest airports.
* Include walking times to train stations and other public transport, travel times to the nearest CBD. etc.
* Better styling of the popup boxes on the map when a user moves the mouse over a school location. The popup could be used to highlight comparative information, fees information, etc.
* Additional filtering on the schools listing, e.g. Private vs Government schools.
* Add more information to the schools listing, rankings based on standardised NAPLAN testing (will require screenscraping of the My School website), school fees information for private schools, etc.
* Mobile responsiveness to be truly a great experience on all types of devices.
* Refactoring of the code - the code is raw as-is expected after 6 days of work. It is reasonably well commented but will could be streamlined.


## Built With the Following Frameworks, APIs and Libraries

* [Vue.js](https://vuejs.org/) - The entire user interface is built using Vue.js
* [Ruby on Rails](https://rubyonrails.org/) - Backend server side web application framework - will manage user authentication (not yet incorporated) and currently manages interactions with the database
* [PostgreSQL](https://www.postgresql.org/) - Relational database for server-side data storage
* [Webpack](https://webpack.js.org/) - Used to bundle the site for deployment
* APIs and Packages
  * [Mapbox GL JS](https://github.com/mapbox/mapbox-gl-js) - Interactive mapping features
  * [Mapbox Geocoding API](https://www.mapbox.com/api-documentation/#geocoding) - Geocoding
  * [Mapbox Directions API](https://www.mapbox.com/api-documentation/#directions) - Travel Times
  * [CSV Ruby Gem](https://github.com/ruby/csv) - Used to read CSV files as part of rake/rails tasks to import data into the PostgresSQL database
  * [Geocoder Ruby Gem](https://github.com/alexreisner/geocoder) - Used to enable spatial queries from the PostgreSQL database - initial use is to get schools nearby
  * [Axios HTTP Client Ruby Gem](https://github.com/axios/axios) - Used to perform Ajax requests against the PostgreSQL database and also the Mapbox API services

## Notes about the Data
The Australian Bureau of Statistics [ABS](http://www.abs.gov.au/) has a lot of information and data that would be relevant to a site such as this. Some of it has been used already but there is a lot more available.

The ABS data is however very difficult to use. There are live APIs provided by the ABS but the information is fairly abstract and requires an intermediate level of translation between the data and being able to use the data.

Therefore, for this website I basically built my own APIs that source data from the PostgreSQL database. The data integration activities to extract data from the ABS, interpret and map the data and then load the data to the PostgreSQL database were performed offline. The resultant CSV data files were loaded using the rake/rails tasks utilising the CSV Ruby Gem.

The file manipulation was primarily Bash shell scripts calling utilities I wrote using Unix AWK.

The ACARA My School's site does not have live APIs. The data I utilised were datasets provided for research purposes and available in CSV format from the ACARA site. I filtered and loaded this information to the PostgreSQL database using the same techniques used for the ABS data.

## Authors

* **Brendan Leonard** - *Initial work*

## License

This project is licensed under the MIT License

## Acknowledgments

* Help / 2nd Pair of Eyes / Inspiration [ Text Chimp (Luke) and Grant ]
* Debugging help / Ideas / Sanity / Laughs [ Anna, Ana, Bhagi, Nathan, Scott & Linna - WDi27 Sydney ]
