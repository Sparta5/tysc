<template>
  <div class="container">
    <h3>数据交互</h3>

    <h4>同域资源</h4>
    <div>{{ title }}</div>

    <h4>跨域资源</h4>
    <div>{{ msg }}</div>

  </div>
</template>

<script>
export default {
  async asyncData({ $axios }) {
    //异步请求 组件渲染前，添加的模块$开头
    let res = await $axios({ url: "/data/list.json" });
    console.log("读取到的静态资源", res.data);

    //跨域处理
    let res2 = await $axios({ url: '/index_veriety/?fid=3' });
    console.log("读取到的跨域资源", res2.data);

    return {
      //与页面合并
      title: res.data.title,
      msg:res2.data.proList
    };
  },

  async fetch({ $axios }) {
    //添加到vuex store
    // let res = await $axios({url:'/data/list.json'})
    // console.log('res',res.data.title)
  },

  components: {},
};
</script>

<style>
</style>
