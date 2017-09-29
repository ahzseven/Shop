/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-09-29 15:08:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '名称',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '图片路径',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '描述',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '网址',
  `sort_order` int(2) NOT NULL DEFAULT '99' COMMENT '排序',
  `is_show` int(1) NOT NULL DEFAULT '1' COMMENT '是否显示,默认为1',
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES ('1', '苹果', '0', '666', 'http:www.apple.com', '1', '1', '2017-09-16 10:15:55', '2017-09-16 10:15:55');
INSERT INTO `brands` VALUES ('2', '小米', '0', '为发烧而生', 'http://www.xiaomi.com', '7', '0', '2017-09-21 10:46:44', '2017-09-21 10:46:44');
INSERT INTO `brands` VALUES ('3', '华为', '0', '吊炸天', 'http://www.marcnote.com', '6', '0', '2017-09-21 10:46:45', '2017-09-21 10:46:45');
INSERT INTO `brands` VALUES ('4', '三星', '0', '酷酷酷', 'http://www.apple.com', '2', '0', '2017-09-16 14:42:35', '2017-09-16 14:42:35');
INSERT INTO `brands` VALUES ('5', '戴尔', '0', '酷酷酷', 'http://www.volvocars.com/zh-cn', '3', '0', '2017-09-21 10:46:48', '2017-09-21 10:46:48');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int(11) NOT NULL COMMENT '一级分类id',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '名称',
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片',
  `sort_order` smallint(6) NOT NULL DEFAULT '99' COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为显示,0为不显示',
  `description` text CHARACTER SET utf8 COMMENT '描述',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '0', '电脑', null, '2', '1', '互联网', '2017-09-14 11:13:02', '2017-09-14 11:13:02');
INSERT INTO `categories` VALUES ('2', '0', '手机', null, '3', '1', '移动端', '2017-09-16 21:24:04', '2017-09-16 21:24:04');
INSERT INTO `categories` VALUES ('3', '1', 'MacBook', null, '4', '1', '酷酷', '2017-09-16 15:05:15', '2017-09-16 15:05:15');
INSERT INTO `categories` VALUES ('4', '1', '戴尔', null, '7', '1', '不错', '2017-09-16 15:05:19', '2017-09-16 15:05:19');
INSERT INTO `categories` VALUES ('5', '2', 'iPhone', null, '2', '1', '哈哈', '2017-09-16 15:05:31', '2017-09-16 15:05:31');
INSERT INTO `categories` VALUES ('6', '2', '小米2017款', null, '5', '1', '切克闹wagee', '2017-09-16 15:02:12', '2017-09-16 15:02:12');

