<template>
  <div class="details">
    <my-header></my-header>
    <span>＜＜返回</span>
    <div class="details_car">
      <swiper ref="mySwiper" :options="swiperOptions" class="swiper">
        <swiper-slide  v-for="(carousels,k) of carouseList" :key="k">
          <router-link to="">
            <img :src="require('../assets/'+ carousels.img)">
          </router-link>
        </swiper-slide>
        <div class="swiper-pagination" slot="pagination"></div>
      </swiper>
    </div> 
    <div>
      <span>精品有机菜花/DS91025 </span>
      <span>有机菜花（约4斤~4.4斤/个）</span>
    </div>
    <div><label>市场价：</label><span>¥0.00</span></div>
    <div>
      <span>大宗购物包装规格：</span>
      <span><a href="javascript:void(0);">份</a></span>
    </div>
    <!-- 输入款 -->
    <div>
      <span>数量：</span>
      <van-stepper v-model="value" integer @change="onChange"
      input-width="75px" button-size="17px"/> 
      <span>（库存：99）</span>     
    </div>
    <div class="btn">
      <button>立即购买</button>
      <button>加入购物车</button>
    </div>
    <van-tabs type="card">
      <van-tab title="标签 1">内容 1</van-tab>
      <van-tab title="标签 2">内容 2</van-tab>
      <van-tab title="标签 3">内容 3</van-tab>
      <van-tab title="标签 4">内容 4</van-tab>
    </van-tabs>
  </div>
  
</template>
<script>
import { Swiper, SwiperSlide, directive } from 'vue-awesome-swiper'
import { Stepper } from 'vant'
import { Tab, Tabs } from 'vant';
import 'swiper/css/swiper.css'
import myHeader from '../components/Header'
export default {
  components:{
    myHeader,Swiper,SwiperSlide
  },
  data() {
    return {
      // 轮播图选项
      swiperOptions: {
        pagination: {
          el: '.swiper-pagination'
        },
        loop: true,
      },
      carouseList:[//列表轮播 列表产品
        {img:'images/index/carouse_list/1L-01.jpg'},
        {img:'images/index/carouse_list/1L-02.jpg'},
      ],
      value: 1,//记录数量
    }
  },
  methods:{
    
  }
}
</script>
<style lang="scss">
.details{
  // 点击菜单样式
  .header .menu{
    background: url(../assets/images/bgico.png) no-repeat center;
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