/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : together

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2015-02-12 18:27:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `activity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `activity_type` varchar(10) NOT NULL DEFAULT '' COMMENT '活动类型：leaf, parent',
  `activity_name` varchar(30) NOT NULL,
  `parent_activity_id` int(10) NOT NULL DEFAULT '0' COMMENT '父类活动id，如乒乓球的父类为球类运动',
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', 'parent', '活动', '0');
INSERT INTO `activity` VALUES ('2', 'parent', '运动', '1');
INSERT INTO `activity` VALUES ('3', 'leaf', '乒乓球', '2');
INSERT INTO `activity` VALUES ('4', 'leaf', '足球', '2');
INSERT INTO `activity` VALUES ('5', 'leaf', '羽毛球', '2');
INSERT INTO `activity` VALUES ('6', 'leaf', '篮球', '2');
INSERT INTO `activity` VALUES ('7', 'leaf', '毽子', '2');
INSERT INTO `activity` VALUES ('8', 'leaf', '游泳', '2');
INSERT INTO `activity` VALUES ('9', 'parent', '吃喝', '0');
INSERT INTO `activity` VALUES ('10', 'leaf', '火锅', '9');
INSERT INTO `activity` VALUES ('11', 'leaf', '烧烤', '9');
INSERT INTO `activity` VALUES ('12', 'leaf', '西餐', '9');

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `group_id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `group_name` varchar(50) NOT NULL,
  `group_privilege` varchar(100) DEFAULT NULL,
  `group_description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES ('1', 'Administrator', null, '系统管理员');

-- ----------------------------
-- Table structure for point_rule
-- ----------------------------
DROP TABLE IF EXISTS `point_rule`;
CREATE TABLE `point_rule` (
  `level_id` int(3) NOT NULL COMMENT '级别ID',
  `required_point` int(8) DEFAULT NULL COMMENT '需要的分数',
  `next_level_point` int(8) DEFAULT NULL COMMENT '下级所需分数',
  `level_1_title` varchar(50) DEFAULT NULL COMMENT '一级称呼',
  `level_2_title` varchar(50) DEFAULT NULL COMMENT '二级称呼',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of point_rule
-- ----------------------------
INSERT INTO `point_rule` VALUES ('1', '0', '50', null, null);
INSERT INTO `point_rule` VALUES ('2', '50', '100', null, null);
INSERT INTO `point_rule` VALUES ('3', '100', null, null, null);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `ID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `userID` varchar(20) NOT NULL COMMENT '用户名',
  `nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `gender` varchar(4) DEFAULT NULL COMMENT '性别',
  `Birthday` datetime DEFAULT NULL COMMENT '生日',
  `registerDate` datetime DEFAULT NULL COMMENT '注册时间',
  `lastLoginTime` datetime DEFAULT NULL COMMENT '上次登录时间',
  `lastmodifyinfoTime` datetime DEFAULT NULL COMMENT '上次修改资料时间',
  `points` int(11) DEFAULT NULL COMMENT '积分',
  `prestige` int(11) DEFAULT NULL COMMENT '威望',
  `isLoginNow` tinyint(1) DEFAULT NULL COMMENT '是否登录',
  `longitude` varchar(12) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(12) NOT NULL COMMENT '纬度',
  `groups` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`,`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
