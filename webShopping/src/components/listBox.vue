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
        <li>
          <router-link to="/">
            <i></i>
            <span>11</span>
          </router-link>
        </li>
        <!-- --------- -->
        <li>
          <router-link to="/">
            <i></i>
            <span>11</span>
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
      // listbox:[
      //   {}
      // ]  
        
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
  position: absolute;
  z-index: 5;
  top: 0px;left:0px;
  .pop{
    display: block;
    width: 8.75rem;min-height: 90.5rem;
    background-color: #6aa84f;
    ul{
      
      >li{
        width: 8.75rem;height:5.4375rem;
        font-size: 0.85rem;
        border-bottom: 0.0625rem solid rgba($color: #000000, $alpha: 0.15);
        padding: 0.75rem 0rem;
        a{
          i{
            display: block;
            width: 3.6rem;height: 3.6rem;
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