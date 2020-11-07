<template>
  <div>
      <div name="a" v-for="(item,i) of 6" :key="i">
        <van-checkbox v-model="checkbox">
          <van-card
            num="2"
            price="2.00"
            desc="描述信息"
            title="商品标题"
            thumb="https://img.yzcdn.cn/vant/ipad.jpeg"
          >
            <template #tags>
              <van-tag plain type="danger">标签</van-tag>
              <van-tag plain type="danger">标签</van-tag>
            </template>
            <template #footer>
              <van-button size="mini">按钮</van-button>
              <van-button size="mini">按钮</van-button>
            </template>
          </van-card>        
        </van-checkbox>     
      </div>
 
    <van-submit-bar :price="3050" button-text="提交订单" @submit="onSubmit">
      <van-checkbox @click="checkAll">全选</van-checkbox>
    </van-submit-bar>
  </div>
</template>
<script>
export default {
  
  data(){
    return{
      checkbox: true
    }
  }
}
</script>