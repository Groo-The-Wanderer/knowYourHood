<template>
  <div class="dashboard" :style="gridTemplate">
    <Map position="a1:b2" @mapLocationSet="updateLocation"></Map>
    <Postcode position="c1" :location="location"></Postcode>
    <!-- <Test position="c2:d2" testTitle="hello"></Test>
    <Test position="d2" testTitle="stonkin C"></Test>
    <Test position="d2" testTitle="stonkin D"></Test>
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

export default {
  components: {
      Map,
      Postcode,
      Test,
  },

  data(){
    return {
      location: null
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
      this.location = location;
    }
  }
};
</script>