<template>
<!-- 测试专用 -->
  <div class="about">
    <my-search></my-search>
    <h1>This is an about page</h1>
    <my-carouseList></my-carouseList>
  </div>
</template>
<script>
<<<<<<< HEAD
import mySearch from '../components/myItem/mySearch'
export default {
  components:{
    mySearch
  }
}
</script>
<style lang="scss">
body{max-width: 650px;margin: 0px auto;}
.about{
  height: 300px;margin: 0px auto;
  // border: 1px solid red;
  h1{
    width: 95%;height: 2.25rem; border: 1px solid rgb(160, 137, 5);
    margin-top: 6px;  
  }
}
</style>
=======
import myCarouseList from '../components/Home/carouseList';
export default {
  components: {
    myCarouseList
  }
}
</script>
>>>>>>> f67bd64a6790809c5180425d84723bcf6fe07266
