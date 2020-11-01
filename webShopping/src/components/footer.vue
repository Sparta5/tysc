<template>
  <div class="footer">
    <mt-tabbar class="item" v-model="tabbar" fixed>
      <mt-tab-item id="index">
        首页
        <i class="iconfont icon-shouye" slot="icon"></i>
      </mt-tab-item>
      <mt-tab-item id="cart">
        购物车
        <i class="iconfont icon-gwc" slot="icon"></i>
      </mt-tab-item>
      <mt-tab-item id="me">
        我的
        <i class="iconfont icon-wode" slot="icon"></i>
      </mt-tab-item>
      <mt-tab-item id="active">
        活动
        <i class="iconfont icon-huodong" slot="icon"></i>
      </mt-tab-item>
    </mt-tabbar>
  </div>
</template>
<script>
export default {
  compotents:{},
  data(){
    return{
      tabbar:'index'
    }
    
  },
  switch:{
    //监听底部跳转 可以带有两个参数,参数1代表新值,参数2代表旧值
    tabbar(value){
      if(value == 'index'){
        this.$router.push('/').catch(e=>{});
      }
      if(value == 'cart'){
        
      }
    }
  }
}
</script>
<style lang="scss">
.footer{
  position: relative;
    z-index: 200; 
  .item{
    background-color: #4d9f39;
     
  }
  a{&:active{color: yellow;}}
  color: white;
  .iconfont{
    font-size: 25px;
    &:active{color: yellow;}
  }
  //调整点击样式
  .mint-tabbar>.mint-tab-item.is-selected {
    background-color: #3b7e2a;
    color: white;
  }
}
</style>