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
  `phone` VARCHAR(11),
  `upwd`  VARCHAR(100)
  -- `avatar` VARCHAR(50) NOT NULL DEFAULT `unamed.jpg` COMMENT `用头像`
);
#插入数据
INSERT INTO user VALUES(NULL,'binbin','18728307147','123456');
INSERT INTO user VALUES(NULL,'toatao','15282395147','123456');

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
  href VARCHAR(128)
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

(13,4,'images/details/4L/on1/DM.jpg','21'),
(14,4,'images/details/4L/on2/XNM.jpg','22'),
(15,4,'images/details/4L/on3/CB.jpg','23'),
(16,4,'images/details/4L/on4/WN.jpg','24'),

(17,5,'images/details/5L/on1/MSSQ.jpg','25'),
(18,5,'images/details/5L/on2/LSQ.jpg','26'),
(19,5,'images/details/5L/on3/SZGZ.jpg','27'),
(20,5,'images/details/5L/on4/GLC.jpg','28'),

(21,6,'images/details/6L/on1/ZEG.jpg','29'),
(22,6,'images/details/6L/on2/NN.jpg','30'),
(23,6,'images/details/6L/on3/YLGY.jpg','31'),
(24,6,'images/details/6L/on4/dt.jpg','32'),

(25,7,'images/details/7L/on1/ZJHT.jpg','33'),
(26,7,'images/details/7L/on2/OP.jpg','34'),
(27,7,'images/details/7L/on3/BLM.jpg','35'),
(28,7,'images/details/7L/on4/YGG.jpg','36'),

(29,8,'images/details/8L/on1/SHY.jpg','37'),
(30,8,'images/details/8L/on2/xxxy.jpg','38'),
(31,8,'images/details/8L/on3/sy.jpg','39'),
(32,8,'images/details/8L/on4/LS.jpg','40'),

(33,9,'images/details/9L/on1/DX.jpg','41'),
(34,9,'images/details/9L/on2/HS.jpg','42'),
(35,9,'images/details/9L/on3/SB.jpg','43'),
(36,9,'images/details/9L/on4/HTYM.jpg','44');


