<template>
  <div class="classifys">
    <div class="carouse">
      <swiper ref="mySwiper" :options="swiperOptions" class="swiper">
        <swiper-slide  v-for="(carousels,k) of carouseList" :key="k">
          <router-link to="/">
            <img :src="carousels.img">
          </router-link>
        </swiper-slide>
        <div class="swiper-pagination" slot="pagination"></div>
      </swiper>
    </div> 
  </div>
</template>
<script>
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
        speed:500,//匀速时间
        autoplay: {
          delay: 3200,//自动切换的时间间隔，单位ms
          //stopOnLastSlide: false,//如果设置为true，当切换到最后一个slide时停止自动切换。（loop模式下无效）。
          disableOnInteraction: false,//用户操作swiper之后，是否禁止autoplay。默认为true：停止。
          autoplayDisableOnInteraction : false,//如果设置为false，用户操作swiper之后自动切换不会停止
        },
        loop: true
      },
      carouseList:[//列表轮播 列表产品
        {img:'/imgs/carouseitem/1L-01.jpg'},
        {img:'/imgs/carouseitem/1L-02.jpg'},
        {img:'/imgs/carouseitem/1L-03.jpg'},
        {img:'/imgs/carouseitem/1L-04.jpg'},
      ]
    }
  },
  methods:{

  },
  mounted(){
    // console.log('第一次加载1',this.family)
    // console.log('第一次加载2',this.listAndCarouse)
  },
  watch:{
    // family(newVal,oldVal){
    //   if(newVal){
    //     console.log('我更新了数据1',typeof (this.family),this.family)
    //   }
    // },
    // listAndCarouse(newVal,oldVal){
    //   if(newVal){
    //     console.log('我更新了数据2',this.listAndCarouse)
    //   }
    // }
  }
}
</script>
<style scoped>
  img{width: 100%;}
  .carouse{
    width: 100%;
    /* border:1px solid red; */
  }
  /*样式穿透*/
  .swiper >>> .swiper-pagination-bullet{
    background-color:white;
    margin: 0 2px;
    width: 12px;
    height: 7px;
  }
</style>
