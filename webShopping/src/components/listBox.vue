<template>
<div>
  <div class="listbox">
    <div class="pop">
      <ul v-if="isShow">
        <li>
          <router-link to="/">
            <i></i>
            <span>首页</span>
          </router-link>
        </li>
        <!-- --------- -->
        <li v-for="(listboxs,i) of listbox" :key="i">
          <router-link to="/">
            <i :style="{background:'url('+require('../assets/'+listboxs.img)+')  no-repeat center'
              ,backgroundSize: '63%'}"></i>
            <span>11</span>
          </router-link>
        </li>
        <!-- --------- -->
        <li>
          <router-link to="/">
            <i></i>
            <span>添洋介绍</span>
          </router-link>
        </li>
      </ul>
      <!-- ----点击显示的----- -->
      <!-- <ul v-else>
        <li>
          <router-link to="/">
            <span>哈哈</span>
            <span>哈哈</span>
          </router-link>
        </li>
        <span @click="userClick">X</span>
      </ul> -->
    </div>
  </div>  
</div>
</template>
<script>
export default {
  data(){
    return {
      listbox:[
        // {img:"../assets/images/index/listBox/bg1.jpg",classify:"蔬菜类",family:"1"},
        {img:"images/index/listBox/bg1.jpg",classify:"蔬菜类",family:"1"},
        {img:"images/index/listBox/bg2.jpg",classify:"水果类",family:"2"},
        {img:"images/index/listBox/bg3.jpg",classify:"鱼肉类",family:"3"},
        {img:"images/index/listBox/bg4.jpg",classify:"干果类",family:"4"},
        {img:"images/index/listBox/bg5.jpg",classify:"干货类",family:"5"},
        {img:"images/index/listBox/bg6.jpg",classify:"粮油副食",family:"6"},
        {img:"images/index/listBox/bg7.jpg",classify:"食品",family:"7"},
        {img:"images/index/listBox/bg8.jpg",classify:"酒水类",family:"8"},
        {img:"images/index/listBox/bg9.jpg",classify:"非食",family:"9"},
        {img:"images/index/listBox/bg10.jpg",classify:"精品礼盒",family:"10"}
      ], 
        
      isShow:true
    }
  },
  methods:{
    userClick(){
      if(this.isShow){
        this.isShow = false
      }else{
        this.isShow = true
      }
    }
  }
}
</script>
<style lang="scss">
.listbox{
  // position:fixed;
  position: absolute;
  z-index: 5;
  top: 0px;left:0px;
  overflow: hidden auto;
  .pop{
    display: block;
    width: 9.75rem;min-height: 90.5rem;
    background-color: #6aa84f;
    ul{
      >li{
        width:100%;height:6.4375rem;
        font-size: 1rem;
        border-bottom: 0.0625rem solid rgba($color: #000000, $alpha: 0.15);
        padding: 0.75rem 0rem;
        a{
          i{
            display: block;
            width: 4.1rem;height: 4.1rem;
            border-radius: 50%;
            border: 0.0625rem solid white;
            margin: 0rem auto;
          }
          span{
            display: block;
            width: 100%;
            height: 1.375rem;line-height: 1.375rem;
            text-align: center;
            padding-top: 0.375rem;
            color: #000;
          }          
        }
      }
      >li:first-child{
        i{background: url("../assets/images/index/listBox/home.jpg") no-repeat center;}
      }
      >li:last-child{
        i{
          background: url("../assets/images/index/listBox/tyjt.jpg") no-repeat center;
          background-size: 63%;
        }
      }
    }
  }
}
</style>