-- ----------------------------
-- Table structure for category_product
-- ----------------------------
DROP TABLE IF EXISTS `category_product`;
CREATE TABLE `category_product` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` smallint(6) unsigned NOT NULL COMMENT '分类id',
  `product_id` smallint(6) unsigned NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of category_product
-- ----------------------------
INSERT INTO `category_product` VALUES ('28', '5', '18');
INSERT INTO `category_product` VALUES ('29', '6', '19');
INSERT INTO `category_product` VALUES ('30', '3', '20');
INSERT INTO `category_product` VALUES ('31', '4', '21');

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` tinyint(11) DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `headimgurl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('11', 'ojoGDjnEi1NCwK3QtARq_FIvLZu0', '2', '深爱阳', '', '', '', '天津', null, null, null, 'http://wx.qlogo.cn/mmopen/78l5GCicaYg57SJsNMItiahfKBk1ia0xpqvN0n2fY5dZCiamQ5CwdA9tGiaAibnhIQB6ZFvzkEeekKswqbPtBxjk0NYRJ14sVibbBF0/0', '2015-08-24 03:35:51', '2015-08-24 03:35:51');
INSERT INTO `customers` VALUES ('12', 'ojoGDjsQtGkWm8LntV-D0HRyML14', '2', '徐琳', '', '', '', '', null, null, null, 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0CXZLAWDwPy8ngZ8aUoBjQOdOK1LkuAtYbKYYSQxd8IxkzVJkCYSNDspwXUfHKQfffgDURaovtDUyFvWjic0c5Iv/0', '2015-08-25 05:30:22', '2015-08-25 05:30:22');
INSERT INTO `customers` VALUES ('13', 'ojoGDjlK7mkAqJ03B2TEBCMJGYwI', '1', 'Lei', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkYjEKQWDy2dyaWjVS5f8v8hadae7rTWfxbhC7nbqAeHITTEerYlKmg1Cd979abvv6BuxZOWkibYLGg/0', '2015-08-30 03:49:00', '2015-08-30 03:49:00');
INSERT INTO `customers` VALUES ('14', 'ojoGDjvCYx8e2bG0-SdiN0IvIP9M', '1', '拒绝融化的冰', '', '', '西安', '陕西', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbRIRBp0Cib8qjuWbGfmiaHP7HicUhticuWC5Cn3TWNKHl2dlfVwEDIS1ib1ov27jibpia2UEp6JSfVNDcJE/0', '2015-08-30 06:25:46', '2015-08-30 06:25:46');
INSERT INTO `customers` VALUES ('16', 'ojoGDjkrcg1m8jVC33Kqrk9DO2Nk', '1', '蒋励睿', '', '', '咸宁', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbRniauuhrztxjIZA1EWlfOThhiaTHy6GicbiapoVDdSBJaSr4icVFKnQwc5cK0Soaou9iaSr8wL8Fr8DFf/0', '2015-09-29 04:03:27', '2015-09-29 04:03:27');
INSERT INTO `customers` VALUES ('18', 'ojoGDjhjbQzTgw0aE-rtCGbPDvSo', '1', '王63', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbaWffsuk3Qh8bPrIibvv5Qg6jHy1icfRNkXyA94AHiboaibhJQ5lUW70m78BpsXdZBIdpVyMzvNQyKsU/0', '2015-09-29 04:03:57', '2015-09-29 04:03:57');
INSERT INTO `customers` VALUES ('19', 'ojoGDjhB5ZsApmq6gTx8nL8wXy-g', '1', '所谓幸福、', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDibQ0FDYR3TrZJsxwVsp1vzmuH3ZbSNphVQMPdbZ3769nicsElJE1pl0WKAkHnJuv5v6ibB2RTl3gQw/0', '2015-09-29 04:41:33', '2015-09-29 04:41:33');
INSERT INTO `customers` VALUES ('20', 'ojoGDjqJ74JbIzSGVyZ1p4OxyRbc', '1', '怨你念你', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/78l5GCicaYg4R0NlUVU9J4C9U5eVI9u9ciaPAcsibcAdoF5QC9C9ZT3mV1MAKGSDGWxAppnvpOadaUCKVjY0FEeZ72PSkRSPlicX/0', '2015-09-29 04:41:59', '2015-09-29 04:41:59');
INSERT INTO `customers` VALUES ('21', 'ojoGDjr6BF2O8kqiwZ_FajSKu7y8', '1', '名字原来可以起这么长啊啊啊啊啊啊', '', '', '', '', null, null, null, 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0DNYM1ngGAN1aFF3jIzeGYicCDP12llo07FVplmTJ3Wowo3OP00Y8ictBn3KInseFIXZYNbAaIfuAtP9j7QibVE3gg/0', '2015-09-29 04:42:08', '2015-09-29 04:42:08');
INSERT INTO `customers` VALUES ('22', 'ojoGDjlWE7xDTfmCOdpRc5us_Lpw', '1', '熊国旗', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/XzhF92tBcezG6aSeCgjsPYITB6C27QHia9uic1mrpDpETSyA5dyrOrGibdgOdjnmcSUibN6LX0C1DRwSNquTqczXsA/0', '2015-09-29 04:42:15', '2015-09-29 04:42:15');
INSERT INTO `customers` VALUES ('23', 'ojoGDjr34dsRmJilaoUeVUi6qkdk', '1', '临川，阿三', '', '', '西安', '陕西', null, null, null, 'http://wx.qlogo.cn/mmopen/XzhF92tBcexMBB3N1ibgibhV3sHicIOtgIEibJsUgfmu6Y9673SLemRE446HRiceFdFw8zK8wQNcxtic0We910zMQMWQ/0', '2015-09-30 13:19:09', '2015-09-30 13:19:09');
INSERT INTO `customers` VALUES ('24', 'ojoGDjoy02l8pSk3Llrpe10ANmZU', '1', 'HDJ', '', '12', '', '', null, null, null, 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0BGvm0drKaaSM1esIeuFiccP5INjDdYz98YXKIkTUn4J0gg1jZvt9C5f5bGB2hMcsdnWIdCayRAasgBdNXb7ZYicD/0', '2015-11-03 10:25:40', '2016-04-23 14:20:02');
INSERT INTO `customers` VALUES ('25', 'ojoGDjpRbbk9zF3JaoT10FlB6kjM', '1', '阿兵', '', '', '荆门', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbYLLiaIWHNx7hWicnB4t9ibPTvd4ibp7vPkzg9K48PgE0DGeqLb91BPyzJ98vJ82PWXLjBw62cUKAFEJ/0', '2015-11-11 16:15:48', '2015-11-11 16:15:48');
INSERT INTO `customers` VALUES ('26', 'ojoGDjgTFqPQmQNukGPV9e_-hQLI', '1', '王敬贤', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkaxrzoSqXTa2pbFtQGx8o5XCeLIDC9F6UoSP7IKATCuyu8PR6S36a3ezHHEXmOwSvXp3Yicy5Y9YHC9ga4a4FuaR/0', '2015-11-20 08:11:29', '2015-11-20 08:11:29');
INSERT INTO `customers` VALUES ('27', 'ojoGDjgMcQT-tmCi5BkijpDuVu-c', '1', '金威', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM41YYemIiaO86ZAosTicOhFKicgVv6xbmerWlv7xkWic2MRxTpgSxttzCahabrxV38n4xAHnWudG0n39Q/0', '2015-11-20 13:47:39', '2015-11-20 13:47:39');
INSERT INTO `customers` VALUES ('28', 'ojoGDjtiswvF8a_jQ17kNYueqtEU', '1', '心程', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0DxeVmXBvGlp26icDIfYdnI4QJnia19spvSicFYXoohByaKzjTeeQ1ssj3TLoqzO6htJm5O7to8tBYaTWd6iaOWYwsb/0', '2015-11-21 16:39:42', '2015-11-21 16:39:42');
INSERT INTO `customers` VALUES ('29', 'ojoGDjg4pi2XWHH9NsJooV1mUIWo', '1', '芒果好好吃', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbSOprMiaq0znejzjiaOxjTm5M3icNPbZibxMTyphD0u9rzHAqg2L3myhWLeBCDnEDWGXBItvg2Yz4KxX/0', '2015-11-23 02:40:22', '2015-11-23 02:40:22');
INSERT INTO `customers` VALUES ('31', 'ojoGDjo9vGsCzmN9IJmH_lVLtF3A', '1', '江江', '', '10', '荆州', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/78l5GCicaYg57SJsNMItiahTFYjicBdabLRpaPmicfKYiazeibssprlc8vAia1JSjaoc6jPJ62O3mV7WvTYAFv3Krc4Dm4cVU80gJAg/0', '2016-04-22 11:34:13', '2016-04-22 20:37:34');
INSERT INTO `customers` VALUES ('32', 'ojoGDjjXiLbQuvhAP0RRZGkZbZa8', '2', '牛牛', '', '8', '荆州', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/XzhF92tBcewHcbEwUyHBkhPfpB1qhYaibEWSUHzCOWWfXQWianl5lYq5Voq6HGggnzYKqtRYiaE5sBWJdDInxpGkw/0', '2016-04-22 11:34:16', '2016-04-22 12:53:22');
INSERT INTO `customers` VALUES ('33', 'ojoGDjmz5-k-7exr58rMWef8Dbco', '2', '试着，改变', '', '21', '襄阳', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/78l5GCicaYg57SJsNMItiahYAqWRxsYnSbYz1IcsHh2WSXdyqppmHhVAJLAWVskuh6ScUfqmOicJ4NBVphhibSW0iapIL59jSE1Ql/0', '2016-04-22 11:34:50', '2016-04-24 13:41:44');
INSERT INTO `customers` VALUES ('34', 'ojoGDjlZytLCN7pIFvSNH8x6MxSw', '2', '皮皮', '', '9', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/XzhF92tBcezZribj8sibsXqfNgaWpt3Bb7icQApZZXbFNczCGu37c8icpsyicObU4zcsvPkSFw88vS9DSIwGHbuPb9w/0', '2016-04-22 12:51:40', '2016-04-22 12:57:14');
INSERT INTO `customers` VALUES ('35', 'ojoGDjsYl6YR0PCrNWsl-J02NqGo', '1', '流纪末', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLATHcHD3hmmzUoNumUHUiaxSmU0AuaGAvvXjUBFJUXAuOQKDex4y5bGM6TT19zze9u6SNQLPib916tZhicoekKibjyWqIyhQaZFXaQ/0', '2016-04-22 19:02:14', '2016-04-22 19:02:14');
INSERT INTO `customers` VALUES ('36', 'ojoGDjktNfh7-8WBTIQXeqgf2v-Y', '1', '风鸟', '', '', '', '河北', null, null, null, 'http://wx.qlogo.cn/mmopen/THgYXIphyQlz9hibKq3Vl0Sd41eNFkibc4CavIGdtRsRKicibrvaiabMiaBarsCdt8jDF0ocNiajkOb4AaibwX7BByUPnFarmwjicBCKo/0', '2016-04-22 20:31:00', '2016-04-22 20:31:00');
INSERT INTO `customers` VALUES ('37', 'ojoGDjiPrG-xrhItqUFlFNlyzPf8', '1', 'levitate', '', '25', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/78l5GCicaYg4lYWxIyKg4ZCIoq2bmuBsAHjicicHlSNw0vCIsSZhhas0SvcAlSeaMpZlCK6YS37cBWdNNUkwYqdcg/0', '2016-04-23 14:10:17', '2016-04-29 21:11:30');
INSERT INTO `customers` VALUES ('38', 'ojoGDjnVT86omBV-zO_quxsP7g10', '1', '第四维', '', '16', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/zC0YGM2wjE6184mngbhtJeMycSrpI4zwuMpnRXlTXl2ZdmjbLPrCic8WhIjX8z8qpEp7zUKAcVBiaLW3iaXFbEcfVsUUCAGXUGM/0', '2016-04-23 15:39:15', '2016-04-23 15:41:33');
INSERT INTO `customers` VALUES ('39', 'ojoGDjr0OGoVxxSVDZN0OGwACSK4', '2', '一缕晨曦', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/78l5GCicaYg605pQWBnPrup6TRrkPQaNMK9brN9GqNCAY7BeJagrScxyddju2MicFEQ8SlqbxQQLqMTxCxqib2m9x7p4A3NrxKn/0', '2016-04-25 10:57:34', '2016-04-25 10:57:34');
INSERT INTO `customers` VALUES ('40', 'ojoGDjnrzRZtcVIzlEcnXsmIofls', '2', '夏莉莉', '', '', '', '', null, null, null, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIyfJ6sKW3SfGJGQVicdK6eRflic68Oiawn1728MwszCpLEIBYsicicZmia0T2RCCzsfHN47hvYekGAOIJA/0', '2016-04-26 12:49:18', '2016-04-26 12:49:18');
INSERT INTO `customers` VALUES ('41', 'ojoGDju22lbYI7BGdcHYtH6TecBM', '1', '✿', '', '27', '', '', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbTfsvoBWbh8yYFwOsHS36oMKAJ7HjzO0RwbdiazMmibgIIe9oYpd2bniaCjtlbuMIIz3p0FAZrJcoGz/0', '2016-04-26 12:49:26', '2016-04-27 21:27:18');
INSERT INTO `customers` VALUES ('42', 'ojoGDjumgV1cP1b7yPpnINnutCpk', '2', '于晓嘉', '', '23', '', '', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkaxrzoSqXTa2iawYFKqTdUSGXNu87Oay95XblHiaAvh2666Mor5nEgRoBvvOMRoLNF98DldgPDlwN0WibUrqA1jUV5/0', '2016-04-26 12:49:27', '2016-04-26 14:31:09');
INSERT INTO `customers` VALUES ('43', 'ojoGDjjgrTaQqElAi54t2CuSN1_U', '1', ' ', '', '', '', '', null, null, null, 'http://wx.qlogo.cn/mmopen/THgYXIphyQlz9hibKq3Vl0bpX8iaWXypmI7j7piaDxaIsfnZqrw2LBFaLeicTXpicHPQ92tV0Sric0YVAgzcWL5bhgsUsvqyWcr5r1/0', '2016-04-26 14:16:53', '2016-04-26 14:16:53');
INSERT INTO `customers` VALUES ('44', 'ojoGDjmS1trWOpBqOX8liHIuxo4Y', '1', 'Disne', '', '30', '武汉', '湖北', null, null, null, '', '2016-04-27 12:17:51', '2016-05-10 13:01:16');
INSERT INTO `customers` VALUES ('45', 'ojoGDjmnUkgyF4_kXH11Ese4kDT8', '1', '翼龙', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0DNYM1ngGAN1WbcdRzvO7ULODeaSLHOoNxibUFFquRCeGftBmQibiaXFNPk00wKO04fKw1kIua8Jib26M2JhWEje6tO/0', '2016-04-28 11:06:37', '2016-04-28 11:06:37');
INSERT INTO `customers` VALUES ('46', 'ojoGDjtSU1NPZ5SqChQAh5CqEC0g', '1', '李东山', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDjQNpzmctEVGE5VGb7jBZ4mYV6mL6QvT5AyZvl01E7GSSsP1HBDviaibevfmPaRP3Yvayq7WskNRtg/0', '2016-05-03 22:27:26', '2016-05-03 22:27:26');
INSERT INTO `customers` VALUES ('47', 'ojoGDjh2IY3OKt3UleD1qwp_lgEo', '1', 'Aaron Ryuu', '', '28', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/78l5GCicaYg57SJsNMItiahX87hLKHqPyfLhojdcdo6GZmES4pib7eOicSKCuUwaNibnic9Pg5MTlCOm0H8HUYw4ibmePqbGZuswmTB/0', '2016-05-03 22:53:41', '2016-06-15 15:20:30');
INSERT INTO `customers` VALUES ('48', 'ojoGDjiJ_VsMHqGbkAKyTAys3lSU', '1', '懒得理你', '', '29', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELzu4F55YaM1ew6y3xUO5OzhKiacibRj1sXFJOl3nfbsSZCrIbl4bZIt86nJ0rVJH8ZTFKiaQ32CV8AQ/0', '2016-05-06 14:26:22', '2016-05-06 14:27:51');
INSERT INTO `customers` VALUES ('49', 'ojoGDjiqhwS8oMSXI5yJfuom7ig4', '2', '西子', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKvS4B2CdqiaLdZ4MeibroFpJpicX2lxALn1RqD9Zq1KAPyUojPO7XXzsFvNlBCOC7sRdUMXltOoiae7g/0', '2016-05-06 14:26:25', '2016-05-06 14:26:25');
INSERT INTO `customers` VALUES ('50', 'ojoGDjnna8WPffcub0CIHFUGMUgA', '1', '万卷皓', '', '32', '', '北京', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkbSAovDpbnwmrcfD6GtBhjpMJ8SckblGrPMOjFVv6ydVqHfBzvCFYAGv8TQEsy0CExEbcDV68cTSPsNFJpkCb1G/0', '2016-05-25 10:54:59', '2016-05-25 10:56:14');
INSERT INTO `customers` VALUES ('51', 'ojoGDjm8YXj7csf3VaGBZLEEonSY', '1', '( ͡° ͜ʖ ͡°)', '', '33', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM70ickTldycTXqMjQ9Fnpxlj28J6FKThhNfrNccXxibppW7EMtxbukRBQ5CLMLQuAM7p6dBLlgtvXaFMVHeDtgAEhia5QfXnPrdSI/0', '2016-05-30 15:48:20', '2016-05-30 15:50:22');
INSERT INTO `customers` VALUES ('52', 'ojoGDjvHyvbcD_csxiNjgTY841jk', '1', '邓权', '', '', '荆门', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0AH1TmC6n0ZSxFZVNnyq6UCISoMRqspicq41CNjRKuljOyaROjGqPO1aB7JOK4oJhB8yDH6yXjpyWYqkzlRcyeD4/0', '2016-06-12 22:12:34', '2016-06-12 22:12:34');
INSERT INTO `customers` VALUES ('53', 'ojoGDjl0D7i2ofFcKRr1jM4U0zXU', '1', '冯帅', '', '34', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/XzhF92tBcexI7p8K0pv578XCkcZ0ewNOPonh9Fdk73OgF5nEbU4jZuygDehaic2svOeVIib6VJ8YpicylNk65x2NlITCYoc6WxF/0', '2016-06-13 15:05:11', '2016-06-13 15:06:14');
INSERT INTO `customers` VALUES ('54', 'ojoGDjt-pbDBVFMV3bMYoTTcjnZc', '1', '未来多远', '', '35', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDTHiak5CA3fOH844ETI25HU9OsZtvKRdicZSdXgbY5NvvzCYK9Gib8z3qxdCh4vFGcRLYzzFnr91beg/0', '2016-06-13 15:05:16', '2016-06-14 21:03:52');
INSERT INTO `customers` VALUES ('55', 'ojoGDjlmTE-mJt-i58rXdkTf4ASM', '1', 'ccs', '', '36', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/XzhF92tBcexkobRoZAnN7s2icXgjMqGsuKHBZh8STqzhrodJiboOLCN1FJ4X6mSw45yV6HCgiaRXlYssNv2TJE7YNj2jGdpJyQu/0', '2016-06-15 14:45:39', '2016-06-15 14:48:53');
INSERT INTO `customers` VALUES ('56', 'ojoGDjhZ44mDOLJQtwuC2J2YIDIM', '1', 'Forrest', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/78l5GCicaYg57SJsNMItiahRzLgLyGnPkiaxYFtI4Nd7MngfdLibYJHaAY9rfdXpvnkv2Maiaxlo7CUWib6Saq3Thxd3Sibdthb5Pvic/0', '2016-06-15 15:11:57', '2016-06-15 15:11:57');
INSERT INTO `customers` VALUES ('57', 'ojoGDjuv0LFXojPCj4y4_i2iOAHk', '1', '莫忘初心', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/78l5GCicaYg57SJsNMItiahctDEdFSRgnWyf8TCetSZutwMS1k11gVFK4E6icVniaWqGSuasRlCoHhJznKDvcmYBSNskppxqycYic/0', '2016-06-15 15:12:40', '2016-06-15 15:12:40');
INSERT INTO `customers` VALUES ('58', 'ojoGDjmh3bPk2eDAIutLHoaLBqko', '2', '云', '', '', '西安', '陕西', null, null, null, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLANr0edkxrgReBficSRdicjStOSiaEncCpXZJZAOn6lSMpTp9XpxvzamtcExlFS0AXsAbElxLREXA9CwmvMDy0nVb7yK23lVibqTlE/0', '2016-06-15 18:35:51', '2016-06-15 18:35:51');
INSERT INTO `customers` VALUES ('59', 'ojoGDjmEg9NUtrFzXI6wG5Rrbw70', '1', '如果如果。', '', '38', '鄂州', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/XzhF92tBcewHdAPW9C2dyChRUIzESADDgGQKxNW00uAWhQH7H9QftzZdwP6yULSJic6aF34SPIgmkZOute4ic8Ww/0', '2016-06-19 22:37:39', '2016-06-19 22:38:23');
INSERT INTO `customers` VALUES ('60', 'ojoGDjvIykQNT9LTIjEAMnBAPAwg', '1', '電助', '', '39', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkaxrzoSqXTa2s8HQfXlNibhDQv5qrQ7ET18DKBgEiaroux1vUnyunQQWNnlN0Dmltr5LEQ92qHmxwiaqCSUtce56DK/0', '2016-06-20 10:22:39', '2016-06-20 10:23:49');
INSERT INTO `customers` VALUES ('61', 'ojoGDjv5D0XKNoGGyAUpiBiSUiSs', '1', 'Abing', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/83cU0pcHqg6fxQovqXskDuRvFF1RVfLBsxxB8Chc9cHIIJL6wGBljxJ4I8bfFruzhI3hyCzDEaohY8ssstWdPTkbyjvtMqxD/0', '2016-06-21 10:52:46', '2016-06-21 10:52:46');
INSERT INTO `customers` VALUES ('62', 'ojoGDjlOHoXdNFy11GYHQiyf_Z-A', '1', '轻风~', '', '40', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbeMwBnqEEcDAa3vw7IgnGcq2TOt0d17DBMvyWEYOGAhEYc2dOeov7gKSABRCEpj2WDpxtr57SRiaR/0', '2016-06-23 12:58:47', '2016-06-23 13:01:09');
INSERT INTO `customers` VALUES ('63', 'ozw1Nwy8AFyVPnV61cLdQk0NXLT4', '1', 'Holy', null, null, '墨尔本', '维多利亚', null, null, null, 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0BGvm0drKaaSM1esIeuFiccP5INjDdYz98YXKIkTUn4J0gg1jZvt9C5f5bGB2hMcsdnWIdCayRAasgBdNXb7ZYicD/0', '2017-06-25 20:19:33', null);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2016_12_22_220609_create_roles_tables', '2');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` tinyint(2) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '路由name',
  `icon` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '图标',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权限名称',
  `sort_order` smallint(2) unsigned DEFAULT '99' COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', '0', 'shop', 'am-icon-github', '商城管理', '99', '2017-09-22 15:14:39', '2017-09-24 19:48:03');
