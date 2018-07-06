import Vue from 'vue/dist/vue.esm';
import Dashboard from '../components/Dashboard';
import '../styles/styles.css';


new Vue({
  el: '#dashboard',

  components: { 
    Dashboard
  },

  template: '<Dashboard rows="3" columns="5" />'
})