CREATE TABLE `uniform charity`.clothes_type
(
    schoolName varchar(30),
    clothestype varchar(30),
    clothesPrice double DEFAULT '0',
    default_pic_url varchar(100),
    used bit(1) DEFAULT b'1'
);
CREATE UNIQUE INDEX clothes_type_schoolName_clothestype_pk ON `uniform charity`.clothes_type (schoolName, clothestype);
INSERT INTO `uniform charity`.clothes_type (schoolName, clothestype, clothesPrice, default_pic_url, used) VALUES ('南京外国语学校仙林分校', '短袖衬衫', 50, '../static/clothesPics/6089476611504509574003.jpg', true);
INSERT INTO `uniform charity`.clothes_type (schoolName, clothestype, clothesPrice, default_pic_url, used) VALUES ('南京外国语学校仙林分校', '长袖衬衫', 60, '../static/clothesPics/8344655311504509597659.jpg', true);