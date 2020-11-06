import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    //表示用户是否已经登录
    isLogined:localStorage.getItem('isLogined') ? localStorage.getItem('isLogined') : 0,
    uname:localStorage.getItem('uname') ? localStorage.getItem('uname') : '',
    //购物车
    prouducts: [
      {
        did: '1',
        art_no:"新土豆",
        title: '土豆',
        price:6555.00,
        top_img:'',
        prosize: "个",
        count:0
      }
    ]
  },
  getters: {
    getCounts(state){//记录购物车数量
      return state.prouducts.length;
    }
  },
  mutations: {
    //登陆检测
    logined(state,payload){
      state.isLogined = 1;
      state.uname = payload.uname;
      localStorage.setItem( 'uname',payload.uname)
    },
    logout(state){
      state.isLogined = 0 ;
      state.uname = '';
      localStorage.removeItem('isLogined');
    },
    //http://www.111com.net/jsp/189153.htm
    //加
    addProduct(state,payload){
      let index = state.prouducts.findIndex(item=>{
        return item.did == payload.did
      })       
      if(index != -1){
        state.prouducts[index].count++
      }else{
        state.prouducts.push({
          num: 1,
          item,//添加购物车商品数据
        });
        ckd:false//添加复选框初始化状态
      }
    },
    //减
    outProduct(state,payload){
      let len = state.prouducts.length;
      for(var i=0;i<len;i++){
        if(state.prouducts[i].did == payload.did){
          state.prouducts[i].count--;
          if(state.prouducts[i].count == 0){
            state.prouducts.splice(i,1);
            break;
          }
        }
      }
    },
    //移除
    delProduct(state,payload){
      let len=state.prouducts.length;
      for(var i=0;i<len;i++){
        if(state.prouducts[i].did==payload.did){
          state.prouducts.splice(i,1)
          break;
        }
      }
    },
    //初始化购物车，用户一登录直接进入购物车
    initCar(state,car){
      state.prouducts = car
    },
  },
  actions: {
    //加
    addProduct(obj){
      axios.get('')
    }
  },
  modules: {
  }
})
