import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    //表示用户是否已经登录
    isLogined:localStorage.getItem('isLogined') ? localStorage.getItem('isLogined') : 0,
    uname:localStorage.getItem('uname') ? localStorage.getItem('uname') : ''
  },
  mutations: {
    logined(state,payload){
      state.isLogined = 1;
      state.uname = payload.uname;
      localStorage.setItem( 'uname',payload.uname)
    },
    logout(state){
      state.isLogined = 0 ;
      state.uname = '';
      localStorage.removeItem('isLogined');
    }
  },
  actions: {
  },
  modules: {
  }
})
