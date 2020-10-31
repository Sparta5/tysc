<template>
  <div class="login">
    <h1>欢迎注册</h1>
    <form action="">
      <div>
        <input type="text" v-model="phone" placeholder="手机号" maxlength="11">
        <i>*</i>
        <label></label>
      </div>
      <div>
        <input type="password" v-model="upwd" placeholder="密码" maxlength="20" autocomplete="off">
        <i>*</i>
        <label v-text="isStatus"></label>
      </div>
      <div class="btn">
        <van-button @click="login" type="primary" size="large">登录</van-button>
      </div>
    </form>
    <div class="jump">
      <router-link to="/register">用户注册</router-link> |
      <router-link to="/register">忘记密码</router-link> |
      <router-link to="/">返回首页</router-link>
    </div>
  </div>
</template>
<script>
import { Dialog } from 'vant';
export default {
  data(){
    return{
      phone:'',
      upwd:'',
      isStatus:null,
    }
  },
  methods:{
    login(){//提交
      console.log(11)
      if(this.phone == '') return this.isStatus = '请输入邮箱/手机号';
      if(this.upwd == '') return this.isStatus = '请输入密码';
      this.axios.get('/login',{
        params:{
          phone:this.phone,
          upwd:this.upwd
        }
      }).then(res=>{
        if(res.data.code == 1){
          Dialog.alert({message: '登录成功'}).then(() => {
            this.$router.push({
              path: '/'
            })
          });
        }else{
          this.isStatus = '账户号或密码错误'
        }
      })
    }
  }
}
</script>
<style lang="scss">
.login{
  height: 100vh;
  background-image: url(../assets/images/bg00.jpg);
  >h1{
    text-align: center;
    color: white;
    font: 1.9rem 宋体;
    padding: 1.5rem 0;
  }
  form{
    margin: 0px 4rem 0 2.36rem;
    >div{
        // 输入框样式
       // margin: 0 2.74375rem 0 1rem;
      width: 100%;
      padding-bottom:0.6rem;
      position: relative;
      >input{
        width: 100%;
        height: 3rem;line-height: 3rem;
        border-radius: 0.25rem;
        outline: none;border: none;
        padding-left: 1.6rem;
        font: 400 1rem 微软雅黑;
        color:#c5c5c5;
      }   
      >i{
        color: #eb6100;
        position: absolute;
        top: 25%;
        left: 0.8rem;
        font-size: 1.5rem;
      }
      >label{
        display: block;
        line-height: 1.5rem;
        width: 100%;
        color: #fff100;
        padding: 0.6rem 1rem 0rem 1rem;
      }
    }
    .btn{
      // margin-left:0.975rem;
      .van-button{
        width: 109%;
        border-radius: 0.4875rem;
        background-color: #fff100;
        color: #26a860;
        font: 400  1.6rem 宋体;
      }        
    }
  }
  .color{color: white;}
  >.jump{
    padding-top: 1.5rem;
    text-align: center;
     @extend .color;
    a{@extend .color;}
  }
}
</style>