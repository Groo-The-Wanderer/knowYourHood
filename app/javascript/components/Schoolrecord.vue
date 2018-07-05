<template>
  <div class="schools__record">
    <p>
      <!-- <template v-if="school.school_profile && school.school_profile.website"> -->
      <template v-if="school.school_profile && school.school_profile.website">
        <a class="schools__link" :href="school.school_profile.website" target="_blank">{{ school.name }}</a>
      </template>
      <template v-else>
        {{ school.name }}
      </template>

      <span class="schools__distance_away">
        ({{ distanceString(school.distance) }} away)
      </span>
      <span class="schools__type">{{ school.sector }} {{ school.school_type }}</span>
    </p>
    <p>
      <span v-if="school.school_profile">
        {{ deriveYearRangeSex() }}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enrolments: {{ deriveEnrolments() }}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teaching Staff: {{ deriveTeachingStaff() }}
      </span>
    </p>
  </div>
</template>

<script>
import { formatNumber, distanceAway } from '../utilities/utilities';

export default {
  props: ['school'],

  methods: {
    distanceString( distance ){
      return distanceAway( distance );
    },

    deriveYearRangeSex(){
      let profile = null;
      let outputString = '';

      if( !this.school.school_profile ){
        return;
      }

      profile = this.school.school_profile;

      if( profile.year_range ){
        outputString = `${ profile.year_range } `;
      }

      if( profile.boys_enrolments > 0 && profile.girls_enrolments > 0 ){
        outputString += 'Co-ed';
      } else if ( profile.boys_enrolments === 0 ){
        outputString += 'Girls Only';
      } else if ( profile.girls_enrolments === 0 ){
        outputString += 'Boys Only';
      }

      return outputString;
    },

    deriveTeachingStaff(){
      let profile = null;
      let outputString = '';

      if( !this.school.school_profile ){
        return;
      }

      profile = this.school.school_profile;

      if( profile.teaching_staff ){
        outputString = profile.teaching_staff;
      }

      if( profile.total_enrolments ){
        outputString += ` (${ (profile.total_enrolments / profile.teaching_staff).toFixed(1) } : 1 ratio)`;
      }

      return outputString;
    },

    deriveEnrolments(){
      let profile = null;
      let outputString = '';

      if( !this.school.school_profile ){
        return;
      }

      profile = this.school.school_profile;
      
      if( profile.total_enrolments ){
        outputString = profile.total_enrolments;
      }

      if( profile.boys_enrolments && profile.boys_enrolments > 0 && profile.girls_enrolments && profile.girls_enrolments > 0 ){
        outputString += ` (${ profile.boys_enrolments } boys/${ profile.girls_enrolments } girls)`;
      }

      return outputString;
    },
  }
};
</script>