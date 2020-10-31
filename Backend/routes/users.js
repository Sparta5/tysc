var express = require('express');
var pool = require('../pool.js')
var router = express.Router();

/* GET users listing. */
router.get('/user', function(req, res) {
  var $obj = req.query;
  var $uname = req.query.uname;
  var sql = 'SELECT uname FROM user WHERE uname=? '
  pool.query(sql,[$uname],(err,result)=>{
    if(err) throw err;
    //用户名已存在
    if(result.length > 0){
      res.send({code: 0,msg: 'fail'})
    }else{
      let sql = 'insert into user set ?'
      pool.query(sql,[obj],(err,result)=>{
        
      })
    }
  })
});

module.exports = router;

