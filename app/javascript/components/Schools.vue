<template>
  <tile :position="position" modifiers="overflow" :title="this.title">
    <section class="schools">
      <div class="tile--header">{{ this.title }}</div>
      <div class="schools__content">
        <div class="schools__type_content">
          <div v-if="show_primary">
            <p class="schools__type_content_subheader schools__type_primary">Primary Schools</p>
            <div class="schools__desc" v-for="school in primarySchools" :key="school.school_id">
              <p>{{ school.name }}</p>
            </div>
          </div>
          <div v-if="show_secondary">
            <p class="schools__type_content_subheader schools__type_secondary">Secondary Schools</p>
            <div class="schools__desc" v-for="school in secondarySchools" :key="school.school_id">
              <p>{{ school.name }}</p>
            </div>
          </div>
          <div v-if="show_combined">
            <p class="schools__type_content_subheader schools__type_combined">Combined Schools</p>
            <div class="schools__desc" v-for="school in combinedSchools" :key="school.school_id">
              <p>{{ school.name }}</p>
            </div>
          </div>
          <div v-if="show_special">
            <p class="schools__type_content_subheader schools__type_special">Special Schools</p>
            <div class="schools__desc" v-for="school in specialSchools" :key="school.school_id">
              <p>{{ school.name }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>
  </tile>
</template>

<script>
import Tile from './common/Tile';
import { formatNumber, createGeoJSON } from '../utilities/utilities';
import axios from 'axios';
import Mapbox from 'mapbox-gl';

const config = require('../config/app.config.js').default;

export default {
  components: {
      Tile,
  },

  props: ['position', 'title', 'location'],

  data() {
    return { 
      primarySchools: [],
      secondarySchools: [],
      combinedSchools: [],
      specialSchools: [],
      show_primary: true,
      show_secondary: true,
      show_combined: true,
      show_special: true
    }
  },

  methods: {
    formatted( inputNumber ){
      return formatNumber( inputNumber );
    },

    getSchools(){
      if( this.location ){
        const schoolsNearbyURL = `${ config.localDataURL }/schools/near?lat=${ this.location.lat }&lng=${ this.location.lng }&proximity=2`;
        axios.get(schoolsNearbyURL)
        .then(resp => {
          resp.data.forEach( school => {
            switch( school.school_type ){
              case 'Primary':
                this.primarySchools.push(school);
                 break;
              case 'Secondary':
                this.secondarySchools.push(school);
                break;
              case 'Combined':
                this.combinedSchools.push(school);
                break;
              case 'Special':
                this.specialSchools.push(school);
                break;
              default:
                break;
            }
          })
        })
        .then( () => {
          this.$emit('schoolsListSet', [this.primarySchools, this.secondarySchools, this.combinedSchools, this.specialSchools]);
        })
      }
    }, // end getSchools()
  },

  watch: {
    // Will watch and run the function whenever 'location' prop changes
    location: function(){
      this.primarySchools = []
      this.secondarySchools = []
      this.combinedSchools = []
      this.specialSchools = []
      this.show_primary = true
      this.show_secondary = true
      this.show_combined = true
      this.show_special = true

      this.getSchools();
    }
  }
};
</script>
<style scoped>

.tile {
  border-top-color: #c2db51 !important;
}

</style>
