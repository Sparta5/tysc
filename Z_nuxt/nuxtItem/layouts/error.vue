<template>
  <div>
    <h1 v-if="error.statusCode">{{error.message}}</h1>
    <h1 v-else>页面发送异常</h1>
    <button @click="$router.replace('/index') ">跳转到首页</button>
    <h1 @click="dev($router)">123</h1>
  </div>
</template>
<script>
export default {
  //接受错误信息 error：{status Code，message}
  props:['error'],
  methods:{
    dev(router){
      console.log(router)
    }
  },
  beforeCreate(){
    // console.log($router)
  },
  mounted(){
    // console.log($router)
  }
  
}
</script>