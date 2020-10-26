<template>
  <div class="classify">
    <div v-for="(indexVerietys,i) of indexVeriety" :key="i">
       <!-- v-if="family.length != 0 && listAndCarouse.length !=0" -->
      <div>
        <div class="floor" v-for="(familys,v) of indexVerietys.family" :key="v">
          <div><router-link to="/"><img :src="require('../../assets/'+familys.img)"></router-link></div>
          <div>
            <router-link to="/"><img :src="require('../../assets/'+familys.img_s)"></router-link>
            <!-- <router-link to="/"><img :src="require('../../assets/images/index/main/02_log.png')"></router-link> -->
            <strong v-text="familys.fname"></strong>
          </div>
        </div>
          <!-- 分类轮播 -->
        <div class="carouse">
          <swiper ref="mySwiper" :options="swiperOptions" class="swiper">
            <swiper-slide  v-for="(carouselLists,k) of indexVerietys.carouselList" :key="k">
              <router-link :to="'details/'+carouselLists.href">
                <img :src="require('../../assets/'+ carouselLists.img)">
              </router-link>
            </swiper-slide>
          </swiper>
        </div>
        <!-- 分类列表 -->
        <div class="home_list" >
          <ul>
            <li v-for="(proLists,t) of indexVerietys.proList" :key="t">
              <div>
                <router-link to="/">
                <img :src="require('../../assets/'+proLists.pic)" alt="">
                </router-link>
              </div>
                                                        <!-- v-text="(proLists.title).slice(0,5)" -->
              <p> <router-link :to="'ditais/'+proLists.href" v-text="(proLists.title).substring(0,5)"></router-link> </p>
              <p>
                <label>价格: </label><span v-text="'¥'+proLists.price"></span>
              </p>
            </li>
          </ul>
        </div>         
      </div>
        
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
  props:{
    // family:{//分类(大图 小图 名字)
    //   type:Array,
    //   default:[]
    // },
    indexVeriety:{//列表轮播 列表产品indexVeriety
      type:Array,
      default:[]
    }
  },
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
        speed:3500,//匀速时间
        freeMode:true,//设置为true则变为free模式，slide会根据惯性滑动
		    autoplay: {
          delay: 0,//自动切换的时间间隔，单位ms
          //stopOnLastSlide: false,//如果设置为true，当切换到最后一个slide时停止自动切换。（loop模式下无效）。
          disableOnInteraction: false,//用户操作swiper之后，是否禁止autoplay。默认为true：停止。
          autoplayDisableOnInteraction : false,//如果设置为false，用户操作swiper之后自动切换不会停止
        },
        loop: true,//true让Swiper看起来是循环的
      }
    }
  },
  methods:{

  },
  mounted(){
    console.log('第一次加载2',this.indexVeriety)
  },
  watch:{
    // family(newVal,oldVal){
    //   if(newVal){
    //     console.log('我更新了数据1',typeof (this.family),this.family)
    //   }
    // },
    indexVeriety(newVal,oldVal){
      if(newVal){
        console.log('我更新了数据2',this.listAndCarouse)
      }
    }
  }
}
</script>
<style lang="scss">
/*- 分类 （大图 轮播 列表）*****************/
.classify{
  padding-bottom: 0.375rem;
  //大图------
  .floor{

    div:first-child{
      img{width: 100%;line-height: 100px;}
    }
    div:nth-child(2){
      height: 2.375rem;line-height: 2.375rem;
      text-align: center;
      background-color: #02ce02;
      font-size: 18px;
      color: white;
      img{width: 25px;height: 25px;margin-right: 0.75rem;}
    }
  }
  //swiper小轮播图样式调整------
  .carouse{
    // border:1px solid red;
    img{
      width: 100%;
      margin: 5px 4px;  
    }
    /*样式穿透*/
    .swiper >>> .swiper-pagination-bullet{
      background-color:black;
      width: 15px;height: 15px; 
    }
    /*修改为匀速*/
    .swiper-container-free-mode > .swiper-wrapper {
      // transition-timing-function: ease-out;
      transition-timing-function: linear; 
      margin: 0 auto;
    }
  }
  //分类列表------
  .home_list{
    
    ul{
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      li{
        width: 38%;
        border: 0.0625rem solid #d9d9d9;
        padding: 0.9375rem;
        margin: 0rem 0.25rem 0.625rem 0rem;
        a{
          color: #000;text-decoration: none;
          font-size: 1rem;
        }
        div{
          text-align: center;
          img{width: 84%;}
        }
        p{
          margin-bottom: 0.21rem;
          font-size: 0.9rem;
          label{color: #888;}
          span{color: red;}
        }
      }
    }
  }
  
}
</style>