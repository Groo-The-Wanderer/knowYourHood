<template>
  <tile :position="position" modifiers="overflow">
    <section>
      <h1>Postcode</h1>
        <p v-if="location">{{ location.postcode }}</p>
        <p v-if="location">{{ location.hood }}, {{ location.city }}, {{ location.state }}</p>
    </section>
  </tile>
</template>

<script>
import Tile from './common/Tile';

export default {
  components: {
      Tile,
  },

  props: ['position', 'location']

};
</script>