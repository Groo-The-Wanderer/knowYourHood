<template>
  <tile :position="position" modifiers="overflow" :title="this.title">
    <section class="schools">
      <div class="tile--header">{{ this.title }}
        <span class="schools__show_block">
          <span class="schools__show_label">Primary [<a class="schools__show_link" @click="toggleView('Primary')">{{ show_primary ? 'Hide' : 'Show' }}</a>]</span>
          <span class="schools__show_label">Secondary [<a class="schools__show_link" @click="toggleView('Secondary')">{{ show_secondary ? 'Hide' : 'Show' }}</a>]</span>
          <span class="schools__show_label">Combined [<a class="schools__show_link" @click="toggleView('Combined')">{{ show_combined ? 'Hide' : 'Show' }}</a>]</span>
          <span class="schools__show_label">Special [<a class="schools__show_link" @click="toggleView('Special')">{{ show_special ? 'Hide' : 'Show' }}</a>]</span>
        </span>
      </div>
      <div class="schools__content">
        <div class="schools__type_content">
          <div v-if="show_primary">
            <p class="schools__type_content_subheader schools__type_primary">Primary Schools</p>
            <div class="schools__desc" v-for="school in primarySchools" :key="school.school_id">
              <schoolrecord :school="school"></schoolrecord>
            </div>
          </div>
          <div v-if="show_secondary">
            <p class="schools__type_content_subheader schools__type_secondary">Secondary Schools</p>
            <div class="schools__desc" v-for="school in secondarySchools" :key="school.school_id">
              <schoolrecord :school="school"></schoolrecord>
            </div>
          </div>
          <div v-if="show_combined">
            <p class="schools__type_content_subheader schools__type_combined">Combined Primary and Secondary Schools</p>
            <div class="schools__desc" v-for="school in combinedSchools" :key="school.school_id">
              <schoolrecord :school="school"></schoolrecord>
            </div>
          </div>
          <div v-if="show_special">
            <p class="schools__type_content_subheader schools__type_special">Special Schools</p>
            <div class="schools__desc" v-for="school in specialSchools" :key="school.school_id">
              <schoolrecord :school="school"></schoolrecord>
            </div>
          </div>
        </div>
      </div>
    </section>
  </tile>
</template>

<script>
import Vue from 'vue';
import Tile from './common/Tile';
import Schoolrecord from './Schoolrecord';
import { formatNumber, distanceAway } from '../utilities/utilities';
import axios from 'axios';
import Mapbox from 'mapbox-gl';

const config = require('../config/app.config.js').default;

export default {
  components: {
      Tile,
      Schoolrecord,
  },

  props: ['position', 'title', 'location'],

  data() {
    return { 
      primarySchools: [],
      secondarySchools: [],
      combinedSchools: [],
      specialSchools: [],
      show_primary: false,
      show_secondary: false,
      show_combined: false,
      show_special: false
    }
  },

  methods: {
    toggleView( type ){
      switch( type ){
        case 'Primary':
          this.show_primary = !this.show_primary;
          break;
        case 'Secondary':
          this.show_secondary = !this.show_secondary;
          break;
        case 'Combined':
          this.show_combined = !this.show_combined;
          break;
        case 'Special':
          this.show_special = !this.show_special;
          break;
        default:
          break;
      }
    },

    formatted( inputNumber ){
      return formatNumber( inputNumber );
    },

    formatSchoolRecord( school ){
      return (
        `<p>${ school.name }<span class="schools__distance_away">(${ distanceAway(school.distance) } away)</span></p>`
      );
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

          if( this.primarySchools.length > 0 ){ 
            this.show_primary = true;
          }

          if( this.secondarySchools.length > 0 ){
            this.show_secondary = true;
          }

          if( this.combinedSchools.length > 0 ){
            this.show_combined = true;
          }

          if( this.specialSchools.length > 0 ){
            this.show_special = true;
          }
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
