<template>
  <tile :position="position" modifiers="overflow" :title="this.title">
    <section class="postcode">
      <div class="tile--header">{{ this.title }}</div>
      <div v-if="location">
        <p class="postcode__suburb">{{ location.hood }}</p>
        <p class="postcode__postcode">{{ location.postcode }}</p>
        <p class="postcode__town"><span v-if="location.city">{{ location.city + ',' }}</span> {{ location.state }}</p>
        <p v-if="area" class="postcode__area">{{ area }} sq km</p>
      </div>
    </section>
  </tile>
</template>

<script>
import Tile from './common/Tile';

export default {
  components: {
      Tile,
  },

  props: ['position', 'title', 'location', 'area']

};
</script>
<style scoped>

.tile {
  border-top-color: #00a65a !important;
}

</style>