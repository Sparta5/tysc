<template>
  <div class="mysearch">
    <div class="list">
      <span class="iconfont icon-caidan"></span>
      <mt-search class="search" v-model="value"
               cancel-text="" placeholder="搜索商品..."
                :result.sync="result">
           <!-- <mt-cell>
           </mt-cell> -->
      </mt-search>
      <span class="iconfont icon-lingdang"></span>
    </div>
  </div>
</template>
<style lang="scss">
.mysearch{
  width: 100%;
  display: block;
  margin: 0px auto;
  .search{//  搜索样式设置
     height: 2.75rem;width: 85%;
     height: 44px;
    .mint-searchbar{
      background-color:white;
      // left: 10%;
      .mint-searchbar-inner{
        background-color: #f2f2f2;
        border-radius: 1.125rem;
        i{font-size: 1rem;margin: 0px 0.3125rem;}
      }
      .mint-searchbar-core{background-color: #f2f2f2;}
    }
    // .mint-search-list{width: 640px; margin: 0px auto;}
  }
  // 菜单样式和右边
  .list{
    display: flex;
    justify-content: center;
    align-items: center;
    >.iconfont{
      width: 28px;height:28px;
      color: #666;
      font:400 28px 微软雅黑;
    }
  }
}
</style>