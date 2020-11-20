<template>
  <div class="cart" @click="handler">
    <div class="cart_item" v-for="(item,i) of product" :key="i">
      <span><input type="checkbox" :checked="item.ckd" :data-i="i"></span>
      <span><img src="https://img.yzcdn.cn/vant/ipad.jpeg"></span>
      <div class="detail">
        <span v-text="item.payload.art_no"></span><br>
        <span>大宗包装规格：<em v-text="item.payload.prosize"></em></span>
        <ul>
          <li>
            <button :data-i="i">-</button>
            <input type="text" :value="item.num">
            <button :data-i="i">+</button>
          </li>
          <li><span v-text="'¥  '+item.payload.price"></span></li>
          <li :data-n="'del'" :data-i="i"><img src="http://static.websiteonline.cn/website/script/shoppingcart/img/sitestar-shopping-cart-delete.jpg" alt=""></li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      product:null   
    }
  },
  methods:{
    handler(e){
        var i=e.target.dataset.i
      if(e.target.nodeName=="INPUT" && e.target.type=="checkbox"){
        console.log(i)
        this.$store.state.prouducts[i].ckd=e.target.checked
        console.log(this.$store.state.prouducts)
      }
      if(e.target.innerHTML == "+"){
        this.$store.commit('addProduct',this.product[i])
        console.log(i)
      }else if(e.target.innerHTML == "-"){
        var count = -1
        this.$store.commit('changeNum',{i,count})
        console.log(this.product[i].num-1)  
      }else if(e.target.dataset.n == 'del'){
        // console.log(i)
        this.$store.commit('delProuduct',i)
      }
    }
  },
  mounted(){
    this.product=this.$store.state.prouducts
    console.log(this.product)
  }
}
</script>
<style lang="scss">
.cart{

  .cart_item{
    padding: 0.625rem;
    margin: 0.3125rem;
    display: flex;
    border:0.0625rem solid orange ;
    >span:first-child{
      align-self: center;
    }
    >span:nth-child(2){
      align-self: center;
      img{
        width: 4.0625rem;height: 4.0625rem;
      }
    }
    .detail{
      >span:first-child{
        color: #555;
        font-size: 1rem;
      }
      span{
        color: #aaa ;
        font-size: 0.85rem;
      }
      ul{
        padding-top: 0.6125rem;
        li{
          float: left;
          padding: 0 0.625rem;
          height: 25px;line-height:20px;
          input{
            width: 2.8125rem;
            text-align: center;
            border: 0.0625rem solid #999;
          }
          button{
            border: 0.0625rem solid #999;
          }
          img{
            width: 1rem;height: 1rem;
          }
        }     
      }     
    }


  }
}
</style>