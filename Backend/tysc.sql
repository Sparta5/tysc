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
(2,'优选水果','images/index/main/02bxsj.jpg','images/index/main/02_log.png'),
(3,'鱼肉类','images/index/main/03bxsj.jpg','images/index/main/03_log.png'),
(4,'粮油副食','images/index/main/04bxsj.jpg','images/index/main/04_log.png'),
(5,'酒水','images/index/main/05bxsj.jpg','images/index/main/05_log.png'),
(6,'食品','images/index/main/06bxsj.jpg','images/index/main/06_log.png'),
(7,'干货','images/index/main/07bxsj.jpg','images/index/main/07_log.png'),
(8,'非食','images/index/main/08bxsj.jpg','images/index/main/08_log.png'),
(9,'精品礼盒区','images/index/main/09bxsj.jpg','images/index/main/09_log.png');

/****首页商品列表****/
CREATE TABLE `tysc_index_product`(
  pid INT PRIMARY KEY AUTO_INCREMENT,
	family_id INT,          #所属分类编号对应fid
  -- title VARCHAR(64),
  pic VARCHAR(64),
  href varchar(128)
);
INSERT INTO `tysc_index_product` (`pid`,`family_id`,`pic`,`href`) VALUES
-- (1,1,'新土豆约6','images/details/1L/on1/01_t1.jpg','1'),
(1,1,'images/details/1L/on1/XTD.jpg','1'),
(2,1,'images/details/1L/on2/YJCH.jpg','2'),
(3,1,'images/details/1L/on3/JPQJ.jpg','3'),
(4,1,'images/details/1L/on4/ST.jpg','4'),

(5,2,'images/details/2L/on1/YC.jpg','8'),
(6,2,'images/details/2L/on2/XSBL.jpg','9'),
(7,2,'images/details/2L/on3/BXGZ.jpg','10'),
(8,2,'images/details/2L/on4/jg.jpg','11'),

(9,3,'images/details/3L/on1/KYD.jpg','15'),
(10,3,'images/details/3L/on2/XY.jpg','16'),
(11,3,'images/details/3L/on3/yy.jpg','17'),
(12,3,'images/details/3L/on4/dtb.jpg','18'),

(13,4,'images/details/3L/on1/KYD.jpg','15'),
(14,4,'images/details/3L/on2/XY.jpg','16'),
(15,4,'images/details/3L/on3/yy.jpg','17'),
(16,4,'images/details/3L/on4/dtb.jpg','18');



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
-- 1号类别
(1,1,'新土豆约6/DS22057','13.60','新土豆(约6.24斤/6个)','996'),
(2,1,'精品有机菜花/DS91025','15.00','有机菜花（约4斤~4.4斤/个）','999'),
(3,1,'精品青椒DS91024','4.20','精品青椒（约0.8斤/份）','999'),
(4,1,'精品蒜苔/DS91019','5.80','精品蒜苔（约0.94斤/份）','994'),
(5,1,'大葱/DS22021','4.5','大葱4个装  （约1.49~1.65斤/份）','990'),
(6,1,'大白菜/DS22058','2.80','大白菜 （约3.2斤-3.6斤/个）','984'),
(7,1,'西红柿/DS22083','5.80','西红柿4个装 （约1.58~1.77斤/份）','994'),
-- 2号类别
(8,2,'云彩红红心火龙果/DS21560','2.00','（500 克）','94'),
(9,2,'香水菠萝/DS21339','10.00','香水菠萝（约3~3.14斤/个）','974'),
(10,2,'白雪公主/DS21508','13.11','白雪公主（单果约3~3.5斤/个）','994'),
(11,2,'金果/DS21034','23.60','金果（单果约0.23~0.24斤/个）','994'),
(13,2,'都乐菠萝/DS21057','20.60','菠萝（单果约3.8斤-4.2斤/个）','694'),
-- 3号类别
(15,3,'烤海鸭蛋/DS31067','13.6','烤海鸭蛋（/个）','494'),
(16,3,'鳕鱼/DS31013  ','10.00',' 鳕鱼（约0.91~1.14斤/条）','94'),
(17,3,'鱿鱼/DS31014','5.3',' 鱿鱼（约0.8~1.06斤/条）','994'),
(18,3,'大鲐鲅/DS31034  ','3.60','大鲐鲅（约0.5~0.62斤/条）','794'),
(19,3,'鸡蛋/DS31001','4.58','鸡蛋（/个）','694'),
(20,3,'大黄花鱼/DS31012  ','15.60',' 大黄花鱼（约0.56斤-0.62斤/条','534'),
-- 4号分类
(21,4,'烤海鸭蛋/DS31067','13.6','烤海鸭蛋（/个）','494'),
(22,4,'鳕鱼/DS31013  ','10.00',' 鳕鱼（约0.91~1.14斤/条）','94'),
(23,4,'鱿鱼/DS31014','5.3',' 鱿鱼（约0.8~1.06斤/条）','994'),
(24,4,'大鲐鲅/DS31034  ','3.60','大鲐鲅（约0.5~0.62斤/条）','794'),
-- 5号分类
(25,5,'烤海鸭蛋/DS31067','13.6','烤海鸭蛋（/个）','494'),
(26,5,'鳕鱼/DS31013  ','10.00',' 鳕鱼（约0.91~1.14斤/条）','94'),
(27,5,'鱿鱼/DS31014','5.3',' 鱿鱼（约0.8~1.06斤/条）','994'),
(28,5,'大鲐鲅/DS31034  ','3.60','大鲐鲅（约0.5~0.62斤/条）','794'),
-- 6号分类
(29,6,'烤海鸭蛋/DS31067','13.6','烤海鸭蛋（/个）','494'),
(30,6,'鳕鱼/DS31013  ','10.00',' 鳕鱼（约0.91~1.14斤/条）','94'),
(31,6,'鱿鱼/DS31014','5.3',' 鱿鱼（约0.8~1.06斤/条）','994'),
(32,6,'大鲐鲅/DS31034  ','3.60','大鲐鲅（约0.5~0.62斤/条）','794'),
-- 7号分类
(33,7,'烤海鸭蛋/DS31067','13.6','烤海鸭蛋（/个）','494'),
(34,7,'鳕鱼/DS31013  ','10.00',' 鳕鱼（约0.91~1.14斤/条）','94'),
(35,7,'鱿鱼/DS31014','5.3',' 鱿鱼（约0.8~1.06斤/条）','994'),
(36,7,'大鲐鲅/DS31034  ','3.60','大鲐鲅（约0.5~0.62斤/条）','794'),
-- 8号分类
(37,8,'烤海鸭蛋/DS31067','13.6','烤海鸭蛋（/个）','494'),
(38,8,'鳕鱼/DS31013  ','10.00',' 鳕鱼（约0.91~1.14斤/条）','94'),
(39,8,'鱿鱼/DS31014','5.3',' 鱿鱼（约0.8~1.06斤/条）','994'),
(40,8,'大鲐鲅/DS31034  ','3.60','大鲐鲅（约0.5~0.62斤/条）','794'),
-- 9号分类
(41,9,'烤海鸭蛋/DS31067','13.6','烤海鸭蛋（/个）','494'),
(42,9,'鳕鱼/DS31013  ','10.00',' 鳕鱼（约0.91~1.14斤/条）','94'),
(43,9,'鱿鱼/DS31014','5.3',' 鱿鱼（约0.8~1.06斤/条）','994'),
(44,9,'大鲐鲅/DS31034  ','3.60','大鲐鲅（约0.5~0.62斤/条）','794');
/**详7页图片**/



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
(1,99, 'images/index/carouse/1woc.jpg', '轮播广告商品01', '/'),
(2,99, 'images/index/carouse/2woc.jpg', '轮播广告商品02', '/'),
(3,99, 'images/index/carouse/3woc.jpg', '轮播广告商品03', '/'),
(4,99, 'images/index/carouse/4woc.jpg', '轮播广告商品04', '/'),