/**详情页*/-------------
CREATE TABLE `tysc_product_details` (
	`did` int(11) NOT NULL,
	`family_id` int(11) DEFAULT NULL,  		#所属分类编号对应fid
	`title` varchar(128) DEFAULT NULL, 		#主标题
	`price` decimal(10,2) DEFAULT NULL,	 	#价格
	`art_no` VARCHAR(32) DEFAULT NULL,     #货品编号 #产品详细说明
	`inventory` VARCHAR(32) DEFAULT NULL,   #库存
  `prosize` VARCHAR(32) DEFAULT NULL     #规格
);
TRUNCATE TABLE `tysc_product_details`;
INSERT INTO `tysc_product_details` (`did`,`family_id`,`title`,`price`,`art_no`,`inventory`,`prosize`)VALUES
-- 1号,'个'类别
(1,1,'新土豆约6/DS22057','13.60','新土豆(约6.24斤/6个)','996','个'),
(2,1,'精品有机菜花/DS91025','15.00','有机菜花（约4斤~4.4斤/个）','999','个'),
(3,1,'精品青椒DS91024','4.20','精品青椒（约0.8斤/份）','999','份'),
(4,1,'精品蒜苔/DS91019','5.80','精品蒜苔（约0.94斤/份）','994','份'),
(5,1,'大葱/DS22021','4.5','大葱4个装  （约1.49~1.65斤/份）','990','份'),
(6,1,'大白菜/DS22058','2.80','大白菜 （约3.2斤-3.6斤/个）','984','个'),
(7,1,'西红柿/DS22083','5.80','西红柿4个装 （约1.58~1.77斤/份）','994','份'),
-- 2号类别
(8,2,'云彩红红心火龙果/DS21560','2.00','（500 克）','94','500克'),
(9,2,'香水菠萝/DS21339','10.00','香水菠萝（约3~3.14斤/个）','974','个'),
(10,2,'白雪公主/DS21508','13.11','白雪公主（单果约3~3.5斤/个）','994','个'),
(11,2,'金果/DS21034','23.60','金果（单果约0.23~0.24斤/个）','994','个'),
(13,2,'都乐菠萝/DS21057','20.60','菠萝（单果约3.8斤-4.2斤/个）','694','个'),
-- 3号类别
(15,3,'烤海鸭蛋/DS31067','13.6','烤海鸭蛋（/个）','494','个'),
(16,3,'鳕鱼/DS31013  ','10.00',' 鳕鱼（约0.91~1.14斤/条）','94','个'),
(17,3,'鱿鱼/DS31014','5.30',' 鱿鱼（约0.8~1.06斤/条）','994','条'),
(18,3,'大鲐鲅/DS31034  ','3.60','大鲐鲅（约0.5~0.62斤/条）','794','条'),
(19,3,'鸡蛋/DS31001','4.58',null,'694','个'),
(20,3,'大黄花鱼/DS31012  ','15.60',' 大黄花鱼（约0.56斤-0.62斤/条','534','条'),
-- 4号分类
(21,4,'盘锦大米<br/>25kg/DS6945740400304','120','大米（/袋）','14','袋'),
(22,4,'紫糯米/DS11334','6.98',null,'94','500克'),
(23,4,'厨邦鸡粉<br/>270g/DS6902902006811','16.50','','656','袋'),
(24,4,'万年玉米胚芽油<br/>5L/DS6954886900128','3.60','','794','桶'),
-- 5号分类
(25,5,'马氏神泉大弱碱<br/>550ml/DS6941518200138','1.20','','494','瓶'),
(26,5,'龙山泉干啤/DS6950822600510','4.00','','94','瓶'),
(27,5,'山楂果汁<br/>245ml/DS6925854005848','5.30','','994','瓶'),
(28,5,'果粒橙<br/>1.25L/DS6956416200029','7.00','','794','瓶'),
-- 6号分类
(29,6,'张二嘎多味瓜子<br/>150g/DS6920753635394','5.50','','494','袋'),
(30,6,'林家铺子糖水桔子罐头<br/>820g/DS6921587202400','15.50','','94','罐'),
(31,6,'银鹭桂圆八宝粥<br/>360g/DS6926892527088','5.30',' ','174','罐'),
(32,6,'银鹭低糖莲子八宝粥<br/>360g/DS6926892528085','3.60','','794','罐'),
-- 7号分类
(33,7,'枣夹核桃kg/DS11056','19.80','','494','500g'),
(34,7,'脱水藕片DS11306','68.00','','94','500g'),
(35,7,'脱水菠萝蜜/DS11303','58.00','','847','500g'),
(36,7,'羊肝羹/DS11195','8.00','','999','500g'),
-- 8号分类
(37,8,'四合院SHY1392妇婴系列卫生纸<br/>1800g/DS6955963401392','24.50','','99','提'),
(38,8,'心相印茶语系列三层12粒卷筒纸<br/>1620g/DS6922868286591','32.00','','94','提'),
(39,8,'丝蕴深层修护洗发露<br/>500ml/DS6920177916826','5.50','','994','支'),
(40,8,'六神清爽香皂（莲心+荷花）125g/DS6901294201736','5.50','','394','个'),
-- 9号分类
(41,9,'10头对虾/DS42165','60.00','','999','盒'),
(42,9,'海参礼盒/DS42167','136.00','','64','盒'),
(43,9,'扇贝肉礼盒/DS42039   （约1.4斤/盒）','28.00','扇贝肉礼盒  约1.4斤/盒','889','盒'),
(44,9,'安慕希黄桃+燕麦<br/>200g/D S6907992513560','68.00','','796','盒');
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
(1,99, 'images/index/carouse/1woc.jpg', '轮播广告商品01', '/'),
(2,99, 'images/index/carouse/2woc.jpg', '轮播广告商品02', '/'),
(3,99, 'images/index/carouse/3woc.jpg', '轮播广告商品03', '/'),
(4,99, 'images/index/carouse/4woc.jpg', '轮播广告商品04', '/'),

(5,1, 'images/index/carouse_list/1L-01.jpg', '轮播广告商品1', '5'),
(6,1, 'images/index/carouse_list/1L-02.jpg', '轮播广告商品1', '6'),
(7,1, 'images/index/carouse_list/1L-03.jpg', '轮播广告商品1', '7'),

(8,2,  'images/index/carouse_list/2L-01.jpg', '轮播广告商品2', '20'),
(9,2,  'images/index/carouse_list/2L-02.jpg', '轮播广告商品2', '13'),
(10,2, 'images/index/carouse_list/2L-03.jpg','轮播广告商品2', '37'),

(11,3, 'images/index/carouse_list/3L-01.jpg', '轮播广告商品3', '19'),
(12,3, 'images/index/carouse_list/3L-02.jpg', '轮播广告商品3', '20'),
(13,3, 'images/index/carouse_list/3L-03.jpg', '轮播广告商品3', '22'),

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



