var express = require('express');
// var router = express.Router('../pool.js');
var query=require("./query")
//创建后端路由接口对象
const router = express.Router()

/******首页分类轮播TOP*********/
router.get("/",(req,res)=>{
  var product = {};
  //查找首页所有分类
  var sql = "SELECT fid,fname,img,img_s FROM tysc_product_family"
  query(sql).then(result=>{
    product.family=result;
    //查找首页顶部轮播图
    var sql = "SELECT img,title,href FROM tysc_index_carousel WHERE family_id=?"
    return query(sql,[99])
  }).then(result=>{
    product.carousel_top=result;
    console.log('查询首页分类轮播图成功')
    res.send(product)
  })
})

/*********首页列表、列表轮播***********/
router.get("/indexList",(req,res)=>{
  var fid = req.query.fid;
  var indexList = {};
  var sql = "SELECT p.title,pic,p.href,d.price FROM tysc_index_product AS p INNER JOIN tysc_product_details AS d ON p.href = d.did WHERE p.family_id=?"
  query(sql,[fid]).then(result=>{
    indexList.proList = result;
    //列表轮播
    var sql = "SELECT img,title,href FROM tysc_index_carousel WHERE family_id=?"
    return query(sql,[fid])
  }).then(result=>{
    indexList.carouselList = result;
    console.log(indexList);
    res.send(indexList)
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
