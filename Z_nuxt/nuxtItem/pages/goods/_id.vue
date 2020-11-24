<template>
  <div class="goods">
    <h3>详情页</h3>
  </div>
</template>

<script>
export default {
  name:'goods-detail',
  validate({params,query}){
    console.log(params,query)
    return typeof params.id === 'number'
  }
}
</script>