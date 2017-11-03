CREATE TABLE `uniform charity`.clothes_history
(
    historyID int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    createTime bigint(20),
    donorID varchar(100),
    buyerID varchar(100),
    story varchar(1000),
    clothesID varchar(40)
);
CREATE UNIQUE INDEX clothes_history_historyID_uindex ON `uniform charity`.clothes_history (historyID);
INSERT INTO `uniform charity`.clothes_history (historyID, createTime, donorID, buyerID, story, clothesID) VALUES (1, 1505789569970, 'E5A2F31D73A60CEA941C2BE944DCEB7B7C4DF98EFEA6DDBD', '25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', '衣服不错，价格实惠。', '291020170807103513698');