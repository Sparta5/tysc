<template>
  <div class="home">
     <mt-header class="header" title="">
       <div slot="left" class="shortcut" v-if="true">
         <span>你好，请</span> 
         <router-link to="/login">登录</router-link> |
         <router-link to="/register">注册</router-link>
       </div>
       <div slot="left" class="shortcut" v-else>
         <span>你好,<span>斌斌</span></span>
         <router-link to="/">注销</router-link>
       </div>
       <span class="menu" slot="right"></span>
     </mt-header>
     <!-- 商标、小购物车、搜索跳转 -->
     <div class="min_cart">
       <div><img src="../assets/images/logo_5npf.png" slot="icon"></div>
       <div class="cart_right">
         <span class="cart_icon"></span>
         <span>购物车</span>
         <span> <b>6</b></span>
         <span>物品</span>
         <div class="search">
           <router-link to="/"></router-link>
         </div>
       </div>
     </div>
     <!-- 轮播图区域   -->
    <div class="swipe">
      <mt-swipe 
          :showIndicators="true"
          :auto="3000"
          :speed="500"
          :continuous="true">
          <mt-swipe-item v-for="(carousels,i) of product.carousel_top" :key="i"><img :src="require('../assets/'+carousels.img)"></mt-swipe-item>
      </mt-swipe>
    </div>
    <!-- 分类 -->
    <div class="sort_list">
      <ul>
        <li v-for="(k,i) of 12" :key="i">
          <div>
            <img src="../assets/images/index/list/001.jpg">
            <p>蔬菜</p>
          </div>
        </li>
      </ul>
    </div>
    <!-- 楼层分类 （大图 轮播 列表） 组件预留-->
    <div
      ifinite-scroll-distance="5"
      v-infinite-scroll="loadMore"
      infinite-scroll-disabled="busy"
      infinite-scroll-immediate-check="true">
      <my-classify :family="product.family" :listAndCarouse="listAndCarouse" v-if="product.length !=0"></my-classify>
    </div>
    <my-footer></my-footer>
  </div>
</template>

<script>
import myFooter from '../components/footer';
import myClassify from '../components/Home/classify';


export default {
  components: {
    myFooter,myClassify
  },
  data(){
    return{
      product:[],//顶部轮播、类别
      listAndCarouse:[],//列表轮播和列表
      busy:false,//标识当前服务器正在空闲，可以处理用户滚动行为所触发的滚动方法
      variety:1,//记录下一次要查询的品种编号
    }
    
  },
  methods:{
    loadData(fid){

      //显示加载提示框
      this.$indicator.open({
        text:'加载中...',
        spinnerType:'double-bounce'
      });
      this.busy = true;//不能触发滚动方法

      this.axios.get('/indexList?fid=' + fid).then(result=>{
        this.listAndCarouse.push(result.data)
        this.busy = false;//可以触发滚动方法
        this.$indicator.close();//关闭加载提示框
      })
    },
    //滚动到指定距离范围内时加载更多的服务器数据
    loadMore(){
      this.variety++;
      if(this.variety <= this.product.family.lenght){
        this.loadData(this.variety)
      }
    }

  },
  mounted(){
    this.axios.get('/').then(result=>{
      this.product=result.data
    });
    //首次且只有一次调用列表和列表轮播
    this.loadData(this.variety)
  }
}
</script>
<style lang="scss">
.home{
  padding-bottom: 55px;
  font-size: 19px;
  .header{
    background-color: rgb(92, 143, 12)!important;
    height: 2.6875rem;
    padding-right: 0px;
    span{font-size: 16px;margin: 0px 4px;}
    a{
      font-size: 16px;
      color: white;
      text-decoration: none;
    }
    a:nth-child(2){color: chocolate;}
    .menu{
      display: inline-block;
      width: 40px;height: 40px;
      background: url(../assets/images/f8qf.png) no-repeat center center;
      
    }
  }
  //商标、小购物车、搜索跳转-------
  .min_cart{
    height: 50px;line-height: 50px;
    border-bottom: 2px dashed #e6e6e6;
    padding: 0px 10px;
    vertical-align: auto;
    div:first-child{
      display: inline-block;
      img{width: 140px;height: auto;}
    }
    .cart_right{
      float:right;
      display: inline-block;
      height: 50px;
      width: 161px;
      display: flex;
      align-items: center;
      span{
        margin: 0px 2px;
        height: 30px;line-height: 30px;
        display: inline-block;
        font-size: 12px;
        color: #777;
        font-weight: normal;
        b{font-weight: 600;color: rgb(170, 9, 9);}
      }
      .cart_icon{
        width: 18px;height: 30px;
        display: inline-block;
        background: url(../assets/images/cart_bg.png) no-repeat 0 -207px;
      }
      .search{
        height: 30px;
        >a{
          display: inline-block;
          margin-left: 8px;
          width: 50px;height: 42px;
          background: url(../assets/images/a1.jpg) no-repeat;
        }
      }
    }
  }
  //--------
  //轮播图-----
  .swipe{
    height: 243px;
    img{
      width:100%;
    }
  }
  //分类
  .sort_list{
    // display: flex;
    // flex-direction: column;
    ul{
        
        display: flex;
        flex-wrap: wrap;
      li{
        width: 25%;
        padding: 0.5375rem 0rem;
        // align-self: center;
        // float: left;
        text-align: center;
        div{
          display: block;
          img{width: 60%;}
          p{
            font-size: 12px;height: 20px;line-height: 20px;
          }
        }
        
      }
    }
  }
  //内容

}
</style>
