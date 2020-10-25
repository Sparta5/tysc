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
);
#插入数据
INSERT INTO user VALUES(NULL,'binbin','123456');
INSERT INTO user VALUES(NULL,'toatao','123456');

/**分类信息***/
DROP TABLE IF EXISTS `tysc_product_family`;
CREATE TABLE `tysc_product_family` (
  `fid` int(11) NOT NULL,
  `fname` VARCHAR(32) DEFAULT NULL,
  `img` VARCHAR(128),
  `img_s` VARCHAR(128)
);
INSERT INTO `tysc_product_family` (`fid`,`fname`,`img`,`img_s`) VALUES
(1,'优选蔬菜','images/index/main/01bxsj.jpg','images/index/main/01_log.png'),
(2,'优选水果','images/index/main/02bxsj.jpg','images/index/main/02_log.png');

/****首页商品列表****/
CREATE TABLE `tysc_index_product`(
  pid INT PRIMARY KEY AUTO_INCREMENT,
	family_id INT,          #所属分类编号对应fid
  -- title VARCHAR(64),
  pic VARCHAR(64),
  href varchar(128)
);
INSERT INTO `tysc_index_product` (`pid`,`family_id`, `title`,`pic`,`href`) VALUES
-- (1,1,'新土豆约6','images/details/1L/on1/01_t1.jpg','1'),
(1,1,'images/details/1L/on1/01_t1.jpg','1'),
(2,1,'images/details/1L/on1/02_t1.jpg','2'),
(3,1,'images/details/1L/on1/03_t1.jpg','3'),
(4,1,'images/details/1L/on1/04_t1.jpg','4'),

(5,2,'images/details/1L/on2/01_t1.jpg','8'),
(6,2,'images/details/1L/on2/01_t1.jpg','9'),
(7,2,'images/details/1L/on2/01_t1.jpg','10');
(8,2,'images/details/1L/on2/01_t1.jpg','11');

/**详情页*/-------------
CREATE TABLE `tysc_product_details` (
	`did` int(11) NOT NULL,
	`family_id` int(11) DEFAULT NULL,  		#所属分类编号对应fid
	`title` varchar(128) DEFAULT NULL, 		#主标题
	`price` decimal(10,2) DEFAULT NULL,	 	#价格
	`art_no` VARCHAR(32) DEFAULT NULL,     #货品编号 #产品详细说明
	`inventory` VARCHAR(32) DEFAULT NULL   #库存
);

TRUNCATE TABLE `tysc_product_details`;
INSERT INTO `tysc_product_details` (`did`,`family_id`,`title`,`price`,`art_no`,`inventory`)VALUES
(1,1,'新土豆/DS22057','13.6','新土豆(约6.24斤/6个)','996'),
(2,1,'精品有机菜花/DS91025','15.00','有机菜花（约4斤~4.4斤/个）','999'),
(3,1,'精品青椒DS91024','4.20','精品青椒（约0.8斤/份）','999'),
(4,1,'精品蒜苔/DS91019','5.80','精品蒜苔（约0.94斤/份','994'),

(5,1,'云彩红红心火龙果/DS21560','13.6','红心火龙果个','994'),
(6,1,'香水菠萝/DS21339 ','10.00','香水菠萝（约3~3.14斤/个）','994'),
(7,1,'精品蒜苔/DS91019','13.6','精品蒜苔（约0.94斤/份','994');
/*2L分类*/



/**详情页图片**/



/****首页轮播广告商品****/
CREATE TABLE `tysc_index_carousel`( 
  `cid` INT PRIMARY KEY AUTO_INCREMENT,
  `family_id` INT,
  `img` VARCHAR(128),
  `title` VARCHAR(64),
  `href` VARCHAR(128)
);
TRUNCATE TABLE `tysc_index_carousel`;
INSERT INTO `tysc_index_carousel` (`cid`,`family_id`,`img`,`title`,`href`) VALUES
(1,99, 'images/index/carouse/1woc.jpg', '轮播广告商品1', '/'),
(2,99, 'images/index/carouse/2woc.jpg', '轮播广告商品2', '/'),
(3,99, 'images/index/carouse/3woc.jpg', '轮播广告商品3', '/'),
(4,99, 'images/index/carouse/4woc.jpg', '轮播广告商品3', '/'),

(5,1, 'images/index/carouse_list/1L-01.jpg', '轮播广告商品3', '5'),
(6,1, 'images/index/carouse_list/1L-02.jpg', '轮播广告商品3', '6'),
(7,1, 'images/index/carouse_list/1L-03.jpg', '轮播广告商品3', '7'),

(8,2, 'images/index/carouse_list/2L-01.jpg', '轮播广告商品3', '12'),
(9,2, 'images/index/carouse_list/2L-02.jpg', '轮播广告商品3', '13'),
(10,2, 'images/index/carouse_list/2L-03.jpg', '轮播广告商品3', '14');



