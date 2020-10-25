var express = require('express');
// var router = express.Router('../pool.js');
var query=require("./query")
//创建后端路由接口对象
const router = express.Router()

/******首页轮播TOP*********/
router.get("/",(req,res)=>{
  var sql = "SELECT img,title,href FROM tysc_index_carousel WHERE family_id=?"
  query(sql,[99]).then(result=>{
    console.log('查询首页分类轮播图成功')
    res.send({code:'1',topCarousel:result})
  })
})

/*********首页列表、列表轮播、查找分类--动态***********/
router.get("/index_veriety",(req,res)=>{
  var fid = req.query.fid;
  var indexVeriety = {};
  var sql = "SELECT d.title,pic,p.href,d.price FROM tysc_index_product AS p INNER JOIN tysc_product_details AS d ON p.href = d.did WHERE p.family_id=?"
  query(sql,[fid]).then(result=>{
    indexVeriety.proList = result;
  console.log(indexVeriety)

    //列表轮播
    var sql = "SELECT img,title,href FROM tysc_index_carousel WHERE family_id=?"
    return query(sql,[fid])
  }).then(result=>{
    indexVeriety.carouselList = result;
    // 查找分类
    var sql = "SELECT fid,fname,img,img_s FROM tysc_product_family WHERE fid=?"
    return query(sql,[fid])
  }).then(result=>{
    indexVeriety.family=result;
    console.log('查询分类成功')
    res.send(indexVeriety)
  })
})

/*******关键字搜索********/
// router.get('/search',(req,res)=>{
//   let title = req.query.title;
//   let sql = 'SELECT * FROM tysc_product_details LIKE "%"+?+"%"';
//   pool.query(sql,[title],(err,result)=>{
//     if(err) throw err;
//     // console.log(result);
//     if(result.length>0){
//       res.send({message:'查询到结果',code:1});
//     }else{
//       res.send({message:'查询失败',code:0});
//     }
//   })
// })

module.exports = router;
