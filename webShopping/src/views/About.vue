<template>
<!-- 测试专用 -->
  <div class="about">
    <my-search></my-search>
    <my-carouse></my-carouse>
    <h1>This is an about page</h1>
    <!-- <my-carouseList></my-carouseList> -->

  </div>
</template>
<script>
import mySearch from '../components/myItem/mySearch'
import myCarouse from '../components/myItem/myCarouse'
export default {
  components:{
    mySearch,myCarouse
  },
  
}
</script>
<style lang="scss">
// body{max-width: 650px;margin: 0px auto;}
.about{
  // height: 300px;margin: 0px auto;
  // border: 1px solid red;
  h1{
    width: 95%;height: 2.25rem; border: 1px solid rgb(160, 137, 5);
    margin: 6px auto;  
  }
}
</style>