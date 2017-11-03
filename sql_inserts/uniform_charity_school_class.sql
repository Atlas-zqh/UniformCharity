CREATE TABLE `uniform charity`.school_class
(
    schoolName varchar(50),
    sgrade varchar(20),
    sclass varchar(20),
    auto_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT
);
CREATE UNIQUE INDEX school_class_auto_id_uindex ON `uniform charity`.school_class (auto_id);
INSERT INTO `uniform charity`.school_class (schoolName, sgrade, sclass, auto_id) VALUES ('南京外国语学校仙林分校', '2015', '1', 1);
INSERT INTO `uniform charity`.school_class (schoolName, sgrade, sclass, auto_id) VALUES ('南京外国语学校仙林分校', '2015', '2', 2);
INSERT INTO `uniform charity`.school_class (schoolName, sgrade, sclass, auto_id) VALUES ('南京外国语学校仙林分校', '2015', '3', 3);
INSERT INTO `uniform charity`.school_class (schoolName, sgrade, sclass, auto_id) VALUES ('南京外国语学校仙林分校', '2016', '1', 4);
INSERT INTO `uniform charity`.school_class (schoolName, sgrade, sclass, auto_id) VALUES ('南京外国语学校仙林分校', '2016', '2', 5);
INSERT INTO `uniform charity`.school_class (schoolName, sgrade, sclass, auto_id) VALUES ('南京外国语学校仙林分校', '2016', '3', 6);