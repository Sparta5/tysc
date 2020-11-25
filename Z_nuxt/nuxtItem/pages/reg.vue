<template>
  <div class="reg">
    <h3>注册</h3>
  </div>
</template>
<script>
export default {
  beforeRouteLeave(to,from,next){
    let b1=window.confirm('是否离开');
    next(b1)
  }
}
</script>