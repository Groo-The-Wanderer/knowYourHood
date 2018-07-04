<template>
  <tile :position="position" modifiers="overflow" :title="this.title">
    <section class="dwellings">
      <div class="tile--header">{{ this.title }}</div>
      <table class="dwellings__table" v-if="dwellings">
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
      </table>
    </section>
  </tile>
</template>

<script>
import Tile from './common/Tile';
import { formatNumber } from '../utilities/utilities';

export default {
  components: {
      Tile,
  },

  props: ['position', 'title', 'dwellings'],

  methods: {
    formatted( inputNumber ){
      return formatNumber( inputNumber );
    }
  }

};
</script>
<style scoped>

.tile {
  border-top-color: #f39c12 !important;
}

</style>