INSERT INTO `permissions` VALUES ('2', '0', 'ads', null, '广告中心', '99', '2017-09-22 15:32:46', '2017-09-22 15:32:50');
INSERT INTO `permissions` VALUES ('3', '0', 'cms', null, '官网管理', '99', '2017-09-22 15:33:44', '2017-09-22 15:33:47');
INSERT INTO `permissions` VALUES ('4', '0', 'crm', null, '学生中心', '99', '2017-09-22 15:34:12', '2017-09-22 15:34:14');
INSERT INTO `permissions` VALUES ('5', '0', 'wechat', null, '微信管理', '99', '2017-09-22 15:34:35', '2017-09-22 15:34:38');
INSERT INTO `permissions` VALUES ('6', '0', 'system', null, '系统管理', '99', '2017-09-22 15:35:12', '2017-09-25 15:58:52');
INSERT INTO `permissions` VALUES ('7', '1', 'shop.index', 'am-icon-github', '仪表盘', '99', '2017-09-22 15:36:05', '2017-09-22 15:36:08');
INSERT INTO `permissions` VALUES ('8', '1', 'shop.order.index', 'am-icon-github', '订单管理', '99', '2017-09-22 15:37:04', '2017-09-22 15:37:09');
INSERT INTO `permissions` VALUES ('9', '1', 'shop.product.index', 'am-icon-github', '商品管理', '99', '2017-09-22 15:38:01', '2017-09-25 14:03:54');
INSERT INTO `permissions` VALUES ('10', '1', 'shop.category.index', 'am-icon-github', '商品分类', '99', '2017-09-22 15:38:24', '2017-09-22 15:38:20');
INSERT INTO `permissions` VALUES ('11', '1', 'shop.brand.index', 'am-icon-github', '商品品牌', '99', '2017-09-22 15:39:28', '2017-09-22 15:39:32');
INSERT INTO `permissions` VALUES ('12', '1', 'shop.customer.index', 'am-icon-github', '会员管理', '99', '2017-09-22 15:40:30', '2017-09-22 15:40:35');
INSERT INTO `permissions` VALUES ('13', '1', 'shop.express.index', 'am-icon-github', '物流运费', '99', '2017-09-22 15:41:15', '2017-09-22 15:41:21');
INSERT INTO `permissions` VALUES ('14', '1', 'shop.product.trash', 'am-icon-github', '商品回收站', '99', '2017-09-22 15:41:58', '2017-09-22 15:42:00');
INSERT INTO `permissions` VALUES ('15', '8', 'shop.order.show', '', '显示', '99', '2017-09-22 15:44:06', '2017-09-22 15:44:10');
INSERT INTO `permissions` VALUES ('16', '8', 'shop.order.update', '', '更新', '99', '2017-09-22 15:44:45', '2017-09-22 15:44:47');
INSERT INTO `permissions` VALUES ('17', '8', 'shop.order.picking', '', '更新状态 : 配货', '99', '2017-09-22 15:46:10', '2017-09-22 15:46:15');
INSERT INTO `permissions` VALUES ('18', '8', 'shop.order.shipping', '', '更新状态 : 发货', '99', '2017-09-22 15:49:11', '2017-09-22 15:49:14');
INSERT INTO `permissions` VALUES ('19', '8', 'shop.brand.finish', '', '更新状态 : 交易成功', '99', '2017-09-22 15:50:13', '2017-09-22 15:50:15');
INSERT INTO `permissions` VALUES ('20', '9', 'shop.product.create', '', '新增', '99', '2017-09-22 15:53:07', '2017-09-22 15:53:09');
INSERT INTO `permissions` VALUES ('21', '9', 'shop.product.store', null, '保存', '99', '2017-09-22 15:53:48', '2017-09-22 15:53:51');
INSERT INTO `permissions` VALUES ('22', '9', 'shop.product.edit', null, '编辑', '99', '2017-09-22 15:54:17', '2017-09-22 15:54:22');
INSERT INTO `permissions` VALUES ('23', '9', 'shop.product.update', null, '更新', '99', '2017-09-22 15:55:03', '2017-09-22 15:55:06');
INSERT INTO `permissions` VALUES ('24', '9', 'shop.product.destroy', null, '删除', '99', '2017-09-22 15:55:42', '2017-09-22 15:55:45');
INSERT INTO `permissions` VALUES ('25', '9', 'shop.product.change_stock', null, '修改库存', '99', '2017-09-22 15:56:30', '2017-09-22 15:56:34');
INSERT INTO `permissions` VALUES ('26', '9', 'shop.product.destroy_checked', null, '多选删除', '99', '2017-09-22 15:57:18', '2017-09-22 15:57:22');
INSERT INTO `permissions` VALUES ('27', '9', 'shop.product.destroy_gallery', null, '删除相册', '99', '2017-09-22 15:58:00', '2017-09-22 15:58:04');
INSERT INTO `permissions` VALUES ('28', '9', 'shop.product.is_something', null, '修改属性', '99', '2017-09-22 15:58:44', '2017-09-22 15:58:47');
INSERT INTO `permissions` VALUES ('29', '10', 'shop.category.create', null, '新增', '99', '2017-09-22 16:01:47', '2017-09-22 16:01:52');
INSERT INTO `permissions` VALUES ('30', '10', 'shop.category.store', null, '保存', '99', '2017-09-22 16:05:36', '2017-09-22 16:05:38');
INSERT INTO `permissions` VALUES ('31', '10', 'shop.category.edit', null, '编辑', '99', '2017-09-22 19:56:07', '2017-09-22 19:56:09');
INSERT INTO `permissions` VALUES ('32', '10', 'shop.category.update', null, '更新', '99', '2017-09-22 19:56:46', '2017-09-22 19:56:48');
INSERT INTO `permissions` VALUES ('33', '10', 'shop.category.destroy', null, '删除', '99', '2017-09-22 19:57:24', '2017-09-22 19:57:29');
INSERT INTO `permissions` VALUES ('34', '10', 'shop.category.sort_order', null, '排序', '99', '2017-09-22 19:58:09', '2017-09-22 19:58:11');
INSERT INTO `permissions` VALUES ('35', '10', 'shop.category.is_something', null, '修改属性', '99', '2017-09-22 19:59:12', '2017-09-22 19:59:14');
INSERT INTO `permissions` VALUES ('36', '11', 'shop.brand.create', null, '新增', '99', '2017-09-22 20:00:45', '2017-09-22 20:00:48');
INSERT INTO `permissions` VALUES ('37', '11', 'shop.brand.store', null, '保存', '99', '2017-09-22 20:01:22', '2017-09-22 20:01:24');
INSERT INTO `permissions` VALUES ('38', '11', 'shop.brand.edit', null, '编辑', '99', '2017-09-22 20:01:52', '2017-09-22 20:01:54');
INSERT INTO `permissions` VALUES ('39', '11', 'shop.brand.update', null, '更新', '99', '2017-09-22 20:02:18', '2017-09-22 20:02:21');
INSERT INTO `permissions` VALUES ('40', '11', 'shop.brand.destroy', null, '删除', '99', '2017-09-22 20:02:45', '2017-09-22 20:02:47');
INSERT INTO `permissions` VALUES ('41', '11', 'shop.brand.destroy_checked', null, '多选删除', '99', '2017-09-22 20:03:20', '2017-09-22 20:03:22');
INSERT INTO `permissions` VALUES ('42', '11', 'shop.brand.sort_order', null, '排序', '99', '2017-09-22 20:03:52', '2017-09-22 20:03:54');
INSERT INTO `permissions` VALUES ('43', '11', 'shop.brand.is_something', null, '修改属性', '99', '2017-09-22 20:04:26', '2017-09-22 20:04:28');
INSERT INTO `permissions` VALUES ('44', '12', 'shop.customer.create', null, '新增', '99', '2017-09-23 01:12:17', '2017-09-23 01:12:17');
INSERT INTO `permissions` VALUES ('45', '12', 'shop.customer.store', null, '保存', '99', '2017-09-23 01:27:57', '2017-09-23 01:27:57');
INSERT INTO `permissions` VALUES ('46', '12', 'shop.customer.edit', null, '编辑', '99', '2017-09-23 01:29:02', '2017-09-23 01:29:02');
INSERT INTO `permissions` VALUES ('47', '12', 'shop.customer.update', 'aeg', '更新', '99', '2017-09-23 10:34:30', '2017-09-23 10:34:30');
INSERT INTO `permissions` VALUES ('48', '12', 'shop.customer.destroy', null, '删除', '99', '2017-09-25 10:34:55', '2017-09-25 10:35:11');
INSERT INTO `permissions` VALUES ('49', '13', 'shop.express.create', null, '新增', '99', '2017-09-25 10:36:48', '2017-09-25 10:36:54');
INSERT INTO `permissions` VALUES ('50', '13', 'shop.express.store', null, '保存', '99', '2017-09-25 10:41:33', '2017-09-25 10:41:35');
INSERT INTO `permissions` VALUES ('51', '13', 'shop.express.edit', null, '编辑', '99', '2017-09-25 10:42:13', '2017-09-25 10:42:15');
INSERT INTO `permissions` VALUES ('52', '13', 'shop.express.update', null, '更新', '99', '2017-09-25 10:45:41', '2017-09-25 10:45:44');
INSERT INTO `permissions` VALUES ('53', '13', 'shop.express.destroy', null, '删除', '99', '2017-09-25 10:46:07', '2017-09-25 10:46:09');
INSERT INTO `permissions` VALUES ('54', '13', 'shop.express.sort_order', null, '排序', '99', '2017-09-25 10:46:41', '2017-09-25 10:46:43');
INSERT INTO `permissions` VALUES ('55', '13', 'shop.express.is_something', null, '修改属性', '99', '2017-09-25 10:47:13', '2017-09-25 10:47:15');
INSERT INTO `permissions` VALUES ('56', '14', 'shop.product.trash', null, '回收站列表', '99', '2017-09-25 10:48:19', '2017-09-25 10:48:22');
INSERT INTO `permissions` VALUES ('57', '14', 'shop.product.restore', null, '还原', '99', '2017-09-25 10:48:58', '2017-09-25 10:49:00');
INSERT INTO `permissions` VALUES ('58', '14', 'shop.product.restore_checked', null, '多选还原', '99', '2017-09-25 10:50:10', '2017-09-25 10:50:15');
INSERT INTO `permissions` VALUES ('59', '14', 'shop.product.force_destroy', null, '永久删除', '99', '2017-09-25 10:51:22', '2017-09-25 10:51:28');
INSERT INTO `permissions` VALUES ('60', '14', 'shop.product.force_destroy_checked', null, '多选永久删除', '99', '2017-09-25 10:52:22', '2017-09-25 10:52:26');
INSERT INTO `permissions` VALUES ('61', '2', 'ads.ad.index', null, '广告管理', '99', '2017-09-25 10:53:29', '2017-09-25 10:53:33');
INSERT INTO `permissions` VALUES ('62', '2', 'ads.category.index', null, '广告分类', '99', '2017-09-25 10:56:02', '2017-09-25 10:56:06');
INSERT INTO `permissions` VALUES ('63', '2', 'ads.ad.trash', null, '广告回收站', '99', '2017-09-25 10:58:56', '2017-09-25 10:58:58');
INSERT INTO `permissions` VALUES ('64', '61', 'ads.ad.create', null, '新增', '99', '2017-09-25 14:09:55', '2017-09-25 14:09:58');
INSERT INTO `permissions` VALUES ('65', '61', 'ads.ad.store', null, '保存', '99', '2017-09-25 14:11:10', '2017-09-25 14:11:25');
INSERT INTO `permissions` VALUES ('66', '61', 'ads.ad.edit', null, '编辑', '99', '2017-09-25 14:12:11', '2017-09-25 14:12:13');
INSERT INTO `permissions` VALUES ('67', '61', 'ads.ad.update', null, '更新', '99', '2017-09-25 14:12:39', '2017-09-25 14:12:41');
INSERT INTO `permissions` VALUES ('68', '61', 'ads.ad.destroy', null, '删除', '99', '2017-09-25 14:13:11', '2017-09-25 14:13:18');
INSERT INTO `permissions` VALUES ('69', '61', 'ads.ad.sort_order', null, '排序', '99', '2017-09-25 14:13:51', '2017-09-25 14:13:55');
INSERT INTO `permissions` VALUES ('70', '61', 'ads.ad.destroy_checked', null, '多选删除', '99', '2017-09-25 14:14:42', '2017-09-25 14:14:44');
INSERT INTO `permissions` VALUES ('71', '61', 'ads.ad.is_something', null, '修改属性', '99', '2017-09-25 14:15:10', '2017-09-25 14:15:12');
INSERT INTO `permissions` VALUES ('72', '62', 'ads.category.create', null, '新增', '99', '2017-09-25 14:16:24', '2017-09-25 14:16:27');
INSERT INTO `permissions` VALUES ('73', '62', 'ads.category.store', null, '保存', '99', '2017-09-25 14:16:53', '2017-09-25 14:16:57');
INSERT INTO `permissions` VALUES ('74', '62', 'ads.category.edit', null, '编辑', '99', '2017-09-25 14:17:24', '2017-09-25 14:17:29');
INSERT INTO `permissions` VALUES ('75', '62', 'ads.category.update', null, '更新', '99', '2017-09-25 14:19:11', '2017-09-25 14:19:14');
INSERT INTO `permissions` VALUES ('76', '62', 'ads.category.destroy', null, '删除', '99', '2017-09-25 14:20:09', '2017-09-25 14:20:13');
INSERT INTO `permissions` VALUES ('77', '62', 'ads.category.sort_order', null, '排序', '99', '2017-09-25 14:22:15', '2017-09-25 14:22:15');
INSERT INTO `permissions` VALUES ('78', '62', 'ads.category.destroy_checked', null, '多选删除', '99', '2017-09-25 14:29:26', '2017-09-25 14:29:26');
INSERT INTO `permissions` VALUES ('79', '63', 'ads.ad.trash', null, '回收站列表', '99', '2017-09-25 14:35:00', '2017-09-25 14:35:00');
INSERT INTO `permissions` VALUES ('80', '63', 'ads.ad.restore', null, '还原', '99', '2017-09-25 14:36:35', '2017-09-25 14:36:35');
INSERT INTO `permissions` VALUES ('81', '63', 'ads.ad.restore_checked', null, '多选还原', '99', '2017-09-25 14:38:39', '2017-09-25 14:38:39');
INSERT INTO `permissions` VALUES ('82', '63', 'ads.ad.destroy_checked', null, '永久删除', '99', '2017-09-25 15:03:51', '2017-09-25 15:36:37');
INSERT INTO `permissions` VALUES ('83', '63', 'ads.ad.force_destroy_checked', null, '多选永久删除', '99', '2017-09-25 15:37:35', '2017-09-25 15:37:35');
INSERT INTO `permissions` VALUES ('84', '5', 'wechat.menu.edit', null, '自定义菜单', '99', '2017-09-25 15:39:48', '2017-09-25 15:39:48');
INSERT INTO `permissions` VALUES ('85', '84', 'wechat.menu.edit', null, '编辑', '99', '2017-09-25 15:40:19', '2017-09-25 15:40:19');
INSERT INTO `permissions` VALUES ('86', '84', 'wechat.menu.update', null, '更新', '99', '2017-09-25 15:40:52', '2017-09-25 15:40:52');
INSERT INTO `permissions` VALUES ('87', '84', 'wechat.menu.destroy', null, '删除', '99', '2017-09-25 15:41:12', '2017-09-25 15:41:12');
INSERT INTO `permissions` VALUES ('88', '6', 'logs', null, '系统日志', '99', '2017-09-25 15:44:11', '2017-09-25 15:44:11');
INSERT INTO `permissions` VALUES ('89', '6', 'system.permission.index', null, '权限管理', '99', '2017-09-25 15:44:46', '2017-09-25 15:45:14');
INSERT INTO `permissions` VALUES ('90', '6', 'system.role.index', null, '用户组管理', '99', '2017-09-25 15:45:42', '2017-09-25 15:55:27');
INSERT INTO `permissions` VALUES ('91', '6', 'system.user.index', null, '用户管理', '99', '2017-09-25 15:46:15', '2017-09-25 15:55:19');
INSERT INTO `permissions` VALUES ('92', '6', 'system.cache.index', null, '缓存管理', '99', '2017-09-25 15:46:36', '2017-09-25 15:46:36');
INSERT INTO `permissions` VALUES ('93', '6', 'system.config.edit', null, '系统设置', '99', '2017-09-25 15:46:57', '2017-09-25 16:00:00');
INSERT INTO `permissions` VALUES ('94', '89', 'system.permission.store', null, '保存', '99', '2017-09-25 15:47:40', '2017-09-25 15:47:40');
INSERT INTO `permissions` VALUES ('95', '89', 'system.permission.edit', null, '编辑', '99', '2017-09-25 15:48:04', '2017-09-25 15:48:04');
INSERT INTO `permissions` VALUES ('96', '89', 'system.permission.update', null, '更新', '99', '2017-09-25 15:48:24', '2017-09-25 15:48:24');
INSERT INTO `permissions` VALUES ('97', '89', 'system.permission.destroy', null, '删除', '99', '2017-09-25 15:48:54', '2017-09-25 15:48:54');
INSERT INTO `permissions` VALUES ('98', '89', 'system.permission.sort_order', null, '排序', '99', '2017-09-25 15:49:24', '2017-09-25 15:49:24');
INSERT INTO `permissions` VALUES ('99', '90', 'system.role.create', null, '新增', '99', '2017-09-25 15:50:16', '2017-09-25 15:50:16');
INSERT INTO `permissions` VALUES ('100', '90', 'system.role.store', null, '保存', '99', '2017-09-25 15:50:43', '2017-09-25 15:50:43');
INSERT INTO `permissions` VALUES ('101', '90', 'system.role.edit', null, '编辑', '99', '2017-09-25 15:51:03', '2017-09-25 15:51:03');
INSERT INTO `permissions` VALUES ('102', '90', 'system.role.update', null, '更新', '99', '2017-09-25 15:51:26', '2017-09-25 15:51:26');
INSERT INTO `permissions` VALUES ('103', '90', 'system.role.destroy', null, '删除', '99', '2017-09-25 15:51:52', '2017-09-25 15:51:52');
INSERT INTO `permissions` VALUES ('104', '91', 'system.user.create', null, '新增', '99', '2017-09-25 15:53:03', '2017-09-25 15:53:03');
INSERT INTO `permissions` VALUES ('105', '91', 'system.user.store', null, '保存', '99', '2017-09-25 15:53:28', '2017-09-25 15:53:28');
INSERT INTO `permissions` VALUES ('106', '91', 'system.user.edit', null, '编辑', '99', '2017-09-25 15:54:03', '2017-09-25 15:54:03');
INSERT INTO `permissions` VALUES ('107', '91', 'system.user.update', null, '更新', '99', '2017-09-25 15:54:26', '2017-09-25 15:54:26');
INSERT INTO `permissions` VALUES ('108', '91', 'system.user.destroy', null, '删除', '99', '2017-09-25 15:54:46', '2017-09-25 15:54:46');
INSERT INTO `permissions` VALUES ('109', '92', 'system.cache.destroy', null, '清除缓存', '99', '2017-09-25 15:56:20', '2017-09-25 15:56:20');
INSERT INTO `permissions` VALUES ('110', '93', 'system.config.edit', null, '编辑', '99', '2017-09-25 15:56:54', '2017-09-25 15:56:54');
INSERT INTO `permissions` VALUES ('111', '93', 'system.config.update', null, '更新', '99', '2017-09-25 15:57:18', '2017-09-25 15:57:18');
INSERT INTO `permissions` VALUES ('112', '93', 'system.photo.update', null, '上传图片', '99', '2017-09-25 15:57:47', '2017-09-25 15:57:47');
INSERT INTO `permissions` VALUES ('113', '93', 'system.photo.upload_icon', null, '上传网站icon图标', '99', '2017-09-25 15:58:42', '2017-09-25 16:04:08');

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES ('1', '3');
INSERT INTO `permission_role` VALUES ('7', '3');
INSERT INTO `permission_role` VALUES ('8', '3');
INSERT INTO `permission_role` VALUES ('9', '3');
INSERT INTO `permission_role` VALUES ('10', '3');
INSERT INTO `permission_role` VALUES ('11', '3');
INSERT INTO `permission_role` VALUES ('15', '3');
INSERT INTO `permission_role` VALUES ('16', '3');
INSERT INTO `permission_role` VALUES ('17', '3');
INSERT INTO `permission_role` VALUES ('18', '3');
INSERT INTO `permission_role` VALUES ('19', '3');
INSERT INTO `permission_role` VALUES ('20', '3');
INSERT INTO `permission_role` VALUES ('21', '3');
INSERT INTO `permission_role` VALUES ('29', '3');
INSERT INTO `permission_role` VALUES ('30', '3');
INSERT INTO `permission_role` VALUES ('36', '3');
INSERT INTO `permission_role` VALUES ('37', '3');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) unsigned DEFAULT NULL COMMENT '品牌id',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '缩略图',
  `price` decimal(10,2) unsigned DEFAULT NULL COMMENT '价格',
  `is_top` tinyint(4) unsigned NOT NULL COMMENT '置顶',
  `is_recommend` tinyint(4) unsigned DEFAULT NULL COMMENT '推荐',
  `is_hot` tinyint(4) unsigned DEFAULT NULL COMMENT '热销',
  `is_new` tinyint(4) unsigned DEFAULT NULL COMMENT '新品',
  `is_onsale` tinyint(4) unsigned DEFAULT NULL COMMENT '打折',
  `stock` int(11) unsigned NOT NULL COMMENT '存货',
  `sort_order` smallint(6) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `description` text CHARACTER SET utf8 COMMENT '商品描述',
  `content` text CHARACTER SET utf8,
  `markdown_html_code` text CHARACTER SET utf8 COMMENT '商品详情',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('18', '1', '苹果8', 'http://ow5nehaxj.bkt.clouddn.com/zdMR7kj1ZeXAKTVQafrOylW7UYKLhsx037utt17N.jpeg', '5600.00', '1', '0', '0', '0', '1', '78', '99', null, null, null, '2017-09-27 14:32:49', '2017-09-27 14:32:49', null);
