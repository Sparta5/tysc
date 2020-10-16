<template>
  <div class="home">
     <mt-header title="">
       <div slot="left" class="shortcut" v-if="true">
         <span>你好，请</span>
         <router-link to="/login">登录</router-link>
         <router-link to="/register">注册</router-link>
       </div>
       <div slot="left" class="shortcut" v-else>
         <span>你好,<span>斌斌</span></span>
         <router-link to="/">注销</router-link>
       </div>
       
     </mt-header>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from '@/components/HelloWorld.vue'

export default {
  components: {
    HelloWorld
  }
}
</script>
