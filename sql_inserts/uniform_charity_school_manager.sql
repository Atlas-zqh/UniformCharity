CREATE TABLE `uniform charity`.school_manager
(
    manager_ID int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    username varchar(50) NOT NULL,
    password varchar(50) NOT NULL,
    schoolName varchar(30)
);
CREATE UNIQUE INDEX school_manager_manager_ID_uindex ON `uniform charity`.school_manager (manager_ID);
INSERT INTO `uniform charity`.school_manager (manager_ID, username, password, schoolName) VALUES (1, 'FB1117EC8E7BC42E', 'FB1117EC8E7BC42E', null);
INSERT INTO `uniform charity`.school_manager (manager_ID, username, password, schoolName) VALUES (2, 'CA394B1CE2EA2A74', 'A2EC736FB07FE172', '南京外国语学校仙林分校');