import store from '@/store'
import { library } from '@fortawesome/fontawesome-svg-core'
import { fab } from '@fortawesome/free-brands-svg-icons'
import { far } from '@fortawesome/free-regular-svg-icons'
import { fas } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.bundle.min.js'
import 'bootstrap/dist/js/bootstrap.min.js'
import { createApp } from 'vue'
//import { VueReCaptcha } from 'vue-recaptcha-v3'
//import VueRecaptcha from 'vue3-recaptcha-v2'
import App from './App.vue'
import './assets/sass/style.scss'
import './registerServiceWorker'
import router from './router'

require('@/store/subscriber')
const credential = {
  token: localStorage.getItem('user')
}
store.dispatch('auth/attempt', credential)

library.add(fas)
library.add(fab)
library.add(far)

createApp(App)
  .component('font-awesome-icon', FontAwesomeIcon)
  .use(store)
  .use(router)
  //.use(VueReCaptcha, { siteKey: '6LeDHRkiAAAAAOM6XiE97Q-8k8x4gEYIYmB32ku5' })
  /*.use(VueRecaptcha, {
    siteKey: '6LcFohwiAAAAAD_858pw4mA57DFHFWhDaShGVxbp',
    alterDomain: false, // default: false
  })*/
  .mount('#app')


