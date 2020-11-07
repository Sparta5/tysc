<template>
  <div class="myheader">
    <mt-header class="header" title="">
      <div slot="left" class="shortcut" v-if="this.$store.state.isLogined == 0">
        <span>你好，请</span> 
        <router-link to="/login">登录</router-link> |
        <router-link to="/register">注册</router-link>
      </div>
      <div slot="left" class="shortcut" v-else>
        <span>你好,<span v-text="this.$store.state.uname"></span></span>
        <router-link to="/register">会员中心</router-link> |
        <a url="javascript:;" @click="isLogin()">注销</a>
      </div>
      <!-- 点击菜单样式 -->
      <span class="menu" slot="right" @click="hidden()"></span>
    </mt-header>
    <!-- 菜单列表 -->
    <list-box v-if="isHidden"></list-box>
      <!-- 商标、小购物车、搜索跳转 -->
     <div class="min_cart">
       <div><img src="../assets/images/logo_5npf.png" slot="icon"></div>
       <div class="cart_right">
         <span class="cart_icon"></span>
         <span>购物车</span>
         <span> <b v-text="this.$store.getters.getCounts"></b></span>
         <span>物品</span>
         <div class="search">
           <router-link to="/"></router-link>
         </div>
       </div>
     </div>
  </div>
</template>
<script>
import listBox from './listBox';
export default {
  components:{listBox},
  data(){
    return{
      isHidden:false,
    }
  },
  methods:{
    // 控制菜单显示隐藏
    hidden(){
      if(!this.isHidden){
        this.isHidden=true
      }else{
        this.isHidden=false
      }
    },
    // 注销登录
    isLogin(){
      this.$store.commit('logout')
    }
  }
}
</script>
<style lang="scss">
.myheader{
   position: relative;
   font-size: 19px;
  .header{
    background-color: rgb(92, 143, 12)!important;
    height: 2.6875rem;
    padding-right: 0px;
    span{font-size: 16px;margin: 0px 4px;}
    a{
      font-size: 16px;
      color: white;
      text-decoration: none;
    }
    a:nth-child(2),a:nth-child(3){color: chocolate;}
    //点击菜单样式----------
    .menu{
      display: inline-block;
      width: 2.5rem;height: 2.5rem;
      background: url(../assets/images/f8qf.png) no-repeat center center;
    }
  }
    //商标、小购物车、搜索跳转-------
  .min_cart{
    height: 50px;line-height: 50px;
    border-bottom: 2px dashed #e6e6e6;
    padding: 0px 10px;
    vertical-align: auto;
    div:first-child{
      display: inline-block;
      img{width: 140px;height: auto;}
    }
    .cart_right{
      float:right;
      display: inline-block;
      height: 50px;
      width: 161px;
      display: flex;
      align-items: center;
      span{
        margin: 0px 2px;
        height: 30px;line-height: 30px;
        display: inline-block;
        font-size: 12px;
        color: #777;
        font-weight: normal;
        b{font-weight: 600;color: rgb(170, 9, 9);}
      }
      .cart_icon{
        width: 18px;height: 30px;
        display: inline-block;
        background: url(../assets/images/cart_bg.png) no-repeat 0 -207px;
      }
      .search{
        height: 30px;
        >a{
          display: inline-block;
          margin-left: 8px;
          width: 50px;height: 42px;
          background: url(../assets/images/a1.jpg) no-repeat;
        }
      }
    }
  }
  //--------
}
</style>