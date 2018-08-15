/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.5.40 : Database - myblog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`myblog` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `myblog`;

/*Table structure for table `intolabels` */

DROP TABLE IF EXISTS `intolabels`;

CREATE TABLE `intolabels` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `in_id` varchar(36) NOT NULL COMMENT '帖子ID',
  `label_id` varchar(36) NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `in_id` (`in_id`,`label_id`),
  KEY `FK_LABEL_IN` (`label_id`),
  CONSTRAINT `FK_IN_LABEL` FOREIGN KEY (`in_id`) REFERENCES `my_invitation` (`id`),
  CONSTRAINT `FK_LABEL_IN` FOREIGN KEY (`label_id`) REFERENCES `my_labels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='帖子-标签库';

/*Data for the table `intolabels` */

insert  into `intolabels`(`id`,`in_id`,`label_id`) values (24,'069b8a344dc84723b0a871eabb296e2b','3308334071014ecfa8f584317d71115a'),(9,'357b8f81b64211e78b50f8a96332c90f','3308334071014ecfa8f584317d71115a'),(23,'5fdd59eaf71947cc8acd76f0f44dda34','80a23f46219449bd8f9f5ab471e97e89'),(17,'72e28e47b64211e78b50f8a96332c90f','3308334071014ecfa8f584317d71115a'),(22,'dceb25ac6e1a49bb96f13498d0dbf14f','3308334071014ecfa8f584317d71115a'),(18,'de030f34b64111e78b50f8a96332c90f','3a50c64017af48bd9687f956d9cebc2b');

/*Table structure for table `intotype` */

DROP TABLE IF EXISTS `intotype`;

CREATE TABLE `intotype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `in_id` varchar(36) NOT NULL COMMENT '帖子ID',
  `type_id` varchar(36) NOT NULL COMMENT '类别ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `in_id` (`in_id`,`type_id`),
  KEY `FK_type_IN` (`type_id`),
  CONSTRAINT `FK_IN_type` FOREIGN KEY (`in_id`) REFERENCES `my_invitation` (`id`),
  CONSTRAINT `FK_type_IN` FOREIGN KEY (`type_id`) REFERENCES `my_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帖子-类别库';

/*Data for the table `intotype` */

/*Table structure for table `my_auth` */

DROP TABLE IF EXISTS `my_auth`;

CREATE TABLE `my_auth` (
  `id` varchar(36) NOT NULL COMMENT '权限Id',
  `name` varchar(20) NOT NULL COMMENT '权限名称',
  `auth_code` varchar(20) DEFAULT NULL COMMENT '权限简码',
  `url` varchar(20) DEFAULT NULL COMMENT '权限URL',
  `paternal` varchar(36) DEFAULT NULL COMMENT '父ID',
  `ocode` int(3) DEFAULT '0' COMMENT '排序方式 0>1>2>3>...',
  `ismenu` int(2) DEFAULT '0' COMMENT '是否为菜单 0-否 1-是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `index_key` (`auth_code`,`url`),
  KEY `FK_AUTH_ME` (`paternal`),
  CONSTRAINT `FK_AUTH_ME` FOREIGN KEY (`paternal`) REFERENCES `my_auth` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

/*Data for the table `my_auth` */

insert  into `my_auth`(`id`,`name`,`auth_code`,`url`,`paternal`,`ocode`,`ismenu`) values ('2ad68ae4a26811e787bcf8a96332c90f','添加权限','authManager_add','/authManager/add','404398e4a26711e787bcf8a96332c90f',2,0),('2ae46821a26811e787bcf8a96332c90f','权限修改','authManager_update','/auth/Manager/update','404398e4a26711e787bcf8a96332c90f',2,0),('2ae97754a26811e787bcf8a96332c90f','权限删除','authManager_remove','/authManager/remove','404398e4a26711e787bcf8a96332c90f',2,0),('2aec2504a26811e787bcf8a96332c90f','权限查询','authManager_select','/authManager/select','404398e4a26711e787bcf8a96332c90f',2,0),('37d432b0a26711e787bcf8a96332c90f','角色管理','roleManager','/roleManager/home','4d7e13b3ad9211e7aca8f8a96332c90f',1,1),('404398e4a26711e787bcf8a96332c90f','权限管理','authManager','/authManager/home','4d7e13b3ad9211e7aca8f8a96332c90f',1,1),('404d9086a26711e787bcf8a96332c90f','帖子管理','inManager','/inManager/home','6085ace0ad9211e7aca8f8a96332c90f',1,1),('4050f557a26711e787bcf8a96332c90f','心得管理','nodeManager','/nodeManager/home','6085ace0ad9211e7aca8f8a96332c90f',1,1),('40547ceaa26711e787bcf8a96332c90f','标签管理','labelManager','/labelManager/home','6085ace0ad9211e7aca8f8a96332c90f',1,1),('4057c5b7a26711e787bcf8a96332c90f','主页管理','homeManager','/homeManager/home','6085ace0ad9211e7aca8f8a96332c90f',1,1),('4d7e13b3ad9211e7aca8f8a96332c90f','账号管理',NULL,NULL,'a3fcb2d9a26511e787bcf8a96332c90f',0,1),('4f12a850a26811e787bcf8a96332c90f','添加用户','userManager_add','/userManager/add','ed339dbda26511e787bcf8a96332c90f',2,0),('4f4b83b5a26811e787bcf8a96332c90f','用户修改','userManager_update','/userManager/update','ed339dbda26511e787bcf8a96332c90f',2,0),('4f4f0117a26811e787bcf8a96332c90f','用户删除','userManager_remove','/userManager/remove','ed339dbda26511e787bcf8a96332c90f',2,0),('4f525e3ea26811e787bcf8a96332c90f','用户查询','userManager_select','/userManager/select','ed339dbda26511e787bcf8a96332c90f',2,0),('6085ace0ad9211e7aca8f8a96332c90f','内容管理',NULL,NULL,'a3fcb2d9a26511e787bcf8a96332c90f',0,1),('77934a66a26811e787bcf8a96332c90f','添加帖子','inManager_add','/inManager/add','404d9086a26711e787bcf8a96332c90f',2,0),('779d726fa26811e787bcf8a96332c90f','帖子修改','inManager_update','/inManager/update','404d9086a26711e787bcf8a96332c90f',2,0),('77a0cbe3a26811e787bcf8a96332c90f','帖子删除','inManager_remove','/inManager/remove','404d9086a26711e787bcf8a96332c90f',2,0),('77a55616a26811e787bcf8a96332c90f','帖子查询','inManager_select','/inManager/select','404d9086a26711e787bcf8a96332c90f',2,0),('a3fcb2d9a26511e787bcf8a96332c90f','系统管理',NULL,NULL,NULL,0,1),('a63a691aa26711e787bcf8a96332c90f','角色删除','roleManager_remove','/roleManager/remove','37d432b0a26711e787bcf8a96332c90f',2,0),('a67920eca26711e787bcf8a96332c90f','角色查询','roleManager_select','/roleManager/select','37d432b0a26711e787bcf8a96332c90f',2,0),('ab90f230a26711e787bcf8a96332c90f','添加角色','roleManager_add','/roleManager/add','37d432b0a26711e787bcf8a96332c90f',2,0),('ab9954cba26711e787bcf8a96332c90f','角色修改','roleManager_update','/roleManager/update','37d432b0a26711e787bcf8a96332c90f',2,0),('ed339dbda26511e787bcf8a96332c90f','用户管理','userManager','/userManager/home','4d7e13b3ad9211e7aca8f8a96332c90f',1,1);

/*Table structure for table `my_home` */

DROP TABLE IF EXISTS `my_home`;

CREATE TABLE `my_home` (
  `id` varchar(36) NOT NULL COMMENT '主键ID',
  `image_url` varchar(30) NOT NULL COMMENT '图片路径',
  `location` varchar(10) NOT NULL COMMENT '图片位置',
  `code` varchar(10) NOT NULL COMMENT '位置代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主页表';

/*Data for the table `my_home` */

/*Table structure for table `my_invitation` */

DROP TABLE IF EXISTS `my_invitation`;

CREATE TABLE `my_invitation` (
  `id` varchar(36) NOT NULL COMMENT '主键ID',
  `title` varchar(20) NOT NULL COMMENT '帖子标题',
  `sub_context` varchar(25) NOT NULL COMMENT '帖子副标题',
  `context` varchar(2000) NOT NULL COMMENT '帖子内容',
  `STATUS` int(2) NOT NULL DEFAULT '0' COMMENT '帖子状态 0-代审核，-1-已删除 1-已发布 2-热门 3-精品',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `img` varchar(20) DEFAULT NULL COMMENT '插画',
  `u_number` int(5) NOT NULL DEFAULT '1' COMMENT '浏览数量',
  `u_praise` int(5) NOT NULL DEFAULT '1' COMMENT '点赞数量',
  PRIMARY KEY (`id`),
  KEY `index_code` (`title`,`sub_context`,`u_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帖子表';

