/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云
 Source Server Type    : MySQL
 Source Server Version : 50638
 Source Host           : 47.96.186.144:3306
 Source Schema         : bbs

 Target Server Type    : MySQL
 Target Server Version : 50638
 File Encoding         : 65001

 Date: 03/01/2018 15:26:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_content` varchar(10000) CHARACTER SET utf8 NOT NULL,
  `comment_create_time` bigint(20) DEFAULT NULL,
  `comment_quote_id` bigint(20) NOT NULL,
  `comment_floor` bigint(20) NOT NULL,
  `comment_user_id` bigint(20) NOT NULL,
  `comment_post_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES (1, '哈哈哈a', 1512483856, 0, 2, 1, 32);
INSERT INTO `comment` VALUES (2, '哈哈哈哈哈', 1512483899, 0, 3, 1, 32);
INSERT INTO `comment` VALUES (3, 'asdasdasdasdads', 1512483999, 0, 2, 1, 33);
INSERT INTO `comment` VALUES (4, 'asdasdasdasdasdasdasdasdsad', 1512483899, 1, 4, 1, 32);
INSERT INTO `comment` VALUES (38, '啦啦啦', 1513928087, 0, 5, 1, 32);
INSERT INTO `comment` VALUES (39, '啦啦啦', 1513928151, 0, 6, 1, 32);
INSERT INTO `comment` VALUES (40, '啦啦啦', 1513928203, 0, 7, 1, 32);
INSERT INTO `comment` VALUES (41, '啦啦啦', 1513928217, 0, 8, 1, 32);
INSERT INTO `comment` VALUES (42, '啦啦啦', 1513928269, 1, 9, 1, 32);
INSERT INTO `comment` VALUES (43, '啦啦啦12312123132213', 1513928331, 1, 3, 1, 33);
INSERT INTO `comment` VALUES (44, '啦啦啦12312123132213', 1513928566, 1, 2, 1, 34);
INSERT INTO `comment` VALUES (45, '啦啦啦12312123132213', 1513928579, 1, 3, 1, 34);
INSERT INTO `comment` VALUES (46, '啦啦啦12312123132213', 1513928592, 1, 4, 1, 34);
INSERT INTO `comment` VALUES (47, '啦啦啦12312123132213', 1513928593, 1, 5, 1, 34);
INSERT INTO `comment` VALUES (48, '我是输入框', 1514100050, 0, 10, 1, 32);
INSERT INTO `comment` VALUES (49, '我是输入框', 1514100111, 0, 11, 1, 32);
INSERT INTO `comment` VALUES (50, '我是输入框', 1514100129, 0, 12, 1, 32);
INSERT INTO `comment` VALUES (51, '我是输入框', 1514100146, 0, 13, 1, 32);
INSERT INTO `comment` VALUES (52, '我是输入框', 1514100162, 0, 14, 1, 32);
INSERT INTO `comment` VALUES (53, '我是输入框', 1514100269, 0, 15, 1, 32);
INSERT INTO `comment` VALUES (54, '我是输入框huhhh', 1514449481, 0, 2, 1, 51);
INSERT INTO `comment` VALUES (55, '我是输入框oooooo', 1514450401, 0, 3, 1, 51);
INSERT INTO `comment` VALUES (56, '我是输入框ooooooiiii\n', 1514450409, 0, 4, 1, 51);
INSERT INTO `comment` VALUES (57, '我是输入框ooooooiiii\n????', 1514450418, 0, 5, 1, 51);
INSERT INTO `comment` VALUES (58, '我是输入框ooooooiiii\n????pppp', 1514450438, 0, 6, 1, 51);
INSERT INTO `comment` VALUES (59, 'Tyyy', 1514450838, 0, 7, 1, 51);
INSERT INTO `comment` VALUES (60, 'Uu', 1514451111, 0, 8, 1, 51);
INSERT INTO `comment` VALUES (61, 'The ', 1514451222, 0, 9, 1, 51);
INSERT INTO `comment` VALUES (62, '一直以为', 1514532759, 0, 10, 1, 51);
COMMIT;

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `forum_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `forum_manager` varchar(255) CHARACTER SET utf8 NOT NULL,
  `forum_create_time` bigint(20) DEFAULT NULL,
  `forum_icon` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `forum_des` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of forum
-- ----------------------------
BEGIN;
INSERT INTO `forum` VALUES (1, '吹水区', '', 1511278736, 'https://www.baidu.com/img/bd_logo1.png', '一天不吹, 浑身难受');
INSERT INTO `forum` VALUES (2, 'iPhone', '', 1514531344, 'https://www.baidu.com/img/bd_logo1.png', '这是一种信仰');
INSERT INTO `forum` VALUES (3, 'Android', '', 1514531500, 'https://www.baidu.com/img/bd_logo1.png', '奥利奥');
COMMIT;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_title` varchar(20) CHARACTER SET utf8 NOT NULL,
  `post_content` varchar(10000) CHARACTER SET utf8 NOT NULL,
  `post_read_count` int(11) DEFAULT NULL,
  `post_create_time` bigint(20) DEFAULT NULL,
  `forum_id` bigint(20) NOT NULL,
  `post_content_pics` varchar(10000) CHARACTER SET utf8 NOT NULL,
  `post_create_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of post
-- ----------------------------
BEGIN;
INSERT INTO `post` VALUES (32, '拉啦啦a拉啦啦a了拉啦啦a了拉啦啦a了拉', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n<title></title>\n<meta name=\"Generator\" content=\"Cocoa HTML Writer\">\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica}\nspan.s1 {font-family: \'Helvetica\'; font-weight: normal; font-style: normal; font-size: 12.00pt}\n</style>\n</head>\n<body>\n<p class=\"p1\"><span class=\"s1\"><img src=\"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1513248663571&di=3a3ddf0dff46650f8399b996da9eaf66&imgtype=0&src=http%3A%2F%2Fd.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Fa8773912b31bb0513bbcb8e93f7adab44bede053.jpg\" alt=\"/Users/pengpeng/Desktop/images/20171205222415/1512483788.jpeg\"><img src=\"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png\" alt=\"/Users/pengpeng/Desktop/images/20171205222415/1512483791.png\"></span></p>\n</body>\n</html>', 0, 1512483856, 1, 'https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png,https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png', 1);
INSERT INTO `post` VALUES (44, ' Bbbbb', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n<title></title>\n<meta name=\"Generator\" content=\"Cocoa HTML Writer\">\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 15.0px \'.SF UI Text\'; color: #000000}\nspan.s1 {font-family: \'.SFUIText\'; font-weight: normal; font-style: normal; font-size: 15.00pt}\n</style>\n</head>\n<body>\n<p class=\"p1\"><span class=\"s1\">Ggggg</span></p>\n</body>\n</html>\n', 0, 1514361671, 1, '', 2);
INSERT INTO `post` VALUES (45, 'Pp', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n<title></title>\n<meta name=\"Generator\" content=\"Cocoa HTML Writer\">\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 15.0px \'.SF UI Text\'; color: #000000}\nspan.s1 {font-family: \'.SFUIText\'; font-weight: normal; font-style: normal; font-size: 15.00pt}\n</style>\n</head>\n<body>\n<p class=\"p1\"><span class=\"s1\">Pp</span></p>\n</body>\n</html>\n', 0, 1514361748, 2, '', 2);
INSERT INTO `post` VALUES (46, 'P', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n<title></title>\n<meta name=\"Generator\" content=\"Cocoa HTML Writer\">\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 15.0px \'.SF UI Text\'; color: #000000}\nspan.s1 {font-family: \'.SFUIText\'; font-weight: normal; font-style: normal; font-size: 15.00pt}\n</style>\n</head>\n<body>\n<p class=\"p1\"><span class=\"s1\">Tt</span></p>\n</body>\n</html>\n', 0, 1514447629, 0, '', 2);
INSERT INTO `post` VALUES (47, 'Trttt', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n<title></title>\n<meta name=\"Generator\" content=\"Cocoa HTML Writer\">\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 15.0px \'.SF UI Text\'; color: #000000}\nspan.s1 {font-family: \'.SFUIText\'; font-weight: normal; font-style: normal; font-size: 15.00pt}\n</style>\n</head>\n<body>\n<p class=\"p1\"><span class=\"s1\">Tyyyy</span></p>\n</body>\n</html>\n', 0, 1514447670, 0, '', 2);
INSERT INTO `post` VALUES (48, 'Oooo', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n<title></title>\n<meta name=\"Generator\" content=\"Cocoa HTML Writer\">\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 15.0px \'.SF UI Text\'; color: #000000}\nspan.s1 {font-family: \'.SFUIText\'; font-weight: normal; font-style: normal; font-size: 15.00pt}\n</style>\n</head>\n<body>\n<p class=\"p1\"><span class=\"s1\">Oooo</span></p>\n</body>\n</html>\n', 0, 1514448079, 1, '', 2);
INSERT INTO `post` VALUES (49, 'Kkkkk', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n<title></title>\n<meta name=\"Generator\" content=\"Cocoa HTML Writer\">\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 15.0px \'.SF UI Text\'; color: #000000}\nspan.s1 {font-family: \'.SFUIText\'; font-weight: normal; font-style: normal; font-size: 15.00pt}\n</style>\n</head>\n<body>\n<p class=\"p1\"><span class=\"s1\">Kkkkk</span></p>\n</body>\n</html>\n', 0, 1514448386, 1, '', 2);
INSERT INTO `post` VALUES (50, 'Zzz', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n<title></title>\n<meta name=\"Generator\" content=\"Cocoa HTML Writer\">\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 15.0px \'.SF UI Text\'; color: #000000}\nspan.s1 {font-family: \'.SFUIText\'; font-weight: normal; font-style: normal; font-size: 15.00pt}\n</style>\n</head>\n<body>\n<p class=\"p1\"><span class=\"s1\">Zzz</span></p>\n</body>\n</html>\n', 0, 1514448454, 1, '', 2);
INSERT INTO `post` VALUES (51, 'Bbbbbbb', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n<title></title>\n<meta name=\"Generator\" content=\"Cocoa HTML Writer\">\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 15.0px \'.SF UI Text\'; color: #000000}\nspan.s1 {font-family: \'.SFUIText\'; font-weight: normal; font-style: normal; font-size: 15.00pt}\n</style>\n</head>\n<body>\n<p class=\"p1\"><span class=\"s1\">Bbbbbb</span></p>\n</body>\n</html>\n', 0, 1514448474, 1, '', 2);
INSERT INTO `post` VALUES (52, '拉啦啦a了', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n<title></title>\n<meta name=\"Generator\" content=\"Cocoa HTML Writer\">\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 15.0px \'.PingFang SC\'; color: #000000}\nspan.s1 {font-family: \'.PingFangSC-Regular\'; font-weight: normal; font-style: normal; font-size: 15.00pt}\nspan.s2 {font-family: \'Helvetica\'; font-weight: normal; font-style: normal; font-size: 12.00pt; color: #000000}\n</style>\n</head>\n<body>\n<p class=\"p1\"><span class=\"s1\">你是谁呢</span><span class=\"s2\"><img src=\"/Users/changxianpeng/Desktop/images/20171229153308/1514532786.jpeg\" alt=\"/Users/changxianpeng/Desktop/images/20171229153308/1514532786.jpeg\"></span></p>\n</body>\n</html>\n', 0, 1514532789, 3, '/Users/changxianpeng/Desktop/images/20171229153308/1514532786.jpeg', 2);
INSERT INTO `post` VALUES (53, '拉啦啦a了', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n<title></title>\n<meta name=\"Generator\" content=\"Cocoa HTML Writer\">\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 15.0px \'.PingFang SC\'; color: #000000}\nspan.s1 {font-family: \'.PingFangSC-Regular\'; font-weight: normal; font-style: normal; font-size: 15.00pt}\nspan.s2 {font-family: \'Helvetica\'; font-weight: normal; font-style: normal; font-size: 12.00pt; color: #000000}\n</style>\n</head>\n<body>\n<p class=\"p1\"><span class=\"s1\">放屁</span><span class=\"s2\"><img src=\"/root/code/bbs/files/images/20171229171427/1514538859.jpeg\" alt=\"/root/code/bbs/files/images/20171229171427/1514538859.jpeg\"></span></p>\n</body>\n</html>\n', 0, 1514538869, 1, '/root/code/bbs/files/images/20171229171427/1514538859.jpeg', 2);
INSERT INTO `post` VALUES (54, '123123123', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n<title></title>\n<meta name=\"Generator\" content=\"Cocoa HTML Writer\">\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 15.0px \'.SF UI Text\'; color: #000000}\nspan.s1 {font-family: \'.SFUIText\'; font-weight: normal; font-style: normal; font-size: 15.00pt}\nspan.s2 {font-family: \'Helvetica\'; font-weight: normal; font-style: normal; font-size: 12.00pt; color: #000000}\n</style>\n</head>\n<body>\n<p class=\"p1\"><span class=\"s1\">123123123</span><span class=\"s2\"><img src=\"/root/code/bbs/files/images/20171229173101/1514539855.jpeg\" alt=\"/root/code/bbs/files/images/20171229173101/1514539855.jpeg\"></span></p>\n</body>\n</html>\n', 0, 1514539861, 1, '/root/code/bbs/files/images/20171229173101/1514539855.jpeg', 2);
INSERT INTO `post` VALUES (55, '123123123', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n<title></title>\n<meta name=\"Generator\" content=\"Cocoa HTML Writer\">\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 15.0px \'.SF UI Text\'; color: #000000}\nspan.s1 {font-family: \'.SFUIText\'; font-weight: normal; font-style: normal; font-size: 15.00pt}\nspan.s2 {font-family: \'Helvetica\'; font-weight: normal; font-style: normal; font-size: 12.00pt; color: #000000}\n</style>\n</head>\n<body>\n<p class=\"p1\"><span class=\"s1\">123123123</span><span class=\"s2\"><img src=\"http://swift520.com/images/20171229173245/1514539963.jpeg\" alt=\"http://swift520.com/images/20171229173245/1514539963.jpeg\"></span></p>\n</body>\n</html>\n', 0, 1514539965, 1, 'http://swift520.com/images/20171229173245/1514539963.jpeg', 2);
INSERT INTO `post` VALUES (56, 'i 看看', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n<title></title>\n<meta name=\"Generator\" content=\"Cocoa HTML Writer\">\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 15.0px \'.PingFang SC\'; color: #000000}\nspan.s1 {font-family: \'.PingFangSC-Regular\'; font-weight: normal; font-style: normal; font-size: 15.00pt}\nspan.s2 {font-family: \'Helvetica\'; font-weight: normal; font-style: normal; font-size: 12.00pt; color: #000000}\n</style>\n</head>\n<body>\n<p class=\"p1\"><span class=\"s1\">我就去不</span><span class=\"s2\"><img src=\"http://swift520.com/images/20171229173725/1514540236.jpeg\" alt=\"http://swift520.com/images/20171229173725/1514540236.jpeg\"><img src=\"http://swift520.com/images/20171229173725/1514540239.jpeg\" alt=\"http://swift520.com/images/20171229173725/1514540239.jpeg\"></span></p>\n</body>\n</html>\n', 0, 1514540245, 2, 'http://swift520.com/images/20171229173725/1514540236.jpeg,http://swift520.com/images/20171229173725/1514540239.jpeg', 2);
INSERT INTO `post` VALUES (57, '231231', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n<title></title>\n<meta name=\"Generator\" content=\"Cocoa HTML Writer\">\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 15.0px \'.SF UI Text\'; color: #000000}\nspan.s1 {font-family: \'.SFUIText\'; font-weight: normal; font-style: normal; font-size: 15.00pt}\nspan.s2 {font-family: \'Helvetica\'; font-weight: normal; font-style: normal; font-size: 12.00pt; color: #000000}\n</style>\n</head>\n<body>\n<p class=\"p1\"><span class=\"s1\">12312313</span><span class=\"s2\"><img src=\"http://swift520.com/:8181images/20171229173822/1514540300.jpeg\" alt=\"http://swift520.com/:8181images/20171229173822/1514540300.jpeg\"></span></p>\n</body>\n</html>\n', 0, 1514540302, 2, 'http://swift520.com/:8181images/20171229173822/1514540300.jpeg', 2);
INSERT INTO `post` VALUES (58, '123123123', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n<title></title>\n<meta name=\"Generator\" content=\"Cocoa HTML Writer\">\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 15.0px \'.SF UI Text\'; color: #000000}\nspan.s1 {font-family: \'.SFUIText\'; font-weight: normal; font-style: normal; font-size: 15.00pt}\nspan.s2 {font-family: \'Helvetica\'; font-weight: normal; font-style: normal; font-size: 12.00pt; color: #000000}\n</style>\n</head>\n<body>\n<p class=\"p1\"><span class=\"s1\">123123123</span><span class=\"s2\"><img src=\"http://swift520.com:8181/images/20171229175023/1514541018.jpeg\" alt=\"http://swift520.com:8181/images/20171229175023/1514541018.jpeg\"></span></p>\n</body>\n</html>\n', 0, 1514541023, 1, 'http://swift520.com:8181/images/20171229175023/1514541018.jpeg', 2);
INSERT INTO `post` VALUES (59, '哦', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n<title></title>\n<meta name=\"Generator\" content=\"Cocoa HTML Writer\">\n<style type=\"text/css\">\np.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 15.0px \'.PingFang SC\'; color: #000000}\nspan.s1 {font-family: \'.PingFangSC-Regular\'; font-weight: normal; font-style: normal; font-size: 15.00pt}\n</style>\n</head>\n<body>\n<p class=\"p1\"><span class=\"s1\">是吗？</span></p>\n</body>\n</html>\n', 0, 1514964336, 1, '', 2);
COMMIT;

-- ----------------------------
-- Table structure for post_collection
-- ----------------------------
DROP TABLE IF EXISTS `post_collection`;
CREATE TABLE `post_collection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) NOT NULL,
  `forum_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of post_collection
-- ----------------------------
BEGIN;
INSERT INTO `post_collection` VALUES (1, 32, 1, 1);
INSERT INTO `post_collection` VALUES (2, 33, 1, 1);
INSERT INTO `post_collection` VALUES (3, 34, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_phone` varchar(11) DEFAULT NULL,
  `user_pass_word` varchar(100) CHARACTER SET utf8 NOT NULL,
  `user_nick_name` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `user_create_time` bigint(20) DEFAULT NULL,
  `user_icon` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `user_collection_post` bigint(20) DEFAULT NULL,
  `user_join_forum` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, '18888888888', 'MTIzNDU2', 'xp', 1512814111, 'http://cxp.im/images/icon.jpg', NULL, NULL);
