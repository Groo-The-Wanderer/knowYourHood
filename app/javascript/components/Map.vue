<template>
  <tile :position="position" modifiers="transparent">
    <div id='map'>
      <div id='map-legend'>Legend:&nbsp;<span class="marker searched"></span>&nbsp;Searched&nbsp;<img src="../../assets/images/hoodMarker.png">&nbsp;Centre&nbsp;&nbsp;&nbsp;Schools:&nbsp;<span class="marker primarySchools"></span>&nbsp;Primary&nbsp;<span class="marker secondarySchools"></span>&nbsp;Secondary&nbsp;<span class="marker combinedSchools"></span>&nbsp;Combined&nbsp;<span class="marker specialSchools"></span>&nbsp;Special&nbsp;</div>
    </div>
  </tile>
</template>

<script>
import Tile from './common/Tile';
import Mapbox from 'mapbox-gl';
import axios from 'axios';
import { createGeoJSON } from '../utilities/utilities';

const config = require('../config/app.config.js').default;

const defaultLatLng = {
  lat: -33.8688197,
  lng: 151.20929550000005
};

const defaultOptions = {
  container: 'map',
  style: config.mapStyles.default,
  center: [defaultLatLng.lng, defaultLatLng.lat],
  zoom: 9
};

const markerColor = {
  Primary: config.primarySchoolMarkerColor,
  Secondary: config.secondarySchoolMarkerColor,
  Combined: config.combinedSchoolMarkerColor,
  Special: config.specialSchoolMarkerColor
};

const popup = new Mapbox.Popup({
  closeButton: false,
  closeOnClick: false,
  offset: 0
});

let map = null;

Mapbox.accessToken = config.mapboxToken;

