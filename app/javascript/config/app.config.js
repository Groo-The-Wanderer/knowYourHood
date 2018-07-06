export default {
  mapboxToken: 'pk.eyJ1IjoiZ3Jvb3RoZXdhbmRlcmVyIiwiYSI6ImNqaWI3MmQ2aTFmM3ozcG5iaGMzMW9oc3QifQ.CwYqjyg85TWZYLiwBxbg8w',
  mapStyles: {
    default: 'mapbox://styles/mapbox/streets-v10',
  },
  hoodCenterMarkerColor: '#44c54c',
  searchedMarkerColor: '#366e76',
  primarySchoolMarkerColor: '#0276fd',
  secondarySchoolMarkerColor: '#31e331',
  combinedSchoolMarkerColor: '#6f2da8',
  specialSchoolMarkerColor: '#fc6600',
  // localDataURL: 'http://localhost:3000',
  localDataURL: 'https://know-your-hood.herokuapp.com',
  mapboxGeocodeURL: 'https://api.mapbox.com/geocoding/v5/mapbox.places',
  mapboxDirectionsURL: 'https://api.mapbox.com/directions/v5/mapbox',
  mapboxDirectionsDestinations: {
    SydneyDomesticAirport: [151.17997660000003,-33.9329233],
    SydneyInternationalAirport: [151.16557979999993,-33.9353852]
  }
}