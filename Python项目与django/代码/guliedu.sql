/*
Navicat MySQL Data Transfer

Source Server         : windows
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : guliedu

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-09-30 16:56:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add 用户信息', '6', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('17', 'Can change 用户信息', '6', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete 用户信息', '6', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 轮播图信息', '7', 'add_bannerinfo');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 轮播图信息', '7', 'change_bannerinfo');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 轮播图信息', '7', 'delete_bannerinfo');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 邮箱验证码信息', '8', 'add_emailverifycode');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 邮箱验证码信息', '8', 'change_emailverifycode');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 邮箱验证码信息', '8', 'delete_emailverifycode');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 课程信息', '9', 'add_courseinfo');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 课程信息', '9', 'change_courseinfo');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 课程信息', '9', 'delete_courseinfo');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 章节信息', '10', 'add_lessoninfo');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 章节信息', '10', 'change_lessoninfo');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 章节信息', '10', 'delete_lessoninfo');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 资源信息', '11', 'add_sourceinfo');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 资源信息', '11', 'change_sourceinfo');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 资源信息', '11', 'delete_sourceinfo');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 视频信息', '12', 'add_videoinfo');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 视频信息', '12', 'change_videoinfo');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 视频信息', '12', 'delete_videoinfo');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 城市信息', '13', 'add_cityinfo');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 城市信息', '13', 'change_cityinfo');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 城市信息', '13', 'delete_cityinfo');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 机构信息', '14', 'add_orginfo');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 机构信息', '14', 'change_orginfo');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 机构信息', '14', 'delete_orginfo');
INSERT INTO `auth_permission` VALUES ('43', 'Can add 讲师信息', '15', 'add_teacherinfo');
INSERT INTO `auth_permission` VALUES ('44', 'Can change 讲师信息', '15', 'change_teacherinfo');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete 讲师信息', '15', 'delete_teacherinfo');
INSERT INTO `auth_permission` VALUES ('46', 'Can add 咨询信息', '16', 'add_userask');
INSERT INTO `auth_permission` VALUES ('47', 'Can change 咨询信息', '16', 'change_userask');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete 咨询信息', '16', 'delete_userask');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 用户评论课程信息', '17', 'add_usercomment');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 用户评论课程信息', '17', 'change_usercomment');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 用户评论课程信息', '17', 'delete_usercomment');
INSERT INTO `auth_permission` VALUES ('52', 'Can add 用户学习课程信息', '18', 'add_usercourse');
INSERT INTO `auth_permission` VALUES ('53', 'Can change 用户学习课程信息', '18', 'change_usercourse');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete 用户学习课程信息', '18', 'delete_usercourse');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 收藏信息', '19', 'add_userlove');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 收藏信息', '19', 'change_userlove');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 收藏信息', '19', 'delete_userlove');
INSERT INTO `auth_permission` VALUES ('58', 'Can add 用户消息信息', '20', 'add_usermessage');
INSERT INTO `auth_permission` VALUES ('59', 'Can change 用户消息信息', '20', 'change_usermessage');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete 用户消息信息', '20', 'delete_usermessage');
INSERT INTO `auth_permission` VALUES ('61', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('62', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('63', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('64', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('65', 'Can view 课程信息', '9', 'view_courseinfo');
INSERT INTO `auth_permission` VALUES ('66', 'Can view 章节信息', '10', 'view_lessoninfo');
INSERT INTO `auth_permission` VALUES ('67', 'Can view 资源信息', '11', 'view_sourceinfo');
INSERT INTO `auth_permission` VALUES ('68', 'Can view 视频信息', '12', 'view_videoinfo');
INSERT INTO `auth_permission` VALUES ('69', 'Can view 咨询信息', '16', 'view_userask');
INSERT INTO `auth_permission` VALUES ('70', 'Can view 用户评论课程信息', '17', 'view_usercomment');
INSERT INTO `auth_permission` VALUES ('71', 'Can view 用户学习课程信息', '18', 'view_usercourse');
INSERT INTO `auth_permission` VALUES ('72', 'Can view 收藏信息', '19', 'view_userlove');
INSERT INTO `auth_permission` VALUES ('73', 'Can view 用户消息信息', '20', 'view_usermessage');
INSERT INTO `auth_permission` VALUES ('74', 'Can view 城市信息', '13', 'view_cityinfo');
INSERT INTO `auth_permission` VALUES ('75', 'Can view 机构信息', '14', 'view_orginfo');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 讲师信息', '15', 'view_teacherinfo');
INSERT INTO `auth_permission` VALUES ('77', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('78', 'Can view 轮播图信息', '7', 'view_bannerinfo');
INSERT INTO `auth_permission` VALUES ('79', 'Can view 邮箱验证码信息', '8', 'view_emailverifycode');
INSERT INTO `auth_permission` VALUES ('80', 'Can view 用户信息', '6', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('81', 'Can add Bookmark', '21', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('82', 'Can change Bookmark', '21', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete Bookmark', '21', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('84', 'Can add User Setting', '22', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('85', 'Can change User Setting', '22', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('86', 'Can delete User Setting', '22', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('87', 'Can add User Widget', '23', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('88', 'Can change User Widget', '23', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('89', 'Can delete User Widget', '23', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('90', 'Can add log entry', '24', 'add_log');
INSERT INTO `auth_permission` VALUES ('91', 'Can change log entry', '24', 'change_log');
INSERT INTO `auth_permission` VALUES ('92', 'Can delete log entry', '24', 'delete_log');
INSERT INTO `auth_permission` VALUES ('93', 'Can view Bookmark', '21', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('94', 'Can view log entry', '24', 'view_log');
INSERT INTO `auth_permission` VALUES ('95', 'Can view User Setting', '22', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('96', 'Can view User Widget', '23', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('97', 'Can add captcha store', '25', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('98', 'Can change captcha store', '25', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete captcha store', '25', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('100', 'Can view captcha store', '25', 'view_captchastore');

-- ----------------------------
-- Table structure for `captcha_captchastore`
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES ('18', 'UPBN', 'upbn', 'ed9353aac4aadfcaa0a2e60d1248eb2abc5a6d06', '2018-09-26 08:44:34.498688');

-- ----------------------------
-- Table structure for `courses_courseinfo`
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseinfo`;
CREATE TABLE `courses_courseinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(200) NOT NULL,
  `name` varchar(20) NOT NULL,
  `study_time` int(11) NOT NULL,
  `study_num` int(11) NOT NULL,
  `level` varchar(5) NOT NULL,
  `love_num` int(11) NOT NULL,
  `click_num` int(11) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `detail` longtext NOT NULL,
  `category` varchar(5) NOT NULL,
  `course_notice` varchar(200) NOT NULL,
  `course_need` varchar(100) NOT NULL,
  `teacher_tell` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `orginfo_id` int(11) NOT NULL,
  `teacherinfo_id` int(11) NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseinfo_orginfo_id_3d3f29c6_fk_orgs_orginfo_id` (`orginfo_id`),
  KEY `courses_courseinfo_teacherinfo_id_fc77d47e_fk_orgs_teac` (`teacherinfo_id`),
  CONSTRAINT `courses_courseinfo_orginfo_id_3d3f29c6_fk_orgs_orginfo_id` FOREIGN KEY (`orginfo_id`) REFERENCES `orgs_orginfo` (`id`),
  CONSTRAINT `courses_courseinfo_teacherinfo_id_fc77d47e_fk_orgs_teac` FOREIGN KEY (`teacherinfo_id`) REFERENCES `orgs_teacherinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_courseinfo
-- ----------------------------
INSERT INTO `courses_courseinfo` VALUES ('1', 'course/HTMLCSS基础.jpg', '前端三大宝之html', '0', '1', 'cj', '1', '114', '前端必备技能之一，最为基础', '前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础前端必备技能之一，最为基础', 'qd', '前端必备技能之一，最为基础', '自备电脑，基础都要学', '前端必备技能之一，最为基础', '2018-09-21 16:05:00.000000', '1', '1', '0');
INSERT INTO `courses_courseinfo` VALUES ('2', 'course/MySQL高级.jpg', 'mysql基础', '0', '1', 'cj', '1', '25', '数据库中的霸者，用户量最大还免费', '数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费数据库中的霸者，用户量最大还免费', 'hd', '数据库必须要学啊', '自备电脑，都要学数据库的', '数据库必须要学好啊', '2018-09-23 14:25:00.000000', '1', '2', '0');
INSERT INTO `courses_courseinfo` VALUES ('3', 'course/MySQL核心.jpg', 'MySQL高级', '0', '1', 'gj', '1', '55', '数据库的霸者', '数据库的霸者数据库的霸者数据库的霸者数据库的霸者数据库的霸者数据库的霸者数据库的霸者数据库的霸者数据库的霸者数据库的霸者数据库的霸者数据库的霸者数据库的霸者数据库的霸者', 'hd', '数据库必须要学啊', '自备电脑，都要学数据库的', '数据库必须要学好啊', '2018-09-23 14:26:00.000000', '1', '2', '0');
INSERT INTO `courses_courseinfo` VALUES ('4', 'course/15130518dbce180821.jpg', 'python全集', '0', '1', 'zj', '0', '31', 'python从入门到放弃python从入门到放弃python从入门到放弃', 'python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃python从入门到放弃', 'hd', '人生苦短，我用python', 'python比较单间容易上手', '一定要把python基础学好', '2018-09-23 14:27:00.000000', '1', '3', '0');
INSERT INTO `courses_courseinfo` VALUES ('5', 'course/140724c11606263861.jpg', 'linux全讲', '0', '0', 'cj', '0', '0', 'linux系统', 'linux系linux系统linux系统统linux系统linux系统linux系统linux系统linux系统linux系统linux系统linux系统', 'hd', '好好学', '好好学', '好好学', '2018-09-30 10:17:00.000000', '1', '1', '0');
INSERT INTO `courses_courseinfo` VALUES ('6', 'course/JavaWeb.jpg', 'javaweb从入门到高级', '0', '0', 'zj', '0', '1', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', 'hd', '好好学', '好好学', '好好学', '2018-09-30 10:18:00.000000', '1', '2', '0');
INSERT INTO `courses_courseinfo` VALUES ('7', 'course/GitGitHub_iHNsWWe.jpg', 'git简介', '0', '0', 'gj', '0', '0', '版本管理', '版本管理版本管理版本管理版本管理版本管理版本管理版本管理版本管理版本管理版本管理版本管理版本管理版本管理版本管理', 'hd', '好好学', '好好学', '好好学', '2018-09-30 10:19:00.000000', '1', '3', '1');
INSERT INTO `courses_courseinfo` VALUES ('8', 'course/redis_iQcbOMX.jpg', 'redis数据库详解', '0', '0', 'gj', '0', '1', '数据库从删库到跑路数据库从删库到跑路', '数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路数据库从删库到跑路', 'hd', '好好学', '好好学', '好好学', '2018-09-30 10:20:00.000000', '1', '1', '1');
INSERT INTO `courses_courseinfo` VALUES ('9', 'course/jQuery_K49AB1J.jpg', 'jQuery实战', '0', '0', 'zj', '0', '0', 'js的全能框架', 'js的全能框架js的全能框架js的全能框架js的全能框架js的全能框架js的全能框架js的全能框架js的全能框架js的全能框架js的全能框架js的全能框架js的全能框架js的全能框架js的全能框架js的全能框架js的全能框架js的全能框架js的全能框架js的全能框架js的全能框架', 'qd', '好好学', '好好学', '好好学', '2018-09-30 10:21:00.000000', '1', '3', '1');

-- ----------------------------
-- Table structure for `courses_lessoninfo`
-- ----------------------------
DROP TABLE IF EXISTS `courses_lessoninfo`;
CREATE TABLE `courses_lessoninfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `courseinfo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lessoninfo_courseinfo_id_25919b0f_fk_courses_c` (`courseinfo_id`),
  CONSTRAINT `courses_lessoninfo_courseinfo_id_25919b0f_fk_courses_c` FOREIGN KEY (`courseinfo_id`) REFERENCES `courses_courseinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_lessoninfo
-- ----------------------------
INSERT INTO `courses_lessoninfo` VALUES ('1', '第一章：html简介', '2018-09-21 16:07:00.000000', '1');
INSERT INTO `courses_lessoninfo` VALUES ('2', '第二章：认识标签', '2018-09-21 16:07:00.000000', '1');
INSERT INTO `courses_lessoninfo` VALUES ('3', '第三章：css选择器', '2018-09-21 16:08:00.000000', '1');

-- ----------------------------
-- Table structure for `courses_sourceinfo`
-- ----------------------------
DROP TABLE IF EXISTS `courses_sourceinfo`;
CREATE TABLE `courses_sourceinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `down_load` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `courseinfo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_sourceinfo_courseinfo_id_9d1b6a06_fk_courses_c` (`courseinfo_id`),
  CONSTRAINT `courses_sourceinfo_courseinfo_id_9d1b6a06_fk_courses_c` FOREIGN KEY (`courseinfo_id`) REFERENCES `courses_courseinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_sourceinfo
-- ----------------------------
INSERT INTO `courses_sourceinfo` VALUES ('1', '开发流程', 'source/谷粒教育.docx', '2018-09-21 16:09:00.000000', '1');

-- ----------------------------
-- Table structure for `courses_videoinfo`
-- ----------------------------
DROP TABLE IF EXISTS `courses_videoinfo`;
CREATE TABLE `courses_videoinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `study_time` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lessoninfo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_videoinfo_lessoninfo_id_02a97f3a_fk_courses_l` (`lessoninfo_id`),
  CONSTRAINT `courses_videoinfo_lessoninfo_id_02a97f3a_fk_courses_l` FOREIGN KEY (`lessoninfo_id`) REFERENCES `courses_lessoninfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_videoinfo
-- ----------------------------
INSERT INTO `courses_videoinfo` VALUES ('1', '01、hello html', '10', 'http://www.atguigu.com', '2018-09-21 16:08:00.000000', '1');
INSERT INTO `courses_videoinfo` VALUES ('2', '02、html实现第一个网页', '30', 'http://www.atguigu.com', '2018-09-21 16:09:00.000000', '1');

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('25', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('9', 'courses', 'courseinfo');
INSERT INTO `django_content_type` VALUES ('10', 'courses', 'lessoninfo');
INSERT INTO `django_content_type` VALUES ('11', 'courses', 'sourceinfo');
INSERT INTO `django_content_type` VALUES ('12', 'courses', 'videoinfo');
INSERT INTO `django_content_type` VALUES ('16', 'operations', 'userask');
INSERT INTO `django_content_type` VALUES ('17', 'operations', 'usercomment');
INSERT INTO `django_content_type` VALUES ('18', 'operations', 'usercourse');
INSERT INTO `django_content_type` VALUES ('19', 'operations', 'userlove');
INSERT INTO `django_content_type` VALUES ('20', 'operations', 'usermessage');
INSERT INTO `django_content_type` VALUES ('13', 'orgs', 'cityinfo');
INSERT INTO `django_content_type` VALUES ('14', 'orgs', 'orginfo');
INSERT INTO `django_content_type` VALUES ('15', 'orgs', 'teacherinfo');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'bannerinfo');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'emailverifycode');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('21', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('24', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('23', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-09-21 14:36:17.003949');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2018-09-21 14:36:17.146339');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2018-09-21 14:36:17.549653');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2018-09-21 14:36:17.626030');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2018-09-21 14:36:17.636057');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2018-09-21 14:36:17.643075');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2018-09-21 14:36:17.652099');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2018-09-21 14:36:17.655107');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2018-09-21 14:36:17.662126');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2018-09-21 14:36:17.670147');
INSERT INTO `django_migrations` VALUES ('11', 'users', '0001_initial', '2018-09-21 14:36:18.339992');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0001_initial', '2018-09-21 14:36:18.601843');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0002_logentry_remove_auto_add', '2018-09-21 14:36:18.614377');
INSERT INTO `django_migrations` VALUES ('14', 'orgs', '0001_initial', '2018-09-21 14:36:18.942407');
INSERT INTO `django_migrations` VALUES ('15', 'courses', '0001_initial', '2018-09-21 14:36:19.613448');
INSERT INTO `django_migrations` VALUES ('16', 'operations', '0001_initial', '2018-09-21 14:36:19.831134');
INSERT INTO `django_migrations` VALUES ('17', 'operations', '0002_auto_20180921_1435', '2018-09-21 14:36:20.770437');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2018-09-21 14:36:20.897822');
INSERT INTO `django_migrations` VALUES ('19', 'xadmin', '0001_initial', '2018-09-21 15:27:29.918447');
INSERT INTO `django_migrations` VALUES ('20', 'xadmin', '0002_log', '2018-09-21 15:27:30.203390');
INSERT INTO `django_migrations` VALUES ('21', 'xadmin', '0003_auto_20160715_0100', '2018-09-21 15:27:30.295206');
INSERT INTO `django_migrations` VALUES ('22', 'captcha', '0001_initial', '2018-09-25 14:29:13.797378');
INSERT INTO `django_migrations` VALUES ('23', 'operations', '0003_auto_20180925_1429', '2018-09-25 14:29:13.813449');
INSERT INTO `django_migrations` VALUES ('24', 'users', '0002_userprofile_is_start', '2018-09-25 14:41:02.011958');
INSERT INTO `django_migrations` VALUES ('25', 'users', '0003_auto_20180929_1026', '2018-09-29 10:26:47.027619');
INSERT INTO `django_migrations` VALUES ('26', 'courses', '0002_courseinfo_is_banner', '2018-09-30 10:16:43.570521');
INSERT INTO `django_migrations` VALUES ('27', 'orgs', '0002_auto_20180930_1420', '2018-09-30 14:21:08.359198');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('3lt0rkjn78fb2wh35sr92oznchqugmvk', 'NjQyNDkxMDMzN2M3ZTMwNmRkMDU3ZmI3ZmQwODMxOWYxNWZiOTMzYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwYjMyOTI4MWVjOTgzNzBkZTZjNjExOTBhYWIwZGM3NjAyODhlYzkwIiwiTElTVF9RVUVSWSI6W1sib3JncyIsIm9yZ2luZm8iXSwiIl19', '2018-10-14 14:28:10.484634');

-- ----------------------------
-- Table structure for `operations_userask`
-- ----------------------------
DROP TABLE IF EXISTS `operations_userask`;
CREATE TABLE `operations_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `course` varchar(20) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_userask
-- ----------------------------
INSERT INTO `operations_userask` VALUES ('1', '刘德华', '123131', '阿达水水', '2018-09-26 14:26:25.021995');
INSERT INTO `operations_userask` VALUES ('2', '赵丽颖', '231231', '阿丹萨顶顶', '2018-09-26 14:29:12.427148');
INSERT INTO `operations_userask` VALUES ('3', '杨幂', '1231312', '阿迪斯十大', '2018-09-26 14:33:10.093589');
INSERT INTO `operations_userask` VALUES ('4', '霍建华', '12313127', '阿迪斯十大', '2018-09-26 14:37:27.217894');
INSERT INTO `operations_userask` VALUES ('5', '班长', '13834561256', '阿迪斯十大', '2018-09-26 14:56:11.705007');
INSERT INTO `operations_userask` VALUES ('6', '副班长', '13564251423', '阿迪斯十大', '2018-09-26 14:57:10.325371');

-- ----------------------------
-- Table structure for `operations_usercomment`
-- ----------------------------
DROP TABLE IF EXISTS `operations_usercomment`;
CREATE TABLE `operations_usercomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_content` varchar(300) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `comment_course_id` int(11) NOT NULL,
  `comment_man_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_usercomme_comment_course_id_39dc5cdf_fk_courses_c` (`comment_course_id`),
  KEY `operations_usercomme_comment_man_id_c4c79f25_fk_users_use` (`comment_man_id`),
  CONSTRAINT `operations_usercomme_comment_course_id_39dc5cdf_fk_courses_c` FOREIGN KEY (`comment_course_id`) REFERENCES `courses_courseinfo` (`id`),
  CONSTRAINT `operations_usercomme_comment_man_id_c4c79f25_fk_users_use` FOREIGN KEY (`comment_man_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_usercomment
-- ----------------------------
INSERT INTO `operations_usercomment` VALUES ('1', '我爱你！', '2018-09-28 10:42:21.415512', '1', '9');
INSERT INTO `operations_usercomment` VALUES ('2', '不错呀', '2018-09-28 10:45:19.489515', '2', '9');
INSERT INTO `operations_usercomment` VALUES ('3', '啊士大夫', '2018-09-28 10:45:53.769881', '2', '9');
INSERT INTO `operations_usercomment` VALUES ('4', '哈哈', '2018-09-28 10:46:01.348929', '2', '9');
INSERT INTO `operations_usercomment` VALUES ('5', '爱爱爱', '2018-09-28 10:55:59.047068', '2', '9');
INSERT INTO `operations_usercomment` VALUES ('6', '阿斯达', '2018-09-28 10:57:30.663552', '2', '9');
INSERT INTO `operations_usercomment` VALUES ('7', '阿大撒', '2018-09-28 10:58:23.171078', '2', '9');

-- ----------------------------
-- Table structure for `operations_usercourse`
-- ----------------------------
DROP TABLE IF EXISTS `operations_usercourse`;
CREATE TABLE `operations_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `study_course_id` int(11) NOT NULL,
  `study_man_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `operations_usercourse_study_man_id_study_course_id_ca233d28_uniq` (`study_man_id`,`study_course_id`),
  KEY `operations_usercours_study_course_id_ad6771e9_fk_courses_c` (`study_course_id`),
  CONSTRAINT `operations_usercours_study_course_id_ad6771e9_fk_courses_c` FOREIGN KEY (`study_course_id`) REFERENCES `courses_courseinfo` (`id`),
  CONSTRAINT `operations_usercours_study_man_id_a1251afb_fk_users_use` FOREIGN KEY (`study_man_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_usercourse
-- ----------------------------
INSERT INTO `operations_usercourse` VALUES ('10', '2018-09-28 15:49:35.171253', '1', '9');
INSERT INTO `operations_usercourse` VALUES ('11', '2018-09-29 14:55:46.746971', '4', '9');
INSERT INTO `operations_usercourse` VALUES ('12', '2018-09-30 11:44:48.182511', '3', '9');
INSERT INTO `operations_usercourse` VALUES ('13', '2018-09-30 11:58:46.375359', '2', '9');

-- ----------------------------
-- Table structure for `operations_userlove`
-- ----------------------------
DROP TABLE IF EXISTS `operations_userlove`;
CREATE TABLE `operations_userlove` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `love_id` int(11) NOT NULL,
  `love_type` int(11) NOT NULL,
  `love_status` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `love_man_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_userlove_love_man_id_7fb97ad4_fk_users_userprofile_id` (`love_man_id`),
  CONSTRAINT `operations_userlove_love_man_id_7fb97ad4_fk_users_userprofile_id` FOREIGN KEY (`love_man_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_userlove
-- ----------------------------
INSERT INTO `operations_userlove` VALUES ('8', '1', '1', '1', '2018-09-28 15:08:13.805899', '9');
INSERT INTO `operations_userlove` VALUES ('9', '7', '1', '0', '2018-09-29 15:28:33.841318', '9');
INSERT INTO `operations_userlove` VALUES ('10', '3', '1', '0', '2018-09-29 16:15:50.355036', '9');
INSERT INTO `operations_userlove` VALUES ('11', '8', '1', '0', '2018-09-29 16:15:55.846734', '9');
INSERT INTO `operations_userlove` VALUES ('12', '1', '3', '0', '2018-09-29 16:29:18.593014', '9');
INSERT INTO `operations_userlove` VALUES ('13', '2', '3', '0', '2018-09-29 16:29:22.621810', '9');
INSERT INTO `operations_userlove` VALUES ('14', '3', '3', '0', '2018-09-29 16:29:26.452713', '9');
INSERT INTO `operations_userlove` VALUES ('15', '1', '2', '0', '2018-09-29 16:41:36.190749', '9');
INSERT INTO `operations_userlove` VALUES ('16', '2', '2', '0', '2018-09-29 16:41:39.458138', '9');
INSERT INTO `operations_userlove` VALUES ('17', '3', '2', '0', '2018-09-29 16:41:41.784698', '9');

-- ----------------------------
-- Table structure for `operations_usermessage`
-- ----------------------------
DROP TABLE IF EXISTS `operations_usermessage`;
CREATE TABLE `operations_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_man` int(11) NOT NULL,
  `message_content` varchar(200) NOT NULL,
  `message_status` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_usermessage
-- ----------------------------
INSERT INTO `operations_usermessage` VALUES ('1', '9', '欢迎登陆', '1', '2018-09-29 16:56:45.804458');
INSERT INTO `operations_usermessage` VALUES ('2', '9', '欢迎登陆', '1', '2018-09-30 09:41:48.273045');
INSERT INTO `operations_usermessage` VALUES ('3', '9', '欢迎登陆', '0', '2018-09-30 11:22:48.913914');
INSERT INTO `operations_usermessage` VALUES ('4', '9', '欢迎登陆', '0', '2018-09-30 11:26:05.186289');
INSERT INTO `operations_usermessage` VALUES ('5', '9', '欢迎登陆', '0', '2018-09-30 11:45:02.351892');
INSERT INTO `operations_usermessage` VALUES ('6', '9', '欢迎登陆', '0', '2018-09-30 11:50:30.518917');
INSERT INTO `operations_usermessage` VALUES ('7', '9', '欢迎登陆', '0', '2018-09-30 11:56:38.659589');
INSERT INTO `operations_usermessage` VALUES ('8', '9', '欢迎登陆', '0', '2018-09-30 11:58:46.351296');
INSERT INTO `operations_usermessage` VALUES ('9', '9', '欢迎登陆', '0', '2018-09-30 11:59:02.516160');
INSERT INTO `operations_usermessage` VALUES ('10', '9', '欢迎登陆', '0', '2018-09-30 14:02:37.325739');

-- ----------------------------
-- Table structure for `orgs_cityinfo`
-- ----------------------------
DROP TABLE IF EXISTS `orgs_cityinfo`;
CREATE TABLE `orgs_cityinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orgs_cityinfo
-- ----------------------------
INSERT INTO `orgs_cityinfo` VALUES ('1', '北京', '2018-09-21 15:51:00.000000');
INSERT INTO `orgs_cityinfo` VALUES ('2', '上海', '2018-09-21 15:52:00.000000');
INSERT INTO `orgs_cityinfo` VALUES ('3', '深圳', '2018-09-21 15:52:00.000000');
INSERT INTO `orgs_cityinfo` VALUES ('4', '杭州', '2018-09-21 15:52:00.000000');

-- ----------------------------
-- Table structure for `orgs_orginfo`
-- ----------------------------
DROP TABLE IF EXISTS `orgs_orginfo`;
CREATE TABLE `orgs_orginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(200) NOT NULL,
  `name` varchar(20) NOT NULL,
  `course_num` int(11) NOT NULL,
  `study_num` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `detail` longtext NOT NULL,
  `love_num` int(11) NOT NULL,
  `click_num` int(11) NOT NULL,
  `category` varchar(10) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `cityinfo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orgs_orginfo_cityinfo_id_b30bafbf_fk_orgs_cityinfo_id` (`cityinfo_id`),
  CONSTRAINT `orgs_orginfo_cityinfo_id_b30bafbf_fk_orgs_cityinfo_id` FOREIGN KEY (`cityinfo_id`) REFERENCES `orgs_cityinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orgs_orginfo
-- ----------------------------
INSERT INTO `orgs_orginfo` VALUES ('1', 'org/logo_9aLm3kE.png', '尚硅谷', '0', '1', '北京昌平', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '<p>&nbsp; &nbsp; 尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训</p><p><img src=\"/static/media/ueditor/images/3_20180930142508_881.jpg\" title=\"\" alt=\"3.jpg\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0028.gif\"/>2018-09-30</p><p><iframe class=\"ueditor_baidumap\" src=\"http://127.0.0.1:8000/static/ueditor/dialogs/map/show.html#center=116.455062,40.094999&zoom=18&width=530&height=340&markers=116.350391,40.070157&markerStyles=l,A\" frameborder=\"0\" width=\"534\" height=\"344\"></iframe></p><p><br/></p><table><tbody><tr class=\"firstRow\"><td width=\"47\" valign=\"top\" style=\"word-break: break-all;\">我喜欢富文本</td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td></tr><tr><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td></tr><tr><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td><td width=\"47\" valign=\"top\"><br/></td></tr></tbody></table><p><br/></p>', '1', '11', 'pxjg', '2018-09-21 15:52:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('2', 'org/logo_s6PSfVO.png', '尚硅谷2', '0', '0', '北京昌平', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '0', '0', 'pxjg', '2018-09-23 14:11:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('3', 'org/logo_H3cwnlC.png', '尚硅谷3', '0', '0', '北京昌平', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '1', '1', 'pxjg', '2018-09-23 14:13:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('4', 'org/logo_miv26C2.png', '尚硅谷4', '0', '0', '北京昌平', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '0', '0', 'pxjg', '2018-09-23 14:13:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('5', 'org/logo_Jyh9Qqr.png', '尚硅谷5', '0', '0', '北京昌平', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '0', '0', 'pxjg', '2018-09-23 14:14:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('6', 'org/logo_gLGf6N6.png', '北京大学', '100', '50', '北京海淀', '中国高校之首', '中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首中国高校之首', '0', '1', 'gx', '2018-09-23 14:14:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('7', 'org/logo_ym2N2JD.png', '清华大学', '50', '100', '北京海淀', '中国高校之首和北京大学并列', '中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列中国高校之首和北京大学并列', '1', '1', 'gx', '2018-09-23 14:15:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('8', 'org/logo_xU71ItQ.png', '同济大学', '0', '0', '上海', '俗称中国高校小清华', '俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华俗称中国高校小清华', '1', '2', 'gx', '2018-09-23 14:16:00.000000', '2');
INSERT INTO `orgs_orginfo` VALUES ('9', 'org/logo_8cP9MkL.png', '尚硅谷6', '0', '0', '深圳', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '0', '0', 'pxjg', '2018-09-23 14:17:00.000000', '3');
INSERT INTO `orgs_orginfo` VALUES ('10', 'org/logo_Uenau1M.png', '阿里巴巴', '0', '0', '杭州', '马云创建的中国算是最牛逼的互联网公司吧', '马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧马云创建的中国算是最牛逼的互联网公司吧', '0', '0', 'gr', '2018-09-23 14:17:00.000000', '4');
INSERT INTO `orgs_orginfo` VALUES ('11', 'org/logo_whW7kRe.png', '尚硅谷7', '0', '0', '北京昌平', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '0', '0', 'pxjg', '2018-09-23 14:18:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('12', 'org/logo_HIpFANc.png', '尚硅谷8', '0', '0', '北京昌平', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '0', '0', 'pxjg', '2018-09-23 14:20:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('13', 'org/logo_3vsuyPf.png', '尚硅谷9', '0', '0', '北京昌平', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '0', '0', 'pxjg', '2018-09-23 14:20:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('14', 'org/logo_fFJO2iH.png', '尚硅谷10', '0', '0', '深圳', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训尚硅谷-老学员为你推荐，有口皆碑的Java培训、HTML5前端培训、大数据培训、Python培训、区块链培训', '0', '0', 'pxjg', '2018-09-23 14:21:00.000000', '3');
INSERT INTO `orgs_orginfo` VALUES ('15', 'org/logo_RaPkxh0.png', '腾讯', '0', '0', '深圳', 'qq是我们玩的最早的聊天工具了吧', 'qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧qq是我们玩的最早的聊天工具了吧', '0', '0', 'gr', '2018-09-23 14:21:00.000000', '3');

-- ----------------------------
-- Table structure for `orgs_teacherinfo`
-- ----------------------------
DROP TABLE IF EXISTS `orgs_teacherinfo`;
CREATE TABLE `orgs_teacherinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(200) NOT NULL,
  `name` varchar(20) NOT NULL,
  `work_year` int(11) NOT NULL,
  `work_position` varchar(20) NOT NULL,
  `work_style` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `love_num` int(11) NOT NULL,
  `click_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `work_company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orgs_teacherinfo_work_company_id_b897a136_fk_orgs_orginfo_id` (`work_company_id`),
  CONSTRAINT `orgs_teacherinfo_work_company_id_b897a136_fk_orgs_orginfo_id` FOREIGN KEY (`work_company_id`) REFERENCES `orgs_orginfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orgs_teacherinfo
-- ----------------------------
INSERT INTO `orgs_teacherinfo` VALUES ('1', 'teacher/17.jpg', '孙老师', '10', '高级讲师', '牛逼666', '18', 'girl', '1', '7', '2018-09-21 15:56:00.000000', '1');
INSERT INTO `orgs_teacherinfo` VALUES ('2', 'teacher/17_QaSaqTi.jpg', 'weesmile', '3', '高级讲师', '闷骚有激情', '30', 'boy', '1', '1', '2018-09-23 14:23:00.000000', '1');
INSERT INTO `orgs_teacherinfo` VALUES ('3', 'teacher/9.jpeg', '超哥', '3', '高级讲师', '激情四射', '30', 'boy', '1', '1', '2018-09-23 14:24:00.000000', '1');

-- ----------------------------
-- Table structure for `users_bannerinfo`
-- ----------------------------
DROP TABLE IF EXISTS `users_bannerinfo`;
CREATE TABLE `users_bannerinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_bannerinfo
-- ----------------------------
INSERT INTO `users_bannerinfo` VALUES ('1', 'banner/banner1.jpg', 'http://www.atguigu.com', '2018-09-30 10:11:00.000000');
INSERT INTO `users_bannerinfo` VALUES ('2', 'banner/banner2.jpg', 'http://www.atguigu.com', '2018-09-30 10:11:00.000000');
INSERT INTO `users_bannerinfo` VALUES ('3', 'banner/banner3.jpg', 'http://www.atguigu.com', '2018-09-30 10:11:00.000000');
INSERT INTO `users_bannerinfo` VALUES ('4', 'banner/banner4.jpg', 'http://www.atguigu.com', '2018-09-30 10:11:00.000000');
INSERT INTO `users_bannerinfo` VALUES ('5', 'banner/banner5.jpg', 'http://www.atguigu.com', '2018-09-30 10:11:00.000000');
INSERT INTO `users_bannerinfo` VALUES ('6', 'banner/感言.jpg', 'http://www.atguigu.com', '2018-09-30 10:11:00.000000');

-- ----------------------------
-- Table structure for `users_emailverifycode`
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifycode`;
CREATE TABLE `users_emailverifycode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `send_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_emailverifycode
-- ----------------------------
INSERT INTO `users_emailverifycode` VALUES ('11', '2iS2W5en', 'ly03171629@163.com', '3', '2018-09-29 14:31:29.726523');

-- ----------------------------
-- Table structure for `users_userprofile`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `nick_name` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `is_start` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$36000$uO07jmnCpftf$LD9jaOUz9iImTD1MYA89MiTSV/n4Ti6+jGQ2sq25iG0=', '2018-09-30 14:21:31.435886', '1', 'admin', '', '', '', '1', '1', '2018-09-21 15:30:43.156739', '', null, null, 'girl', null, null, '2018-09-21 15:30:43.156739', '0');
INSERT INTO `users_userprofile` VALUES ('3', 'pbkdf2_sha256$36000$swL8PWtoxTKN$O3Jr1EWrFJ4EKSFQtRSOmffbX76GphGIZBz2GIt3ofU=', null, '0', '1@1.com', '', '', '1@1.com', '0', '1', '2018-09-25 11:54:46.440924', '', null, null, 'girl', null, null, '2018-09-25 11:54:46.440924', '0');
INSERT INTO `users_userprofile` VALUES ('4', 'pbkdf2_sha256$36000$Pqif2esG4Enj$eq6cPmFcq42+WaEtB/vBruz09hgVWkvRwzw1Ewjjho0=', null, '0', '2@2.com', '', '', '2@2.com', '0', '1', '2018-09-25 11:57:31.242546', '', null, null, 'girl', null, null, '2018-09-25 11:57:31.242546', '0');
INSERT INTO `users_userprofile` VALUES ('5', 'pbkdf2_sha256$36000$JXoKC8qTqTRl$P63rHuPUbaeGI+WNlWhkaJK0CM/IaK+rqjldVeTeCMg=', null, '0', '222@2.com', '', '', '222@2.com', '0', '1', '2018-09-25 12:17:37.128354', '', null, null, 'girl', null, null, '2018-09-25 12:17:37.129390', '0');
INSERT INTO `users_userprofile` VALUES ('6', 'pbkdf2_sha256$36000$HR1dvU5vl0s6$cPC/hOPETWZaPsx1ywf1ldCUFYcaULXrngOfgZ9EAT4=', null, '0', '111@1.com', '', '', '111@1.com', '0', '1', '2018-09-25 12:18:18.197177', '', null, null, 'girl', null, null, '2018-09-25 12:18:18.197177', '0');
INSERT INTO `users_userprofile` VALUES ('7', 'pbkdf2_sha256$36000$QtRWZKXzOvId$i5SqynN+MjjdGS+RcUhItQf6Tixfeaa1RJPLcGIxo1w=', '2018-09-25 14:20:41.654582', '0', '111@2.com', '', '', '111@2.com', '0', '1', '2018-09-25 12:19:28.953756', '', null, null, 'girl', null, null, '2018-09-25 12:19:28.953756', '0');
INSERT INTO `users_userprofile` VALUES ('8', 'pbkdf2_sha256$36000$8rpkX9LLoS63$ZXZFpsI9kTUApzEare7jvERrwgbYj6R2KEUjueqzxTw=', '2018-09-25 14:38:15.831779', '0', '222@3.com', '', '', '222@3.com', '0', '1', '2018-09-25 14:33:51.281771', '', null, null, 'girl', null, null, '2018-09-25 14:33:51.281771', '0');
INSERT INTO `users_userprofile` VALUES ('9', 'pbkdf2_sha256$36000$V2ekHhjtGpqz$L/e1oBgHZrm6AdlKvuMgcpKxOexU2KzB0xsWYPJNNaQ=', '2018-09-30 14:02:37.321728', '0', 'ly03171629@163.com', '', '', 'ly03171629@163.com', '0', '1', '2018-09-25 15:41:00.000000', 'user/9.jpeg', '赵丽颖', '2018-09-10', 'boy', '北京', '18645621356', '2018-09-25 15:41:00.000000', '1');

-- ----------------------------
-- Table structure for `users_userprofile_groups`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `users_userprofile_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `xadmin_bookmark`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for `xadmin_log`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-09-21 15:52:04.985504', '127.0.0.1', '1', '北京', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2018-09-21 15:52:08.688249', '127.0.0.1', '2', '上海', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2018-09-21 15:52:13.570983', '127.0.0.1', '3', '深圳', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2018-09-21 15:52:21.868868', '127.0.0.1', '4', '杭州', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2018-09-21 15:55:49.466195', '127.0.0.1', '1', '尚硅谷', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2018-09-21 15:58:28.729620', '127.0.0.1', '1', '孙老师', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2018-09-21 16:07:24.776421', '127.0.0.1', '1', '前端三大宝之html', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2018-09-21 16:07:55.647498', '127.0.0.1', '1', '第一章：html简介', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2018-09-21 16:08:12.197807', '127.0.0.1', '2', '第二章：认识标签', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2018-09-21 16:08:27.055947', '127.0.0.1', '3', '第三章：css选择器', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2018-09-21 16:09:15.652288', '127.0.0.1', '1', '01、hello html', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2018-09-21 16:09:40.195906', '127.0.0.1', '2', '02、html实现第一个网页', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2018-09-21 16:10:19.662557', '127.0.0.1', '1', '开发流程', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2018-09-23 14:13:06.590725', '127.0.0.1', '2', '尚硅谷2', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2018-09-23 14:13:45.096908', '127.0.0.1', '3', '尚硅谷3', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2018-09-23 14:14:16.544877', '127.0.0.1', '4', '尚硅谷4', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2018-09-23 14:14:55.440011', '127.0.0.1', '5', '尚硅谷5', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2018-09-23 14:15:34.003728', '127.0.0.1', '6', '北京大学', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2018-09-23 14:16:24.215781', '127.0.0.1', '7', '清华大学', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2018-09-23 14:17:01.935628', '127.0.0.1', '8', '同济大学', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2018-09-23 14:17:29.993151', '127.0.0.1', '9', '尚硅谷6', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2018-09-23 14:18:25.037233', '127.0.0.1', '10', '阿里巴巴', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2018-09-23 14:20:32.573779', '127.0.0.1', '11', '尚硅谷7', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2018-09-23 14:20:55.656444', '127.0.0.1', '12', '尚硅谷8', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2018-09-23 14:21:17.700015', '127.0.0.1', '13', '尚硅谷9', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2018-09-23 14:21:42.461320', '127.0.0.1', '14', '尚硅谷10', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2018-09-23 14:22:51.341893', '127.0.0.1', '15', '腾讯', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2018-09-23 14:24:23.716361', '127.0.0.1', '2', 'weesmile', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2018-09-23 14:25:13.575037', '127.0.0.1', '3', '超哥', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2018-09-23 14:26:55.137572', '127.0.0.1', '2', 'mysql基础', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2018-09-23 14:27:50.485739', '127.0.0.1', '3', 'MySQL高级', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2018-09-23 14:29:00.299679', '127.0.0.1', '4', 'python全集', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2018-09-27 16:23:37.087069', '127.0.0.1', '9', '1316425655@qq.com', 'change', '修改 last_login，image 和 nick_name', '6', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2018-09-30 10:11:30.835063', '127.0.0.1', '1', 'banner/banner1.jpg', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2018-09-30 10:11:34.468654', '127.0.0.1', '2', 'banner/banner2.jpg', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2018-09-30 10:11:38.938010', '127.0.0.1', '3', 'banner/banner3.jpg', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2018-09-30 10:11:42.254754', '127.0.0.1', '4', 'banner/banner4.jpg', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2018-09-30 10:11:46.347162', '127.0.0.1', '5', 'banner/banner5.jpg', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2018-09-30 10:12:02.658877', '127.0.0.1', '6', 'banner/感言.jpg', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('40', '2018-09-30 10:18:36.966663', '127.0.0.1', '5', 'linux全讲', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('41', '2018-09-30 10:19:35.083980', '127.0.0.1', '6', 'javaweb从入门到高级', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2018-09-30 10:20:15.300871', '127.0.0.1', '7', 'git简介', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('43', '2018-09-30 10:21:07.015680', '127.0.0.1', '8', 'redis数据库详解', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('44', '2018-09-30 10:22:07.684679', '127.0.0.1', '9', 'jQuery实战', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2018-09-30 10:22:47.862916', '127.0.0.1', '8', 'redis数据库详解', 'change', '修改 image 和 is_banner', '9', '1');
INSERT INTO `xadmin_log` VALUES ('46', '2018-09-30 10:23:03.960687', '127.0.0.1', '9', 'jQuery实战', 'change', '修改 image 和 is_banner', '9', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2018-09-30 10:23:19.370294', '127.0.0.1', '7', 'git简介', 'change', '修改 image 和 is_banner', '9', '1');
INSERT INTO `xadmin_log` VALUES ('48', '2018-09-30 14:28:10.332684', '127.0.0.1', '1', '尚硅谷', 'change', '修改 image 和 detail', '14', '1');

-- ----------------------------
-- Table structure for `xadmin_usersettings`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');
INSERT INTO `xadmin_usersettings` VALUES ('2', 'site-theme', '/static/xadmin/css/themes/bootstrap-xadmin.css', '1');

-- ----------------------------
-- Table structure for `xadmin_userwidget`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
