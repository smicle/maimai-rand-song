import Vue from 'vue'
import App from './App.vue'
import router from './router'
import 'vuetify/dist/vuetify.min.css'
import 'material-design-icons-iconfont/dist/material-design-icons.css'
import '@mdi/font/css/materialdesignicons.css'
import vuetify from '@/plugins/vuetify'

Vue.config.productionTip = false

new Vue({
  router,
  vuetify,
  render: h => h(App),
}).$mount('#app')
