var express = require('express');
var pool = require('../pool.js');
var md5 = require('md5');

var router = express.Router();

/* 用户注册接口 */
router.get('/register',(req, res)=>{
  var $phone = req.query.phone;
  var $upwd = req.query.upwd;
  var $uname = req.query.uname;
  var sql = 'SELECT uid,phone FROM user WHERE phone=? '
  pool.query(sql,[$phone],(err,result)=>{
    if(err) throw err;
    //用户名已存在
    if(result.length > 0){
      res.send({code: 0,msg: 'fail'})
    }else if($upwd){
      let sql = 'INSERT user(uname,phone,upwd) VALUES(?,?,MD5(?))';
      pool.query(sql,[$uname,$phone,$upwd],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows > 0){
          console.log(result)
          res.send({code:1,msg:'success'})
        }else{
          res.send({code:0,msg:'fail'})
        }
      })
    }else{
      res.send({code:'ok',msg:'可以使用'})
    }
  })
});

//用户登录接口
router.get('/login',(req,res)=>{
  console.log(11)
  //获得用户输入的用户名和密码
  var $phone = req.query.phone;
  var $upwd = md5(req.query.upwd);
  console.log($upwd)
  var sql = 'SELECT uname FROM user WHERE phone=? AND upwd=?';
  pool.query(sql,[$phone,$upwd],(err,result)=>{
    if(err) throw err;
    console.log(result)
    if(result.length > 0){
      res.send({message:'登录成功',code:1,info:result[0].uname})
    }else{
      res.send({message:'登录失败',code:0})
    }
  })
})

module.exports = router;

