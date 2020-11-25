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
  middleware({store,router,redirect,params,query}){//页面内部
     //context 服务器上下文
    //局部前置业务
    //store 状态数信息
    //route 一条目标路由信息
    // redirect 强制跳转
    //params,query 校验参数合理性
    // console.log('middleware nuxt.config outside 全局守卫前置业务 ')
    // redirect('/reg')
    // console.log('middleware layouts')
    // console.log(context)
  },
  components:{AppHeader}
}
</script>scrip
<style>

</style>
