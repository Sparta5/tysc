var pool=require("../pool");
module.exports=function(sql,params){
  return new Promise(function(resolve,err){
    pool.query(sql,params,(error,result)=>{
      if(error) err(error);
      else resolve(result)
    })
  })
}