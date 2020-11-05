const express=require('express');
//引入连接池模块
const pool=require('../pool.js');
//创建路由器对象
const router=express.Router();

/******详情页********/
router.get('/details',(req,res)=>{
  let did = req.query.did;
  console.log(did)
  // 'SELECT d.title,pic,p.href,d.price FROM tysc_index_product AS p INNER JOIN tysc_product_details AS d ON p.href = d.did WHERE p.family_id=?'
  let sql = "SELECT d.did,family_id,title,price,art_no,inventory,prosize,top_img,details_img FROM tysc_product_details AS d INNER JOIN tysc_details_img AS g ON d.did = g.did WHERE d.did=?"
  pool.query(sql,[did],(err,result)=>{
    console.log(result)
    res.send(result)
  })
})

/*******关键字搜索********/
router.get('/search',(req,res)=>{
  let title = req.query.title;
  let sql="SELECT * FROM tysc_product_details WHERE title LIKE '%"+title+"%'";
  let sql2=`SELECT p.title,pic,p.href,d.price FROM tysc_index_product AS p INNER JOIN tysc_product_details AS d ON p.href = d.did WHERE p.title LIKE '%${title}%'`;
  pool.query(sql2,[title],(err,result)=>{
    if(err) throw err;
    // console.log(result);
    if(result.length>0){
      res.send({message:'查询到结果',code:1,searchs:result});
    }else{
      res.send({message:'查询失败',code:0});
    }
  })
})

module.exports = router;