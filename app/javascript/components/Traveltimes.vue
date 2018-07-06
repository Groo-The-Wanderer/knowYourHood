<template>
  <tile :position="position" modifiers="overflow" :title="this.title">
    <section class="traveltimes">
      <div class="tile--header">{{ this.title }}</div>
      <table class="traveltimes__table" v-if="travelTimesAndDistances && location">
        <tr>
          <td colspan="3">{{ this.location.searched_for }} to ...</td>
        </tr>
        <tr v-for="dest in travelTimesAndDistances" :key="dest.name">
          <td><li>{{ dest.name }}</li></td>
          <td>{{ duration(dest.duration) }}</td>
          <td>{{ formatted(distanceString(dest.distance)) }}</td>
        </tr>
      </table>
    </section>
  </tile>
</template>

<script>
import Tile from './common/Tile';
import { formatNumber, distanceAway, formatSecondsAsTime } from '../utilities/utilities';
import axios from 'axios';

const config = require('../config/app.config.js').default;

export default {
  components: {
      Tile,
  },

  data(){
    return {
      travelTimesAndDistances: []
    }
  },

  props: ['position', 'title', 'location'],

  methods: {
    distanceString( distance ){
      return distanceAway( distance, 'm' );
    },

    formatted( inputNumber ){
      return formatNumber( inputNumber );
    },

    duration( inputSeconds ){
      return formatSecondsAsTime( inputSeconds );
    },

    getTravelTimes(){
      if( this.location ){
        const mbDirectionsURL = config.mapboxDirectionsURL;
        const SydneyDomesticAirport = config.mapboxDirectionsDestinations.SydneyDomesticAirport;
        const SydneyInternationalAirport = config.mapboxDirectionsDestinations.SydneyInternationalAirport;
        const destinations = [
          { name: "Sydney Domestic Airport", coords: SydneyDomesticAirport },
          { name: "Sydney International Airport", coords: SydneyInternationalAirport }
        ];
        const startingPoint = this.location.center;

        destinations.forEach( dest => {
          axios.get(`${mbDirectionsURL}/driving-traffic/${ startingPoint };${ dest.coords }?geometries=geojson&access_token=${config.mapboxToken}`)
          .then(resp => {
            if( resp.data.routes && resp.data.routes.length > 0 ){
              this.travelTimesAndDistances.push({
                name: dest.name,
                distance: resp.data.routes[0].distance,
                duration: resp.data.routes[0].duration
              })
            }
          })
        })
      }
    }
  },

  watch: {
    // Will watch and run the function whenever 'location' prop changes
    location: function(){
      this.travelTimesAndDistances = [];
      this.getTravelTimes();
    }
  }
};
</script>
<style scoped>

.tile {
  border-top-color: #d442f4 !important;
}

</style>