/*Data for the table `my_invitation` */

insert  into `my_invitation`(`id`,`title`,`sub_context`,`context`,`STATUS`,`create_time`,`img`,`u_number`,`u_praise`) values ('069b8a344dc84723b0a871eabb296e2b','sfsa','asdf','sdfsf',0,NULL,NULL,1,1),('0705faf6c84d49939bde09fbec67dd4a','ttt','tttt','<p>\r\n	ttttt\r\n</p>\r\n<p>\r\n	tttt\r\n</p>\r\n<p>\r\n	ttttt\r\n</p>\r\n<p>\r\n	tttttttt\r\n</p>\r\n<p>\r\n	tttt\r\n</p>',0,'2017-10-22 16:23:29',NULL,1,1),('357b8f81b64211e78b50f8a96332c90f','PHP操作Session和Cookie','我们跟踪用户信息时需','我们跟踪用户信息时需要用到Session和Cookie，比如用户登录验证、记录用户浏览历史，存储购物车数据，限制用户会话有效时间等。今天我们来了解下PHP是如何操作Session和Cookie的。',2,'2017-10-21 17:27:33',NULL,1,1),('5fdd59eaf71947cc8acd76f0f44dda34','asdfsdf','asdf','asdfasdf',2,NULL,NULL,1,1),('72e28e47b64211e78b50f8a96332c90f','jQuery数字加减插件','我们在','我们在网上购物提交订单时，在网页上一般会有一个选择数量的控件，要求买家选择购买商品的件数，开发者会把该控件做成可以通过点击实现加减等微调操作，当然也可以直接输入数字件数。本文将介绍常见的几种使用spinner数字微调器来实现数字加减的功能的方法。',2,'2017-10-21 17:29:16',NULL,1,1),('7c4fe18f0c484d728467afcd4dea337f','test','test','<p>\r\n	test\r\n</p>',0,'2017-10-22 16:21:42',NULL,1,1),('85a6159bb64211e78b50f8a96332c90f','收集整理的非常有用的PHP函数','项目中经常会需要一些让人头疼的函数，','项目中经常会需要一些让人头疼的函数，作为开发者应该整理一个自己的函数库，在需要之时复制过来即可。本文作者收集整理数十个PHP项目中常用的函数，保证能正常运行，你只要复制粘贴到你项目中即可。',2,'2017-10-21 17:29:47',NULL,1,1),('dceb25ac6e1a49bb96f13498d0dbf14f','asdfsdfas','asdf','asdf',0,NULL,NULL,1,1),('de030f34b64111e78b50f8a96332c90f','HTML5+CSS3响应式垂直时间轴','网页时间轴一般用','网页时间轴一般用于展示以时间为主线的事件，如企业网站常见的公司发展历程等。本文将给大家介绍一款基于HTML5和CSS3的漂亮的垂直时间轴，它可以响应页面布局，适用于HTML5开发的PC和移动手机WEB应用。',2,'2017-10-21 17:25:06',NULL,1,1),('ffa238b4b64111e78b50f8a96332c90f','jQuery+PHP动态数字展示效果','我们在一些应用中需等，','我们在一些应用中需要动态展示数据，比如当前在线人数，当前交易总额，当前汇率等等，前端页面需要实时刷新获取最新数据。本文将结合实例给大家介绍使用jQuery和PHP来实现动态数字展示效果。',2,'2017-10-21 17:26:02',NULL,1,1);

