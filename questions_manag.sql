/*
 Navicat MySQL Data Transfer

 Source Server         : MySQL3306
 Source Server Type    : MySQL
 Source Server Version : 50528
 Source Host           : localhost:3306
 Source Schema         : questions_manag

 Target Server Type    : MySQL
 Target Server Version : 50528
 File Encoding         : 65001

 Date: 28/08/2018 00:41:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(2) NOT NULL COMMENT '1是选择，2是判断，3是填空，4是综合',
  `body` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_user` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES (1, '呵呵题', 1, '1+1等于几？##2#3#10#69', 'tea', '2017-11-14 09:16:55');
INSERT INTO `questions` VALUES (2, '送命题', 2, '你爱不爱我？', 'tea', '2017-11-14 09:19:26');
INSERT INTO `questions` VALUES (3, '呵呵题', 3, '##的人流', 'tea', '2017-11-14 09:19:34');
INSERT INTO `questions` VALUES (4, '送命题', 4, '女朋友和老妈一起掉进水里，你先救哪个？为什么？', 'tea', '2017-11-14 09:20:04');
INSERT INTO `questions` VALUES (5, '', 1, '1+1等于几2？##2#3#10#69', 'tea', '2017-11-21 10:01:12');
INSERT INTO `questions` VALUES (6, '', 1, '1+1等于几3？##2#3#10#69', 'tea', '2017-11-21 10:01:26');
INSERT INTO `questions` VALUES (7, '', 1, '1+1等于几4？##2#3#10#69', 'tea', '2017-11-21 10:01:31');
INSERT INTO `questions` VALUES (8, '', 1, '1+1等于几5？##2#3#10#69', 'tea', '2017-11-21 10:01:37');
INSERT INTO `questions` VALUES (9, '', 1, '1+1等于几6？##2#3#10#69', 'tea', '2017-11-21 10:01:49');
INSERT INTO `questions` VALUES (10, '', 1, '1+1等于几7？##2#3#10#69', 'tea', '2017-11-21 10:01:55');
INSERT INTO `questions` VALUES (11, '', 1, '1+1等于几8？##2#3#10#69', 'tea', '2017-11-21 10:02:01');
INSERT INTO `questions` VALUES (12, '', 1, '1+1等于几9？##2#3#10#69', 'tea', '2017-11-21 10:02:07');
INSERT INTO `questions` VALUES (13, '', 1, '1+1等于几11？##2#3#10#69', 'tea', '2017-11-21 10:02:12');
INSERT INTO `questions` VALUES (14, '', 1, '1+1等于几12？##2#3#10#69', 'tea', '2017-11-21 10:02:18');
INSERT INTO `questions` VALUES (15, '', 1, '1+1等于几13？##2#3#10#69', 'tea', '2017-11-21 10:02:23');
INSERT INTO `questions` VALUES (16, '', 1, '1+1等于几14？##2#3#10#69', 'tea', '2017-11-21 10:02:28');
INSERT INTO `questions` VALUES (17, '', 1, '1+1等于几15？##2#3#10#69', 'tea', '2017-11-21 10:02:35');
INSERT INTO `questions` VALUES (18, '', 2, '你爱不爱我2？', 'tea', '2017-11-21 10:03:09');
INSERT INTO `questions` VALUES (19, '', 2, '你爱不爱我3？', 'tea', '2017-11-21 10:03:15');
INSERT INTO `questions` VALUES (20, '', 2, '你爱不爱我4？', 'tea', '2017-11-21 10:03:21');
INSERT INTO `questions` VALUES (21, '', 2, '你爱不爱我5？', 'tea', '2017-11-21 10:03:27');
INSERT INTO `questions` VALUES (22, '', 2, '你爱不爱我6？', 'tea', '2017-11-21 10:03:33');
INSERT INTO `questions` VALUES (23, '', 2, '你爱不爱我7？', 'tea', '2017-11-21 10:03:40');
INSERT INTO `questions` VALUES (24, '', 2, '你爱不爱我8？', 'tea', '2017-11-21 10:03:48');
INSERT INTO `questions` VALUES (25, '', 2, '你爱不爱我9？', 'tea', '2017-11-21 10:03:58');
INSERT INTO `questions` VALUES (26, '', 2, '你爱不爱我10？', 'tea', '2017-11-21 10:04:06');
INSERT INTO `questions` VALUES (27, '', 3, '##的人流2', 'tea', '2017-11-21 10:04:18');
INSERT INTO `questions` VALUES (28, '', 3, '##的人流3', 'tea', '2017-11-21 10:04:24');
INSERT INTO `questions` VALUES (29, '', 3, '##的人流4', 'tea', '2017-11-21 10:04:31');
INSERT INTO `questions` VALUES (30, '', 3, '##的人流5', 'tea', '2017-11-21 10:04:36');
INSERT INTO `questions` VALUES (31, '', 4, '女朋友和老妈一起掉进水里，你先救哪个？为什么2？', 'tea', '2017-11-21 10:05:08');
INSERT INTO `questions` VALUES (32, '', 4, '女朋友和老妈一起掉进水里，你先救哪个？为什么3？', 'tea', '2017-11-21 10:05:14');
INSERT INTO `questions` VALUES (33, '', 4, '女朋友和老妈一起掉进水里，你先救哪个？为什么4？', 'tea', '2017-11-21 10:05:21');
INSERT INTO `questions` VALUES (34, '', 4, '女朋友和老妈一起掉进水里，你先救哪个？为什么5？', 'tea', '2017-11-21 10:05:27');
INSERT INTO `questions` VALUES (35, '', 1, '1+1等于几10？##2#3#10#69', 'tea', '2017-11-21 10:06:37');
INSERT INTO `questions` VALUES (36, '', 2, '急啊急啊急啊急啊家', 'tea', '2017-11-21 21:33:59');
INSERT INTO `questions` VALUES (37, '拉拉', 2, '你到底爱不爱我？~~', 'tea', '2017-11-30 20:36:47');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '学号或工号' COMMENT '帐号',
  `pass` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(1) NULL DEFAULT NULL COMMENT '1为老师，0或空为学生',
  PRIMARY KEY (`user`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', '123', '张三', 0);
INSERT INTO `user` VALUES ('stu', '123', '王麻子', 2);
INSERT INTO `user` VALUES ('tea', '123', '李四', 1);
INSERT INTO `user` VALUES ('test', '666', '哈哈', 1);
INSERT INTO `user` VALUES ('哈哈', '123456', '啦啦', 0);

SET FOREIGN_KEY_CHECKS = 1;
