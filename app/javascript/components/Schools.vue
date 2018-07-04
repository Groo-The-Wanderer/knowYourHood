<template>
  <tile :position="position" modifiers="overflow" :title="this.title">
    <section class="schools">
      <div class="tile--header">{{ this.title }}</div>
      <!-- <table class="dwellings__table" v-if="dwellings">
        <tr>
          <td># of Dwellings</td>
          <td>{{ formatted(dwellings.tot_dwellings) }}</td>
        </tr>
        <tr class="dwellings__sub_row">
          <td><li>Houses</li></td>
          <td>{{ formatted(dwellings.num_houses + dwellings.num_others) }}</td>
        </tr>
        <tr class="dwellings__sub_row">
          <td><li>Townhouses</li></td>
          <td>{{ formatted(dwellings.num_townhouses) }}</td>
        </tr>
        <tr class="dwellings__sub_row">
          <td><li>Flats/Apartments</li></td>
          <td>{{ formatted(dwellings.num_flats) }}</td>
        </tr>
      </table> -->
    </section>
  </tile>
</template>

<script>
import Tile from './common/Tile';
import { formatNumber, createGeoJSON } from '../utilities/utilities';
import axios from 'axios';

const config = require('../config/app.config.js').default;

export default {
  components: {
      Tile,
  },

  props: ['position', 'title', 'lat', 'lng'],

  methods: {
    formatted( inputNumber ){
      return formatNumber( inputNumber );
    },

    getSchools(){
      if( )
      const searchSchoolsURL = `${ config.localDataURL }/schools/near?sw_lat=${ this.mapBounds._sw.lat  }&sw_lng=${ this.mapBounds._sw.lng }&ne_lat=${ this.mapBounds._ne.lat }&ne_lng=${  this.mapBounds._ne.lng }`;
      axios.get(searchSchoolsURL)
      .then(resp => {
        console.log('resp from schools query: ', resp);
        // this.area = resp.data[0].area;
        // this.suburb_data = resp.data[0];
        // this.snapshot = resp.data[0].snapshot;
        // this.families = resp.data[0].family;
        // this.dwellings = resp.data[0].dwelling;
        // this.homeownership = resp.data[0].homeownership;
      });
      }
    },
  },

  watch: {
    mapBounds: function( o, n ) {
      console.log('inside the mapBounds watcher function');
      this.getSchools();
    }
  }
};
</script>
<style scoped>

.tile {
  border-top-color: #c2db51 !important;
}

</style>
