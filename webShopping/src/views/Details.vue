<template>
  <div class="details">
    <my-header></my-header>
    <span><router-link to="/"> ＜＜返回</router-link></span>
    <div class="details_car">
      <swiper ref="mySwiper" :options="swiperOptions" class="swiper">
        <swiper-slide  v-for="(carousels,k) of detail_obj.top_img" :key="k">
          <router-link to="">
            <img :src="require('../assets/'+carousels)">
          </router-link>
        </swiper-slide>
        <div class="swiper-pagination" slot="pagination"></div>
      </swiper>
    </div> 
    <div class="case">
      <div>
        <span v-text="detail_obj.title"></span>
        <span v-text="detail_obj.art_no"></span>        
      </div>
      <div>
        <label>市场价：¥ 0.00</label>
        <p>价格：<span>¥ {{detail_obj.price}}</span></p>
      </div>
      <div>
        <span>大宗购物包装规格：</span>
        <span :class="bor" @click="borColor()"><a href="javascript:void(0);" v-text="detail_obj.prosize"></a></span>
      </div>
      <!-- 输入款 -->
      <div>
        <span>数量：</span>
        <van-stepper v-model="amout" integer
        input-width="65px" button-size="19px"/> 
        <span>（库存：{{detail_obj.inventory}}）</span>     
      </div>
    </div>
    <div class="btn">
      <button>立即购买</button>
      <button @click="add()">加入购物车</button>
    </div>
    <van-tabs type="card" title-inactive-color="#777"
              title-active-color="#777"
              color="#b5b5b5"
              background="#eee">
      <van-tab title="产品描述">
        <p class="content">产品描述</p>
        <div>
          <span v-for="(imgs,i) of detail_obj.details_img" :key="i">
            <img :src="require('../assets/'+imgs)">
          </span>
        </div>
      </van-tab>
      <van-tab title="购买记录">购买记录</van-tab>
      <van-tab title="客户评论">客户评论</van-tab>
      <van-tab title="买家问答">买家问答</van-tab>
    </van-tabs>
    <my-floor></my-floor>
    <my-footer></my-footer>
  </div>
</template>
<script>
import { Swiper, SwiperSlide, directive } from 'vue-awesome-swiper'
import { Stepper } from 'vant'
import { Tab, Tabs } from 'vant';
import 'swiper/css/swiper.css'
import myHeader from '../components/Header'
import myFloor from '../components/floor'
import myFooter from '../components/footer'
export default {
  components:{
    myHeader,Swiper,SwiperSlide,myFloor,myFooter
  },
  props:{
    did:{
      type:String,
    }
  },
  data() {
    return {
      // 轮播图选项
      swiperOptions: {
        pagination: {
          el: '.swiper-pagination'
        },
        // loop: true,
      },
      // carouseList:[//列表轮播 列表产品
      //   {img:'images/index/carouse_list/1L-01.jpg'},
      //   {img:'images/index/carouse_list/1L-02.jpg'},
      // ],
      amout: 1,//记录数量
      bor:null,
      detail_obj:[]
    }
  },
  methods:{
    borColor(){
      this.bor==null?this.bor='bor':this.bor=null
    }
  },
  mounted(){
    console.log(this.$route)
    this.axios.get('/details?did='+this.did).then(result=>{
      var obj = result.data[0];
      obj.top_img = JSON.parse(obj.top_img);
      obj.details_img = JSON.parse(obj.details_img);
      this.detail_obj = obj
      console.log(this.detail_obj) 
    })
  },
  methods: {
    //添加商品 调用vue中得add方法
    add() {
      console.log(this.detail_obj,555)
      this.$store.commit('addProduct',this.detail_obj)
    }
  }
}
</script>
<style lang="scss">
.details{
  color: #333;
  // 点击菜单样式
  .header .menu{
    background: url(../assets/images/bgico.png) no-repeat center;
  }  
  >span{//返回
    height: 2rem;line-height: 2rem; display: block;
    a{color: #888;}
  }
  // swiper

  >.case{
    padding: 1rem;
    div:nth-child(1){
      font-size: 1.2rem;
      >span{line-height: 1.5625rem;}
    }
    div:nth-child(2){
      line-height: 2rem;
      >label{text-decoration: line-through;color: #999;}
      >p{color:red;}
    }
    div:nth-child(3){//规格
      line-height: 1.8125rem;margin-bottom: 0.5rem;
      >span:last-child{
        padding:0.4rem;
        border: 1px solid #dddddd;
        a{color: #888;}
      }
      .bor{border: 1px solid red!important;}
    }
    div:nth-child(4){//购物车
      border-top:1px solid #b5b5b5;
      padding-top: 0.8rem;
      display: inline-block;
      display: flex;
      line-height: 2rem;
      .van-stepper{
        >button{
          border:1px solid #aaa;
          color: #111;
        }
        >input{border:1px solid #aaa}
      }
    }
  }
  .btn{//购买/加入
    >button{
      background-image: linear-gradient(#ff4600 100%,#fff);
      border: none;
      box-shadow: -1px 2px 4px #666;
      padding: 0.75rem 2rem;
      color: white;
      margin:1rem;
    }
    >button:last-child{
      background-image: linear-gradient(#eee 30%,#fff 100%);
      color: #666;
    }
  }
    //选项卡样式
  .van-tabs__nav--card{ 
    margin:0rem;
    .van-tab{
      font-size: 1rem;
      // padding: 0;
      span{padding: 1.5rem 0;}
    } 
  }
  .van-tabs__content{//选项卡内容
    padding: 0.35rem 0rem;
    .van-tab__pane{
      padding: 0rem 0.5rem;
      border:0rem;
      p{
        color: #666;
        padding-left: 0.75rem;
        height: 2.5rem;line-height: 2.5rem;
        background-color: #eee;
      }
      >div span{
        img{
          width: 100%;
        }
      }
    }
  } 


  /*样式穿透*/
  .swiper {
    img{width: 100%;}
    .swiper-pagination-bullet{
      background-color:#66ff33;
      width:0.375rem;height:0.375rem;
    }
    .swiper-pagination-bullets{
      width: 2rem;
      // padding: 0 0.1525rem;
      height: 11px;
      line-height: 6px;
      border-radius: 11px;
      background: rgba(45,45,45,0.5);
      position: absolute;
      top: 5px;
      left: 90%;
      z-index: 16;
      overflow: hidden;
    }
  }  
}

</style>