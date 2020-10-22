const express=require('express');
//引入连接池模块
const pool=require('../pool.js');
//创建路由器对象
const router=express.Router();



/*******关键字搜索********/
router.get('/search',(req,res)=>{
  let title = req.query.title;
  let sql="SELECT * FROM tysc_product_details WHERE title LIKE '%"+title+"%'";
  let sql2=`SELECT p.title,pic,p.href,d.price FROM tysc_index_product AS p INNER JOIN tysc_product_details AS d ON p.href = d.did WHERE p.title LIKE '%${title}%'`;
  console.log(111)
  pool.query(sql2,[title],(err,result)=>{
    console.log(222)
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