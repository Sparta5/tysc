<template>
  <div class="home">
     <mt-header class="header" title="">
       <div slot="left" class="shortcut" v-if="true">
         <span>你好，请</span> 
         <router-link to="/login">登录</router-link> |
         <router-link to="/register">注册</router-link>
       </div>
       <div slot="left" class="shortcut" v-else>
         <span>你好,<span>斌斌</span></span>
         <router-link to="/">注销</router-link>
       </div>
       <span class="menu" slot="right"></span>
     </mt-header>
     <!-- 商标、小购物车、搜索跳转 -->
     <div class="min_cart">
       <div><img src="../assets/images/logo_5npf.png" slot="icon"></div>
       <div class="cart_right">
         <span class="cart_icon"></span>
         <span>购物车</span>
         <span> <b>6</b></span>
         <span>物品</span>
         <div class="search">
           <router-link to="/"></router-link>
         </div>
       </div>
     </div>
     <!-- 轮播图区域   -->
    <div class="swipe">
      <mt-swipe 
          :showIndicators="true"
          :auto="3000"
          :speed="500"
          :continuous="true">
          <mt-swipe-item><img src="../assets/images/caruser/1woc.jpg"></mt-swipe-item>
          <mt-swipe-item><img src="../assets/images/caruser/2woc.jpg"></mt-swipe-item>
          <mt-swipe-item><img src="../assets/images/caruser/3woc.jpg"></mt-swipe-item>
          <mt-swipe-item><img src="../assets/images/caruser/4woc.jpg"></mt-swipe-item>
      </mt-swipe>
    </div>
    <!-- 分类 -->
    <div class="sort_list">
      <ul>
        <li v-for="(k,i) of 4" :key="i">
          <div class="list_img">
            <img src="../assets/images/list/001.jpg">
            <p>蔬菜</p>
          </div>
        </li>
      </ul>
      <ul>
        <li v-for="(k,i) of 4" :key="i">
          <div class="list_img">
            <img src="../assets/images/list/001.jpg">
            <p>蔬菜</p>
          </div>
        </li>
      </ul>
      <ul>
        <li v-for="(k,i) of 4" :key="i">
          <div class="list_img">
            <img src="../assets/images/list/001.jpg">
            <p>蔬菜</p>
          </div>
        </li>
      </ul>
    </div>
    <!-- 内容 -->
    <div class="floor">
      <div><router-link to="/"><img src="../assets/images/index/main/01bxsj.jpg"></router-link></div>
      <div>
        <router-link to="/"><img src="../assets/images/index/main/01_log.png">优选蔬菜</router-link>
        <span></span>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from '@/components/HelloWorld.vue'

export default {
  components: {
    HelloWorld
  }
}
</script>
<style lang="scss">
.home{
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
    a:nth-child(2){color: chocolate;}
    .menu{
      display: inline-block;
      width: 40px;height: 40px;
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
  //轮播图-----
  .swipe{
    height: 200px;
    img{width:100%;}
  }
  //分类
  .sort_list{
    // display: flex;
    // flex-direction: column;
    ul{
        padding-top: 10px;height: 80px;
      
      li{
        width: 25%;height: 80px;
        align-self: center;
        float: left;
        text-align: center;
        .list_img{
          display: block;
          img{height: 60px;height: 60px;}
          p{
            font-size: 12px;height: 20px;line-height: 20px;
          }
        }
        
      }
    }
  }
  //内容
  .floor{

    div:first-child{
      img{width: 100%;line-height: 100px;}
    }
  }
}
</style>
