CREATE TABLE `uniform charity`.school
(
    schoolName varchar(40) PRIMARY KEY NOT NULL,
    schoolCity varchar(10) NOT NULL,
    schoolDistrict varchar(10) NOT NULL,
    used bit(1) NOT NULL
);
INSERT INTO `uniform charity`.school (schoolName, schoolCity, schoolDistrict, used) VALUES ('abc学校', '南京', '建邺区', true);
INSERT INTO `uniform charity`.school (schoolName, schoolCity, schoolDistrict, used) VALUES ('cde学校', '南京', '栖霞区', true);
INSERT INTO `uniform charity`.school (schoolName, schoolCity, schoolDistrict, used) VALUES ('fgh学校', '上海', '青浦区', true);
INSERT INTO `uniform charity`.school (schoolName, schoolCity, schoolDistrict, used) VALUES ('ijk学校', '南京', '鼓楼区', true);
INSERT INTO `uniform charity`.school (schoolName, schoolCity, schoolDistrict, used) VALUES ('南京外国语学校仙林分校', '南京', '栖霞区', true);