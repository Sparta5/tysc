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
module.exports = router;