(5,1, 'images/index/carouse_list/1L-01.jpg', '轮播广告商品1', '5'),
(6,1, 'images/index/carouse_list/1L-02.jpg', '轮播广告商品1', '6'),
(7,1, 'images/index/carouse_list/1L-03.jpg', '轮播广告商品1', '7'),

(8,2,  'images/index/carouse_list/2L-01.jpg', '轮播广告商品2', '/'),
(9,2,  'images/index/carouse_list/2L-02.jpg', '轮播广告商品2', '13'),
(10,2, 'images/index/carouse_list/2L-03.jpg','轮播广告商品2', '/'),

(11,3, 'images/index/carouse_list/3L-01.jpg', '轮播广告商品3', '19'),
(12,3, 'images/index/carouse_list/3L-02.jpg', '轮播广告商品3', '20'),
(13,3, 'images/index/carouse_list/3L-03.jpg', '轮播广告商品3', '/'),

(14,4, 'images/index/carouse_list/4L-01.jpg', '轮播广告商品4', '19'),
(15,4, 'images/index/carouse_list/4L-02.jpg', '轮播广告商品4', '7'),
(16,4, 'images/index/carouse_list/4L-03.jpg', '轮播广告商品4', '13'),

(17,5, 'images/index/carouse_list/5L-01.jpg', '轮播广告商品5', '19'),
(18,5, 'images/index/carouse_list/5L-02.jpg', '轮播广告商品5', '20'),
(19,5, 'images/index/carouse_list/5L-03.jpg', '轮播广告商品5', '13'),

(20,6, 'images/index/carouse_list/6L-01.jpg', '轮播广告商品6', '19'),
(21,6, 'images/index/carouse_list/6L-02.jpg', '轮播广告商品6', '7'),
(22,6, 'images/index/carouse_list/6L-03.jpg', '轮播广告商品6', '13'),

(23,7, 'images/index/carouse_list/7L-01.jpg', '轮播广告商品7', '19'),
(24,7, 'images/index/carouse_list/7L-02.jpg', '轮播广告商品7', '20'),
(25,7, 'images/index/carouse_list/7L-03.jpg', '轮播广告商品7', '13'),

(26,8, 'images/index/carouse_list/8L-01.jpg', '轮播广告商品8', '19'),
(27,8, 'images/index/carouse_list/8L-02.jpg', '轮播广告商品8', '20'),
(28,8, 'images/index/carouse_list/8L-03.jpg', '轮播广告商品8', '5'),

(29,9, 'images/index/carouse_list/9L-01.jpg', '轮播广告商品9', '19'),
(30,9, 'images/index/carouse_list/9L-02.jpg', '轮播广告商品9', '20'),
(31,9, 'images/index/carouse_list/9L-03.jpg', '轮播广告商品9', '6');



