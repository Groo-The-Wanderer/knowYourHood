<template>
  <tile :position="position" modifiers="overflow">
    <section>
      <p>This is Test</p>
        <p>I'm the testTitle prop [{{ testTitle }}]</p>
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

  props: ['testTitle', 'position']

};
</script>