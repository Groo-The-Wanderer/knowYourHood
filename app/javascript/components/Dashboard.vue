<template>
  <div class="dashboard" :style="gridTemplate">
    <Map position="a1:b2" @mapLocationSet="updateLocation"></Map>
    <Postcode position="c1" :location="location" title="Postcode"></Postcode>
    <Snapshot position="d1:e1" title="Suburb Snapshot" :snapshot="snapshot"></Snapshot>
    <!-- <Test position="d2" testTitle="stonkin D"></Test>
    <Test position="a3" testTitle="hiya!"></Test>
    <Test position="e1" testTitle="New Panel!"></Test>

    <Test position="b3:c3" testTitle="bottom line"></Test>
    <Test position="d3" testTitle="shoved in the corner"></Test> -->
  </div>
</template>

<script>
import Test from './Test';
import Map from './Map';
import Postcode from './Postcode';
import Snapshot from './Snapshot';
import axios from 'axios';

const config = require('../config/app.config.js').default;

export default {
  components: {
      Map,
      Postcode,
      Snapshot,
      Test,
  },

  data(){
    return {
      location: null,
      snapshot: null,
      family: null,
      dwelling: null,
      homeownership: null,
      suburb_data: null
    }
  },

  props: ['rows', 'columns'],

  computed: {
    gridTemplate() {
      return `grid-template: repeat(${this.rows}, 1fr) / repeat(${this.columns}, 1fr);`;
    }
  },

  methods: {
    updateLocation( location ){
      // update location in state
      this.location = location;

      // Retrieve 
      this.getSuburbData( location.hood );
    },

    getSuburbData( suburb ){
      const suburbSearchURL = `${ config.localDataURL }/suburb/search?suburb=${ suburb }`;
      axios.get(suburbSearchURL)
      .then(resp => {
        this.suburb_data = resp.data[0];
        this.snapshot = resp.data[0].snapshot;
        this.family = resp.data[0].family;
        this.dwelling = resp.data[0].dwelling;
        this.homeownership = resp.data[0].homeownership;
      })
    },
  } // methods
};
</script>