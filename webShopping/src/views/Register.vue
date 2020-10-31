<template>
  <div class="register">
    <h1>欢迎注册</h1>
    <form action="">
      <div>
        <input type="text" v-model="phone" @blur="checkPhone" placeholder="手机号">
        <i>*</i>
        <label v-text="phoneStatus"></label>
      </div>
      <div>
        <input type="password" v-model="upwd" @blur="checkUpwd" placeholder="密码" maxlength="20" autocomplete="off">
        <i>*</i>
        <label v-text="upwdStatus"></label>
      </div>
      <div>
        <input type="password" v-model="conupwd" @blur="checkConupwd" placeholder="确认密码" maxlength="20" autocomplete="off">
        <i>*</i>
        <label v-text="conupwdStatus"></label>
      </div>
      <div>
        <input type="text" v-model="uname" @blur="checkUname" placeholder="姓名" maxlength="10">
        <i>*</i>
        <label v-text="unameStatus"></label>
      </div>
      <div>
        <i>*</i>
        <van-radio-group v-model="radio" direction="horizontal">
          <van-radio @click="onRadio(1)" name="1" checked-color="#5f9b7a">
            男
            </van-radio>
          <van-radio @click="onRdio(2)" name="2">
            女
          </van-radio>
        </van-radio-group>
      </div>
      <div class="btn">
        <van-button @click="submit" type="primary" block>注册</van-button>
      </div>
    </form>
  </div>
</template>
<script>
export default {
  data(){
    return{
      phone:null,
      phoneStatus:null,

      upwd:null,
      upwdStatus:null,

      conupwd:null,
      conupwdStatus:null,

      uname:null,
      unameStatus:null,
      
      radio:null
    }
  },
  methods:{
    checkPhone(){//手机号验证
      var phoneRegExp = /^1[34578]\d{9}$/
      if(this.phone == null){this.phoneStatus=='字段不能为空!'; return}
      if(phoneRegExp.test(this.phone)){
        this.phoneStatus = null;
        this.axios.get()
        return true
      }else{
        this.phoneStatus = '非法输入!'
        return false
      } 

    },
    checkUpwd(){
      if( this.upwd.length < 6 ){
        this.upwdStatus = '密码至少为6位'
        return false
      }else{
        this.upwdStatus = null
        return true
      }
    },
    checkConupwd(){
      if(this.conupwd =  this.)
    },
    checkUname(){

    },
    onRadio(){

    },
    submit(){//提交

    }
  }
}
</script>
<style lang="scss">
body{
  height: 100vh;
  background-image: url(../assets/images/bg00.jpg);
}
.register{
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
        top: 20%;
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
      // 选择框按钮的样式
      .van-radio{
        padding:0.75rem 1.5rem 0.75rem 2rem;
        span{
          color: white;
        }
      }
    }
    .btn{
      margin-left:0.975rem;
      .van-button{
        border-radius: 0.6875rem;
        background-color: #fff100;
        color: #26a860;
        font: 400  1.3rem 宋体;
      }        
    }
  }
}
</style>