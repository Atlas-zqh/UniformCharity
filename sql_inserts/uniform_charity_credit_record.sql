CREATE TABLE `uniform charity`.credit_record
(
    userid varchar(100) NOT NULL,
    recordID int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    recordtype int(11),
    clothesID varchar(50),
    variance double DEFAULT '0' NOT NULL,
    afterCredits double DEFAULT '0' NOT NULL,
    createtime bigint(20) NOT NULL
);
CREATE UNIQUE INDEX credit_record_recordID_uindex ON `uniform charity`.credit_record (recordID);
INSERT INTO `uniform charity`.credit_record (userid, recordID, recordtype, clothesID, variance, afterCredits, createtime) VALUES ('E5A2F31D73A60CEA941C2BE944DCEB7B7C4DF98EFEA6DDBD', 1, 1, '-3403857231502028819342', 0, 2000, 1502028819641);
INSERT INTO `uniform charity`.credit_record (userid, recordID, recordtype, clothesID, variance, afterCredits, createtime) VALUES ('E5A2F31D73A60CEA941C2BE944DCEB7B7C4DF98EFEA6DDBD', 2, 1, '291020170807103342120', 0, 2000, 1502073222701);
INSERT INTO `uniform charity`.credit_record (userid, recordID, recordtype, clothesID, variance, afterCredits, createtime) VALUES ('E5A2F31D73A60CEA941C2BE944DCEB7B7C4DF98EFEA6DDBD', 3, 1, '291020170807103513698', 0, 2000, 1502073314803);
INSERT INTO `uniform charity`.credit_record (userid, recordID, recordtype, clothesID, variance, afterCredits, createtime) VALUES ('E5A2F31D73A60CEA941C2BE944DCEB7B7C4DF98EFEA6DDBD', 4, 1, '291020170807103515366', 0, 2000, 1502073315823);
INSERT INTO `uniform charity`.credit_record (userid, recordID, recordtype, clothesID, variance, afterCredits, createtime) VALUES ('E5A2F31D73A60CEA941C2BE944DCEB7B7C4DF98EFEA6DDBD', 5, 1, '291020170807103516851', 0, 2000, 1502073317273);
INSERT INTO `uniform charity`.credit_record (userid, recordID, recordtype, clothesID, variance, afterCredits, createtime) VALUES ('25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', 6, 1, '010120170809170204070', 0, 100, 1502269324321);
INSERT INTO `uniform charity`.credit_record (userid, recordID, recordtype, clothesID, variance, afterCredits, createtime) VALUES ('25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', 7, 1, '010120170809174414334', 0, 100, 1502271854568);
INSERT INTO `uniform charity`.credit_record (userid, recordID, recordtype, clothesID, variance, afterCredits, createtime) VALUES ('25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', 8, 1, '010120170818203706691', 0, 100, 1503059826882);
INSERT INTO `uniform charity`.credit_record (userid, recordID, recordtype, clothesID, variance, afterCredits, createtime) VALUES ('25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', 9, 1, '010120170818203909185', 0, 100, 1503059949403);
INSERT INTO `uniform charity`.credit_record (userid, recordID, recordtype, clothesID, variance, afterCredits, createtime) VALUES ('25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', 10, 1, '010120170818204355230', 0, 100, 1503060235438);
INSERT INTO `uniform charity`.credit_record (userid, recordID, recordtype, clothesID, variance, afterCredits, createtime) VALUES ('25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', 11, 1, '010120170819232648875', 0, 100, 1503156409305);
INSERT INTO `uniform charity`.credit_record (userid, recordID, recordtype, clothesID, variance, afterCredits, createtime) VALUES ('25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', 12, 0, '291020170807103513698', 50, 150, 1505789569036);
INSERT INTO `uniform charity`.credit_record (userid, recordID, recordtype, clothesID, variance, afterCredits, createtime) VALUES ('25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', 13, 2, '291020170807103342120', -50, 100, 1505790222629);