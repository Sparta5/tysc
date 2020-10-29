<template>
  <div id="app">
    
    <!-- <my-footer></my-footer> -->
    <router-view/>
  </div>
</template>
<script>
import myFooter from './components/footer';
export default {
  components:{
    // myFooter
  }
}
</script>
<style lang="scss">
// *{
//   -webkit-text-size-adjust: none;//禁用webkit内核浏览器文字大小调整功能
// }
// #app {
//   font-family: Avenir, Helvetica, Arial, sans-serif;
//   -webkit-font-smoothing: antialiased;
//   -moz-osx-font-smoothing: grayscale;
//   text-align: center;
//   color: #2c3e50;
// }

</style>

