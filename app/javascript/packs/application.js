/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex';
import axios from 'axios'
import VueAxios from 'vue-axios'

Vue.use(VueAxios, axios)
Vue.use(Vuex)
// Register components names
Vue.component('dushboard', () => import('./components/dushboard/main'));
Object.defineProperty(Vue.prototype, 'policy', { get: () => window.policy });
window.Vue = Vue;

document.addEventListener('DOMContentLoaded', () => {
  const el = document.getElementById('vue-app');

  // Check if root element exist
  if (!el) {
    return false;
  }

  return new Vue({
    el: '#vue-app'
  })
})