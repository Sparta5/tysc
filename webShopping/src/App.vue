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
<script type="text/javascript">
// document.documentElement.style.fontSize = document.documentElement.clientWidth / 640*100 + 'px';

  // function initWidth() {
  //     document.getElementById("app").style.width = document.documentElement.clientWidth + 'px'
  // }
  // function initFontSize() {
  //     const cw = document.documentElement.clientWidth
  //     // width: 375px -> fontSize:16px
  //     if (cw == 375) {
  //         document.documentElement.style.fontSize = '16px'
  //     } else {
  //         document.documentElement.style.fontSize = cw / 375 * 16 + 'px'
  //     }
  // }
  // initWidth()
  // initFontSize()
  // window.onresize = () => {
  //     initWidth()
  //     initFontSize()
  // }

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

