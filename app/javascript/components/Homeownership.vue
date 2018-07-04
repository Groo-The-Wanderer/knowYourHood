<template>
  <tile :position="position" modifiers="overflow" :title="this.title">
    <section class="homeownership">
      <div class="tile--header">{{ this.title }}</div>
      <table class="homeownership__table" v-if="homeownership">
        <tr>
          <td># of Homes</td>
          <td>{{ formatted(homeownership.total_dwellings) }}</td>
        </tr>
        <tr class="homeownership__sub_row">
          <td><li>Owned Outright</li></td>
          <td>{{ formatted(homeownership.outright_total) }}</td>
        </tr>
        <tr class="homeownership__sub_row">
          <td><li>Paying a Mortgage</li></td>
          <td>{{ formatted(homeownership.mortgage_total) }}</td>
        </tr>
        <tr class="homeownership__sub_row">
          <td><li>Renting</li></td>
          <td>{{ formatted(homeownership.rented_total) }}</td>
        </tr>
        <tr class="homeownership__sub_row">
          <td><li>Other</li></td>
          <td>{{ formatted(homeownership.others_total) }}</td>
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

  props: ['position', 'title', 'homeownership'],

  methods: {
    formatted( inputNumber ){
      return formatNumber( inputNumber );
    }
  }

};
</script>
<style scoped>

.tile {
  border-top-color: #00c0ef !important;
}

</style>
