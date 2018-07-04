<template>
  <div class="dashboard" :style="gridTemplate">
    <Map position="a1:b2" @mapLocationSet="updateLocation"></Map>
    <Postcode position="c1" :location="location" :area="area" title="Postcode"></Postcode>
    <Snapshot position="d1:e1" title="Suburb Snapshot" :snapshot="snapshot"></Snapshot>
    <Dwellings position="c2" title="Dwellings" :dwellings="dwellings"></Dwellings>
    <Families position="d2" title="Family Makeup" :families="families"></Families>
    <Homeownership position="e2" title="Home Ownership" :homeownership="homeownership"></Homeownership>
  </div>
</template>

<script>
import Test from './Test';
import Map from './Map';
import Postcode from './Postcode';
import Snapshot from './Snapshot';
import Dwellings from './Dwellings';
import Families from './Families';
import Homeownership from './Homeownership';
import axios from 'axios';

const config = require('../config/app.config.js').default;

export default {
  components: {
      Map,
      Postcode,
      Snapshot,
      Dwellings,
      Families,
      Homeownership,
      Test,
  },

  data(){
    return {
      location: null,
      area: null,
      snapshot: null,
      families: null,
      dwellings: null,
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
        this.area = resp.data[0].area;
        this.suburb_data = resp.data[0];
        this.snapshot = resp.data[0].snapshot;
        this.families = resp.data[0].family;
        this.dwellings = resp.data[0].dwelling;
        this.homeownership = resp.data[0].homeownership;
      })
    },
  } // methods
};
</script>