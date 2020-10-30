<template>
<div>
  <div class="listbox" :style="'height:'+onHeight+'px'">
    <div class="pop" :style="'min-height:'+onHeight+'px'">
      <ul v-if="isShow">
        <li>
          <router-link to="/">
            <i></i>
            <span>首页</span>
          </router-link>
        </li>
        <!-- ----中间的循环----- -->
        <li v-for="(listboxs,i) of listbox" :key="i" @click="userClick(i)" >
          <router-link to="/">
            <i :style="{background:'url('+require('../assets/'+listboxs.img)+')  no-repeat center'
              ,backgroundSize: '63%'}"></i>
            <span v-text="listboxs.classify"></span>
          </router-link>
        </li> 
        <!-- --------- -->
        <li>
          <router-link to="/">
            <i></i>
            <span>添洋介绍</span>
          </router-link>
        </li>
      </ul>
      <!-- ----点击显示的----- -->
      <ul class="userClick" v-else>
        <li>
          <router-link to="/">
            <i :style="{backgroundImage:'url('+require('../assets/'+listbox[key].img2)+')',backgroundSize:'63%'}">
            </i>
            <span>{{listbox[key].classify}}</span>
            <span v-for="(pulldowns,t) of listbox[key].pulldown" :key="t" @click="page(pulldowns)">
              <a href="javascript:;">{{pulldowns}}</a>
            </span>
          </router-link>
        </li>
        <div>
          <span @click="userClick(670)"></span>
        </div>
      </ul>
    </div>
  </div>  
</div>
</template>
<script>
export default {
  data(){
    return {
      listbox:[
        // {img:"../assets/images/index/listBox/bg1.jpg",classify:"蔬菜类",family:"1"},
        {img:"images/index/listBox/bg1.jpg",img2:"images/index/listBox/bg_1.jpg",pulldown:["大众蔬菜","精品蔬菜"],classify:"蔬菜类",family:"1"},
        {img:"images/index/listBox/bg2.jpg",img2:"images/index/listBox/bg_2.jpg",pulldown:["大众蔬菜1","精品蔬菜"],classify:"水果类",family:"2"},
        {img:"images/index/listBox/bg3.jpg",img2:"images/index/listBox/bg_3.jpg",pulldown:["大众蔬菜2","精品蔬菜"],classify:"鱼肉类",family:"3"},
        {img:"images/index/listBox/bg4.jpg",img2:"images/index/listBox/bg_4.jpg",pulldown:["大众蔬菜3","精品蔬菜"],classify:"干果类",family:"4"},
        {img:"images/index/listBox/bg5.jpg",img2:"images/index/listBox/bg_5.jpg",pulldown:["大众蔬菜4","精品蔬菜"],classify:"干货类",family:"5"},
        {img:"images/index/listBox/bg6.jpg",img2:"images/index/listBox/bg_6.jpg",pulldown:["大众蔬菜5","精品蔬菜"],classify:"粮油副食",family:"6"},
        {img:"images/index/listBox/bg7.jpg",img2:"images/index/listBox/bg_7.jpg",pulldown:["大众蔬菜6","精品蔬菜"],classify:"食品",family:"7"},
        {img:"images/index/listBox/bg8.jpg",img2:"images/index/listBox/bg_8.jpg",pulldown:["大众蔬菜7","精品蔬菜"],classify:"酒水类",family:"8"},
        {img:"images/index/listBox/bg9.jpg",img2:"images/index/listBox/bg_8.jpg",pulldown:["大众蔬菜6","精品蔬菜"],classify:"非食",family:"9"},
        {img:"images/index/listBox/bg10.jpg",img2:"images/index/listBox/bg_10.jpg",pulldown:["大众蔬菜6","精品蔬菜"],classify:"精品礼盒",family:"10"}
      ], 
        
      isShow:true,
      onHeight:667,//屏幕高度
      key:null
    }
  },
  methods:{
    userClick(i){
      console.log(i)
      this.key=i
      this.onHeight=670
      if(this.isShow){
        this.isShow = false
      }else{
        this.isShow = true
      }
    }
  },
  mounted(){
    //获取屏幕高度的设置不同尺寸
    var viewHeight=this.$getViewportSize();
    this.onHeight=viewHeight.height;
    console.log(this.onHeight)
  }
}
</script>
<style lang="scss">
.listbox{
  position:fixed;
  z-index: 5;
  top: 0px;left:0px;
  // height: 38.925rem;
  overflow: hidden auto;
  .pop{
    display: block;
    width: 9.75rem;//min-height: 700px;
    background-color: #6aa84f;
    ul{
      padding-bottom: 6.4375rem;
      >li{                                              
        width:100%;
        font-size: 1rem;
        border-bottom: 0.0625rem solid rgba($color: #000000, $alpha: 0.15);
        padding: 0.75rem 0rem;
        a{
          display: block;
          i{
            display: block;
            width: 4.1rem;height: 4.1rem;
            border-radius: 50%;
            border: 0.0625rem solid white;
            margin: 0rem auto;
          }
          span{
            display: block;
            width: 100%;
            height: 1.375rem;line-height: 1.375rem;
            text-align: center;
            padding-top: 0.375rem;
            color: #000;
          }          
        }
      }
      >li:first-child{
        i{background: url("../assets/images/index/listBox/home.jpg") no-repeat center;}
      }
      >li:last-child{
        i{
          background: url("../assets/images/index/listBox/tyjt.jpg") no-repeat center;
          background-size: 63%;
        }
      }
    }
    // 下拉菜单
    .userClick {
      >li{ 
        // i{background-color: white;}
        span{
          font-size: 0.9rem;
          padding-top: 0rem;
          height: 1.875rem;line-height:1.875rem;
          >a{
            display: inline-block;
            width: 5.25rem;
            border-left: 0.0625rem solid #666;
            font-size: 0.9rem;
            color: black;
          }
        }  
      }
      >div{
        width: 100%;
        text-align: center;
        span{
          display: inline-block;
          background: url(../assets/images/index/listBox/close.png) no-repeat center;
          background-size: 50%;
          padding: 10px;
          width: 2.5rem;
          height: 2.5rem;
          border: 1px solid #fff;
          -webkit-border-radius: 50px;
          -moz-border-radius: 50px;
          border-radius: 50px;  
          margin: 1.2rem auto;          
        }
      }  
    }
  }
}
</style>