CREATE TABLE `uniform charity`.student
(
    username varchar(50) DEFAULT '' NOT NULL COMMENT '用户名',
    password varchar(50) DEFAULT '' NOT NULL COMMENT '密码',
    wechatID varchar(50) DEFAULT '' NOT NULL COMMENT '微信号',
    phone varchar(50) DEFAULT '' NOT NULL COMMENT '手机号',
    realName varchar(50) DEFAULT '' NOT NULL COMMENT '真实姓名',
    gender varchar(10) DEFAULT '' NOT NULL COMMENT '性别',
    personID varchar(100) DEFAULT '' PRIMARY KEY NOT NULL COMMENT '身份证号',
    credits double DEFAULT '0' NOT NULL COMMENT '公益积分',
    email varchar(50) DEFAULT '',
    picurl varchar(100) COMMENT '头像存储路径',
    used bit(1) DEFAULT b'1' NOT NULL COMMENT '账号是否处于使用状态',
    school varchar(30) NOT NULL,
    sclass varchar(20) DEFAULT '1班',
    sgrade varchar(20) DEFAULT '2015级'
);
CREATE INDEX schoolName ON `uniform charity`.student (school);
CREATE INDEX schoolName_2 ON `uniform charity`.student (school);
CREATE INDEX schoolName_3 ON `uniform charity`.student (school);
CREATE UNIQUE INDEX student_username_uindex ON `uniform charity`.student (username);
INSERT INTO `uniform charity`.student (username, password, wechatID, phone, realName, gender, personID, credits, email, picurl, used, school, sclass, sgrade) VALUES ('14C06F0C2C46594A', 'A2EC736FB07FE172', '685C70BB802F4E14', '62BCE5DAB6B38A5EBA26DF7781128720', '4C26A55A9018EA940A46B0D0831C512A', '男', '25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', 100, '685C70BB802F4E14', '../static/icons/320522199701010101.jpg', true, '南京外国语学校仙林分校', '1', '2015');
INSERT INTO `uniform charity`.student (username, password, wechatID, phone, realName, gender, personID, credits, email, picurl, used, school, sclass, sgrade) VALUES ('FB1117EC8E7BC42E', 'A2EC736FB07FE172', '824531C76F0E192B4E2692D0C4FA2E9B', '469226DE55FFA296211F9D387D6CDF5B', 'EA9717314FD1CD2B7E95E458B74CAB01', '男', '469226DE55FFA296809231F939D2DBE850AB8B262413075D', 2000, '9F892F64C832E4CEF2C9CC2D559BFCBB', '', true, '南京外国语学校仙林分校', '2', '2015');
INSERT INTO `uniform charity`.student (username, password, wechatID, phone, realName, gender, personID, credits, email, picurl, used, school, sclass, sgrade) VALUES ('87528FA77141F052', 'A2EC736FB07FE172', '3746CD490DF9A040', '469226DE55FFA296211F9D387D6CDF5B', '7FC78427CE6B30FAC5CC2C4008B755AA', '男', 'E5A2F31D73A60CEA941C2BE944DCEB7B7C4DF98EFEA6DDBD', 2000, '6A95FD8AAB4DC75E9BA71BF7874C33B0', 'dd', true, '南京外国语学校仙林分校', '2', '2016');