<template>
  <div class="container">
    <h3>首页</h3>
    <!-- <div>
      <about />
      <Logo />
      <h1 class="title">
        nuxtItem{{a}}/{{b}}
      </h1>
      <div class="links">
        <a
          href="https://nuxtjs.org/"
          target="_blank"
          rel="noopener noreferrer"
          class="button--green"
        >
          Documentation
        </a>
        <a
          href="https://github.com/nuxt/nuxt.js"
          target="_blank"
          rel="noopener noreferrer"
          class="button--grey"
        >
          GitHub
        </a>
      </div>
    </div> -->
  </div>
</template>

<script>
export default {

  //  SSR
  // middleware:'auth',
  middleware(context){//页面加载时运行
    console.log('middleware pages',this)//this指undefind
  },

  //参数的有效性 也可以拿到textcont
  validate({params,query}){
    //校验业务
    console.log('validate')
    return true;//true页面正常显示 false404页面
  },
  
  //读数据 ， 返回给组件
  asyncData(context){
    //异步业务逻辑，读取服务器数据
    console.log('asyncData')
    // console.log(window)//服务端生命周期拿不到widnow
    return {
      b:2
    }
  },

  //读数据 ， vuex
  fetch({store}){
    //异步业务逻辑，读取服务器数据提交给vuex
    console.log('fetch')
    // console.log(window)//服务端生命周期拿不到widnow
  },

  //SSR && CSR

  beforeCreate(){
    console.log('beforeCreate')
  },

  created(){
    console.log('created')
  },

  //CSR  //this指向组件
  beforeMount(){},
  mounted(){console.log('mounted',this,window)},
  beforeUpdate(){},
  updated(){console.log('updated')},
  beforeDestroy(){},
  destroyed(){},

  //服务端渲染 激活、失活 不存在
  // activated(){},
  // deactivated(){},

  data(){
    return {
      a:1
    }
  }
}
</script>

<style>
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.title {
  font-family:
    'Quicksand',
    'Source Sans Pro',
    -apple-system,
    BlinkMacSystemFont,
    'Segoe UI',
    Roboto,
    'Helvetica Neue',
    Arial,
    sans-serif;
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
}

.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.links {
  padding-top: 15px;
}
</style>
