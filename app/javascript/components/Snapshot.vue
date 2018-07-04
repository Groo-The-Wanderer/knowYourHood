<template>
  <tile :position="position" modifiers="overflow" :title="this.title">
    <section class="snapshot">
      <div class="tile--header">{{ this.title }}</div>
      <table class="snapshot__table" v-if="snapshot">
        <tr>
          <td>Median Age of Residents</td>
          <td>{{ snapshot.median_age }}</td>
        </tr>
        <tr>
          <td>Individual Income per Week</td>
          <td>${{ formatted(snapshot.median_individual_income) }}</td>
        </tr>
        <tr>
          <td>Household Income per Week</td>
          <td>${{ formatted(snapshot.median_monthly_mortgage_payments) }}</td>
        </tr>
        <tr>
          <td>Monthly Mortgage Repayments</td>
          <td>${{ formatted(snapshot.median_household_income) }}</td>
        </tr>
        <tr>
          <td>Weekly Rent</td>
          <td>${{ formatted(snapshot.median_weekly_rental_payments) }}</td>
        </tr>
        <tr>
          <td>Average Household Size</td>
          <td>{{ snapshot.avg_household_size }}</td>
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

  props: ['position', 'title', 'snapshot'],

  methods: {
    formatted( inputNumber ){
      return formatNumber( inputNumber );
    }
  }

};
</script>
<style scoped>

.tile {
  border-top-color: #3c8dbc !important;
}

</style>
