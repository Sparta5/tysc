<template>
  <div class="user">
    <h3>用户</h3>
  </div>
</template>
<script>
export default {
  middleware({store,route,redirect,params,query}) {
    //context 服务器上下文
    //组件独享前置守卫

    //store 状态数信息
    //route 一条目标路由信息
    // redirect 强制跳转
    //params,query 校验参数合理性
    console.log('middleware pages 组件独享前置守卫 ')
    redirect('/login')
  },
};
</script>