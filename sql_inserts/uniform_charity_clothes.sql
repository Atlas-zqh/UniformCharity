CREATE TABLE `uniform charity`.clothes
(
    auto_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    clothesID varchar(40) NOT NULL COMMENT '衣物编号',
    schoolName varchar(40) NOT NULL COMMENT '学校名称',
    clothesHeight double NOT NULL COMMENT '衣服身高',
    clothesWeight double DEFAULT '40' NOT NULL COMMENT '体重',
    clothesType varchar(10) COMMENT '衣服种类',
    donorID varchar(100) NOT NULL COMMENT '捐衣者ID',
    gender varchar(10) NOT NULL,
    status varchar(10) NOT NULL,
    times int(11) DEFAULT '1' NOT NULL
);
CREATE UNIQUE INDEX clothes_auto_id_uindex ON `uniform charity`.clothes (auto_id);
INSERT INTO `uniform charity`.clothes (auto_id, clothesID, schoolName, clothesHeight, clothesWeight, clothesType, donorID, gender, status, times) VALUES (1, '010120170809170204070', '南京外国语学校仙林分校', 150, 40, '短袖衬衫', '25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', '男', 'Available', 1);
INSERT INTO `uniform charity`.clothes (auto_id, clothesID, schoolName, clothesHeight, clothesWeight, clothesType, donorID, gender, status, times) VALUES (2, '010120170809174414334', '南京外国语学校仙林分校', 150, 40, '短袖衬衫', '25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', '男', 'Available', 1);
INSERT INTO `uniform charity`.clothes (auto_id, clothesID, schoolName, clothesHeight, clothesWeight, clothesType, donorID, gender, status, times) VALUES (3, '010120170818203706691', '南京外国语学校仙林分校', 140, 0, '短袖衬衫', '25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', '男', 'Occupied', 1);
INSERT INTO `uniform charity`.clothes (auto_id, clothesID, schoolName, clothesHeight, clothesWeight, clothesType, donorID, gender, status, times) VALUES (4, '010120170818203909185', '南京外国语学校仙林分校', 150, 0, '短袖衬衫', '25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', '男', 'Available', 1);
INSERT INTO `uniform charity`.clothes (auto_id, clothesID, schoolName, clothesHeight, clothesWeight, clothesType, donorID, gender, status, times) VALUES (5, '010120170818204355230', '南京外国语学校仙林分校', 160, 0, '短袖衬衫', '25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', '男', 'Available', 1);
INSERT INTO `uniform charity`.clothes (auto_id, clothesID, schoolName, clothesHeight, clothesWeight, clothesType, donorID, gender, status, times) VALUES (6, '010120170819232648875', '南京外国语学校仙林分校', 120, 0, '短袖衬衫', '25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', '男', 'Available', 1);
INSERT INTO `uniform charity`.clothes (auto_id, clothesID, schoolName, clothesHeight, clothesWeight, clothesType, donorID, gender, status, times) VALUES (7, '291020170807103342120', '南京外国语学校仙林分校', 150, 40, '短袖衬衫', 'E5A2F31D73A60CEA941C2BE944DCEB7B7C4DF98EFEA6DDBD', '男', 'Available', 1);
INSERT INTO `uniform charity`.clothes (auto_id, clothesID, schoolName, clothesHeight, clothesWeight, clothesType, donorID, gender, status, times) VALUES (8, '291020170807103513698', '南京外国语学校仙林分校', 150, 40, '短袖衬衫', 'E5A2F31D73A60CEA941C2BE944DCEB7B7C4DF98EFEA6DDBD', '男', 'Occupied', 1);