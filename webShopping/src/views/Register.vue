<template>
  <div class="register">
    <h1>欢迎注册</h1>
    <form action="">
      <div>
        <input type="text" v-model="phone" @blur="checkPhone" placeholder="手机号" maxlength="11">
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
          <van-radio  name="1" checked-color="#4d9f39">
            男
            </van-radio>
          <van-radio  name="0" checked-color="#4d9f39">
            女
          </van-radio>
        </van-radio-group>
        <label v-text="radioStatus"></label>
      </div>
      <div class="btn">
        <van-button @click="submit" type="primary" size="large">注册</van-button>
      </div>
    </form>
    <div class="jump">
      <router-link to="/login">已有账号</router-link> |
      <router-link to="/">返回首页</router-link>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      phone:'',
      phoneStatus:null,

      upwd:'',
      upwdStatus:null,

      conupwd:'',
      conupwdStatus:null,

      uname:'',
      unameStatus:null,
      
      radio:'',
      radioStatus:null
    }
  },
  methods:{
    checkPhone(){//手机号验证
      var phoneRegExp = /^1[34578]\d{9}$/
      if(!this.phone){this.phoneStatus='字段不能为空!'; return}
      if(phoneRegExp.test(this.phone)){
        this.axios.get('/register?phone='+this.phone).then(res=>{
          if(res.data.code == 0){this.phoneStatus = '该账号已经被注册！'
          }else{
            this.phoneStatus = null;
          };
        })
        this.phoneStatus = '';
        return true
      }else{
        this.phoneStatus = '非法输入!'
        return false
      } 
    },
    checkUpwd(){
      if( this.upwd.length < 6 && this.upwd != null
      ){
        this.upwdStatus = '密码至少为6位'
        return false
      }else{
        this.upwdStatus = null;
        return true
      }
    },
    checkConupwd(){
      if(this.conupwd ==  this.upwd){
        this.conupwdStatus = '';
        return true;
      }else{
        this.conupwdStatus = '两次输入密码不一致';
      }
    },
    checkUname(){
      var unameRegExp2 = /[#\$%\^&\*@]/;
      if(this.uname && this.uname.search(unameRegExp2)==-1){
        this.unameStatus = '';
        return true;
      }else{
        this.unameStatus='字段不能为空，不能含有特殊字符！'
      }
    },
    submit(){//提交
      if(this.checkPhone() && this.checkUpwd() && this.checkConupwd()){
        if(this.radio == '') return this.radioStatus = '字段不能为空!';
        this.axios.get('/register',{
          params:{
            phone:this.phone,
            upwd:this.upwd,
            uname:this.uname
          }
        }).then(res=>{
          if(res.data.code == 1){
            this.$router.push({
              path: '/'
            });
          }else{alert('注册失败请重新尝试！')}
        })
      }
    }
  }
}
</script>
<style lang="scss">
.register{
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
      // 选择框按钮的样式
      .van-radio{
        padding:0.75rem 1rem 0.75rem 2rem;
        span{
          color: white;
        }
      }
    }
    .btn{
      // margin-left:0.975rem;
      .van-button{
        width: 108%;
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