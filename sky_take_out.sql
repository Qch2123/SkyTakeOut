/*
 Navicat Premium Dump SQL

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80043 (8.0.43)
 Source Host           : localhost:3306
 Source Schema         : sky_take_out

 Target Server Type    : MySQL
 Target Server Version : 80043 (8.0.43)
 File Encoding         : 65001

 Date: 26/12/2025 10:06:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '收货人',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认 0 否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '地址簿' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES (2, 4, '张三', '0', '13491234567', '35', '福建省', '3501', '福州市', '350102', '鼓楼区', '西洪路123号凤凰小区12栋303室', '2', 1);
INSERT INTO `address_book` VALUES (3, 4, '张三', '0', '13491234567', '35', '福建省', '3501', '福州市', '350102', '鼓楼区', '洪山镇杨桥西路50号福州大学至诚学院', '3', 0);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int NULL DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '分类名称',
  `sort` int NOT NULL DEFAULT 0 COMMENT '顺序',
  `status` int NULL DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_category_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品及套餐分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 1, '招牌必点', 1, 1, '2025-12-23 00:04:05', '2025-12-23 00:07:04', 1, 1);
INSERT INTO `category` VALUES (2, 1, '经典主食', 2, 1, '2025-12-23 00:04:32', '2025-12-23 00:07:05', 1, 1);
INSERT INTO `category` VALUES (3, 1, '风味菜肴', 3, 1, '2025-12-23 00:04:41', '2025-12-23 00:07:07', 1, 1);
INSERT INTO `category` VALUES (4, 1, '小吃饮品', 4, 1, '2025-12-23 00:04:53', '2025-12-23 00:07:08', 1, 1);
INSERT INTO `category` VALUES (5, 2, '单人套餐', 5, 1, '2025-12-23 00:05:19', '2025-12-23 00:07:10', 1, 1);
INSERT INTO `category` VALUES (6, 2, '双人套餐', 6, 1, '2025-12-23 00:05:33', '2025-12-23 00:07:11', 1, 1);
INSERT INTO `category` VALUES (7, 2, '多人套餐', 7, 1, '2025-12-23 00:05:45', '2025-12-23 00:07:15', 1, 1);
INSERT INTO `category` VALUES (8, 2, '超值特惠套餐', 8, 0, '2025-12-23 00:06:02', '2025-12-23 11:37:56', 1, 1);

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品价格',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述信息',
  `status` int NULL DEFAULT 1 COMMENT '0 停售 1 起售',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dish_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (1, '秘制烤鸭', 1, 35.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/c4e09730-bf10-400e-b1af-cf2f711e3503.jpg', '传承百年挂炉技艺，果木炭火慢烤3小时，鸭皮酥脆如纸，肉质鲜嫩多汁，配手工薄饼和秘制酱料', 1, '2025-12-23 08:50:12', '2025-12-23 10:08:20', 1, 1);
INSERT INTO `dish` VALUES (2, '黄焖鸡米饭', 1, 22.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/12b29d67-315d-45fe-a6d7-ee56a9014d67.jpg', '选用三黄鸡腿肉，文火慢炖40分钟，汤汁浓郁醇厚，鸡肉滑嫩入味，配米饭绝佳', 1, '2025-12-23 09:06:19', '2025-12-23 10:08:19', 1, 1);
INSERT INTO `dish` VALUES (3, '麻辣小龙虾', 1, 63.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/bb9c85a5-3ffb-4b3b-9b2c-f7d5a821a000.jpg', '鲜活小龙虾当日现杀，配32种香料炒制，虾肉Q弹紧实，麻辣鲜香直击味蕾', 1, '2025-12-23 09:07:30', '2025-12-23 10:08:15', 1, 1);
INSERT INTO `dish` VALUES (4, '金牌红烧肉', 1, 28.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/99470968-2b4a-432c-becb-ecf7280c5439.jpg', '精选五花三层肉，慢火炖煮2小时，色泽红亮，肥而不腻，入口即化', 1, '2025-12-23 09:09:28', '2025-12-23 12:12:08', 1, 1);
INSERT INTO `dish` VALUES (5, '鱼香肉丝盖饭', 2, 18.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/6bbb09c0-2206-4df3-a7e3-3fa55c9e2890.jpg', '经典川菜盖饭，肉丝滑嫩，鱼香汁浓郁下饭，配木耳丝、胡萝卜丝、青椒丝', 1, '2025-12-23 09:10:46', '2025-12-23 10:08:12', 1, 1);
INSERT INTO `dish` VALUES (6, '回锅肉套餐', 2, 22.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/76b3cb67-ddea-4917-a7f4-3b979cf1e382.jpg', '薄切五花肉煸炒至灯盏窝状，郫县豆瓣酱爆香，配蒜苗、青椒，含米饭和例汤', 1, '2025-12-23 09:11:38', '2025-12-23 10:08:10', 1, 1);
INSERT INTO `dish` VALUES (7, '西红柿鸡蛋面', 2, 12.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/9cf8d248-a208-4161-a0eb-c864da382b4a.jpg', '农家土鸡蛋与熟透西红柿碰撞，酸甜汤汁包裹劲道面条，简单却温暖', 1, '2025-12-23 09:15:43', '2025-12-23 10:08:09', 1, 1);
INSERT INTO `dish` VALUES (8, '虾仁鲜肉馄饨', 2, 19.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/cbd4643e-cd46-4572-9a24-33e6bc5014ca.jpg', '每颗馄饨都包入整颗虾仁和新鲜猪肉，皮薄馅大，汤鲜味美', 1, '2025-12-23 09:21:41', '2025-12-23 10:08:07', 1, 1);
INSERT INTO `dish` VALUES (9, '台式卤肉饭', 2, 24.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/ccfaff08-0561-43c2-911b-90236cf224d1.jpg', '五花肉丁慢炖至入口即化，卤汁香浓醇厚，拌饭一流，台湾经典风味', 1, '2025-12-23 09:22:51', '2025-12-23 10:08:05', 1, 1);
INSERT INTO `dish` VALUES (10, '酸菜鱼', 3, 50.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/9b75773a-0328-4978-a04c-3b56355e9bd2.jpg', '活鱼现杀，鱼片薄如蝉翼，酸菜自家腌制，酸爽开胃，汤底金黄浓郁', 1, '2025-12-23 09:24:00', '2025-12-23 10:07:53', 1, 1);
INSERT INTO `dish` VALUES (11, '蒜蓉粉丝蒸扇贝', 3, 25.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/5bb030b5-8fa5-44f4-9c2d-f5f8eff73bda.jpg', '新鲜扇贝现蒸，金银蒜蓉香气扑鼻，粉丝吸满鲜美汤汁', 1, '2025-12-23 09:30:16', '2025-12-23 10:07:51', 1, 1);
INSERT INTO `dish` VALUES (12, '鱼香肉丝', 3, 15.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/bad62182-d7dc-43e5-91e8-30709027cf18.jpg', '经典川菜，肉丝滑嫩，泡椒的酸辣与糖醋的平衡完美融合', 1, '2025-12-23 09:31:53', '2025-12-23 10:07:50', 1, 1);
INSERT INTO `dish` VALUES (13, '干锅土豆片', 3, 10.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/333b6a2c-aa03-46e0-b3ce-2578892bde95.jpg', '土豆片煎至边缘焦脆，干锅做法香气四溢，麻辣鲜香，外焦里嫩', 1, '2025-12-23 09:32:46', '2025-12-23 10:07:34', 1, 1);
INSERT INTO `dish` VALUES (14, '玉米排骨汤', 3, 12.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/c4d47f44-3d88-400d-bb51-c6de8a42afa6.jpg', '慢火熬煮4小时，排骨软烂脱骨，玉米清甜，汤色奶白，营养滋补', 1, '2025-12-23 09:33:36', '2025-12-23 10:07:32', 1, 1);
INSERT INTO `dish` VALUES (15, '宫保鸡丁', 3, 12.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/d3bb87a1-8f41-47ca-a685-a5afeb21be85.jpg', '鸡丁滑嫩，花生香脆，糊辣荔枝味独特，酸甜微辣，色泽红亮', 1, '2025-12-23 09:34:26', '2025-12-23 10:07:29', 1, 1);
INSERT INTO `dish` VALUES (16, '香酥炸鸡翅', 4, 20.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/81bad5df-1595-480a-9ee9-04d485881d17.jpg', '外皮金黄酥脆，内里鲜嫩多汁，独家腌料秘制，现点现炸', 1, '2025-12-23 09:36:02', '2025-12-23 10:07:27', 1, 1);
INSERT INTO `dish` VALUES (17, '拍黄瓜', 4, 8.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/96a73517-d376-4ed6-9535-a6a053ff7a31.jpg', '黄瓜当日现拍，蒜香浓郁，酸辣爽口，解腻开胃', 1, '2025-12-23 09:36:49', '2025-12-23 10:07:25', 1, 1);
INSERT INTO `dish` VALUES (18, '酸梅汤', 4, 5.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/bec96de8-9440-432e-b629-da285b73e51a.jpg', '古法熬制，乌梅、山楂、桂花等十余种原料，酸甜解腻，冰爽沁心', 1, '2025-12-23 09:37:35', '2025-12-23 10:07:23', 1, 1);
INSERT INTO `dish` VALUES (19, '红糖糍粑', 4, 16.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/c33ffe3e-3a1c-4259-acb5-3e09515cce2c.jpg', '糯米现打，外酥内糯，淋上浓稠红糖，撒上黄豆粉，甜蜜软糯', 1, '2025-12-23 09:38:57', '2025-12-23 10:07:21', 1, 1);
INSERT INTO `dish` VALUES (20, '可乐', 4, 5.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/2b1c3ea9-595e-4c65-8284-4ef64f9bf977.jpg', ' 经典碳酸饮料，气泡十足，畅爽解腻，为每一餐注入快乐因子', 1, '2025-12-23 09:56:16', '2025-12-23 10:07:19', 1, 1);
INSERT INTO `dish` VALUES (21, '雪碧', 4, 5.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/2da46bd9-5e2b-4b19-8263-48ea685aaf71.jpg', '清新柠檬风味，气泡清爽甘洌，解腻提神，特别适合搭配油炸小食、酸甜菜肴与辛辣菜品，带来沁人心脾的畅快体验', 1, '2025-12-23 09:58:37', '2025-12-23 10:07:16', 1, 1);
INSERT INTO `dish` VALUES (22, '麻辣鸭脖', 4, 10.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/b1d67f9a-4de5-4327-a2ce-5bd0e28093ff.jpg', '酱香浓郁，辣中带甜，肉质紧实有嚼劲，追剧下酒神器', 1, '2025-12-23 09:59:59', '2025-12-23 10:07:14', 1, 1);
INSERT INTO `dish` VALUES (23, '米饭', 2, 2.00, 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/114e3474-099b-481f-96ad-0284ba0179be.jpg', '精选当季优质稻米，粒粒分明，软糯适口，是搭配各类菜肴的百搭主食，让美味更完整，饱腹又安心', 1, '2025-12-23 10:22:25', '2025-12-23 10:41:10', 1, 1);

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dish_id` bigint NOT NULL COMMENT '菜品',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味名称',
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味数据list',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品口味关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES (40, 10, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (45, 6, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (46, 6, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (47, 5, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (48, 5, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (51, 3, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (52, 3, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (86, 52, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (87, 52, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (88, 51, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (89, 51, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (92, 53, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (93, 53, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (94, 54, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\"]');
INSERT INTO `dish_flavor` VALUES (95, 56, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (96, 57, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (97, 60, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (101, 66, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (102, 67, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (103, 65, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (106, 1, '辣度', '[\"不辣\",\"微辣\"]');
INSERT INTO `dish_flavor` VALUES (107, 1, '忌口', '[\"不要蒜\"]');
INSERT INTO `dish_flavor` VALUES (109, 3, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\"]');
INSERT INTO `dish_flavor` VALUES (110, 3, '辣度', '[\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (111, 2, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\"]');
INSERT INTO `dish_flavor` VALUES (112, 2, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (114, 5, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\"]');
INSERT INTO `dish_flavor` VALUES (115, 5, '辣度', '[\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (116, 6, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\"]');
INSERT INTO `dish_flavor` VALUES (117, 6, '辣度', '[\"不辣\",\"微辣\"]');
INSERT INTO `dish_flavor` VALUES (119, 7, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\"]');
INSERT INTO `dish_flavor` VALUES (120, 8, '忌口', '[\"不要葱\",\"不要香菜\"]');
INSERT INTO `dish_flavor` VALUES (121, 9, '忌口', '[\"不要葱\",\"不要蒜\"]');
INSERT INTO `dish_flavor` VALUES (122, 10, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\"]');
INSERT INTO `dish_flavor` VALUES (123, 10, '辣度', '[\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (124, 11, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\"]');
INSERT INTO `dish_flavor` VALUES (125, 12, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\"]');
INSERT INTO `dish_flavor` VALUES (126, 12, '辣度', '[\"不辣\",\"微辣\"]');
INSERT INTO `dish_flavor` VALUES (127, 13, '辣度', '[\"不辣\",\"微辣\"]');
INSERT INTO `dish_flavor` VALUES (128, 13, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\"]');
INSERT INTO `dish_flavor` VALUES (129, 14, '忌口', '[\"不要葱\"]');
INSERT INTO `dish_flavor` VALUES (130, 15, '忌口', '[\"不要葱\",\"不要蒜\"]');
INSERT INTO `dish_flavor` VALUES (131, 15, '辣度', '[\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (135, 17, '忌口', '[\"不要葱\",\"不要蒜\"]');
INSERT INTO `dish_flavor` VALUES (136, 17, '辣度', '[\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (137, 16, '辣度', '[\"不辣\",\"微辣\"]');
INSERT INTO `dish_flavor` VALUES (138, 19, '甜味', '[\"少糖\",\"多糖\"]');
INSERT INTO `dish_flavor` VALUES (139, 22, '辣度', '[\"微辣\",\"中辣\",\"重辣\"]');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '身份证号',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '员工信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', 1, '2022-02-15 15:51:20', '2022-02-17 09:16:20', 10, 1);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '订单明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (5, '米饭', 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/114e3474-099b-481f-96ad-0284ba0179be.jpg', 4, 23, NULL, NULL, 1, 2.00);
INSERT INTO `order_detail` VALUES (6, '金牌红烧肉', 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/99470968-2b4a-432c-becb-ecf7280c5439.jpg', 4, 4, NULL, NULL, 1, 28.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单号',
  `status` int NOT NULL DEFAULT 1 COMMENT '订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消 7退款',
  `user_id` bigint NOT NULL COMMENT '下单用户',
  `address_book_id` bigint NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime NULL DEFAULT NULL COMMENT '结账时间',
  `pay_method` int NOT NULL DEFAULT 1 COMMENT '支付方式 1微信,2支付宝',
  `pay_status` tinyint NOT NULL DEFAULT 0 COMMENT '支付状态 0未支付 1已支付 2退款',
  `amount` decimal(10, 2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '备注',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '地址',
  `user_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '用户名称',
  `consignee` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '收货人',
  `cancel_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单取消原因',
  `rejection_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单拒绝原因',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '订单取消时间',
  `estimated_delivery_time` datetime NULL DEFAULT NULL COMMENT '预计送达时间',
  `delivery_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '配送状态  1立即送出  0选择具体时间',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '送达时间',
  `pack_amount` int NULL DEFAULT NULL COMMENT '打包费',
  `tableware_number` int NULL DEFAULT NULL COMMENT '餐具数量',
  `tableware_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '餐具数量状态  1按餐量提供  0选择具体数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (4, '1766463228380', 5, 4, 2, '2025-12-23 12:13:48', '2025-12-23 12:13:51', 1, 1, 38.00, '', '13491234567', '西洪路123号凤凰小区12栋303室', NULL, '张三', NULL, NULL, NULL, '2025-12-23 13:13:00', 0, '2025-12-23 12:14:09', 2, 0, 0);

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10, 2) NOT NULL COMMENT '套餐价格',
  `status` int NULL DEFAULT 1 COMMENT '售卖状态 0:停售 1:起售',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_setmeal_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '套餐' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES (32, 5, '工作能量套餐', 38.00, 1, '工作日午餐首选，荤素搭配，能量满满，30分钟快速送达', 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/595839b7-f4f5-428d-a019-77f636cd2b87.jpg', '2025-12-23 10:12:32', '2025-12-23 10:19:03', 1, 1);
INSERT INTO `setmeal` VALUES (33, 5, '经典一人食', 20.00, 1, '经典盖饭搭配营养热汤，暖心暖胃，一个人也要好好吃饭', 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/97fa3ee3-4443-42c1-b1cf-c28870f16b78.jpg', '2025-12-23 10:21:03', '2025-12-23 10:41:18', 1, 1);
INSERT INTO `setmeal` VALUES (34, 5, '鸡翅茄蛋面套餐', 19.00, 1, '番茄炒蛋的酸甜遇上炸鸡的酥香，一碗一翅，简单搭配却滋味十足，单人食的快乐之选。', 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/86bdbc08-e8ba-4ba4-83d4-febde309efca.jpg', '2025-12-23 10:36:49', '2025-12-23 10:41:47', 1, 1);
INSERT INTO `setmeal` VALUES (35, 6, '经典下饭二人餐', 40.00, 1, '两道国民级下饭菜，配一份暖心暖胃的炖汤，米饭管饱，是追求家常满足感的经典搭配。 |', 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/3d1d9463-1aef-4924-9fc6-99e06258e301.jpg', '2025-12-23 10:39:10', '2025-12-23 10:41:21', 1, 1);
INSERT INTO `setmeal` VALUES (36, 6, '招牌双拼纯享餐', 50.00, 0, '烤鸭的酥香与宫保鸡丁的酸甜微辣，佐以香酥鸡翅与爽口拍黄瓜，享受纯粹吃菜的乐趣', 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/c4af02e9-b5a6-41ac-b099-77df4801602d.jpg', '2025-12-23 11:01:15', '2025-12-23 11:01:15', 1, 1);
INSERT INTO `setmeal` VALUES (37, 6, '海鲜狂欢纯享餐', 100.00, 0, '主打海鲜盛宴，麻辣小龙虾与鲜美扇贝的豪华二重奏，附赠开胃小吃与饮品，适合追求高品质味蕾体验的食客', 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/e6c84c28-c93d-4683-96f7-6b1c39243085.jpg', '2025-12-23 11:32:26', '2025-12-23 11:32:26', 1, 1);
INSERT INTO `setmeal` VALUES (38, 7, '全鸭宴欢聚餐', 72.00, 0, '以镇店整鸭为主角，搭配两道经典热炒和滋补汤品，菜、饭、汤俱全，是体面又实惠的家庭聚会首选。', 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/630ec248-8fe2-470f-85e2-acb50ff00963.jpg', '2025-12-23 11:36:16', '2025-12-23 11:36:16', 1, 1);
INSERT INTO `setmeal` VALUES (39, 7, '酸辣风味全家福', 96.00, 0, '一桌齐全的“酸、香、甜”风味，三道硬核下饭菜，配以经典甜点，满足全家不同口味需求', 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/42889c87-b4bf-4b19-979f-6349cf1e1c3e.jpg', '2025-12-23 11:47:42', '2025-12-23 11:47:42', 1, 1);
INSERT INTO `setmeal` VALUES (40, 7, '硬菜盛宴狂欢餐', 150.00, 0, '集结三大招牌硬菜，分量豪横，搭配经典小吃，不含一丝碳水，专为“无肉不欢”的肉食爱好者与聚会狂欢设计。', 'https://takeout-upload.oss-cn-beijing.aliyuncs.com/d3ef84f6-9dac-494e-a506-aa425fbc2488.jpg', '2025-12-23 12:10:20', '2025-12-23 12:10:20', 1, 1);

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品单价（冗余字段）',
  `copies` int NULL DEFAULT NULL COMMENT '菜品份数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '套餐菜品关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES (50, 32, 21, '雪碧', 5.00, 1);
INSERT INTO `setmeal_dish` VALUES (51, 32, 17, '拍黄瓜', 8.00, 1);
INSERT INTO `setmeal_dish` VALUES (52, 32, 2, '黄焖鸡米饭', 22.00, 1);
INSERT INTO `setmeal_dish` VALUES (53, 33, 14, '玉米排骨汤', 12.00, 1);
INSERT INTO `setmeal_dish` VALUES (54, 33, 5, '鱼香肉丝盖饭', 18.00, 1);
INSERT INTO `setmeal_dish` VALUES (57, 35, 14, '玉米排骨汤', 12.00, 1);
INSERT INTO `setmeal_dish` VALUES (58, 35, 12, '鱼香肉丝', 15.00, 1);
INSERT INTO `setmeal_dish` VALUES (59, 35, 4, '金牌红烧肉', 28.00, 1);
INSERT INTO `setmeal_dish` VALUES (60, 34, 7, '西红柿鸡蛋面', 12.00, 1);
INSERT INTO `setmeal_dish` VALUES (61, 34, 16, '香酥炸鸡翅', 20.00, 1);
INSERT INTO `setmeal_dish` VALUES (62, 36, 17, '拍黄瓜', 8.00, 1);
INSERT INTO `setmeal_dish` VALUES (63, 36, 1, '秘制烤鸭', 35.00, 1);
INSERT INTO `setmeal_dish` VALUES (64, 36, 15, '宫保鸡丁', 12.00, 1);
INSERT INTO `setmeal_dish` VALUES (65, 36, 16, '香酥炸鸡翅', 20.00, 1);
INSERT INTO `setmeal_dish` VALUES (66, 37, 18, '酸梅汤', 5.00, 1);
INSERT INTO `setmeal_dish` VALUES (67, 37, 13, '干锅土豆片', 10.00, 1);
INSERT INTO `setmeal_dish` VALUES (68, 37, 11, '蒜蓉粉丝蒸扇贝', 25.00, 1);
INSERT INTO `setmeal_dish` VALUES (69, 37, 3, '麻辣小龙虾', 63.00, 1);
INSERT INTO `setmeal_dish` VALUES (70, 38, 23, '米饭', 2.00, 1);
INSERT INTO `setmeal_dish` VALUES (71, 38, 14, '玉米排骨汤', 12.00, 1);
INSERT INTO `setmeal_dish` VALUES (72, 38, 13, '干锅土豆片', 10.00, 1);
INSERT INTO `setmeal_dish` VALUES (73, 38, 15, '宫保鸡丁', 12.00, 1);
INSERT INTO `setmeal_dish` VALUES (74, 38, 1, '秘制烤鸭', 35.00, 1);
INSERT INTO `setmeal_dish` VALUES (75, 39, 23, '米饭', 2.00, 1);
INSERT INTO `setmeal_dish` VALUES (76, 39, 12, '鱼香肉丝', 15.00, 1);
INSERT INTO `setmeal_dish` VALUES (77, 39, 4, '金牌红烧肉', 28.00, 1);
INSERT INTO `setmeal_dish` VALUES (78, 39, 10, '酸菜鱼', 50.00, 1);
INSERT INTO `setmeal_dish` VALUES (79, 40, 22, '麻辣鸭脖', 10.00, 1);
INSERT INTO `setmeal_dish` VALUES (80, 40, 17, '拍黄瓜', 8.00, 1);
INSERT INTO `setmeal_dish` VALUES (81, 40, 10, '酸菜鱼', 50.00, 1);
INSERT INTO `setmeal_dish` VALUES (82, 40, 1, '秘制烤鸭', 35.00, 1);
INSERT INTO `setmeal_dish` VALUES (83, 40, 3, '麻辣小龙虾', 63.00, 1);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `user_id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '购物车' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '微信用户唯一标识',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '用户信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (4, 'ovaRx157dNbn0uS5-mqxZob7bzQQ', NULL, NULL, NULL, NULL, NULL, '2025-12-22 22:44:46');

SET FOREIGN_KEY_CHECKS = 1;