/*Table structure for table `my_labels` */

DROP TABLE IF EXISTS `my_labels`;

CREATE TABLE `my_labels` (
  `id` varchar(36) NOT NULL COMMENT '标签ID',
  `name` varchar(10) NOT NULL COMMENT '标签名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签表';

/*Data for the table `my_labels` */

insert  into `my_labels`(`id`,`name`) values ('2de77f31fc8e415da53c9007d9ea61f2','sadfasf'),('3308334071014ecfa8f584317d71115a','asdfsf'),('3a50c64017af48bd9687f956d9cebc2b','js'),('80a23f46219449bd8f9f5ab471e97e89','java');

/*Table structure for table `my_node` */

DROP TABLE IF EXISTS `my_node`;

CREATE TABLE `my_node` (
  `id` varchar(36) NOT NULL COMMENT '主键ID',
  `title` varchar(30) NOT NULL COMMENT '日记标题',
  `context` varchar(500) NOT NULL COMMENT '日记内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日记表';

/*Data for the table `my_node` */

insert  into `my_node`(`id`,`title`,`context`,`create_time`) values ('57507508b6d711e78b50f8a96332c90f','我是一只小青蛙','Do大神发达 this technological terror you&acuteve constructed. The ability to destroy a planet is insignificant next to the power of the Force. The plans you refer to will soon be back in our hands. A tremor in the Force. The last time I felt it was in the presence of my old master. Escape is not his plan. I must face him. Alone.','2017-10-22 11:14:55'),('94597195b6d711e78b50f8a96332c90f','I aint shooting','Ha, didnt even stay for the wedding. Just took his million spacebucks and ran. And you will not call me you. You will never address me as you. You will call me your royal highness. I really must go back. I shouldnt have run away. I realize now that love is one luxury a princess cannot afford.','2017-10-22 11:16:37'),('a27f3b5d83384818bc374bc54d59a8f6','asfas','asfasdf','2017-10-17 14:29:36'),('cdd144deb6d711e78b50f8a96332c90f','My brains ','Were done with you. Go back to the golf coSo, Lone Star, now you see that evil will always triumph because good is dumb. ','2017-10-22 11:18:14'),('ff4dacfab6d711e78b50f8a96332c90f','Wouldlling me that?','You make it so difficult sometimes. You have your moments. Not many of them, but you do have them. Youre not actually going IN to an asteroid field? I happen to like nice men. This bucket of boltss never gonna get us past that blockade. Were going to get pulverized if we stay out here much longer. Evacuate remaining ground staff.','2017-10-22 11:19:37');

/*Table structure for table `my_role` */

DROP TABLE IF EXISTS `my_role`;

CREATE TABLE `my_role` (
  `id` varchar(36) NOT NULL COMMENT '角色Id',
  `name` varchar(20) NOT NULL COMMENT '角色名',
  `role_code` varchar(20) DEFAULT NULL COMMENT '角色简码',
  `description` varchar(20) NOT NULL COMMENT '角色简介',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `index_code` (`role_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `my_role` */

insert  into `my_role`(`id`,`name`,`role_code`,`description`) values ('4352095c896949fead685c0628cb7e32','test','test','test'),('48d58ce0a26911e787bcf8a96332c90f','超级管理员','root','拥有所有权限'),('75c63ff40ad84dd5926b90683b27b5ce','学生','student','学生拥有的权限'),('af5108f9a29f11e787bcf8a96332c90f','管理员','admin','具有大部分权限');

/*Table structure for table `my_type` */

DROP TABLE IF EXISTS `my_type`;

CREATE TABLE `my_type` (
  `id` varchar(36) NOT NULL COMMENT '类别ID',
  `name` varchar(10) NOT NULL COMMENT '类别名',
  `ocode` int(2) NOT NULL DEFAULT '0' COMMENT '排序方式',
  PRIMARY KEY (`id`),
  KEY `index_code` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类别表';

/*Data for the table `my_type` */

/*Table structure for table `my_user` */

DROP TABLE IF EXISTS `my_user`;

CREATE TABLE `my_user` (
  `id` varchar(36) NOT NULL COMMENT '用户id',
  `name` varchar(10) DEFAULT NULL COMMENT '用户昵称',
  `login_name` varchar(10) NOT NULL COMMENT '用户名',
  `password` varchar(36) NOT NULL COMMENT '密码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `login_time` date NOT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`,`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `my_user` */

insert  into `my_user`(`id`,`name`,`login_name`,`password`,`create_time`,`login_time`) values ('1b161ef0a26911e787bcf8a96332c90f','user','user','e10adc3949ba59abbe56e057f20f883e','2017-09-26 11:13:50','2017-09-26'),('fd36c404b56211e78b50f8a96332c90f','admin','admin','e10adc3949ba59abbe56e057f20f883e','2017-10-20 14:50:04','2017-10-20');

/*Table structure for table `roletoauth` */

DROP TABLE IF EXISTS `roletoauth`;

CREATE TABLE `roletoauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `role_id` varchar(36) NOT NULL COMMENT '角色Id',
  `auth_id` varchar(36) NOT NULL COMMENT '权限Id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_id` (`role_id`,`auth_id`),
  KEY `FK_AUTH_ROLE` (`auth_id`),
  CONSTRAINT `FK_AUTH_ROLE` FOREIGN KEY (`auth_id`) REFERENCES `my_auth` (`id`),
  CONSTRAINT `FK_ROLE_AUTH` FOREIGN KEY (`role_id`) REFERENCES `my_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='角色权限表';

/*Data for the table `roletoauth` */

insert  into `roletoauth`(`id`,`role_id`,`auth_id`) values (85,'4352095c896949fead685c0628cb7e32','2ad68ae4a26811e787bcf8a96332c90f'),(86,'4352095c896949fead685c0628cb7e32','2ae46821a26811e787bcf8a96332c90f'),(87,'4352095c896949fead685c0628cb7e32','2ae97754a26811e787bcf8a96332c90f'),(88,'4352095c896949fead685c0628cb7e32','2aec2504a26811e787bcf8a96332c90f'),(79,'4352095c896949fead685c0628cb7e32','37d432b0a26711e787bcf8a96332c90f'),(84,'4352095c896949fead685c0628cb7e32','404398e4a26711e787bcf8a96332c90f'),(96,'4352095c896949fead685c0628cb7e32','404d9086a26711e787bcf8a96332c90f'),(101,'4352095c896949fead685c0628cb7e32','4050f557a26711e787bcf8a96332c90f'),(102,'4352095c896949fead685c0628cb7e32','40547ceaa26711e787bcf8a96332c90f'),(103,'4352095c896949fead685c0628cb7e32','4057c5b7a26711e787bcf8a96332c90f'),(78,'4352095c896949fead685c0628cb7e32','4d7e13b3ad9211e7aca8f8a96332c90f'),(90,'4352095c896949fead685c0628cb7e32','4f12a850a26811e787bcf8a96332c90f'),(91,'4352095c896949fead685c0628cb7e32','4f4b83b5a26811e787bcf8a96332c90f'),(92,'4352095c896949fead685c0628cb7e32','4f4f0117a26811e787bcf8a96332c90f'),(93,'4352095c896949fead685c0628cb7e32','4f525e3ea26811e787bcf8a96332c90f'),(94,'4352095c896949fead685c0628cb7e32','6085ace0ad9211e7aca8f8a96332c90f'),(97,'4352095c896949fead685c0628cb7e32','77934a66a26811e787bcf8a96332c90f'),(98,'4352095c896949fead685c0628cb7e32','779d726fa26811e787bcf8a96332c90f'),(99,'4352095c896949fead685c0628cb7e32','77a0cbe3a26811e787bcf8a96332c90f'),(100,'4352095c896949fead685c0628cb7e32','77a55616a26811e787bcf8a96332c90f'),(77,'4352095c896949fead685c0628cb7e32','a3fcb2d9a26511e787bcf8a96332c90f'),(80,'4352095c896949fead685c0628cb7e32','a63a691aa26711e787bcf8a96332c90f'),(81,'4352095c896949fead685c0628cb7e32','a67920eca26711e787bcf8a96332c90f'),(82,'4352095c896949fead685c0628cb7e32','ab90f230a26711e787bcf8a96332c90f'),(83,'4352095c896949fead685c0628cb7e32','ab9954cba26711e787bcf8a96332c90f'),(89,'4352095c896949fead685c0628cb7e32','ed339dbda26511e787bcf8a96332c90f'),(13,'48d58ce0a26911e787bcf8a96332c90f','2ad68ae4a26811e787bcf8a96332c90f'),(14,'48d58ce0a26911e787bcf8a96332c90f','2ae46821a26811e787bcf8a96332c90f'),(16,'48d58ce0a26911e787bcf8a96332c90f','2ae97754a26811e787bcf8a96332c90f'),(17,'48d58ce0a26911e787bcf8a96332c90f','37d432b0a26711e787bcf8a96332c90f'),(72,'75c63ff40ad84dd5926b90683b27b5ce','404d9086a26711e787bcf8a96332c90f'),(71,'75c63ff40ad84dd5926b90683b27b5ce','6085ace0ad9211e7aca8f8a96332c90f'),(73,'75c63ff40ad84dd5926b90683b27b5ce','77934a66a26811e787bcf8a96332c90f'),(74,'75c63ff40ad84dd5926b90683b27b5ce','779d726fa26811e787bcf8a96332c90f'),(75,'75c63ff40ad84dd5926b90683b27b5ce','77a0cbe3a26811e787bcf8a96332c90f'),(76,'75c63ff40ad84dd5926b90683b27b5ce','77a55616a26811e787bcf8a96332c90f'),(70,'75c63ff40ad84dd5926b90683b27b5ce','a3fcb2d9a26511e787bcf8a96332c90f');

/*Table structure for table `usertorole` */

DROP TABLE IF EXISTS `usertorole`;

CREATE TABLE `usertorole` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(36) NOT NULL COMMENT '用户ID',
  `role_id` varchar(36) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`role_id`),
  KEY `FK_ROLE_USER` (`role_id`),
  CONSTRAINT `FK_ROLE_USER` FOREIGN KEY (`role_id`) REFERENCES `my_role` (`id`),
  CONSTRAINT `FK_USER_ROLE` FOREIGN KEY (`user_id`) REFERENCES `my_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

/*Data for the table `usertorole` */

insert  into `usertorole`(`id`,`user_id`,`role_id`) values (20,'1b161ef0a26911e787bcf8a96332c90f','4352095c896949fead685c0628cb7e32'),(21,'1b161ef0a26911e787bcf8a96332c90f','48d58ce0a26911e787bcf8a96332c90f'),(22,'1b161ef0a26911e787bcf8a96332c90f','af5108f9a29f11e787bcf8a96332c90f'),(15,'fd36c404b56211e78b50f8a96332c90f','48d58ce0a26911e787bcf8a96332c90f'),(16,'fd36c404b56211e78b50f8a96332c90f','75c63ff40ad84dd5926b90683b27b5ce'),(17,'fd36c404b56211e78b50f8a96332c90f','af5108f9a29f11e787bcf8a96332c90f');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
