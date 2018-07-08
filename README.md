# know Your Hood

_**know Your Hood**_ is a website that gives you information about any neighbourhood or suburb in New South Wales in Australia. Consider 'know Your Hood' as your neighbourhood dashboard.

This site was built as a final project at the end of a 12-week web development course (see [WDi from General Assembly](https://generalassemb.ly/education/web-development-immersive?where=sydney). It was built over 6 and a half days.

## Getting Started

The site is available live via the following Heroku link:

<https://know-your-hood.herokuapp.com/>

## Site Features



* User login and logout and a User Profile page. There is a lot more work needed on this part of the solution
* Search for a type of event (or leave the field blank for All Events)
* Enter a location to search. The location field is in the header and accepts postcodes and suburb names
  * The site was built with Australia in mind but the location search works for any country
  * The location is geocoded using Mapbox's Geocoding API Service (<https://www.mapbox.com/api-documentation/#geocoding>)
  * The default location when the homepage is loaded is Sydney, close to the Sydney Harbour Bridge
* Once the location has been geocoded a search for matching events is performed using the PredictHQ Event Search API (<https://www.predicthq.com/product/api/search>)
  * The proximity is a 2km radius from the centre point of the search location
* Up to 20 matching events are returned by the search and displayed as:
  * Colour coded pins on the map
  * A short description in the panel to the right of the map. Next to the title of each 'Happening' is a small badge that indicates what sort of event it is (e.g. Festival, Markets, Sports, Community, etc). The badge has the same colour scheme as the map pins
* Hovering over a map pin will display a small popup indicating the event. The same effect occurs if hovering over an event description in the side panel
* Clicking on an event in the side panel will take you to a 'Show' page that has more in depth information - the Show Page has 3 tabs; (1) Full Description, (2) Details for the address and map and (3) Dates and Times
* Move around in the map will display a "Search this Area" button towards the top of the map. Clicking on this button will re-run the search and re-render results for the map area now displayed.

## Feature Wishlist

* Bookmarking functionality to allow a user to save an event to their own list
* Filtering to restrict or expand search results - e.g. show all 'Happenings' other than 'Music Festivals'
* Mobile responsiveness to be truly a great experience on all types of devices
* Adding linking functionality on map popups to enable linking to the actual description on the description panel
* Refactoring of the code - the code is raw as-is expected after 5 days of work - the hover features are effectively coded twice to support mouse movements over the map and again to support mouse movements over the desription panel
* Turning the bouncing arrow icon in the description panel into a link that causes the scroll when the mouse pointer moves over it
* Expansion to cover other event APIs - e.g. Facebook Events, Google Places, etc.

## Built With the Following Frameworks, APIs and Libraries

* [Ruby on Rails](https://rubyonrails.org/) - Server side web application framework
* [PostgreSQL](https://www.postgresql.org/) - Relational database for server-side data storage
* [ReactJS](https://reactjs.org/) - The entire user interface is built using ReactJS
* [Webpack](https://webpack.js.org/) - Used to bundle the site for deployment
* APIs and Packages
  * [Mapbox](https://www.mapbox.com/) - Geocoding and Mapping features (via mapbox-gl-js)
  * [PredictHQ](https://www.predicthq.com/) - Real-time event information
  * [Microsoft Bing Image Search API](https://azure.microsoft.com/en-us/services/cognitive-services/bing-image-search-api/) - To retrieve images for each event
  * [reactstrap](https://reactstrap.github.io/) - Provide Bootstrap 4 components within React
  * [dateformat NPM Package](https://www.npmjs.com/package/dateformat) - to format dates for display

## Authors (in alphabetical order)

* **Brendan Leonard** - *Initial work*
* **Nathan Del Medico** - *Initial work*

## License

This project is licensed under the MIT License

## Acknowledgments

* Help / 2nd Pair of Eyes / Inspiration [ Text Chimp (Luke) and Grant ]
* Debugging help / Ideas / Sanity / Laughs [ Anna, Ana, Bhagi, Scott & Linna - WDi27 Sydney ]
