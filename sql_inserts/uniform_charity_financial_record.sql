CREATE TABLE `uniform charity`.financial_record
(
    recordtype int(11) NOT NULL,
    amount double NOT NULL,
    createTime bigint(20),
    user_id varchar(100) NOT NULL,
    recordID int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT
);
INSERT INTO `uniform charity`.financial_record (recordtype, amount, createTime, user_id, recordID) VALUES (1, 50, 1505789569312, '25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', 1);
INSERT INTO `uniform charity`.financial_record (recordtype, amount, createTime, user_id, recordID) VALUES (0, 50, 1505789569312, '', 2);