<template>
  <div>

    <!-- 跳转 声明式跳转 router-link    一级路由-->
    <app-header></app-header>
    <!-- 展示区  ~~ router-view -->
    <Nuxt />
  </div>
</template>
<script>
import AppHeader from './app-header'
export default {
  // middleware:'auth',//页面层级中间件定义
  // middleware(context){//页面内部
    // console.log('middleware layouts')
    // console.log(context)
  // }
  components:{AppHeader}
}
</script>scrip
<style>

</style>
