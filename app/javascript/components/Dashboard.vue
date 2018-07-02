<template>
  <div class="dashboard" :style="gridTemplate">
    <Map position="a1:b2" testTitle="hello"></Map>
    <Test position="c1:d1" testTitle="hello"></Test>
    <!-- <Test position="a2" testTitle="world"></Test>
    <Test position="b2" testTitle="stonkin A"></Test> -->
    <Test position="c2" testTitle="stonkin B"></Test>
    <Test position="d2" testTitle="stonkin C"></Test>
    <Test position="d2" testTitle="stonkin D"></Test>
    <Test position="a3" testTitle="hiya!"></Test>
    <Test position="e1" testTitle="New Panel!"></Test>

    <Test position="b3:c3" testTitle="bottom line"></Test>
    <Test position="d3" testTitle="shoved in the corner"></Test>
  </div>
</template>

<script>
import Test from './Test';
import Map from './Map';

export default {
  components: {
      Map,
      Test,
  },

  props: ['rows', 'columns'],

  computed: {
    gridTemplate() {
      return `grid-template: repeat(${this.rows}, 1fr) / repeat(${this.columns}, 1fr);`;
    }
  }
};
</script>