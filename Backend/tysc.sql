#设置客户端连接服务器的编码
SET NAMES UTF8;
#丢弃数据库如果存在
DROP DATABASE IF EXISTS tysc;
#创建数据库，设置储存的编码
CREATE DATABASE tysc CHARSET=UTF8;
#进入创建的数据库
USE tysc;
#创建用户表user
CREATE TABLE `user` (
  `uid` INT PRIMARY KEY AUTO_INCREMENT,
  `uname` VARCHAR(16),
  `upwd`  VARCHAR(16)
  -- `avatar` VARCHAR(50) NOT NULL DEFAULT `unamed.jpg` COMMENT `用头像`
)
#插入数据
INSERT INTO user VALUES(NULL,'binbin','123456');
INSERT INTO user VALUES(NULL,'toatao','123456');

/**分类信息***/
DROP TABLE IF EXISTS `tysc_product_family`;
CREATE TABLE `yzf_food_family` (
  `fid` int(11) NOT NULL,
  `fname` VARCHAR(32) DEFAULT NULL,
  `img` VARCHAR(128),
  `img_s` VARCHAR(128)
);
INSERT INTO `yzf_food_family` (`fid`,`fname`,`img`,`img_s`) VALUES
(1,'五谷营养禅食','/img/index_img/index01.png','/img/index_img/index01_1.png'),

/****首页商品列表****/
CREATE TABLE yzf_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
	family_id INT,          #所属分类编号对应fid
  title VARCHAR(64),
  pic VARCHAR(64),
  href varchar(128)
);
INSERT INTO `yzf_index_product` (`pid`,`family_id`, `title`,`pic`,`href`) VALUES
(6,1,'燕之坊 芝麻核桃黑豆粉500...','/img/index_img/1L06.jpg','9'),

(8,2,'燕之坊 自然吊干400g 新疆楼兰...','/img/index_img/2L01.jpg','11');

/**详情页*/-------------
CREATE TABLE `yzf_food_details` (
	`did` int(11) NOT NULL,
	`family_id` int(11) DEFAULT NULL,  		#所属分类编号对应fid
	`title` varchar(128) DEFAULT NULL, 		#主标题
	`price` decimal(10,2) DEFAULT NULL,	 	#价格
	`art_no` VARCHAR(32) DEFAULT NULL,     #货品编号 #产品详细说明
	`specification` VARCHAR(32) DEFAULT NULL   #规格
);

TRUNCATE TABLE `yzf_food_details`;
INSERT INTO `yzf_food_details` (`did`,`family_id`,`title`,`price`,`art_no`,`specification`)VALUES
(1,1,'燕之坊 精选白砂糖400g 早餐晚餐 熬粥 煮豆浆','11.80','	C01060010026','燕之坊 精选白砂糖400g'),
(2,1,'燕之坊冻干红枣枸杞银耳羹90g营养早餐免煮冲泡即食6包装','39.80','C03070080014','燕之坊 冻干红枣枸杞银耳羹90g'),

/**详情页图片**/