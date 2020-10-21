<template>
  <div class="mysearch">
    <div class="list">
      <span class="iconfont" :class="isList?'icon-caidan':'icon-chacha'" @click="isLists"></span>
      <!-- 搜索框+点击弹出背景 -->
      <van-cell style="marign:0px;" @click="showPopup">
        <mt-search class="search" 
                cancel-text="" placeholder="搜索商品..."
                >
            <!-- <mt-cell>
            </mt-cell> -->
        </mt-search>        
      </van-cell>
      <!-- -------- -->
      <span class="iconfont icon-lingdang"></span>
       <!-- 弹出背景内容设置 -->
      <van-popup position="top"
                :style="{ height: '100%' ,top:'3.6rem'}"
                v-model="show" close-icon-position="top-right"
                closeable>
     内容</van-popup>
     <!-- --------- -->
    </div>
    <!-- 手风琴-->
    <div class=""  :class="isHidden?'unlist':'enlist'">
      <van-collapse v-model="activeName" accordion>
        <van-collapse-item title="产品指南" name="1">
          <ul>
            <li>桌面吸尘器</li>
            <li>手持/推杆</li>
            <li>除螨仪</li>
            <li>卧式吸尘器</li>
            <li>扫地机</li>
            <li>桶式</li>
            <li>配件</li>
          </ul>
        </van-collapse-item>
        <van-collapse-item title="核心技术" name="2">
          
        </van-collapse-item>
        <van-collapse-item title="中央维修" name="3">  </van-collapse-item>
        <van-collapse-item title="媒体中心" name="4">  </van-collapse-item>
        <van-collapse-item title="关于我们" name="5">
          <ul>
            <li>公司介绍</li>
            <li>招商合作</li>
            <li>奖项专利</li>
            <li>社会责任</li>
          </ul>
        </van-collapse-item>
      </van-collapse> 
          
    </div>

    <!-- //////// -->

  </div>
  
</template>
<script>
export default {
  data(){
    return{
      show: false,//弹框
      isList:true,
      activeName: '',
      isHidden:false
    }
  },
  methods:{
    isLists(){
      console.log(11)
      if(this.isList){
        this.isList=false,
        this.isHidden=true
      }else{
        this.isList=true,
        this.isHidden=false
      }
    },
    //弹框
    showPopup() {
      if(this.show){
        this.show = false
      }else{
        this.show = true;
      }
    },
  }
}
</script>
<style lang="scss">
.mysearch{
  width: 100%;
  display: block;
  margin: 0px auto;
  position: relative;
  .search{//  搜索样式设置
     height: 2.75rem;width: 100%;
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
    justify-content: space-between;
    align-items: center;
    padding: 0px 8px;
    >.iconfont{
      width: 28px;height:28px;
      color: #666;
      font:400 28px 微软雅黑;
    }
  }
  .unlist{//控制菜单显示
    position: absolute;
    top: 3.51rem;left: 0rem;
    width: 100%;
    height: 40.75rem;
    background-color: rgb(255, 255, 255);
    // transition:9s;
    .van-collapse-item__content{
      background-color: #f8f8f8;
      padding: 1.875rem 1.25rem 1.25rem 1.25rem;
    }
    ul{
      // background-color: #f8f8f8;
      padding: 1.875rem,1.25rem,0rem,1.25rem;
      li:not(:last-child){margin-bottom: 1.875rem;}  
    }
  }
  .enlist{//控制菜单隐藏
    display: none;height: 0%;
    // transition:9s;
  }
  .van-overlay{top:6.6rem}
}
</style>