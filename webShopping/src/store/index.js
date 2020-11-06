import Vue from 'vue'
import Vuex from 'vuex'
import VuexPersist from 'vuex-persist'

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
  getters: {//计算
    getCounts(state){//记录购物车数量
      return state.prouducts.length;
    },
    total(state) {
      let sum = 0;
      state.prouducts.forEach(item => {
        //如果复选框选择 计算总价
        if (item.ckd == true){
          sum += item.payload.price * item.num
        }
      })
      return sum
    }
  },
  mutations: {
    //登陆检测
    logined(state,payload){
      state.isLogined = 1;
      state.uname = payload.uname;
      localStorage.setItem( 'uname',payload.uname)
    },
    logout(state){//退出登录
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
          payload,//添加购物车商品数据
          ckd:false//添加复选框初始化状态
        });
      }
    },
    //减
    // outProduct(state,payload){
    //   let len = state.prouducts.length;
    //   for(var i=0;i<len;i++){
    //     if(state.prouducts[i].did == payload.did){
    //       state.prouducts[i].count--;
    //       if(state.prouducts[i].count == 0){
    //         state.prouducts.splice(i,1);
    //         break;
    //       }
    //     }
    //   }
    // },

    //移除
    // delProduct(state,payload){
    //   let len=state.prouducts.length;
    //   for(var i=0;i<len;i++){
    //     if(state.prouducts[i].did==payload.did){
    //       state.prouducts.splice(i,1)
    //       break;
    //     }
    //   }
    // },
    // 删除商品
    delProuduct(state,index){
      state.prouducts.num = index;
    },
    //改变数量-----加减综合法!!!
    changeNum(state,index) {
      state.prouducts.num = index;
    },
    // 全选全不选
    ckd(state,newAll) {
      state.prouducts.forEach(item => {
        item.ckd = newAll
      })
    },
    //初始化购物车，用户一登录直接进入购物车
    initCar(state,car){
      state.prouducts = car
    },
  },
  actions: {},
  modules: {},
  //Vuex存储插件
  plugins: [
    new VuexPersist({
      storage: window.localStorage,
    }).plugin,
  ]
})
