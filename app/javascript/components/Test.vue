<template>
  <tile :position="position" modifiers="overflow">
    <section>
      <h1>This is Test</h1>
        <p>I'm the testTitle prop [{{ testTitle }}]</p>
        <h1>I'm the testTitle prop [{{ location }}]</h1>
    </section>
  </tile>
</template>

<script>
import Tile from './common/Tile';
// import saveState from 'vue-save-state';

export default {
  components: {
      Tile,
  },

  // mixins: [echo, saveState],

  props: ['testTitle', 'position', 'location']

};
</script>