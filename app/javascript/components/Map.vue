<template>
  <tile :position="position" modifiers="transparent">
    <h1>I'm the Map Tile</h1>
    <div id='map'></div>
  </tile>
</template>

<script>
import Tile from './common/Tile';
import { addClassModifiers } from '../utilities/utilities';
import mapboxgl from 'mapbox-gl';

// import saveState from 'vue-save-state';
export default {
  components: {
      Tile,
  },
  // mixins: [echo, saveState],
  props: ['position'],
  data() {
      return {
          artist: '',
          trackName: '',
          artwork: '',
          userName: '',
      };
  },

  methods: {
    createMap() {
      const map = new mapboxgl.Map({
          container: this.mapContainer,
          style: 'mapbox://styles/mapbox/streets-v10',
          center: [longitude, latitude],
          zoom
        });

    },

    addClassModifiers,
    getEventHandlers() {
        return {
            'Music.NothingPlaying': () => {
                this.artist = '';
            },
            'Music.TrackIsPlaying': response => {
                this.artist = response.trackInfo.artist;
                this.trackName = response.trackInfo.trackName;
                this.artwork = response.trackInfo.artwork;
                this.userName = response.userName;
            },
        };
    },
    getSaveStateConfig() {
        return {
            cacheKey: 'music',
        };
    },
  },
};
</script>