<template>
  <div class="home">
      <!-- 头部 -->
     <my-header></my-header>
     <!-- 轮播图区域   -->
    <div class="swipe">
      <mt-swipe 
          :showIndicators="true"
          :auto="3000"
          :speed="500"
          :continuous="true">
          <mt-swipe-item v-for="(carousels,i) of topCarousel" :key="i"><img :src="require('../assets/'+carousels.img)"></mt-swipe-item>
      </mt-swipe>
    </div>
    <!-- 分类 -->
    <div class="sort_list">
      <ul>
        <li v-for="(varietyLists,i) of varietyList" :key="i">
          <div>
            <router-link to="/"><img :src="require('../assets/'+varietyLists.imgs)"></router-link>
            <p>蔬菜</p>
          </div>
        </li>
      </ul>
    </div>
    <!-- 楼层分类 （大图 轮播 列表） 组件预留-->
    <div
      ifinite-scroll-distance="15"
      v-infinite-scroll="loadMore"
      infinite-scroll-disabled="busy"
      infinite-scroll-immediate-check="true">
      <my-classify :indexVeriety="indexVeriety" v-if="indexVeriety.length !=0"></my-classify>
    </div>
    <my-floor></my-floor>
    <my-footer></my-footer>
  </div>
</template>

<script>
import myClassify from '../components/Home/classify';
import myFloor from '../components/floor';
import myFooter from '../components/footer';
import myHeader from '../components/Header'
export default {
  components: {
   myClassify,myFloor,myFooter,myHeader
  },
  data(){
    return{
      topCarousel:[],//顶部轮播、类别
      indexVeriety:[],//列表轮播和列表
      busy:false,//标识当前服务器正在空闲，可以处理用户滚动行为所触发的滚动方法
      variety:1,//记录下一次要查询的品种编号
      varietyList:[//头部分类
        {imgs:'images/index/list/01_lqcj.jpg'},
        {imgs:'images/index/list/02_qgf5.jpg'},
        {imgs:'images/index/list/03_sigu.jpg'},
        {imgs:'images/index/list/04_4abc.jpg'},
        {imgs:'images/index/list/05_vqz7.jpg'},
        {imgs:'images/index/list/06_rp6f.jpg'},
        {imgs:'images/index/list/07_q1at.jpg'},
        {imgs:'images/index/list/08_k5op.jpg'},
        {imgs:'images/index/list/09_lb27.jpg'},
        {imgs:'images/index/list/10_1h4d.jpg'},
        {imgs:'images/index/list/11_govc.jpg'},
        {imgs:'images/index/list/12_0t75.jpg'}
      ]
    }
    
  },
  methods:{
    loadData(fid){
        console.log(11)

      //显示加载提示框
      this.$indicator.open({
        text:'加载中...',
        spinnerType:'double-bounce'
      });
      this.busy = true;//不能触发滚动方法
      console.log('触发滚动请求')
            // 首页类列表 列表轮播
      this.axios.get('/index_veriety?fid=' + fid).then(result=>{
        console.log(22)
        this.indexVeriety.push(result.data)
        this.busy = false;//可以触发滚动方法
        this.$indicator.close();//关闭加载提示框
        console.log('分类',this.indexVeriety)
      });
      //     // 首页列表分类大小图
      // this.axios.get('/?fid='+fid).then(result=>{
      //   this.product.push(result.data)
      // });
    },
    //滚动到指定距离范围内时加载更多的服务器数据
    loadMore(){
      if(this.variety < 9){
      this.variety++;
        console.log('调用请求函数')
        this.loadData(this.variety)
      }
    },

    // 注销登录
    isLogin(){
      console.log(11)
      this.$store.commit('logout')
    }
  },
  mounted(){
    this.axios.get('/').then(result=>{
      this.topCarousel=result.data.topCarousel
      console.log(this.topCarousel)
    });
    //首次且只有一次调用列表和列表轮播
    this.loadData(this.variety)
    //检测是否登录
    // if(this.$store.state.isLogined == 1){}
  }
}
</script>
<style lang="scss">
.home{

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