INSERT INTO `products` VALUES ('19', '2', '小米9', 'http://ow5nehaxj.bkt.clouddn.com/GW338ir0X0nNxQuIfD3Bxr6UVh3No3xt8up8hMVE.jpeg', '7000.00', '0', '0', '0', '0', '0', '45', '99', null, null, null, '2017-09-21 13:50:42', '2017-09-21 13:50:42', null);
INSERT INTO `products` VALUES ('20', '1', 'MacBookPro', 'http://ow5nehaxj.bkt.clouddn.com/vFMbRHdNNSyJ4k0fHELQpAwye0WI6xzeMc5PXWEU.jpeg', '678.00', '0', '1', '0', '0', '0', '23', '99', null, null, null, '2017-09-27 14:32:49', '2017-09-27 14:32:49', null);
INSERT INTO `products` VALUES ('21', '5', '戴尔', 'http://ow5nehaxj.bkt.clouddn.com/P35IW7rw52SiqbeczZp4ldsHiafAexcJz4MGBMbC.jpeg', '78.00', '1', '0', '0', '0', '1', '23', '99', null, null, null, '2017-09-27 14:32:49', '2017-09-27 14:32:49', null);

-- ----------------------------
-- Table structure for product_galleries
-- ----------------------------
DROP TABLE IF EXISTS `product_galleries`;
CREATE TABLE `product_galleries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) unsigned NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '单个商品的图片地址',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product_galleries
-- ----------------------------
INSERT INTO `product_galleries` VALUES ('14', '19', 'http://ow5nehaxj.bkt.clouddn.com/20170921053314_761403.jpg', '2017-09-21 13:33:18', '2017-09-21 13:33:18');
INSERT INTO `product_galleries` VALUES ('15', '19', 'http://ow5nehaxj.bkt.clouddn.com/20170921053314_627739.jpg', '2017-09-21 13:33:18', '2017-09-21 13:33:18');
INSERT INTO `product_galleries` VALUES ('16', '20', 'http://ow5nehaxj.bkt.clouddn.com/20170921053504_801220.jpg', '2017-09-21 13:35:08', '2017-09-21 13:35:08');
INSERT INTO `product_galleries` VALUES ('17', '20', 'http://ow5nehaxj.bkt.clouddn.com/20170921053504_983232.jpg', '2017-09-21 13:35:08', '2017-09-21 13:35:08');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '超级管理员', null, '2017-09-22 14:57:25', '2017-09-22 14:57:28');
INSERT INTO `roles` VALUES ('2', '管理员', null, '2017-09-22 14:57:39', '2017-09-22 14:57:43');
INSERT INTO `roles` VALUES ('3', '学生', null, '2017-09-22 14:58:02', '2017-09-22 14:58:04');

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES ('1', '1');
INSERT INTO `role_user` VALUES ('3', '2');
INSERT INTO `role_user` VALUES ('2', '3');
INSERT INTO `role_user` VALUES ('3', '3');
INSERT INTO `role_user` VALUES ('2', '4');

-- ----------------------------
-- Table structure for systems
-- ----------------------------
DROP TABLE IF EXISTS `systems`;
CREATE TABLE `systems` (
  `id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '网站名称',
  `keyword` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述信息',
  `icon` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '网站图标',
  `icp_record` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT 'icp备案号',
  `copyright` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '版权信息',
  `admin` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '管理员',
  `company` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '公司名称',
  `qq` varchar(16) CHARACTER SET utf8 DEFAULT NULL COMMENT 'QQ号',
  `email` varchar(48) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机号',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of systems
