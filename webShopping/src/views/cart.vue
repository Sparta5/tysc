<template>
  <div class="cart" @click="handler">
    <div class="cart_item" v-for="(item, i) of product" :key="i">
      <span><input type="checkbox" :checked="item.ckd" :data-i="i" /></span>
      <span
        ><img :src="require('../assets/' + item.payload.top_img[0])"
      /></span>
      <div class="detail">
        <span v-text="item.payload.art_no"></span><br />
        <span>大宗包装规格：<em v-text="item.payload.prosize"></em></span>
        <ul>
          <li>
            <button :data-i="i">-</button>
            <input type="text" :value="item.num" />
            <button :data-i="i">+</button>
          </li>
          <li><span v-text="'¥  ' + item.payload.price"></span></li>
          <li>
            <img :data-n="'del'" :data-i="i"
              src="http://static.websiteonline.cn/website/script/shoppingcart/img/sitestar-shopping-cart-delete.jpg"
              alt=""
            />
          </li>
        </ul>
      </div>
    </div>
    <van-submit-bar
      :price="3050"
      button-text="提交订单"
      @submit.prevent="onSubmit"
    >
      <van-checkbox v-model="checked" @click="isckdAll()">全选</van-checkbox>
      <!-- <template #tip>
        你的收货地址不支持同城送,
        <span @click="onClickEditAddress">修改地址</span>
      </template> -->
    </van-submit-bar>
  </div>
</template>
<script>
// import { SubmitBar } from 'vant';
export default {
  data() {
    return {
      product: null,
      checked: false,
    };
  },
  methods: {
    handler(e) {
      var i = e.target.dataset.i;
      if (e.target.nodeName == "INPUT" && e.target.type == "checkbox") {
        // this.$store.state.prouducts[i].ckd=e.target.checked
        // console.log(this.$store.state.prouducts)
        this.$store.commit("ckd", i);
        this.isckd()
        console.log(localStorage.getItem("vuex"));
      }
      if (e.target.innerHTML == "+") {
        this.$store.commit("addProduct", this.product[i].payload);
        // console.log(i,111)
      } else if (e.target.innerHTML == "-") {
        var count = -1;
        this.$store.commit("changeNum", { i, count });
        console.log(this.product[i].num - 1);
      } else if (e.target.dataset.n == "del") {
        // console.log(i)
        this.$store.commit("delProuduct", i);
      }
    },
    isckd() {//判断是否全选
      this.product = this.$store.state.prouducts;
      var isAll = this.$store.getters.isAll;
      isAll ? (this.checked = true) : (this.checked = false);
    },
    isckdAll() {//调用全选|全不选
      if (this.checked) {
        console.log(11);
        this.checked = false;
        this.$store.commit("ckdAll", false);
      } else {
        console.log(222);
        this.checked = true;
        this.$store.commit("ckdAll", true);
      }
    },
  },
  onsubmit() {
    console.log("ok");
  },
  mounted() {
   this.isckd()
  },
  watch: {
    checked(newVal, lodVal) {
      console.log('变化全选判断')
      this.isckd()
    },
  },
};
</script>
<style lang="scss">
.cart {
  .cart_item {
    padding: 0.625rem;
    margin: 0.3125rem;
    display: flex;
    border: 0.0625rem solid orange;
    > span:first-child {
      align-self: center;
    }
    > span:nth-child(2) {
      align-self: center;
      img {
        width: 4.0625rem;
        height: 4.0625rem;
      }
    }
    .detail {
      > span:first-child {
        color: #555;
        font-size: 1rem;
      }
      span {
        color: #aaa;
        font-size: 0.85rem;
      }
      ul {
        padding-top: 0.6125rem;
        li {
          float: left;
          padding: 0 0.625rem;
          height: 25px;
          line-height: 20px;
          input {
            width: 2.8125rem;
            text-align: center;
            border: 0.0625rem solid #999;
          }
          button {
            border: 0.0625rem solid #999;
          }
          img {
            width: 1rem;
            height: 1rem;
          }
        }
      }
    }
  }
}
</style>