<template>
  <div class="classify">
    <div class="carouse">
      <swiper ref="mySwiper" :options="swiperOptions" class="swiper">
        <swiper-slide  v-for="(carousels,k) of carouseList" :key="k">
          <router-link to="/">
            <img :src="require('../../assets/'+ carousels.img)">
          </router-link>
        </swiper-slide>
      </swiper>
    </div> 
  </div>
</template>
<script>
/*********
 * 下载链接:  swiper  npm install swiper vue-awesome-swiper --save
 * 下载下来的为最新版本修改--package.json>>swiper版本如下示例>>再 npn install更新一下
 *   "dependencies": {
    "swiper": "^5.4.5",
    "vue-awesome-swiper": "^4.1.1",
  },
 * 
 * ******/
import { Swiper, SwiperSlide, directive } from 'vue-awesome-swiper'
import 'swiper/css/swiper.css'
export default {
  components: {
    Swiper,SwiperSlide
  },
  // props:{
  //   carouseList:{//列表轮播 列表产品
  //     type:Array,
  //     default:[]
  //   }
  // },
  data(){
    return{
      // 轮播图选项
      swiperOptions: {
        pagination: {
          el: '.swiper-pagination'
         },
        slidesPerView: 2.5,//容器能够同时显示的slides数量(carousel模式)
        paginationClickable: true,//点击分页器的指示点分页器会控制Swiper切换
        spaceBetween: 15, //在slide之间设置距离（单位px）
        // speed:3500,//匀速时间
        // freeMode:true,//设置为true则变为free模式，slide会根据惯性滑动
		    autoplay: {
          // delay: 0,//自动切换的时间间隔，单位ms
          //stopOnLastSlide: false,//如果设置为true，当切换到最后一个slide时停止自动切换。（loop模式下无效）。
          disableOnInteraction: false,//用户操作swiper之后，是否禁止autoplay。默认为true：停止。
          autoplayDisableOnInteraction : false,//如果设置为false，用户操作swiper之后自动切换不会停止
        },
        // loop: true,//true让Swiper看起来是循环的
      },
      carouseList:[//列表轮播 列表产品
        {img:'images/index/carouse_list/1L-01.jpg'},
        {img:'images/index/carouse_list/1L-02.jpg'},
        {img:'images/index/carouse_list/1L-03.jpg'},
      ]
    }
  },
  methods:{

  },
  mounted(){
    
    console.log('第一次加载1',this.family)
    console.log('第一次加载2',this.listAndCarouse)
  },
  watch:{
    family(newVal,oldVal){
      if(newVal){
        console.log('我更新了数据1',typeof (this.family),this.family)
      }
    },
    listAndCarouse(newVal,oldVal){
      if(newVal){
        console.log('我更新了数据2',this.listAndCarouse)
      }
    }
  }
}
</script>
<style>
.carouse{
    border:1px solid red;
}

.carouse img{
    width: 100%;
    margin: 5px 4px;  
  }
  /*样式穿透*/
.carouse  .swiper >>> .swiper-pagination-bullet{
    background-color:black;
    width: 15px;height: 15px; 
  }
  /*修改为匀速*/
.carouse .swiper-container-free-mode > .swiper-wrapper {
    transition-timing-function: ease-out;
    /* transition-timing-function: linear;  */
    margin: 0 auto;
  }
  
</style>