<template>
<!-- 测试专用 -->
  <div class="about">
    <my-search></my-search>
    <my-carouse></my-carouse>
    <h1>This is an about page
    
    <div @click="isShow()">点击弹出出
      <transition name="van-slide-up">
        <div v-show="visible" class="pop">Slide Up</div>
      </transition>
    </div>
    <ul @click="userClick()">
      <li :class="isshow?'show':''">111</li>
      <li :class="isshow?'show':''">222</li>
      <li :class="isshow?'show':''">333</li>
      <li :class="isshow?'show':''">444</li>
      <li :class="isshow?'show':''">555</li>
    </ul>
    </h1>
    <my-floor></my-floor>
    <!-- <my-carouseList></my-carouseList> -->

  </div>
</template>
<script>
import mySearch from '../components/myItem/mySearch'
import myCarouse from '../components/myItem/myCarouse'
import myFloor from '../components/floor'
export default {
  components:{
    mySearch,myCarouse,myFloor
  },
  data(){
    return{
      visible:false,

    }
  },
  methods:{
    isShow(){
      if(this.visible){
        this.visible=false
      }else{
        this.visible=true
      }
      
    }
  }
}
</script>
<style lang="scss">
.pop{width: 6.25rem;height: 6.25rem;border: 1px solid red ;}
.about{
  // height: 300px;margin: 0px auto;
  // border: 1px solid red;
  h1{
    width: 95%;border: 1px solid rgb(160, 137, 5);
    margin: 6px auto;  height: 600px;
  }
}
</style>