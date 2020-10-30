import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import qs from 'qs'

Vue.prototype.qs = qs;

//导入Mint UI
import MintUI from 'mint-ui';
import 'mint-ui/lib/style.min.css';
Vue.use(MintUI);

import Vant from 'vant';
import 'vant/lib/index.css';
Vue.use(Vant);

/*封装成全局获取屏幕的宽高*/
Vue.prototype.$getViewportSize = function(){
  return {
    width: window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth,//兼容性获取屏幕宽度度
    height: window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight//兼容性获取屏幕高度
  }
}


//配置服务器的默认地址
axios.defaults.baseURL = 'http://127.0.0.1:3000'
Vue.prototype.axios = axios;


Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