export default {
  components: {
    Tile
  },

  mounted() {
    this.createMap();
  },

  props: [ 'position', 'primarySchools', 'secondarySchools', 'combinedSchools', 'specialSchools', 'showPrimary', 'showSecondary', 'showCombined', 'showSpecial' ],

  methods: {
    createMap() {
      map = new Mapbox.Map(defaultOptions);
      // this.map = map;

      map.on('load', () => {
        map.addSource('searched-point', {
          "type": "geojson",
          "data": {
            "type": "FeatureCollection",
            "features": []
          }
        });

        map.addLayer({
          "id": "searched-point",
          "source": "searched-point",
          "type": "circle",
          "paint": {
            "circle-radius": 7,
            "circle-color": config.searchedMarkerColor
          }
        });
      })

      // Center Marker below will render at the centre of the hood that was searched for
      const centerMarker = new Mapbox.Marker({ color: config.hoodCenterMarkerColor });

      const geocoder = new MapboxGeocoder({
        accessToken: config.mapboxToken,
        // Limit results to Australia
        country: 'au',
        // Further restrict to NSW
        bbox: [139.965, -38.030, 155.258, -27.839],
        zoom: 13,
        
        filter: function (item) {
          // returns true if item contains New South Wales region
          return item.context.map(function (i) {
            // id is in the form {index}.{id} per https://github.com/mapbox/carmen/blob/master/carmen-geojson.md
            // this example attempts to find the `region` named `New South Wales`
            return (i.id.split('.').shift() === 'region' && i.text === 'New South Wales');
          }).reduce(function (acc, cur) {
            return acc || cur;
          });
        }
      });

      // Add geocoder search box (i.e. where the user enters a query) to the map
      map.addControl(geocoder, 'top-right');

      // Add zoom and rotation controls
      map.addControl(new Mapbox.NavigationControl());

      map.on('mouseenter', 'primary-schools', (event) => {
        this.showSchoolsPopup( event );
      });

      map.on('mouseenter', 'secondary-schools', (event) => {
        this.showSchoolsPopup( event );
      });

      map.on('mouseenter', 'combined-schools', (event) => {
        this.showSchoolsPopup( event );
      });

      map.on('mouseenter', 'special-schools', (event) => {
        this.showSchoolsPopup( event );
      });

      map.on('mouseleave', 'secondary-schools', () => {
        this.hideSchoolsPopup( popup );
      });

      map.on('mouseleave', 'primary-schools', () => {
        this.hideSchoolsPopup( popup );
      });

      map.on('mouseleave', 'combined-schools', () => {
        this.hideSchoolsPopup( popup );
      });

      map.on('mouseleave', 'special-schools', () => {
        this.hideSchoolsPopup( popup );
      });

      // Callback to send the geocoded result to the parent
      geocoder.on('result', e => {
        // Extract relevant information from the result set
        const result = e.result;

        let postcode = '';
        let hood = '';
        let city = '';
        let state = '';
        let center = [];
        let lat = null;
        let lng = null;
        let hoodCenter = [];
        let hoodLat = null;
        let hoodLng = null;
        let locationObj = {};
      
        if( result.center && result.center.length > 0 ){
          lng = result.center[0];
          lat = result.center[1];
          center = [ lng, lat ];

          // Code below will display a point on the searched location
          // Drop the circle onto the map
          map.getSource('searched-point').setData( result.geometry );
        }

        const mbGeocodeURL = config.mapboxGeocodeURL;
        axios.get(`${mbGeocodeURL}/${lng},${lat}.json?&access_token=${config.mapboxToken}&country=AU&types=locality`)
        .then(resp => {
          if( resp.data.features.length > 0 ){
            hood = resp.data.features[0].text;
            hoodCenter = resp.data.features[0].center;
            hoodLng = hoodCenter[0];
            hoodLat = hoodCenter[1];
          }

          if( resp.data.features[0].context ){
            resp.data.features[0].context.forEach( elem => {
              const type = elem.id.split('.').shift();
              switch (type) {
                case 'postcode':
                  postcode = elem.text;
                  break;
                case 'place':
                  city = elem.text;
                  break;
                case 'region':
                  state = elem.text;
                  break;
                default:
                  break;
              }
            })
          }

          // Get map bounds of visible map to restrict any future queries
          const mapBounds = map.getBounds();

          // Set a marker on the center of the hood
          centerMarker.setLngLat( hoodCenter ).addTo( map );

          // Create return object
          locationObj = {
            postcode: postcode,
            city: city,
            state: state,
            center: center,
            lng: lng,
            lat: lat,
            hood: hood,
            hoodCenter: hoodCenter,
            hoodLng: hoodLng,
            hootLat: hoodLat,
            mapBounds: mapBounds
          }

          // send location object to parent
          this.$emit('mapLocationSet', locationObj);
        });
      });
    }, // end createMap()
    
    showSchoolsPopup( event ) {
      // Change the cursor style as a UI indicator.
      map.getCanvas().style.cursor = 'pointer';
      const coordinates = event.features[0].geometry.coordinates.slice();
      const description = event.features[0].properties.description;
      const sector = event.features[0].properties.sector;
      const school_type = event.features[0].properties.school_type;

      // Ensure that if the map is zoomed out such that multiple
      // copies of the feature are visible, the popup appears
      // over the copy being pointed to.
      while (Math.abs(event.lngLat.lng - coordinates[0]) > 180) {
        coordinates[0] += event.lngLat.lng > coordinates[0] ? 360 : -360;
      }

      // Populate the popup and set its coordinates
      // based on the feature found.
      popup.setLngLat(coordinates)
        .setHTML('<p>' + description + '</p><p>' + sector + ' ' + school_type + '<p>')
        .addTo(map);
    },

    hideSchoolsPopup( popup ){
      map.getCanvas().style.cursor = '';
      popup.remove();
    },
  }, // Method definition

  watch: {
    primarySchools: function( newList, oldList ){
      if( map.getLayer('primary-schools') ){
        map.removeLayer( 'primary-schools' );
        map.removeSource( 'primary-schools' );
      }
      map.addLayer( createGeoJSON( newList, 'primary-schools', markerColor.Primary) );
    },
    secondarySchools: function( newList, oldList ){
      if( map.getLayer('secondary-schools') ){
        map.removeLayer( 'secondary-schools' );
        map.removeSource( 'secondary-schools' );
      }
      map.addLayer( createGeoJSON( newList, 'secondary-schools', markerColor.Secondary) );
    },
    combinedSchools: function( newList, oldList ){
      if( map.getLayer('combined-schools') ){
        map.removeLayer( 'combined-schools' );
        map.removeSource( 'combined-schools' );
      }
      map.addLayer( createGeoJSON( newList, 'combined-schools', markerColor.Combined) );
    },
    specialSchools: function( newList, oldList ){
      if( map.getLayer('special-schools') ){
        map.removeLayer( 'special-schools' );
        map.removeSource( 'special-schools' );
      }
      map.addLayer( createGeoJSON( newList, 'special-schools', markerColor.Special) );
    },
    showPrimary: function( newVal, oldVal ){
      map.setLayoutProperty('primary-schools', 'visibility', newVal ? 'visible' : 'none');
    },
    showSecondary: function( newVal, oldVal ){
      map.setLayoutProperty('secondary-schools', 'visibility', newVal ? 'visible' : 'none');
    },
    showCombined: function( newVal, oldVal ){
      map.setLayoutProperty('combined-schools', 'visibility', newVal ? 'visible' : 'none');
    },
    showSpecial: function( newVal, oldVal ){
      map.setLayoutProperty('special-schools', 'visibility', newVal ? 'visible' : 'none');
    },
  }
}
</script>

<style scoped lang='scss'>
#map {
  position:absolute;
  left:0;
  right:0;
  top:0;
  bottom:0;
  width:100%;
  height:100%;
}

#map-legend {
  background: transparentize(white, 0.2);
  bottom: 10px;
  box-sizing: border-box;
  display: inline;
  left: 10px;
  padding: 5px;
  pointer-events: none;
  position: absolute;
  z-index: 200;
  font-size: var(--font-size-xxs);
  font-weight: var(--font-weight-bold);
  color: rgb(92, 40, 40);
  font-family: Arial, Helvetica, sans-serif;
  border-radius: 7%;
  line-height: 1rem;
  .marker {
    height: 0.65rem;
    width: 0.65rem;
    border-radius: 50%;
    vertical-align: middle;
    display: inline-block;
    line-height: 0.65rem;
  }
  img {
    height:1.2rem;
    vertical-align: middle;
  }
  .searched {
    background-color: #366e76;
  }
  .primarySchools {
    background-color: #0276fd;
  }
  .secondarySchools {
    background-color: #31e331;
  }
  .combinedSchools {
    background-color: #6f2da8;
  }
  .specialSchools {
    background-color: #fc6600;
  }
}

#mapType {
  background: white;
  border-radius: 5px;
  box-sizing: border-box;
  display: inline;
  padding: 5px;
  top: 10px;
  right: 10px;
  position: absolute;
  z-index: 200;
  label {
    display: block;
    font-weight: bold;
  }
}
</style>