-- ----------------------------
INSERT INTO `systems` VALUES ('1', 'shop商城后台管理', 'shop商城', '自主研发,历时7天的商城系统', null, '鄂ICP备13016268号', 'Copyright © 2013-2017 SHOP商城公司版权所有', 'Marc', 'Shop商城', '1234567', 'ahzseven@outlook.com', '13123456789', '2017-09-20 20:39:30', '2017-09-20 20:39:30');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `realname` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机号码',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `openid` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '微信号',
  `tel` varchar(24) CHARACTER SET utf8 DEFAULT NULL,
  `address_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '城市id',
  `city` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '城市',
  `province` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '省份',
  `headimgurl` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', 'marc', '280360671@qq.com', '13412345678', '$2y$10$cONYW0/3qVIVyxBZcE83je0qWM192xDfYdWMkdXUefKyaVBzp/ORu', 'cl3wXuuw6p78eyyyhnvlBPOA6zvszgAEieeeqjSgAz8RuNQxfTHSrMzSgwuU', '2017-09-06 07:20:09', '2017-09-13 20:41:17', '1', null, null, null, '深圳', '广东', null);
INSERT INTO `users` VALUES ('2', 'marchub', 'marc', 'ahzseven@outlook.com', '13412345678', '$2y$10$cONYW0/3qVIVyxBZcE83je0qWM192xDfYdWMkdXUefKyaVBzp/ORu', 'W8wLwTZnhkEPuwxZMBwi9UFGpXyALNr8BWAViqEE8uzMV6lhbpE2hOktocsj', '2017-09-25 12:42:03', '2017-09-25 12:42:07', '1', null, null, null, '上海', '上海', null);
INSERT INTO `users` VALUES ('3', 'admin23', '哈哈哈', 'admin@out.com', null, 'admina', null, '2017-09-26 14:41:30', '2017-09-27 13:26:04', '2', null, null, null, '北京', '北京', null);
INSERT INTO `users` VALUES ('4', 'admin123', null, 'admin123@out.com', null, 'admina', null, '2017-09-27 13:37:25', '2017-09-27 13:37:25', '2', null, null, null, '武汉', '湖北', null);
INSERT INTO `users` VALUES ('11', '深爱阳', null, null, null, null, null, '2015-08-24 03:35:51', '2015-08-24 03:35:51', '2', 'ojoGDjnEi1NCwK3QtARq_FIvLZu0', null, '', '天津', '天津', 'http://wx.qlogo.cn/mmopen/78l5GCicaYg57SJsNMItiahfKBk1ia0xpqvN0n2fY5dZCiamQ5CwdA9tGiaAibnhIQB6ZFvzkEeekKswqbPtBxjk0NYRJ14sVibbBF0/0');
INSERT INTO `users` VALUES ('12', '徐琳', null, null, null, null, null, '2015-08-25 05:30:22', '2015-08-25 05:30:22', '2', 'ojoGDjsQtGkWm8LntV-D0HRyML14', null, '', '', '', 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0CXZLAWDwPy8ngZ8aUoBjQOdOK1LkuAtYbKYYSQxd8IxkzVJkCYSNDspwXUfHKQfffgDURaovtDUyFvWjic0c5Iv/0');
INSERT INTO `users` VALUES ('13', 'Lei', null, null, null, null, null, '2015-08-30 03:49:00', '2015-08-30 03:49:00', '1', 'ojoGDjlK7mkAqJ03B2TEBCMJGYwI', null, '', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/DalCoibajMkYjEKQWDy2dyaWjVS5f8v8hadae7rTWfxbhC7nbqAeHITTEerYlKmg1Cd979abvv6BuxZOWkibYLGg/0');
INSERT INTO `users` VALUES ('14', '拒绝融化的冰', null, null, null, null, null, '2015-08-30 06:25:46', '2015-08-30 06:25:46', '1', 'ojoGDjvCYx8e2bG0-SdiN0IvIP9M', null, '', '西安', '陕西', 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbRIRBp0Cib8qjuWbGfmiaHP7HicUhticuWC5Cn3TWNKHl2dlfVwEDIS1ib1ov27jibpia2UEp6JSfVNDcJE/0');
INSERT INTO `users` VALUES ('16', '蒋励睿', null, null, null, null, null, '2015-09-29 04:03:27', '2015-09-29 04:03:27', '1', 'ojoGDjkrcg1m8jVC33Kqrk9DO2Nk', null, '', '咸宁', '湖北', 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbRniauuhrztxjIZA1EWlfOThhiaTHy6GicbiapoVDdSBJaSr4icVFKnQwc5cK0Soaou9iaSr8wL8Fr8DFf/0');
INSERT INTO `users` VALUES ('18', '王63', null, null, null, null, null, '2015-09-29 04:03:57', '2015-09-29 04:03:57', '1', 'ojoGDjhjbQzTgw0aE-rtCGbPDvSo', null, '', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbaWffsuk3Qh8bPrIibvv5Qg6jHy1icfRNkXyA94AHiboaibhJQ5lUW70m78BpsXdZBIdpVyMzvNQyKsU/0');
INSERT INTO `users` VALUES ('19', '所谓幸福、', null, null, null, null, null, '2015-09-29 04:41:33', '2015-09-29 04:41:33', '1', 'ojoGDjhB5ZsApmq6gTx8nL8wXy-g', null, '', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDibQ0FDYR3TrZJsxwVsp1vzmuH3ZbSNphVQMPdbZ3769nicsElJE1pl0WKAkHnJuv5v6ibB2RTl3gQw/0');
INSERT INTO `users` VALUES ('20', '怨你念你', null, null, null, null, null, '2015-09-29 04:41:59', '2015-09-29 04:41:59', '1', 'ojoGDjqJ74JbIzSGVyZ1p4OxyRbc', null, '', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/78l5GCicaYg4R0NlUVU9J4C9U5eVI9u9ciaPAcsibcAdoF5QC9C9ZT3mV1MAKGSDGWxAppnvpOadaUCKVjY0FEeZ72PSkRSPlicX/0');
INSERT INTO `users` VALUES ('21', '名字原来可以起这么长啊啊啊啊啊啊', null, null, null, null, null, '2015-09-29 04:42:08', '2015-09-29 04:42:08', '1', 'ojoGDjr6BF2O8kqiwZ_FajSKu7y8', null, '', '', '', 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0DNYM1ngGAN1aFF3jIzeGYicCDP12llo07FVplmTJ3Wowo3OP00Y8ictBn3KInseFIXZYNbAaIfuAtP9j7QibVE3gg/0');
INSERT INTO `users` VALUES ('22', '熊国旗', null, null, null, null, null, '2015-09-29 04:42:15', '2015-09-29 04:42:15', '1', 'ojoGDjlWE7xDTfmCOdpRc5us_Lpw', null, '', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/XzhF92tBcezG6aSeCgjsPYITB6C27QHia9uic1mrpDpETSyA5dyrOrGibdgOdjnmcSUibN6LX0C1DRwSNquTqczXsA/0');
INSERT INTO `users` VALUES ('23', '临川，阿三', null, null, null, null, null, '2015-09-30 13:19:09', '2015-09-30 13:19:09', '1', 'ojoGDjr34dsRmJilaoUeVUi6qkdk', null, '', '西安', '陕西', 'http://wx.qlogo.cn/mmopen/XzhF92tBcexMBB3N1ibgibhV3sHicIOtgIEibJsUgfmu6Y9673SLemRE446HRiceFdFw8zK8wQNcxtic0We910zMQMWQ/0');
INSERT INTO `users` VALUES ('24', 'HDJ', null, null, null, null, null, '2015-11-03 10:25:40', '2016-04-23 14:20:02', '1', 'ojoGDjoy02l8pSk3Llrpe10ANmZU', null, '12', '', '', 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0BGvm0drKaaSM1esIeuFiccP5INjDdYz98YXKIkTUn4J0gg1jZvt9C5f5bGB2hMcsdnWIdCayRAasgBdNXb7ZYicD/0');
INSERT INTO `users` VALUES ('25', '阿兵', null, null, null, null, null, '2015-11-11 16:15:48', '2015-11-11 16:15:48', '1', 'ojoGDjpRbbk9zF3JaoT10FlB6kjM', null, '', '荆门', '湖北', 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbYLLiaIWHNx7hWicnB4t9ibPTvd4ibp7vPkzg9K48PgE0DGeqLb91BPyzJ98vJ82PWXLjBw62cUKAFEJ/0');
INSERT INTO `users` VALUES ('26', '王敬贤', null, null, null, null, null, '2015-11-20 08:11:29', '2015-11-20 08:11:29', '1', 'ojoGDjgTFqPQmQNukGPV9e_-hQLI', null, '', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/DalCoibajMkaxrzoSqXTa2pbFtQGx8o5XCeLIDC9F6UoSP7IKATCuyu8PR6S36a3ezHHEXmOwSvXp3Yicy5Y9YHC9ga4a4FuaR/0');
INSERT INTO `users` VALUES ('27', '金威', null, null, null, null, null, '2015-11-20 13:47:39', '2015-11-20 13:47:39', '1', 'ojoGDjgMcQT-tmCi5BkijpDuVu-c', null, '', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM41YYemIiaO86ZAosTicOhFKicgVv6xbmerWlv7xkWic2MRxTpgSxttzCahabrxV38n4xAHnWudG0n39Q/0');
INSERT INTO `users` VALUES ('28', '心程', null, null, null, null, null, '2015-11-21 16:39:42', '2015-11-21 16:39:42', '1', 'ojoGDjtiswvF8a_jQ17kNYueqtEU', null, '', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0DxeVmXBvGlp26icDIfYdnI4QJnia19spvSicFYXoohByaKzjTeeQ1ssj3TLoqzO6htJm5O7to8tBYaTWd6iaOWYwsb/0');
INSERT INTO `users` VALUES ('29', '芒果好好吃', null, null, null, null, null, '2015-11-23 02:40:22', '2015-11-23 02:40:22', '1', 'ojoGDjg4pi2XWHH9NsJooV1mUIWo', null, '', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbSOprMiaq0znejzjiaOxjTm5M3icNPbZibxMTyphD0u9rzHAqg2L3myhWLeBCDnEDWGXBItvg2Yz4KxX/0');
INSERT INTO `users` VALUES ('31', '江江', null, null, null, null, null, '2016-04-22 11:34:13', '2016-04-22 20:37:34', '1', 'ojoGDjo9vGsCzmN9IJmH_lVLtF3A', null, '10', '荆州', '湖北', 'http://wx.qlogo.cn/mmopen/78l5GCicaYg57SJsNMItiahTFYjicBdabLRpaPmicfKYiazeibssprlc8vAia1JSjaoc6jPJ62O3mV7WvTYAFv3Krc4Dm4cVU80gJAg/0');
INSERT INTO `users` VALUES ('32', '牛牛', null, null, null, null, null, '2016-04-22 11:34:16', '2016-04-22 12:53:22', '2', 'ojoGDjjXiLbQuvhAP0RRZGkZbZa8', null, '8', '荆州', '湖北', 'http://wx.qlogo.cn/mmopen/XzhF92tBcewHcbEwUyHBkhPfpB1qhYaibEWSUHzCOWWfXQWianl5lYq5Voq6HGggnzYKqtRYiaE5sBWJdDInxpGkw/0');
INSERT INTO `users` VALUES ('33', '试着，改变', null, null, null, null, null, '2016-04-22 11:34:50', '2016-04-24 13:41:44', '2', 'ojoGDjmz5-k-7exr58rMWef8Dbco', null, '21', '襄阳', '湖北', 'http://wx.qlogo.cn/mmopen/78l5GCicaYg57SJsNMItiahYAqWRxsYnSbYz1IcsHh2WSXdyqppmHhVAJLAWVskuh6ScUfqmOicJ4NBVphhibSW0iapIL59jSE1Ql/0');
INSERT INTO `users` VALUES ('34', '皮皮', null, null, null, null, null, '2016-04-22 12:51:40', '2016-04-22 12:57:14', '2', 'ojoGDjlZytLCN7pIFvSNH8x6MxSw', null, '9', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/XzhF92tBcezZribj8sibsXqfNgaWpt3Bb7icQApZZXbFNczCGu37c8icpsyicObU4zcsvPkSFw88vS9DSIwGHbuPb9w/0');
INSERT INTO `users` VALUES ('35', '流纪末', null, null, null, null, null, '2016-04-22 19:02:14', '2016-04-22 19:02:14', '1', 'ojoGDjsYl6YR0PCrNWsl-J02NqGo', null, '', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLATHcHD3hmmzUoNumUHUiaxSmU0AuaGAvvXjUBFJUXAuOQKDex4y5bGM6TT19zze9u6SNQLPib916tZhicoekKibjyWqIyhQaZFXaQ/0');
INSERT INTO `users` VALUES ('36', '风鸟', null, null, null, null, null, '2016-04-22 20:31:00', '2016-04-22 20:31:00', '1', 'ojoGDjktNfh7-8WBTIQXeqgf2v-Y', null, '', '', '河北', 'http://wx.qlogo.cn/mmopen/THgYXIphyQlz9hibKq3Vl0Sd41eNFkibc4CavIGdtRsRKicibrvaiabMiaBarsCdt8jDF0ocNiajkOb4AaibwX7BByUPnFarmwjicBCKo/0');
INSERT INTO `users` VALUES ('37', 'levitate', null, null, null, null, null, '2016-04-23 14:10:17', '2016-04-29 21:11:30', '1', 'ojoGDjiPrG-xrhItqUFlFNlyzPf8', null, '25', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/78l5GCicaYg4lYWxIyKg4ZCIoq2bmuBsAHjicicHlSNw0vCIsSZhhas0SvcAlSeaMpZlCK6YS37cBWdNNUkwYqdcg/0');
INSERT INTO `users` VALUES ('38', '第四维', null, null, null, null, null, '2016-04-23 15:39:15', '2016-04-23 15:41:33', '1', 'ojoGDjnVT86omBV-zO_quxsP7g10', null, '16', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/zC0YGM2wjE6184mngbhtJeMycSrpI4zwuMpnRXlTXl2ZdmjbLPrCic8WhIjX8z8qpEp7zUKAcVBiaLW3iaXFbEcfVsUUCAGXUGM/0');
INSERT INTO `users` VALUES ('39', '一缕晨曦', null, null, null, null, null, '2016-04-25 10:57:34', '2016-04-25 10:57:34', '2', 'ojoGDjr0OGoVxxSVDZN0OGwACSK4', null, '', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/78l5GCicaYg605pQWBnPrup6TRrkPQaNMK9brN9GqNCAY7BeJagrScxyddju2MicFEQ8SlqbxQQLqMTxCxqib2m9x7p4A3NrxKn/0');
INSERT INTO `users` VALUES ('40', '夏莉莉', null, null, null, null, null, '2016-04-26 12:49:18', '2016-04-26 12:49:18', '2', 'ojoGDjnrzRZtcVIzlEcnXsmIofls', null, '', '', '', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIyfJ6sKW3SfGJGQVicdK6eRflic68Oiawn1728MwszCpLEIBYsicicZmia0T2RCCzsfHN47hvYekGAOIJA/0');
INSERT INTO `users` VALUES ('41', '✿', null, null, null, null, null, '2016-04-26 12:49:26', '2016-04-27 21:27:18', '1', 'ojoGDju22lbYI7BGdcHYtH6TecBM', null, '27', '', '', 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbTfsvoBWbh8yYFwOsHS36oMKAJ7HjzO0RwbdiazMmibgIIe9oYpd2bniaCjtlbuMIIz3p0FAZrJcoGz/0');
INSERT INTO `users` VALUES ('42', '于晓嘉', null, null, null, null, null, '2016-04-26 12:49:27', '2016-04-26 14:31:09', '2', 'ojoGDjumgV1cP1b7yPpnINnutCpk', null, '23', '', '', 'http://wx.qlogo.cn/mmopen/DalCoibajMkaxrzoSqXTa2iawYFKqTdUSGXNu87Oay95XblHiaAvh2666Mor5nEgRoBvvOMRoLNF98DldgPDlwN0WibUrqA1jUV5/0');
INSERT INTO `users` VALUES ('43', ' ', null, null, null, null, null, '2016-04-26 14:16:53', '2016-04-26 14:16:53', '1', 'ojoGDjjgrTaQqElAi54t2CuSN1_U', null, '', '', '', 'http://wx.qlogo.cn/mmopen/THgYXIphyQlz9hibKq3Vl0bpX8iaWXypmI7j7piaDxaIsfnZqrw2LBFaLeicTXpicHPQ92tV0Sric0YVAgzcWL5bhgsUsvqyWcr5r1/0');
INSERT INTO `users` VALUES ('44', 'Disne', null, null, null, null, null, '2016-04-27 12:17:51', '2016-05-10 13:01:16', '1', 'ojoGDjmS1trWOpBqOX8liHIuxo4Y', null, '30', '武汉', '湖北', '');
INSERT INTO `users` VALUES ('45', '翼龙', null, null, null, null, null, '2016-04-28 11:06:37', '2016-04-28 11:06:37', '1', 'ojoGDjmnUkgyF4_kXH11Ese4kDT8', null, '', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0DNYM1ngGAN1WbcdRzvO7ULODeaSLHOoNxibUFFquRCeGftBmQibiaXFNPk00wKO04fKw1kIua8Jib26M2JhWEje6tO/0');
INSERT INTO `users` VALUES ('46', '李东山', null, null, null, null, null, '2016-05-03 22:27:26', '2016-05-03 22:27:26', '1', 'ojoGDjtSU1NPZ5SqChQAh5CqEC0g', null, '', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDjQNpzmctEVGE5VGb7jBZ4mYV6mL6QvT5AyZvl01E7GSSsP1HBDviaibevfmPaRP3Yvayq7WskNRtg/0');
INSERT INTO `users` VALUES ('47', 'Aaron Ryuu', null, null, null, null, null, '2016-05-03 22:53:41', '2016-06-15 15:20:30', '1', 'ojoGDjh2IY3OKt3UleD1qwp_lgEo', null, '28', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/78l5GCicaYg57SJsNMItiahX87hLKHqPyfLhojdcdo6GZmES4pib7eOicSKCuUwaNibnic9Pg5MTlCOm0H8HUYw4ibmePqbGZuswmTB/0');
INSERT INTO `users` VALUES ('48', '懒得理你', null, null, null, null, null, '2016-05-06 14:26:22', '2016-05-06 14:27:51', '1', 'ojoGDjiJ_VsMHqGbkAKyTAys3lSU', null, '29', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELzu4F55YaM1ew6y3xUO5OzhKiacibRj1sXFJOl3nfbsSZCrIbl4bZIt86nJ0rVJH8ZTFKiaQ32CV8AQ/0');
INSERT INTO `users` VALUES ('49', '西子', null, null, null, null, null, '2016-05-06 14:26:25', '2016-05-06 14:26:25', '2', 'ojoGDjiqhwS8oMSXI5yJfuom7ig4', null, '', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKvS4B2CdqiaLdZ4MeibroFpJpicX2lxALn1RqD9Zq1KAPyUojPO7XXzsFvNlBCOC7sRdUMXltOoiae7g/0');
INSERT INTO `users` VALUES ('50', '万卷皓', null, null, null, null, null, '2016-05-25 10:54:59', '2016-05-25 10:56:14', '1', 'ojoGDjnna8WPffcub0CIHFUGMUgA', null, '32', '', '北京', 'http://wx.qlogo.cn/mmopen/DalCoibajMkbSAovDpbnwmrcfD6GtBhjpMJ8SckblGrPMOjFVv6ydVqHfBzvCFYAGv8TQEsy0CExEbcDV68cTSPsNFJpkCb1G/0');
INSERT INTO `users` VALUES ('51', '( ͡° ͜ʖ ͡°)', null, null, null, null, null, '2016-05-30 15:48:20', '2016-05-30 15:50:22', '1', 'ojoGDjm8YXj7csf3VaGBZLEEonSY', null, '33', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM70ickTldycTXqMjQ9Fnpxlj28J6FKThhNfrNccXxibppW7EMtxbukRBQ5CLMLQuAM7p6dBLlgtvXaFMVHeDtgAEhia5QfXnPrdSI/0');
INSERT INTO `users` VALUES ('52', '邓权', null, null, null, null, null, '2016-06-12 22:12:34', '2016-06-12 22:12:34', '1', 'ojoGDjvHyvbcD_csxiNjgTY841jk', null, '', '荆门', '湖北', 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0AH1TmC6n0ZSxFZVNnyq6UCISoMRqspicq41CNjRKuljOyaROjGqPO1aB7JOK4oJhB8yDH6yXjpyWYqkzlRcyeD4/0');
INSERT INTO `users` VALUES ('53', '冯帅', null, null, null, null, null, '2016-06-13 15:05:11', '2016-06-13 15:06:14', '1', 'ojoGDjl0D7i2ofFcKRr1jM4U0zXU', null, '34', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/XzhF92tBcexI7p8K0pv578XCkcZ0ewNOPonh9Fdk73OgF5nEbU4jZuygDehaic2svOeVIib6VJ8YpicylNk65x2NlITCYoc6WxF/0');
INSERT INTO `users` VALUES ('54', '未来多远', null, null, null, null, null, '2016-06-13 15:05:16', '2016-06-14 21:03:52', '1', 'ojoGDjt-pbDBVFMV3bMYoTTcjnZc', null, '35', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDTHiak5CA3fOH844ETI25HU9OsZtvKRdicZSdXgbY5NvvzCYK9Gib8z3qxdCh4vFGcRLYzzFnr91beg/0');
INSERT INTO `users` VALUES ('55', 'ccs', null, null, null, null, null, '2016-06-15 14:45:39', '2016-06-15 14:48:53', '1', 'ojoGDjlmTE-mJt-i58rXdkTf4ASM', null, '36', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/XzhF92tBcexkobRoZAnN7s2icXgjMqGsuKHBZh8STqzhrodJiboOLCN1FJ4X6mSw45yV6HCgiaRXlYssNv2TJE7YNj2jGdpJyQu/0');
INSERT INTO `users` VALUES ('56', 'Forrest', null, null, null, null, null, '2016-06-15 15:11:57', '2016-06-15 15:11:57', '1', 'ojoGDjhZ44mDOLJQtwuC2J2YIDIM', null, '', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/78l5GCicaYg57SJsNMItiahRzLgLyGnPkiaxYFtI4Nd7MngfdLibYJHaAY9rfdXpvnkv2Maiaxlo7CUWib6Saq3Thxd3Sibdthb5Pvic/0');
INSERT INTO `users` VALUES ('57', '莫忘初心', null, null, null, null, null, '2016-06-15 15:12:40', '2016-06-15 15:12:40', '1', 'ojoGDjuv0LFXojPCj4y4_i2iOAHk', null, '', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/78l5GCicaYg57SJsNMItiahctDEdFSRgnWyf8TCetSZutwMS1k11gVFK4E6icVniaWqGSuasRlCoHhJznKDvcmYBSNskppxqycYic/0');
INSERT INTO `users` VALUES ('58', '云', null, null, null, null, null, '2016-06-15 18:35:51', '2016-06-15 18:35:51', '2', 'ojoGDjmh3bPk2eDAIutLHoaLBqko', null, '', '西安', '陕西', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLANr0edkxrgReBficSRdicjStOSiaEncCpXZJZAOn6lSMpTp9XpxvzamtcExlFS0AXsAbElxLREXA9CwmvMDy0nVb7yK23lVibqTlE/0');
INSERT INTO `users` VALUES ('59', '如果如果。', null, null, null, null, null, '2016-06-19 22:37:39', '2016-06-19 22:38:23', '1', 'ojoGDjmEg9NUtrFzXI6wG5Rrbw70', null, '38', '鄂州', '湖北', 'http://wx.qlogo.cn/mmopen/XzhF92tBcewHdAPW9C2dyChRUIzESADDgGQKxNW00uAWhQH7H9QftzZdwP6yULSJic6aF34SPIgmkZOute4ic8Ww/0');
INSERT INTO `users` VALUES ('60', '電助', null, null, null, null, null, '2016-06-20 10:22:39', '2016-06-20 10:23:49', '1', 'ojoGDjvIykQNT9LTIjEAMnBAPAwg', null, '39', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/DalCoibajMkaxrzoSqXTa2s8HQfXlNibhDQv5qrQ7ET18DKBgEiaroux1vUnyunQQWNnlN0Dmltr5LEQ92qHmxwiaqCSUtce56DK/0');
INSERT INTO `users` VALUES ('61', 'Abing', null, null, null, null, null, '2016-06-21 10:52:46', '2016-06-21 10:52:46', '1', 'ojoGDjv5D0XKNoGGyAUpiBiSUiSs', null, '', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/83cU0pcHqg6fxQovqXskDuRvFF1RVfLBsxxB8Chc9cHIIJL6wGBljxJ4I8bfFruzhI3hyCzDEaohY8ssstWdPTkbyjvtMqxD/0');
INSERT INTO `users` VALUES ('62', '轻风~', null, null, null, null, null, '2016-06-23 12:58:47', '2016-06-23 13:01:09', '1', 'ojoGDjlOHoXdNFy11GYHQiyf_Z-A', null, '40', '武汉', '湖北', 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbeMwBnqEEcDAa3vw7IgnGcq2TOt0d17DBMvyWEYOGAhEYc2dOeov7gKSABRCEpj2WDpxtr57SRiaR/0');
INSERT INTO `users` VALUES ('63', 'Holy', null, null, null, null, null, '2017-06-25 20:19:33', null, '1', 'ozw1Nwy8AFyVPnV61cLdQk0NXLT4', null, null, '墨尔本', '维多利亚', 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0BGvm0drKaaSM1esIeuFiccP5INjDdYz98YXKIkTUn4J0gg1jZvt9C5f5bGB2hMcsdnWIdCayRAasgBdNXb7ZYicD/0');

-- ----------------------------
-- Table structure for usersq
-- ----------------------------
DROP TABLE IF EXISTS `usersq`;
CREATE TABLE `usersq` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` tinyint(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `headimgurl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` int(13) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of usersq
-- ----------------------------
INSERT INTO `usersq` VALUES ('1', null, '1', 'admin', null, null, null, null, '280360671@qq.com', '$10$cONYW0/3qVIVyxBZcE83je0qWM192xDfYdWMkdXUefKyaVBzp/ORu', 'cl3wXuuw6p78eyyyhnvlBPOA6zvszgAEieeeqjSgAz8RuNQxfTHSrMzSgwuU', null, '2017-09-29 11:00:26', '2017-09-29 11:00:31', 'marc', '1234567891');
INSERT INTO `usersq` VALUES ('2', null, '1', 'marchub', null, null, null, null, 'ahzseven@outlook.com', '$10$cONYW0/3qVIVyxBZcE83je0qWM192xDfYdWMkdXUefKyaVBzp/ORu', 'W8wLwTZnhkEPuwxZMBwi9UFGpXyALNr8BWAViqEE8uzMV6lhbpE2hOktocsj', null, '2017-09-29 11:07:08', '2017-09-29 11:07:11', 'marc', '1234567891');
INSERT INTO `usersq` VALUES ('11', 'ojoGDjnEi1NCwK3QtARq_FIvLZu0', '2', '深爱阳', '', '', '', '天津', null, null, null, 'http://wx.qlogo.cn/mmopen/78l5GCicaYg57SJsNMItiahfKBk1ia0xpqvN0n2fY5dZCiamQ5CwdA9tGiaAibnhIQB6ZFvzkEeekKswqbPtBxjk0NYRJ14sVibbBF0/0', '2015-08-24 03:35:51', '2015-08-24 03:35:51', null, null);
INSERT INTO `usersq` VALUES ('12', 'ojoGDjsQtGkWm8LntV-D0HRyML14', '2', '徐琳', '', '', '', '', null, null, null, 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0CXZLAWDwPy8ngZ8aUoBjQOdOK1LkuAtYbKYYSQxd8IxkzVJkCYSNDspwXUfHKQfffgDURaovtDUyFvWjic0c5Iv/0', '2015-08-25 05:30:22', '2015-08-25 05:30:22', null, null);
INSERT INTO `usersq` VALUES ('13', 'ojoGDjlK7mkAqJ03B2TEBCMJGYwI', '1', 'Lei', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkYjEKQWDy2dyaWjVS5f8v8hadae7rTWfxbhC7nbqAeHITTEerYlKmg1Cd979abvv6BuxZOWkibYLGg/0', '2015-08-30 03:49:00', '2015-08-30 03:49:00', null, null);
INSERT INTO `usersq` VALUES ('14', 'ojoGDjvCYx8e2bG0-SdiN0IvIP9M', '1', '拒绝融化的冰', '', '', '西安', '陕西', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbRIRBp0Cib8qjuWbGfmiaHP7HicUhticuWC5Cn3TWNKHl2dlfVwEDIS1ib1ov27jibpia2UEp6JSfVNDcJE/0', '2015-08-30 06:25:46', '2015-08-30 06:25:46', null, null);
INSERT INTO `usersq` VALUES ('16', 'ojoGDjkrcg1m8jVC33Kqrk9DO2Nk', '1', '蒋励睿', '', '', '咸宁', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbRniauuhrztxjIZA1EWlfOThhiaTHy6GicbiapoVDdSBJaSr4icVFKnQwc5cK0Soaou9iaSr8wL8Fr8DFf/0', '2015-09-29 04:03:27', '2015-09-29 04:03:27', null, null);
INSERT INTO `usersq` VALUES ('18', 'ojoGDjhjbQzTgw0aE-rtCGbPDvSo', '1', '王63', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbaWffsuk3Qh8bPrIibvv5Qg6jHy1icfRNkXyA94AHiboaibhJQ5lUW70m78BpsXdZBIdpVyMzvNQyKsU/0', '2015-09-29 04:03:57', '2015-09-29 04:03:57', null, null);
INSERT INTO `usersq` VALUES ('19', 'ojoGDjhB5ZsApmq6gTx8nL8wXy-g', '1', '所谓幸福、', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDibQ0FDYR3TrZJsxwVsp1vzmuH3ZbSNphVQMPdbZ3769nicsElJE1pl0WKAkHnJuv5v6ibB2RTl3gQw/0', '2015-09-29 04:41:33', '2015-09-29 04:41:33', null, null);
INSERT INTO `usersq` VALUES ('20', 'ojoGDjqJ74JbIzSGVyZ1p4OxyRbc', '1', '怨你念你', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/78l5GCicaYg4R0NlUVU9J4C9U5eVI9u9ciaPAcsibcAdoF5QC9C9ZT3mV1MAKGSDGWxAppnvpOadaUCKVjY0FEeZ72PSkRSPlicX/0', '2015-09-29 04:41:59', '2015-09-29 04:41:59', null, null);
INSERT INTO `usersq` VALUES ('21', 'ojoGDjr6BF2O8kqiwZ_FajSKu7y8', '1', '名字原来可以起这么长啊啊啊啊啊啊', '', '', '', '', null, null, null, 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0DNYM1ngGAN1aFF3jIzeGYicCDP12llo07FVplmTJ3Wowo3OP00Y8ictBn3KInseFIXZYNbAaIfuAtP9j7QibVE3gg/0', '2015-09-29 04:42:08', '2015-09-29 04:42:08', null, null);
INSERT INTO `usersq` VALUES ('22', 'ojoGDjlWE7xDTfmCOdpRc5us_Lpw', '1', '熊国旗', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/XzhF92tBcezG6aSeCgjsPYITB6C27QHia9uic1mrpDpETSyA5dyrOrGibdgOdjnmcSUibN6LX0C1DRwSNquTqczXsA/0', '2015-09-29 04:42:15', '2015-09-29 04:42:15', null, null);
INSERT INTO `usersq` VALUES ('23', 'ojoGDjr34dsRmJilaoUeVUi6qkdk', '1', '临川，阿三', '', '', '西安', '陕西', null, null, null, 'http://wx.qlogo.cn/mmopen/XzhF92tBcexMBB3N1ibgibhV3sHicIOtgIEibJsUgfmu6Y9673SLemRE446HRiceFdFw8zK8wQNcxtic0We910zMQMWQ/0', '2015-09-30 13:19:09', '2015-09-30 13:19:09', null, null);
INSERT INTO `usersq` VALUES ('24', 'ojoGDjoy02l8pSk3Llrpe10ANmZU', '1', 'HDJ', '', '12', '', '', null, null, null, 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0BGvm0drKaaSM1esIeuFiccP5INjDdYz98YXKIkTUn4J0gg1jZvt9C5f5bGB2hMcsdnWIdCayRAasgBdNXb7ZYicD/0', '2015-11-03 10:25:40', '2016-04-23 14:20:02', null, null);
INSERT INTO `usersq` VALUES ('25', 'ojoGDjpRbbk9zF3JaoT10FlB6kjM', '1', '阿兵', '', '', '荆门', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbYLLiaIWHNx7hWicnB4t9ibPTvd4ibp7vPkzg9K48PgE0DGeqLb91BPyzJ98vJ82PWXLjBw62cUKAFEJ/0', '2015-11-11 16:15:48', '2015-11-11 16:15:48', null, null);
INSERT INTO `usersq` VALUES ('26', 'ojoGDjgTFqPQmQNukGPV9e_-hQLI', '1', '王敬贤', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkaxrzoSqXTa2pbFtQGx8o5XCeLIDC9F6UoSP7IKATCuyu8PR6S36a3ezHHEXmOwSvXp3Yicy5Y9YHC9ga4a4FuaR/0', '2015-11-20 08:11:29', '2015-11-20 08:11:29', null, null);
INSERT INTO `usersq` VALUES ('27', 'ojoGDjgMcQT-tmCi5BkijpDuVu-c', '1', '金威', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM41YYemIiaO86ZAosTicOhFKicgVv6xbmerWlv7xkWic2MRxTpgSxttzCahabrxV38n4xAHnWudG0n39Q/0', '2015-11-20 13:47:39', '2015-11-20 13:47:39', null, null);
INSERT INTO `usersq` VALUES ('28', 'ojoGDjtiswvF8a_jQ17kNYueqtEU', '1', '心程', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0DxeVmXBvGlp26icDIfYdnI4QJnia19spvSicFYXoohByaKzjTeeQ1ssj3TLoqzO6htJm5O7to8tBYaTWd6iaOWYwsb/0', '2015-11-21 16:39:42', '2015-11-21 16:39:42', null, null);
INSERT INTO `usersq` VALUES ('29', 'ojoGDjg4pi2XWHH9NsJooV1mUIWo', '1', '芒果好好吃', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbSOprMiaq0znejzjiaOxjTm5M3icNPbZibxMTyphD0u9rzHAqg2L3myhWLeBCDnEDWGXBItvg2Yz4KxX/0', '2015-11-23 02:40:22', '2015-11-23 02:40:22', null, null);
INSERT INTO `usersq` VALUES ('31', 'ojoGDjo9vGsCzmN9IJmH_lVLtF3A', '1', '江江', '', '10', '荆州', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/78l5GCicaYg57SJsNMItiahTFYjicBdabLRpaPmicfKYiazeibssprlc8vAia1JSjaoc6jPJ62O3mV7WvTYAFv3Krc4Dm4cVU80gJAg/0', '2016-04-22 11:34:13', '2016-04-22 20:37:34', null, null);
INSERT INTO `usersq` VALUES ('32', 'ojoGDjjXiLbQuvhAP0RRZGkZbZa8', '2', '牛牛', '', '8', '荆州', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/XzhF92tBcewHcbEwUyHBkhPfpB1qhYaibEWSUHzCOWWfXQWianl5lYq5Voq6HGggnzYKqtRYiaE5sBWJdDInxpGkw/0', '2016-04-22 11:34:16', '2016-04-22 12:53:22', null, null);
INSERT INTO `usersq` VALUES ('33', 'ojoGDjmz5-k-7exr58rMWef8Dbco', '2', '试着，改变', '', '21', '襄阳', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/78l5GCicaYg57SJsNMItiahYAqWRxsYnSbYz1IcsHh2WSXdyqppmHhVAJLAWVskuh6ScUfqmOicJ4NBVphhibSW0iapIL59jSE1Ql/0', '2016-04-22 11:34:50', '2016-04-24 13:41:44', null, null);
INSERT INTO `usersq` VALUES ('34', 'ojoGDjlZytLCN7pIFvSNH8x6MxSw', '2', '皮皮', '', '9', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/XzhF92tBcezZribj8sibsXqfNgaWpt3Bb7icQApZZXbFNczCGu37c8icpsyicObU4zcsvPkSFw88vS9DSIwGHbuPb9w/0', '2016-04-22 12:51:40', '2016-04-22 12:57:14', null, null);
INSERT INTO `usersq` VALUES ('35', 'ojoGDjsYl6YR0PCrNWsl-J02NqGo', '1', '流纪末', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLATHcHD3hmmzUoNumUHUiaxSmU0AuaGAvvXjUBFJUXAuOQKDex4y5bGM6TT19zze9u6SNQLPib916tZhicoekKibjyWqIyhQaZFXaQ/0', '2016-04-22 19:02:14', '2016-04-22 19:02:14', null, null);
INSERT INTO `usersq` VALUES ('36', 'ojoGDjktNfh7-8WBTIQXeqgf2v-Y', '1', '风鸟', '', '', '', '河北', null, null, null, 'http://wx.qlogo.cn/mmopen/THgYXIphyQlz9hibKq3Vl0Sd41eNFkibc4CavIGdtRsRKicibrvaiabMiaBarsCdt8jDF0ocNiajkOb4AaibwX7BByUPnFarmwjicBCKo/0', '2016-04-22 20:31:00', '2016-04-22 20:31:00', null, null);
INSERT INTO `usersq` VALUES ('37', 'ojoGDjiPrG-xrhItqUFlFNlyzPf8', '1', 'levitate', '', '25', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/78l5GCicaYg4lYWxIyKg4ZCIoq2bmuBsAHjicicHlSNw0vCIsSZhhas0SvcAlSeaMpZlCK6YS37cBWdNNUkwYqdcg/0', '2016-04-23 14:10:17', '2016-04-29 21:11:30', null, null);
INSERT INTO `usersq` VALUES ('38', 'ojoGDjnVT86omBV-zO_quxsP7g10', '1', '第四维', '', '16', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/zC0YGM2wjE6184mngbhtJeMycSrpI4zwuMpnRXlTXl2ZdmjbLPrCic8WhIjX8z8qpEp7zUKAcVBiaLW3iaXFbEcfVsUUCAGXUGM/0', '2016-04-23 15:39:15', '2016-04-23 15:41:33', null, null);
INSERT INTO `usersq` VALUES ('39', 'ojoGDjr0OGoVxxSVDZN0OGwACSK4', '2', '一缕晨曦', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/78l5GCicaYg605pQWBnPrup6TRrkPQaNMK9brN9GqNCAY7BeJagrScxyddju2MicFEQ8SlqbxQQLqMTxCxqib2m9x7p4A3NrxKn/0', '2016-04-25 10:57:34', '2016-04-25 10:57:34', null, null);
INSERT INTO `usersq` VALUES ('40', 'ojoGDjnrzRZtcVIzlEcnXsmIofls', '2', '夏莉莉', '', '', '', '', null, null, null, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIyfJ6sKW3SfGJGQVicdK6eRflic68Oiawn1728MwszCpLEIBYsicicZmia0T2RCCzsfHN47hvYekGAOIJA/0', '2016-04-26 12:49:18', '2016-04-26 12:49:18', null, null);
INSERT INTO `usersq` VALUES ('41', 'ojoGDju22lbYI7BGdcHYtH6TecBM', '1', '✿', '', '27', '', '', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbTfsvoBWbh8yYFwOsHS36oMKAJ7HjzO0RwbdiazMmibgIIe9oYpd2bniaCjtlbuMIIz3p0FAZrJcoGz/0', '2016-04-26 12:49:26', '2016-04-27 21:27:18', null, null);
INSERT INTO `usersq` VALUES ('42', 'ojoGDjumgV1cP1b7yPpnINnutCpk', '2', '于晓嘉', '', '23', '', '', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkaxrzoSqXTa2iawYFKqTdUSGXNu87Oay95XblHiaAvh2666Mor5nEgRoBvvOMRoLNF98DldgPDlwN0WibUrqA1jUV5/0', '2016-04-26 12:49:27', '2016-04-26 14:31:09', null, null);
INSERT INTO `usersq` VALUES ('43', 'ojoGDjjgrTaQqElAi54t2CuSN1_U', '1', ' ', '', '', '', '', null, null, null, 'http://wx.qlogo.cn/mmopen/THgYXIphyQlz9hibKq3Vl0bpX8iaWXypmI7j7piaDxaIsfnZqrw2LBFaLeicTXpicHPQ92tV0Sric0YVAgzcWL5bhgsUsvqyWcr5r1/0', '2016-04-26 14:16:53', '2016-04-26 14:16:53', null, null);
INSERT INTO `usersq` VALUES ('44', 'ojoGDjmS1trWOpBqOX8liHIuxo4Y', '1', 'Disne', '', '30', '武汉', '湖北', null, null, null, '', '2016-04-27 12:17:51', '2016-05-10 13:01:16', null, null);
INSERT INTO `usersq` VALUES ('45', 'ojoGDjmnUkgyF4_kXH11Ese4kDT8', '1', '翼龙', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0DNYM1ngGAN1WbcdRzvO7ULODeaSLHOoNxibUFFquRCeGftBmQibiaXFNPk00wKO04fKw1kIua8Jib26M2JhWEje6tO/0', '2016-04-28 11:06:37', '2016-04-28 11:06:37', null, null);
INSERT INTO `usersq` VALUES ('46', 'ojoGDjtSU1NPZ5SqChQAh5CqEC0g', '1', '李东山', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDjQNpzmctEVGE5VGb7jBZ4mYV6mL6QvT5AyZvl01E7GSSsP1HBDviaibevfmPaRP3Yvayq7WskNRtg/0', '2016-05-03 22:27:26', '2016-05-03 22:27:26', null, null);
INSERT INTO `usersq` VALUES ('47', 'ojoGDjh2IY3OKt3UleD1qwp_lgEo', '1', 'Aaron Ryuu', '', '28', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/78l5GCicaYg57SJsNMItiahX87hLKHqPyfLhojdcdo6GZmES4pib7eOicSKCuUwaNibnic9Pg5MTlCOm0H8HUYw4ibmePqbGZuswmTB/0', '2016-05-03 22:53:41', '2016-06-15 15:20:30', null, null);
INSERT INTO `usersq` VALUES ('48', 'ojoGDjiJ_VsMHqGbkAKyTAys3lSU', '1', '懒得理你', '', '29', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELzu4F55YaM1ew6y3xUO5OzhKiacibRj1sXFJOl3nfbsSZCrIbl4bZIt86nJ0rVJH8ZTFKiaQ32CV8AQ/0', '2016-05-06 14:26:22', '2016-05-06 14:27:51', null, null);
INSERT INTO `usersq` VALUES ('49', 'ojoGDjiqhwS8oMSXI5yJfuom7ig4', '2', '西子', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKvS4B2CdqiaLdZ4MeibroFpJpicX2lxALn1RqD9Zq1KAPyUojPO7XXzsFvNlBCOC7sRdUMXltOoiae7g/0', '2016-05-06 14:26:25', '2016-05-06 14:26:25', null, null);
INSERT INTO `usersq` VALUES ('50', 'ojoGDjnna8WPffcub0CIHFUGMUgA', '1', '万卷皓', '', '32', '', '北京', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkbSAovDpbnwmrcfD6GtBhjpMJ8SckblGrPMOjFVv6ydVqHfBzvCFYAGv8TQEsy0CExEbcDV68cTSPsNFJpkCb1G/0', '2016-05-25 10:54:59', '2016-05-25 10:56:14', null, null);
INSERT INTO `usersq` VALUES ('51', 'ojoGDjm8YXj7csf3VaGBZLEEonSY', '1', '( ͡° ͜ʖ ͡°)', '', '33', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM70ickTldycTXqMjQ9Fnpxlj28J6FKThhNfrNccXxibppW7EMtxbukRBQ5CLMLQuAM7p6dBLlgtvXaFMVHeDtgAEhia5QfXnPrdSI/0', '2016-05-30 15:48:20', '2016-05-30 15:50:22', null, null);
INSERT INTO `usersq` VALUES ('52', 'ojoGDjvHyvbcD_csxiNjgTY841jk', '1', '邓权', '', '', '荆门', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0AH1TmC6n0ZSxFZVNnyq6UCISoMRqspicq41CNjRKuljOyaROjGqPO1aB7JOK4oJhB8yDH6yXjpyWYqkzlRcyeD4/0', '2016-06-12 22:12:34', '2016-06-12 22:12:34', null, null);
INSERT INTO `usersq` VALUES ('53', 'ojoGDjl0D7i2ofFcKRr1jM4U0zXU', '1', '冯帅', '', '34', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/XzhF92tBcexI7p8K0pv578XCkcZ0ewNOPonh9Fdk73OgF5nEbU4jZuygDehaic2svOeVIib6VJ8YpicylNk65x2NlITCYoc6WxF/0', '2016-06-13 15:05:11', '2016-06-13 15:06:14', null, null);
INSERT INTO `usersq` VALUES ('54', 'ojoGDjt-pbDBVFMV3bMYoTTcjnZc', '1', '未来多远', '', '35', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDTHiak5CA3fOH844ETI25HU9OsZtvKRdicZSdXgbY5NvvzCYK9Gib8z3qxdCh4vFGcRLYzzFnr91beg/0', '2016-06-13 15:05:16', '2016-06-14 21:03:52', null, null);
INSERT INTO `usersq` VALUES ('55', 'ojoGDjlmTE-mJt-i58rXdkTf4ASM', '1', 'ccs', '', '36', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/XzhF92tBcexkobRoZAnN7s2icXgjMqGsuKHBZh8STqzhrodJiboOLCN1FJ4X6mSw45yV6HCgiaRXlYssNv2TJE7YNj2jGdpJyQu/0', '2016-06-15 14:45:39', '2016-06-15 14:48:53', null, null);
INSERT INTO `usersq` VALUES ('56', 'ojoGDjhZ44mDOLJQtwuC2J2YIDIM', '1', 'Forrest', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/78l5GCicaYg57SJsNMItiahRzLgLyGnPkiaxYFtI4Nd7MngfdLibYJHaAY9rfdXpvnkv2Maiaxlo7CUWib6Saq3Thxd3Sibdthb5Pvic/0', '2016-06-15 15:11:57', '2016-06-15 15:11:57', null, null);
INSERT INTO `usersq` VALUES ('57', 'ojoGDjuv0LFXojPCj4y4_i2iOAHk', '1', '莫忘初心', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/78l5GCicaYg57SJsNMItiahctDEdFSRgnWyf8TCetSZutwMS1k11gVFK4E6icVniaWqGSuasRlCoHhJznKDvcmYBSNskppxqycYic/0', '2016-06-15 15:12:40', '2016-06-15 15:12:40', null, null);
INSERT INTO `usersq` VALUES ('58', 'ojoGDjmh3bPk2eDAIutLHoaLBqko', '2', '云', '', '', '西安', '陕西', null, null, null, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLANr0edkxrgReBficSRdicjStOSiaEncCpXZJZAOn6lSMpTp9XpxvzamtcExlFS0AXsAbElxLREXA9CwmvMDy0nVb7yK23lVibqTlE/0', '2016-06-15 18:35:51', '2016-06-15 18:35:51', null, null);
INSERT INTO `usersq` VALUES ('59', 'ojoGDjmEg9NUtrFzXI6wG5Rrbw70', '1', '如果如果。', '', '38', '鄂州', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/XzhF92tBcewHdAPW9C2dyChRUIzESADDgGQKxNW00uAWhQH7H9QftzZdwP6yULSJic6aF34SPIgmkZOute4ic8Ww/0', '2016-06-19 22:37:39', '2016-06-19 22:38:23', null, null);
INSERT INTO `usersq` VALUES ('60', 'ojoGDjvIykQNT9LTIjEAMnBAPAwg', '1', '電助', '', '39', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkaxrzoSqXTa2s8HQfXlNibhDQv5qrQ7ET18DKBgEiaroux1vUnyunQQWNnlN0Dmltr5LEQ92qHmxwiaqCSUtce56DK/0', '2016-06-20 10:22:39', '2016-06-20 10:23:49', null, null);
INSERT INTO `usersq` VALUES ('61', 'ojoGDjv5D0XKNoGGyAUpiBiSUiSs', '1', 'Abing', '', '', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/83cU0pcHqg6fxQovqXskDuRvFF1RVfLBsxxB8Chc9cHIIJL6wGBljxJ4I8bfFruzhI3hyCzDEaohY8ssstWdPTkbyjvtMqxD/0', '2016-06-21 10:52:46', '2016-06-21 10:52:46', null, null);
INSERT INTO `usersq` VALUES ('62', 'ojoGDjlOHoXdNFy11GYHQiyf_Z-A', '1', '轻风~', '', '40', '武汉', '湖北', null, null, null, 'http://wx.qlogo.cn/mmopen/DalCoibajMkY4ElBnUOfTbeMwBnqEEcDAa3vw7IgnGcq2TOt0d17DBMvyWEYOGAhEYc2dOeov7gKSABRCEpj2WDpxtr57SRiaR/0', '2016-06-23 12:58:47', '2016-06-23 13:01:09', null, null);
INSERT INTO `usersq` VALUES ('63', 'ozw1Nwy8AFyVPnV61cLdQk0NXLT4', '1', 'Holy', null, null, '墨尔本', '维多利亚', null, null, null, 'http://wx.qlogo.cn/mmopen/u8mbrzGDk0BGvm0drKaaSM1esIeuFiccP5INjDdYz98YXKIkTUn4J0gg1jZvt9C5f5bGB2hMcsdnWIdCayRAasgBdNXb7ZYicD/0', '2017-06-25 20:19:33', '2017-09-29 11:00:34', null, null);
SET FOREIGN_KEY_CHECKS=1;
