/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : group_bot

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 15/05/2022 01:32:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for channel_event
-- ----------------------------
DROP TABLE IF EXISTS `channel_event`;
CREATE TABLE `channel_event`  (
  `channel_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enter_switch` tinyint(1) NOT NULL DEFAULT 0,
  `enter_channel_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enter_channel_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quit_switch` tinyint(1) NOT NULL DEFAULT 0,
  `quit_channel_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quit_channel_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `check_switch` tinyint(1) NOT NULL DEFAULT 0,
  `check_channel_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `check_channel_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '频道事件配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for channel_info
-- ----------------------------
DROP TABLE IF EXISTS `channel_info`;
CREATE TABLE `channel_info`  (
  `channel_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mute_time` int NOT NULL DEFAULT 5,
  `warn_count` int NOT NULL DEFAULT 3,
  `operate` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'mute',
  `integral_as` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '积分'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '频道配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for channel_logger
-- ----------------------------
DROP TABLE IF EXISTS `channel_logger`;
CREATE TABLE `channel_logger`  (
  `channel_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `channel_enter` int NOT NULL DEFAULT 0,
  `channel_quit` int NOT NULL DEFAULT 0,
  `channel_check` int NOT NULL DEFAULT 0,
  `channel_warn` int NOT NULL DEFAULT 0,
  `logger_date` date NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '频道日志表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for channel_push
-- ----------------------------
DROP TABLE IF EXISTS `channel_push`;
CREATE TABLE `channel_push`  (
  `channel_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `logger_switch` tinyint(1) NOT NULL DEFAULT 0,
  `logger_channel_id` varbinary(50) NOT NULL,
  `logger_channel_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志推送配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for channel_speak
-- ----------------------------
DROP TABLE IF EXISTS `channel_speak`;
CREATE TABLE `channel_speak`  (
  `channel_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `member_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `today_count` int NOT NULL DEFAULT 0,
  `yesterday_count` int NOT NULL DEFAULT 0,
  `speak_count` int NOT NULL DEFAULT 0,
  `speak_date` date NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发言统计表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for member_info
-- ----------------------------
DROP TABLE IF EXISTS `member_info`;
CREATE TABLE `member_info`  (
  `channel_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `member_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `warn_count` int NOT NULL DEFAULT 0,
  `signin_date` date NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for warn_word
-- ----------------------------
DROP TABLE IF EXISTS `warn_word`;
CREATE TABLE `warn_word`  (
  `channel_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `keyword` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '频道违禁词表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for bot_info
-- ----------------------------
DROP TABLE IF EXISTS `bot_info`;
CREATE TABLE `bot_info`  (
  `appid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '机器人信息表' ROW_FORMAT = COMPACT;

SET FOREIGN_KEY_CHECKS = 1;
