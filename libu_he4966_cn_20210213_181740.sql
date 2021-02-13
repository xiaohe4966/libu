-- MySQL dump 10.13  Distrib 5.6.49, for Linux (x86_64)
--
-- Host: localhost    Database: libu_he4966_cn
-- ------------------------------------------------------
-- Server version	5.6.49-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `lb_admin`
--

DROP TABLE IF EXISTS `lb_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '昵称',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_admin`
--

LOCK TABLES `lb_admin` WRITE;
/*!40000 ALTER TABLE `lb_admin` DISABLE KEYS */;
INSERT INTO `lb_admin` VALUES (1,'admin','Admin','aac8ac903297e7df4a39922d00411e00','f3690b','/assets/img/avatar.png','496631085@qq.com',0,1612941708,'112.19.123.230',1492186163,1612941708,'15152e01-a43b-4b52-97a8-ada571a44b99','normal'),(2,'test','测试账号','062eb12ce65bed93f847c8d25d330b65','IA53Mr','/assets/img/avatar.png','16794660@qq.com',0,1613058904,'113.92.129.145',1612780243,1613058904,'5d81f8ea-4856-4e85-949b-4c7be5efbf5e','normal'),(3,'xiaohe','xiaohe','edfd18aa08977c0e5fa3acc6fc1ce96f','ZFtWsV','/assets/img/avatar.png','49310@11.com',0,1613104738,'112.19.123.230',1612847259,1613104738,'8458ef56-fa35-4d57-9d5e-61ffa0195d64','normal');
/*!40000 ALTER TABLE `lb_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_admin_log`
--

DROP TABLE IF EXISTS `lb_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '日志标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_admin_log`
--

LOCK TABLES `lb_admin_log` WRITE;
/*!40000 ALTER TABLE `lb_admin_log` DISABLE KEYS */;
INSERT INTO `lb_admin_log` VALUES (150,3,'xiaohe','/a.php/index/login?url=%2Fa.php%2Flibu%3Fref%3Daddtabs','登录','{\"url\":\"\\/a.php\\/libu?ref=addtabs\",\"__token__\":\"***\",\"username\":\"xiaohe\",\"password\":\"***\",\"captcha\":\"z4j7\"}','112.19.123.230','Mozilla/5.0 (Macintosh; Intel Mac OS X 11_1_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36',1612941027),(151,1,'admin','/a.php/index/login?url=%2Fa.php%2Fgeneral%2Fconfig%3Faddtabs%3D1','登录','{\"url\":\"\\/a.php\\/general\\/config?addtabs=1\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"jwka\"}','112.19.123.230','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.2 Safari/605.1.15',1612941708),(152,1,'admin','/a.php/general.config/edit','常规管理 / 系统配置 / 编辑','{\"__token__\":\"***\",\"row\":{\"name\":\"礼簿管理系统\",\"beian\":\"蜀ICP备2020032960号-1\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{&quot;backend&quot;:&quot;zh-cn&quot;,&quot;frontend&quot;:&quot;zh-cn&quot;}\",\"fixedpage\":\"libu\"}}','112.19.123.230','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.2 Safari/605.1.15',1612941734),(153,3,'xiaohe','/a.php/index/login?url=%2Fa.php','登录','{\"url\":\"\\/a.php\",\"__token__\":\"***\",\"username\":\"xiaohe\",\"password\":\"***\",\"captcha\":\"p2rs\",\"keeplogin\":\"1\"}','112.19.123.230','Mozilla/5.0 (Linux; Android 9; MI 6 Build/PKQ1.190118.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.120 MQQBrowser/6.2 TBS/045513 Mobile Safari/537.36 MMWEBID/3025 MicroMessenger/8.0.1.1841(0x28000151) Process/tools WeChat/a',1612942026),(154,0,'Unknown','/a.php/index/login','','{\"__token__\":\"***\",\"username\":\"\",\"password\":\"***\",\"captcha\":\"\"}','112.19.123.230','Mozilla/5.0 (Linux; Android 9; MI 6 Build/PKQ1.190118.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.120 MQQBrowser/6.2 TBS/045513 Mobile Safari/537.36 MMWEBID/3025 MicroMessenger/8.0.1.1841(0x28000151) Process/tools WeChat/a',1612942045),(155,3,'xiaohe','/a.php/index/login?url=%2Fa.php%2Findex%2Findex','登录','{\"url\":\"\\/a.php\\/index\\/index\",\"__token__\":\"***\",\"username\":\"xiaohe\",\"password\":\"***\",\"captcha\":\"hexc\",\"keeplogin\":\"1\"}','112.19.123.230','Mozilla/5.0 (Linux; Android 9; MI 6 Build/PKQ1.190118.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.120 MQQBrowser/6.2 TBS/045513 Mobile Safari/537.36 MMWEBID/3025 MicroMessenger/8.0.1.1841(0x28000151) Process/tools WeChat/a',1612942142),(156,3,'xiaohe','/a.php/index/login?url=%2Fa.php','登录','{\"url\":\"\\/a.php\",\"__token__\":\"***\",\"username\":\"xiaohe\",\"password\":\"***\",\"captcha\":\"sqjy\",\"keeplogin\":\"1\"}','112.19.123.230','Mozilla/5.0 (Linux; U; Android 9; zh-CN; MI 6 Build/PKQ1.190118.001) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/78.0.3904.108 UCBrowser/13.2.3.1103 Mobile Safari/537.36',1612942223),(157,3,'xiaohe','/a.php/ajax/upload','','[]','112.19.123.230','Mozilla/5.0 (Linux; U; Android 9; zh-CN; MI 6 Build/PKQ1.190118.001) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/78.0.3904.108 UCBrowser/13.2.3.1103 Mobile Safari/537.36',1612942353),(158,3,'xiaohe','/a.php/type/edit/ids/5?dialog=1','事项管理 / 编辑','{\"dialog\":\"1\",\"row\":{\"type_name\":\"满月宴\",\"status\":\"1\"},\"ids\":\"5\"}','112.19.123.230','Mozilla/5.0 (Linux; U; Android 9; zh-CN; MI 6 Build/PKQ1.190118.001) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/78.0.3904.108 UCBrowser/13.2.3.1103 Mobile Safari/537.36',1612942472),(159,3,'xiaohe','/a.php/type/edit/ids/5?dialog=1','事项管理 / 编辑','{\"dialog\":\"1\",\"row\":{\"type_name\":\"满月宴\",\"status\":\"1\"},\"ids\":\"5\"}','112.19.123.230','Mozilla/5.0 (Linux; U; Android 9; zh-CN; MI 6 Build/PKQ1.190118.001) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/78.0.3904.108 UCBrowser/13.2.3.1103 Mobile Safari/537.36',1612942479),(160,0,'Unknown','/a.php/index/login?url=%2Fa.php','','{\"url\":\"\\/a.php\",\"__token__\":\"***\",\"username\":\"test\",\"password\":\"***\",\"captcha\":\"2pc0\"}','39.180.45.23','Mozilla/5.0 (Linux; Android 11; XT2125-4 Build/RRN31.Q1-20-17-6; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.120 MQQBrowser/6.2 TBS/045514 Mobile Safari/537.36 V1_AND_SQ_8.5.5_1630_YYB_D A_8050500 QQ/8.5.5.5105 NetType/WIFI Web',1613037030),(161,2,'test','/a.php/index/login?url=%2Fa.php','登录','{\"url\":\"\\/a.php\",\"__token__\":\"***\",\"username\":\"test\",\"password\":\"***\",\"captcha\":\"zdyr\"}','39.180.45.23','Mozilla/5.0 (Linux; Android 11; XT2125-4 Build/RRN31.Q1-20-17-6; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.120 MQQBrowser/6.2 TBS/045514 Mobile Safari/537.36 V1_AND_SQ_8.5.5_1630_YYB_D A_8050500 QQ/8.5.5.5105 NetType/WIFI Web',1613037041),(162,0,'Unknown','/a.php/index/login?url=%2Fa.php','','{\"url\":\"\\/a.php\",\"__token__\":\"***\",\"username\":\"xiaohe\",\"password\":\"***\",\"captcha\":\"p8qp\",\"keeplogin\":\"1\"}','112.19.123.230','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36',1613057378),(163,3,'xiaohe','/a.php/index/login?url=%2Fa.php','登录','{\"url\":\"\\/a.php\",\"__token__\":\"***\",\"username\":\"xiaohe\",\"password\":\"***\",\"captcha\":\"swj3\",\"keeplogin\":\"1\"}','112.19.123.230','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36',1613057386),(164,3,'xiaohe','/a.php/type/edit/ids/5?dialog=1','事项管理 / 编辑','{\"dialog\":\"1\",\"row\":{\"type_name\":\"满月宴 平昌\",\"status\":\"1\"},\"ids\":\"5\"}','112.19.123.230','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36',1613057424),(165,3,'xiaohe','/a.php/type/edit/ids/6?dialog=1','事项管理 / 编辑','{\"dialog\":\"1\",\"row\":{\"type_name\":\"满月宴 巴中\",\"status\":\"1\"},\"ids\":\"6\"}','112.19.123.230','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36',1613057447),(166,3,'xiaohe','/a.php/libu/add?dialog=1','礼簿记录 / 添加','{\"dialog\":\"1\",\"row\":{\"type_id\":\"6\",\"name\":\"王小英\",\"money\":\"500\",\"weigh\":\"27\",\"ps\":\"现金\",\"state\":\"1\"}}','112.19.123.230','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36',1613057494),(167,3,'xiaohe','/a.php/libu/add?dialog=1','礼簿记录 / 添加','{\"dialog\":\"1\",\"row\":{\"type_id\":\"6\",\"name\":\"何虎\",\"money\":\"1000\",\"weigh\":\"28\",\"ps\":\"现金\",\"state\":\"1\"}}','112.19.123.230','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36',1613057523),(168,3,'xiaohe','/a.php/libu/add?dialog=1','礼簿记录 / 添加','{\"dialog\":\"1\",\"row\":{\"type_id\":\"6\",\"name\":\"何虎\",\"money\":\"1000\",\"weigh\":\"29\",\"ps\":\"妈收\",\"state\":\"1\"}}','112.19.123.230','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36',1613057553),(169,3,'xiaohe','/a.php/libu/add?dialog=1','礼簿记录 / 添加','{\"dialog\":\"1\",\"row\":{\"type_id\":\"6\",\"name\":\"黄俊华\",\"money\":\"300\",\"weigh\":\"30\",\"ps\":\"现金\",\"state\":\"1\"}}','112.19.123.230','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36',1613057589),(170,2,'test','/a.php/index/login?url=%2Fa.php','登录','{\"url\":\"\\/a.php\",\"__token__\":\"***\",\"username\":\"test\",\"password\":\"***\",\"captcha\":\"fxbb\"}','113.92.129.145','Mozilla/5.0 (Linux; Android 10; HLK-AL00 Build/HONORHLK-AL00; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.120 MQQBrowser/6.2 TBS/045514 Mobile Safari/537.36 V1_AND_SQ_8.5.5_1630_YYB_D A_8050500 QQ/8.5.5.5105 NetType/WIFI WebP/0',1613058904),(171,3,'xiaohe','/a.php/index/login?url=%2Fa.php','登录','{\"url\":\"\\/a.php\",\"__token__\":\"***\",\"username\":\"xiaohe\",\"password\":\"***\",\"captcha\":\"jq5n\",\"keeplogin\":\"1\"}','112.19.123.230','Mozilla/5.0 (Linux; Android 10; MI 8 Build/QKQ1.190828.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.120 MQQBrowser/6.2 TBS/045426 Mobile Safari/537.36 V1_AND_SQ_8.5.5_1630_YYB_D A_8050500 QQ/8.5.5.5105 NetType/WIFI WebP/0.3',1613104738),(172,3,'xiaohe','/a.php/libu/add?dialog=1','礼簿记录 / 添加','{\"dialog\":\"1\",\"row\":{\"type_id\":\"6\",\"name\":\"婆婆\",\"money\":\"1000\",\"weigh\":\"31\",\"ps\":\"现金\",\"state\":\"1\"}}','112.19.123.230','Mozilla/5.0 (Linux; Android 10; MI 8 Build/QKQ1.190828.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.120 MQQBrowser/6.2 TBS/045426 Mobile Safari/537.36 V1_AND_SQ_8.5.5_1630_YYB_D A_8050500 QQ/8.5.5.5105 NetType/WIFI WebP/0.3',1613104780);
/*!40000 ALTER TABLE `lb_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_area`
--

DROP TABLE IF EXISTS `lb_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_area` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) DEFAULT NULL COMMENT '父id',
  `shortname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '简称',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `mergename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '全称',
  `level` tinyint(4) DEFAULT NULL COMMENT '层级 0 1 2 省市区县',
  `pinyin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '拼音',
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '长途区号',
  `zip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮编',
  `first` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '首字母',
  `lng` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='地区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_area`
--

LOCK TABLES `lb_area` WRITE;
/*!40000 ALTER TABLE `lb_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `lb_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_attachment`
--

DROP TABLE IF EXISTS `lb_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filename` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '文件名称',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_attachment`
--

LOCK TABLES `lb_attachment` WRITE;
/*!40000 ALTER TABLE `lb_attachment` DISABLE KEYS */;
INSERT INTO `lb_attachment` VALUES (1,1,0,'/assets/img/qrcode.png','150','150','png',0,'qrcode.png',21859,'image/png','',1499681848,1499681848,1499681848,'local','17163603d0263e4838b9387ff2cd4877e8b018f6'),(2,3,0,'/uploads/20210210/672c35cf56a49fc7d4b10a3f3f2e8b3f.jpg','1080','1920','jpg',0,'1612248800214.jpg',148922,'image/jpeg','',1612942353,1612942353,1612942353,'local','b62b126e2cc098f99c88a7fb5ad008681527b700');
/*!40000 ALTER TABLE `lb_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_auth_group`
--

DROP TABLE IF EXISTS `lb_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '组名',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_auth_group`
--

LOCK TABLES `lb_auth_group` WRITE;
/*!40000 ALTER TABLE `lb_auth_group` DISABLE KEYS */;
INSERT INTO `lb_auth_group` VALUES (1,0,'Admin group','*',1490883540,149088354,'normal'),(2,1,'二级管理组','8,29,30,31,32,33,34,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,2',1490883540,1612848381,'normal'),(3,2,'Third group','',1490883540,1612848381,'normal'),(4,1,'用户账号','29,30,31,32,34,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,8,2',1490883540,1612787178,'normal'),(5,2,'Third group 2','2,8,29,30,31,32,33,34',1490883540,1612848381,'normal');
/*!40000 ALTER TABLE `lb_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_auth_group_access`
--

DROP TABLE IF EXISTS `lb_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_auth_group_access`
--

LOCK TABLES `lb_auth_group_access` WRITE;
/*!40000 ALTER TABLE `lb_auth_group_access` DISABLE KEYS */;
INSERT INTO `lb_auth_group_access` VALUES (1,1),(2,4),(3,4),(6,4),(7,4);
/*!40000 ALTER TABLE `lb_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_auth_rule`
--

DROP TABLE IF EXISTS `lb_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图标',
  `condition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '条件',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_auth_rule`
--

LOCK TABLES `lb_auth_rule` WRITE;
/*!40000 ALTER TABLE `lb_auth_rule` DISABLE KEYS */;
INSERT INTO `lb_auth_rule` VALUES (1,'file',0,'dashboard','Dashboard','fa fa-dashboard','','Dashboard tips',1,1497429920,1497429920,143,'normal'),(2,'file',0,'general','General','fa fa-cogs','','',1,1497429920,1497430169,137,'normal'),(3,'file',0,'category','Category','fa fa-leaf','','Category tips',1,1497429920,1497429920,119,'normal'),(4,'file',0,'addon','Addon','fa fa-rocket','','Addon tips',1,1502035509,1502035509,0,'normal'),(5,'file',0,'auth','Auth','fa fa-group','','',1,1497429920,1497430092,99,'normal'),(6,'file',2,'general/config','Config','fa fa-cog','','Config tips',1,1497429920,1497430683,60,'normal'),(7,'file',2,'general/attachment','Attachment','fa fa-file-image-o','','Attachment tips',1,1497429920,1497430699,53,'normal'),(8,'file',2,'general/profile','Profile','fa fa-user','','',1,1497429920,1497429920,34,'normal'),(9,'file',5,'auth/admin','Admin','fa fa-user','','Admin tips',1,1497429920,1497430320,118,'normal'),(10,'file',5,'auth/adminlog','Admin log','fa fa-list-alt','','Admin log tips',1,1497429920,1497430307,113,'normal'),(11,'file',5,'auth/group','Group','fa fa-group','','Group tips',1,1497429920,1497429920,109,'normal'),(12,'file',5,'auth/rule','Rule','fa fa-bars','','Rule tips',1,1497429920,1497430581,104,'normal'),(13,'file',1,'dashboard/index','View','fa fa-circle-o','','',0,1497429920,1497429920,136,'normal'),(14,'file',1,'dashboard/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,135,'normal'),(15,'file',1,'dashboard/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,133,'normal'),(16,'file',1,'dashboard/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,134,'normal'),(17,'file',1,'dashboard/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,132,'normal'),(18,'file',6,'general/config/index','View','fa fa-circle-o','','',0,1497429920,1497429920,52,'normal'),(19,'file',6,'general/config/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,51,'normal'),(20,'file',6,'general/config/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,50,'normal'),(21,'file',6,'general/config/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,49,'normal'),(22,'file',6,'general/config/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,48,'normal'),(23,'file',7,'general/attachment/index','View','fa fa-circle-o','','Attachment tips',0,1497429920,1497429920,59,'normal'),(24,'file',7,'general/attachment/select','Select attachment','fa fa-circle-o','','',0,1497429920,1497429920,58,'normal'),(25,'file',7,'general/attachment/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,57,'normal'),(26,'file',7,'general/attachment/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,56,'normal'),(27,'file',7,'general/attachment/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,55,'normal'),(28,'file',7,'general/attachment/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,54,'normal'),(29,'file',8,'general/profile/index','View','fa fa-circle-o','','',0,1497429920,1497429920,33,'normal'),(30,'file',8,'general/profile/update','Update profile','fa fa-circle-o','','',0,1497429920,1497429920,32,'normal'),(31,'file',8,'general/profile/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,31,'normal'),(32,'file',8,'general/profile/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,30,'normal'),(33,'file',8,'general/profile/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,29,'normal'),(34,'file',8,'general/profile/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,28,'normal'),(35,'file',3,'category/index','View','fa fa-circle-o','','Category tips',0,1497429920,1497429920,142,'normal'),(36,'file',3,'category/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,141,'normal'),(37,'file',3,'category/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,140,'normal'),(38,'file',3,'category/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,139,'normal'),(39,'file',3,'category/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,138,'normal'),(40,'file',9,'auth/admin/index','View','fa fa-circle-o','','Admin tips',0,1497429920,1497429920,117,'normal'),(41,'file',9,'auth/admin/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,116,'normal'),(42,'file',9,'auth/admin/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,115,'normal'),(43,'file',9,'auth/admin/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,114,'normal'),(44,'file',10,'auth/adminlog/index','View','fa fa-circle-o','','Admin log tips',0,1497429920,1497429920,112,'normal'),(45,'file',10,'auth/adminlog/detail','Detail','fa fa-circle-o','','',0,1497429920,1497429920,111,'normal'),(46,'file',10,'auth/adminlog/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,110,'normal'),(47,'file',11,'auth/group/index','View','fa fa-circle-o','','Group tips',0,1497429920,1497429920,108,'normal'),(48,'file',11,'auth/group/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,107,'normal'),(49,'file',11,'auth/group/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,106,'normal'),(50,'file',11,'auth/group/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,105,'normal'),(51,'file',12,'auth/rule/index','View','fa fa-circle-o','','Rule tips',0,1497429920,1497429920,103,'normal'),(52,'file',12,'auth/rule/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,102,'normal'),(53,'file',12,'auth/rule/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,101,'normal'),(54,'file',12,'auth/rule/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,100,'normal'),(55,'file',4,'addon/index','View','fa fa-circle-o','','Addon tips',0,1502035509,1502035509,0,'normal'),(56,'file',4,'addon/add','Add','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(57,'file',4,'addon/edit','Edit','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(58,'file',4,'addon/del','Delete','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(59,'file',4,'addon/downloaded','Local addon','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(60,'file',4,'addon/state','Update state','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(63,'file',4,'addon/config','Setting','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(64,'file',4,'addon/refresh','Refresh','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(65,'file',4,'addon/multi','Multi','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(66,'file',0,'user','User','fa fa-list','','',1,1516374729,1516374729,0,'normal'),(67,'file',66,'user/user','User','fa fa-user','','',1,1516374729,1516374729,0,'normal'),(68,'file',67,'user/user/index','View','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(69,'file',67,'user/user/edit','Edit','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(70,'file',67,'user/user/add','Add','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(71,'file',67,'user/user/del','Del','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(72,'file',67,'user/user/multi','Multi','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(73,'file',66,'user/group','User group','fa fa-users','','',1,1516374729,1516374729,0,'normal'),(74,'file',73,'user/group/add','Add','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(75,'file',73,'user/group/edit','Edit','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(76,'file',73,'user/group/index','View','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(77,'file',73,'user/group/del','Del','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(78,'file',73,'user/group/multi','Multi','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(79,'file',66,'user/rule','User rule','fa fa-circle-o','','',1,1516374729,1516374729,0,'normal'),(80,'file',79,'user/rule/index','View','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(81,'file',79,'user/rule/del','Del','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(82,'file',79,'user/rule/add','Add','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(83,'file',79,'user/rule/edit','Edit','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(84,'file',79,'user/rule/multi','Multi','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(85,'file',0,'command','在线命令管理','fa fa-terminal','','',1,1612705958,1612705958,0,'normal'),(86,'file',85,'command/index','查看','fa fa-circle-o','','',0,1612705958,1612705958,0,'normal'),(87,'file',85,'command/add','添加','fa fa-circle-o','','',0,1612705958,1612705958,0,'normal'),(88,'file',85,'command/detail','详情','fa fa-circle-o','','',0,1612705958,1612705958,0,'normal'),(89,'file',85,'command/execute','运行','fa fa-circle-o','','',0,1612705958,1612705958,0,'normal'),(90,'file',85,'command/del','删除','fa fa-circle-o','','',0,1612705958,1612705958,0,'normal'),(91,'file',85,'command/multi','批量更新','fa fa-circle-o','','',0,1612705958,1612705958,0,'normal'),(92,'file',0,'type','事项管理','fa fa-circle-o','','',1,1612761830,1612761830,0,'normal'),(93,'file',92,'type/import','Import','fa fa-circle-o','','',0,1612761830,1612761830,0,'normal'),(94,'file',92,'type/index','查看','fa fa-circle-o','','',0,1612761830,1612761830,0,'normal'),(95,'file',92,'type/add','添加','fa fa-circle-o','','',0,1612761830,1612761830,0,'normal'),(96,'file',92,'type/edit','编辑','fa fa-circle-o','','',0,1612761830,1612761830,0,'normal'),(97,'file',92,'type/del','删除','fa fa-circle-o','','',0,1612761830,1612761830,0,'normal'),(98,'file',92,'type/multi','批量更新','fa fa-circle-o','','',0,1612761830,1612761830,0,'normal'),(99,'file',0,'libu','礼簿记录','fa fa-circle-o','','',1,1612761934,1612761934,0,'normal'),(100,'file',99,'libu/import','Import','fa fa-circle-o','','',0,1612761934,1612761934,0,'normal'),(101,'file',99,'libu/index','查看','fa fa-circle-o','','',0,1612761934,1612761934,0,'normal'),(102,'file',99,'libu/recyclebin','回收站','fa fa-circle-o','','',0,1612761934,1612761934,0,'normal'),(103,'file',99,'libu/add','添加','fa fa-circle-o','','',0,1612761934,1612761934,0,'normal'),(104,'file',99,'libu/edit','编辑','fa fa-circle-o','','',0,1612761934,1612761934,0,'normal'),(105,'file',99,'libu/del','删除','fa fa-circle-o','','',0,1612761934,1612761934,0,'normal'),(106,'file',99,'libu/destroy','真实删除','fa fa-circle-o','','',0,1612761934,1612761934,0,'normal'),(107,'file',99,'libu/restore','还原','fa fa-circle-o','','',0,1612761934,1612761934,0,'normal'),(108,'file',99,'libu/multi','批量更新','fa fa-circle-o','','',0,1612761934,1612761934,0,'normal');
/*!40000 ALTER TABLE `lb_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_category`
--

DROP TABLE IF EXISTS `lb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `flag` set('hot','index','recommend') COLLATE utf8mb4_unicode_ci DEFAULT '',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '关键字',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_category`
--

LOCK TABLES `lb_category` WRITE;
/*!40000 ALTER TABLE `lb_category` DISABLE KEYS */;
INSERT INTO `lb_category` VALUES (1,0,'page','官方新闻','news','recommend','/assets/img/qrcode.png','','','news',1495262190,1495262190,1,'normal'),(2,0,'page','移动应用','mobileapp','hot','/assets/img/qrcode.png','','','mobileapp',1495262244,1495262244,2,'normal'),(3,2,'page','微信公众号','wechatpublic','index','/assets/img/qrcode.png','','','wechatpublic',1495262288,1495262288,3,'normal'),(4,2,'page','Android开发','android','recommend','/assets/img/qrcode.png','','','android',1495262317,1495262317,4,'normal'),(5,0,'page','软件产品','software','recommend','/assets/img/qrcode.png','','','software',1495262336,1499681850,5,'normal'),(6,5,'page','网站建站','website','recommend','/assets/img/qrcode.png','','','website',1495262357,1495262357,6,'normal'),(7,5,'page','企业管理软件','company','index','/assets/img/qrcode.png','','','company',1495262391,1495262391,7,'normal'),(8,6,'page','PC端','website-pc','recommend','/assets/img/qrcode.png','','','website-pc',1495262424,1495262424,8,'normal'),(9,6,'page','移动端','website-mobile','recommend','/assets/img/qrcode.png','','','website-mobile',1495262456,1495262456,9,'normal'),(10,7,'page','CRM系统 ','company-crm','recommend','/assets/img/qrcode.png','','','company-crm',1495262487,1495262487,10,'normal'),(11,7,'page','SASS平台软件','company-sass','recommend','/assets/img/qrcode.png','','','company-sass',1495262515,1495262515,11,'normal'),(12,0,'test','测试1','test1','recommend','/assets/img/qrcode.png','','','test1',1497015727,1497015727,12,'normal'),(13,0,'test','测试2','test2','recommend','/assets/img/qrcode.png','','','test2',1497015738,1497015738,13,'normal');
/*!40000 ALTER TABLE `lb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_command`
--

DROP TABLE IF EXISTS `lb_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_command` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型',
  `params` varchar(1500) NOT NULL DEFAULT '' COMMENT '参数',
  `command` varchar(1500) NOT NULL DEFAULT '' COMMENT '命令',
  `content` text COMMENT '返回结果',
  `executetime` int(10) unsigned DEFAULT NULL COMMENT '执行时间',
  `createtime` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `status` enum('successed','failured') NOT NULL DEFAULT 'failured' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='在线命令表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_command`
--

LOCK TABLES `lb_command` WRITE;
/*!40000 ALTER TABLE `lb_command` DISABLE KEYS */;
INSERT INTO `lb_command` VALUES (1,'crud','[\"--force=1\",\"--table=lb_type\",\"--fields=id,type_name,status\"]','php think crud --force=1 --table=lb_type --fields=id,type_name,status','Build Successed',1612761820,1612761820,1612761820,'successed'),(2,'menu','[\"--controller=Type\"]','php think menu --controller=Type','Build Successed!',1612761830,1612761830,1612761830,'successed'),(3,'crud','[\"--force=1\",\"--table=lb_libu\",\"--fields=id,name,createtime,weigh,ps,state\",\"--relation=lb_type\",\"--relationmode=belongsto\",\"--relationforeignkey=type_id\",\"--relationprimarykey=id\",\"--relationfields=type_name\"]','php think crud --force=1 --table=lb_libu --fields=id,name,createtime,weigh,ps,state --relation=lb_type --relationmode=belongsto --relationforeignkey=type_id --relationprimarykey=id --relationfields=type_name','Build Successed',1612761922,1612761922,1612761922,'successed'),(4,'menu','[\"--controller=Libu\"]','php think menu --controller=Libu','Build Successed!',1612761934,1612761934,1612761934,'successed'),(5,'crud','[\"--force=1\",\"--table=lb_libu\",\"--fields=id,name,createtime,weigh,ps,state,money\",\"--relation=lb_type\",\"--relationmode=belongsto\",\"--relationforeignkey=type_id\",\"--relationprimarykey=id\",\"--relationfields=type_name\"]','php think crud --force=1 --table=lb_libu --fields=id,name,createtime,weigh,ps,state,money --relation=lb_type --relationmode=belongsto --relationforeignkey=type_id --relationprimarykey=id --relationfields=type_name','Build Successed',1612830579,1612830579,1612830579,'successed'),(6,'crud','[\"--force=1\",\"--table=lb_type\"]','php think crud --force=1 --table=lb_type','Build Successed',1612848602,1612848602,1612848602,'successed'),(7,'crud','[\"--force=1\",\"--table=lb_libu\",\"--fields=id,admin_id,type_id,name,money,createtime,weigh,ps,state\",\"--relation=lb_type\",\"--relationmode=belongsto\",\"--relationforeignkey=type_id\",\"--relationprimarykey=id\",\"--relationfields=type_name\"]','php think crud --force=1 --table=lb_libu --fields=id,admin_id,type_id,name,money,createtime,weigh,ps,state --relation=lb_type --relationmode=belongsto --relationforeignkey=type_id --relationprimarykey=id --relationfields=type_name','Build Successed',1612848980,1612848980,1612848980,'successed'),(8,'crud','[\"--force=1\",\"--table=lb_libu\",\"--fields=id,admin_id,type_id,name,money,createtime,weigh,ps,state\",\"--relation=lb_type\",\"--relationmode=belongsto\",\"--relationforeignkey=type_id\",\"--relationprimarykey=id\",\"--relationfields=type_name\"]','php think crud --force=1 --table=lb_libu --fields=id,admin_id,type_id,name,money,createtime,weigh,ps,state --relation=lb_type --relationmode=belongsto --relationforeignkey=type_id --relationprimarykey=id --relationfields=type_name','Build Successed',1612849180,1612849180,1612849180,'successed');
/*!40000 ALTER TABLE `lb_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_config`
--

DROP TABLE IF EXISTS `lb_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '变量名',
  `group` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '分组',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text COLLATE utf8mb4_unicode_ci COMMENT '变量值',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '变量字典数据',
  `rule` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '扩展属性',
  `setting` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '配置',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_config`
--

LOCK TABLES `lb_config` WRITE;
/*!40000 ALTER TABLE `lb_config` DISABLE KEYS */;
INSERT INTO `lb_config` VALUES (1,'name','basic','Site name','请填写站点名称','string','礼簿管理系统','','required','',NULL),(2,'beian','basic','Beian','粤ICP备15000000号-1','string','蜀ICP备2020032960号-1','','','',NULL),(3,'cdnurl','basic','Cdn url','如果全站静态资源使用第三方云储存请配置该值','string','','','','',NULL),(4,'version','basic','Version','如果静态资源有变动请重新配置该值','string','1.0.1','','required','',NULL),(5,'timezone','basic','Timezone','','string','Asia/Shanghai','','required','',NULL),(6,'forbiddenip','basic','Forbidden ip','一行一条记录','text','','','','',NULL),(7,'languages','basic','Languages','','array','{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}','','required','',NULL),(8,'fixedpage','basic','Fixed page','请尽量输入左侧菜单栏存在的链接','string','libu','','required','',NULL),(9,'categorytype','dictionary','Category type','','array','{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}','','','',''),(10,'configgroup','dictionary','Config group','','array','{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}','','','',''),(11,'mail_type','email','Mail type','选择邮件发送方式','select','1','[\"请选择\",\"SMTP\"]','','',''),(12,'mail_smtp_host','email','Mail smtp host','错误的配置发送邮件会导致服务器超时','string','smtp.qq.com','','','',''),(13,'mail_smtp_port','email','Mail smtp port','(不加密默认25,SSL默认465,TLS默认587)','string','465','','','',''),(14,'mail_smtp_user','email','Mail smtp user','（填写完整用户名）','string','10000','','','',''),(15,'mail_smtp_pass','email','Mail smtp password','（填写您的密码或授权码）','string','password','','','',''),(16,'mail_verify_type','email','Mail vertify type','（SMTP验证方式[推荐SSL]）','select','2','[\"无\",\"TLS\",\"SSL\"]','','',''),(17,'mail_from','email','Mail from','','string','10000@qq.com','','','','');
/*!40000 ALTER TABLE `lb_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_ems`
--

DROP TABLE IF EXISTS `lb_ems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '事件',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮箱验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_ems`
--

LOCK TABLES `lb_ems` WRITE;
/*!40000 ALTER TABLE `lb_ems` DISABLE KEYS */;
/*!40000 ALTER TABLE `lb_ems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_ip`
--

DROP TABLE IF EXISTS `lb_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_ip` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) DEFAULT NULL COMMENT 'Ip地址',
  `time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='限制ip';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_ip`
--

LOCK TABLES `lb_ip` WRITE;
/*!40000 ALTER TABLE `lb_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `lb_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_libu`
--

DROP TABLE IF EXISTS `lb_libu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_libu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) DEFAULT '0' COMMENT '管理员',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '事项',
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `ps` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `state` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态值:0=加入草稿箱,1=正常,2=特殊',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='礼簿记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_libu`
--

LOCK TABLES `lb_libu` WRITE;
/*!40000 ALTER TABLE `lb_libu` DISABLE KEYS */;
INSERT INTO `lb_libu` VALUES (2,3,5,'陈家国',10000.00,1612799195,1612883567,NULL,1,'','1'),(3,2,3,'小和',600.00,1612850935,1612850935,NULL,3,'备注事项','1'),(4,3,5,'张先',300.00,1612882634,1612882634,NULL,4,'邻居','1'),(5,3,5,'张云峰',300.00,1612882662,1612882662,NULL,5,'光爷爷','1'),(6,3,5,'向中平',700.00,1612882690,1612882690,NULL,6,'大姨夫','1'),(7,3,5,'张继承',300.00,1612882756,1612882756,NULL,7,'大姨二女婿','1'),(8,3,5,'张耀进',300.00,1612882788,1612882788,NULL,8,'大姨大女婿','1'),(9,3,5,'邱万信',200.00,1612882865,1612882865,NULL,9,'邱英的爸','1'),(10,3,5,'陈友缘',300.00,1612882908,1612882908,NULL,10,'二爹','1'),(11,3,5,'陈家平',500.00,1612882947,1612882947,NULL,11,'三爷爷的儿子  大爹','1'),(12,3,5,'陈华',600.00,1612882979,1612882979,NULL,12,'三爹','1'),(13,3,5,'周能华',500.00,1612883014,1612883014,NULL,13,'三爷爷的女婿','1'),(14,3,5,'陈玉群',300.00,1612883041,1612883041,NULL,14,'大姑 代','1'),(15,3,5,'邬德先',500.00,1612883129,1612883129,NULL,15,'幺姑夫  代','1'),(16,3,5,'张曲',1000.00,1612883175,1612883175,NULL,16,'大娘 的女婿','1'),(17,3,5,'陈佳泉',1000.00,1612883231,1612883231,NULL,17,'大爹','1'),(18,3,5,'徐伟元',300.00,1612883277,1612883277,NULL,18,'舅爷爷','1'),(19,3,5,'张兵云',500.00,1612883305,1612883305,NULL,19,'二姑','1'),(20,3,5,'何奎',300.00,1612883326,1612883326,NULL,20,'舅妈的女婿','1'),(21,3,5,'丁绪孝',500.00,1612883385,1612883385,NULL,21,'舅舅','1'),(22,3,5,'徐明华',300.00,1612883438,1612883438,NULL,22,'幺幺  代','1'),(23,3,5,'丁欢',300.00,1612883473,1612883473,NULL,23,'微信','1'),(24,3,5,'保保',500.00,1612883496,1612883496,NULL,24,'微信','1'),(25,3,5,'保保的大儿子',500.00,1612883524,1612883524,NULL,25,'微信','1'),(26,3,5,'保保的二儿子',500.00,1612883544,1612883544,NULL,26,'微信','1'),(27,3,6,'王小英',500.00,1613057494,1613057494,NULL,27,'现金','1'),(28,3,6,'何虎',1000.00,1613057523,1613057523,NULL,28,'现金','1'),(29,3,6,'何虎',1000.00,1613057553,1613057553,NULL,29,'妈收','1'),(30,3,6,'黄俊华',300.00,1613057589,1613057589,NULL,30,'现金','1'),(31,3,6,'婆婆',1000.00,1613104780,1613104780,NULL,31,'现金','1');
/*!40000 ALTER TABLE `lb_libu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_sms`
--

DROP TABLE IF EXISTS `lb_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_sms`
--

LOCK TABLES `lb_sms` WRITE;
/*!40000 ALTER TABLE `lb_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `lb_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_test`
--

DROP TABLE IF EXISTS `lb_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片',
  `images` varchar(1500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '关键字',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '描述',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '省市',
  `json` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='测试表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_test`
--

LOCK TABLES `lb_test` WRITE;
/*!40000 ALTER TABLE `lb_test` DISABLE KEYS */;
INSERT INTO `lb_test` VALUES (1,0,12,'12,13','monday','hot,index','male','music,reading','我是一篇测试文章','<p>我是测试内容</p>','/assets/img/avatar.png','/assets/img/avatar.png,/assets/img/qrcode.png','/assets/img/avatar.png','关键字','描述','广西壮族自治区/百色市/平果县','{\"a\":\"1\",\"b\":\"2\"}',0.00,0,'2017-07-10','2017-07-10 18:24:45',2017,'18:24:45',1499682285,1499682526,1499682526,NULL,0,1,'normal','1');
/*!40000 ALTER TABLE `lb_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_type`
--

DROP TABLE IF EXISTS `lb_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) DEFAULT NULL COMMENT '事项名',
  `admin_id` int(10) unsigned DEFAULT NULL,
  `status` enum('1','0') DEFAULT '0' COMMENT '默认事项:0=未默认,1=默认',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='事项管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_type`
--

LOCK TABLES `lb_type` WRITE;
/*!40000 ALTER TABLE `lb_type` DISABLE KEYS */;
INSERT INTO `lb_type` VALUES (1,'结婚',1,'0'),(2,'满月酒124',1,'1'),(3,'满月宴',2,'1'),(4,'结婚',2,'0'),(5,'满月宴 平昌',3,'0'),(6,'满月宴 巴中',3,'1');
/*!40000 ALTER TABLE `lb_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_user`
--

DROP TABLE IF EXISTS `lb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '昵称',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Token',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  `verification` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_user`
--

LOCK TABLES `lb_user` WRITE;
/*!40000 ALTER TABLE `lb_user` DISABLE KEYS */;
INSERT INTO `lb_user` VALUES (1,1,'admin','admin','e1b577060eaaf10188b9e9992de5a02c','e24717','admin@163.com','13888888888','',0,0,'2017-04-15','',0.00,0,1,1,1516170492,1516171614,'127.0.0.1',0,'127.0.0.1',1491461418,0,1516171614,'','normal','');
/*!40000 ALTER TABLE `lb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_user_group`
--

DROP TABLE IF EXISTS `lb_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '组名',
  `rules` text COLLATE utf8mb4_unicode_ci COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_user_group`
--

LOCK TABLES `lb_user_group` WRITE;
/*!40000 ALTER TABLE `lb_user_group` DISABLE KEYS */;
INSERT INTO `lb_user_group` VALUES (1,'默认组','1,2,3,4,5,6,7,8,9,10,11,12',1515386468,1516168298,'normal');
/*!40000 ALTER TABLE `lb_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_user_money_log`
--

DROP TABLE IF EXISTS `lb_user_money_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_user_money_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员余额变动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_user_money_log`
--

LOCK TABLES `lb_user_money_log` WRITE;
/*!40000 ALTER TABLE `lb_user_money_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lb_user_money_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_user_rule`
--

DROP TABLE IF EXISTS `lb_user_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_user_rule`
--

LOCK TABLES `lb_user_rule` WRITE;
/*!40000 ALTER TABLE `lb_user_rule` DISABLE KEYS */;
INSERT INTO `lb_user_rule` VALUES (1,0,'index','Frontend','',1,1516168079,1516168079,1,'normal'),(2,0,'api','API Interface','',1,1516168062,1516168062,2,'normal'),(3,1,'user','User Module','',1,1515386221,1516168103,12,'normal'),(4,2,'user','User Module','',1,1515386221,1516168092,11,'normal'),(5,3,'index/user/login','Login','',0,1515386247,1515386247,5,'normal'),(6,3,'index/user/register','Register','',0,1515386262,1516015236,7,'normal'),(7,3,'index/user/index','User Center','',0,1516015012,1516015012,9,'normal'),(8,3,'index/user/profile','Profile','',0,1516015012,1516015012,4,'normal'),(9,4,'api/user/login','Login','',0,1515386247,1515386247,6,'normal'),(10,4,'api/user/register','Register','',0,1515386262,1516015236,8,'normal'),(11,4,'api/user/index','User Center','',0,1516015012,1516015012,10,'normal'),(12,4,'api/user/profile','Profile','',0,1516015012,1516015012,3,'normal'),(13,NULL,NULL,'',NULL,NULL,1612936983,1612936983,13,NULL);
/*!40000 ALTER TABLE `lb_user_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_user_score_log`
--

DROP TABLE IF EXISTS `lb_user_score_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员积分变动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_user_score_log`
--

LOCK TABLES `lb_user_score_log` WRITE;
/*!40000 ALTER TABLE `lb_user_score_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lb_user_score_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_user_token`
--

DROP TABLE IF EXISTS `lb_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_user_token` (
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员Token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_user_token`
--

LOCK TABLES `lb_user_token` WRITE;
/*!40000 ALTER TABLE `lb_user_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `lb_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lb_version`
--

DROP TABLE IF EXISTS `lb_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lb_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '包大小',
  `content` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='版本表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lb_version`
--

LOCK TABLES `lb_version` WRITE;
/*!40000 ALTER TABLE `lb_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `lb_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'libu_he4966_cn'
--

--
-- Dumping routines for database 'libu_he4966_cn'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-13 18:17:40
