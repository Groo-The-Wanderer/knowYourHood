<template>
  <tile :position="position" modifiers="overflow" :title="this.title">
    <section class="families">
      <div class="tile--header">{{ this.title }}</div>
      <table class="families__table" v-if="families">
        <tr>
          <td class="families__table_totrow"># of Families</td>
          <td>{{ formatted(families.tot_families) }}</td>
        </tr>
        <tr class="families__sub_row">
          <td><li>with kids under 15</li></td>
          <td>{{ formatted(families.kids_u15) }}</td>
        </tr>
        <tr class="families__sub_row">
          <td><li>with kids over 15</li></td>
          <td>{{ formatted(families.kids_over15) }}</td>
        </tr>
        <tr class="families__sub_row">
          <td><li>no kids</li></td>
          <td>{{ formatted(families.no_kids) }}</td>
        </tr>
        <tr class="families__sub_row_header">
          <td><li class="families__nobullet">Single Parent Families</li></td>
          <td>{{ formatted(families.tot_single_parent_families) }}</td>
        </tr>
        <tr class="families__sub_row">
          <td><li>with kids under 15</li></td>
          <td>{{ formatted(families.single_parent_kids_u15) }}</td>
        </tr>
        <tr class="families__sub_row">
          <td><li>with kids over 15</li></td>
          <td>{{ formatted(families.single_parent_kids_over15) }}</td>
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

  props: ['position', 'title', 'families'],

  methods: {
    formatted( inputNumber ){
      return formatNumber( inputNumber );
    }
  }

};
</script>
<style scoped>

.tile {
  border-top-color: #dd4b39 !important;
}

</style>
