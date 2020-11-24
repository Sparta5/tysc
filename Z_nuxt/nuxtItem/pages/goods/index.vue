<template>
  <div class="goods">
    <h3>商品</h3>
    <nuxt-link to="/goods/1?a=1&b=2">商品01</nuxt-link>
    <nuxt-link :to="{name:'goods-id',params:{id:2},query:{a:3,b:6}}">商品02</nuxt-link>
    <nuxt-link to="/goods/comment">评论</nuxt-link>
    <!-- 动态 对应 goods/_id.vue-->
    <nuxt-link :to="{name:'goods-id',params:{id:3},query:{a:111,b:222}}">商品03</nuxt-link>

    <!-- 约定展示区内容才能显示 -->
    <nuxt/>
  </div>
</template>