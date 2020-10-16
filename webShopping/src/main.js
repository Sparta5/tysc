import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import qs from 'qs'
//导入Mint UI
import MintUI from 'mint-ui';
import 'mint-ui/lib/style.min.css';
Vue.use(MintUI);
//配置服务器的默认地址
axios.defaults.baseURL = 'http://127.0.0.1:3000'

Vue.prototype.qs = qs;

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