INSERT INTO `user` VALUES (2, '11111111111', 'MTExMTEx', '手机号全是1', 1514106189, 'http://cxp.im/images/icon.jpg', NULL, NULL);
INSERT INTO `user` VALUES (3, '12312311231', 'MTExMTEx', '123', 1514106365, 'http://cxp.im/images/icon.jpg', NULL, NULL);
INSERT INTO `user` VALUES (4, '12222222222', 'MjIyMjIy', '222', 1514106417, 'http://cxp.im/images/icon.jpg', NULL, NULL);
INSERT INTO `user` VALUES (5, '13333333333', 'MzMzMzMz', '333', 1514109074, 'http://cxp.im/images/icon.jpg', NULL, NULL);
INSERT INTO `user` VALUES (6, '12222222223', 'MTExMTEx', 't', 1514343525, 'http://cxp.im/images/icon.jpg', NULL, NULL);
INSERT INTO `user` VALUES (7, '14444444444', 'MTExMTEx', 'qqq', 1514356103, 'http://cxp.im/images/icon.jpg', NULL, NULL);
INSERT INTO `user` VALUES (8, '15555555555', 'MTExMTEx', '15555', 1514356279, 'http://cxp.im/images/icon.jpg', NULL, NULL);
INSERT INTO `user` VALUES (9, '12222222224', 'MTExMTEx', 'www', 1514356390, 'http://cxp.im/images/icon.jpg', NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
