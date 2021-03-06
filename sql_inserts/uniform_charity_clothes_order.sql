CREATE TABLE `uniform charity`.clothes_order
(
    orderID varchar(17) PRIMARY KEY NOT NULL COMMENT '订单编号',
    clothesID varchar(40) NOT NULL COMMENT '衣服编号',
    donorID varchar(100) NOT NULL COMMENT '卖方ID',
    buyerID varchar(100) NOT NULL COMMENT '买方ID',
    orderStatus int(11) DEFAULT '-1' NOT NULL COMMENT '交易状态',
    startTime bigint(20) NOT NULL COMMENT '交易开始时间',
    endTime bigint(20) COMMENT '交易结束时间',
    authority int(11) DEFAULT '1' NOT NULL
);
INSERT INTO `uniform charity`.clothes_order (orderID, clothesID, donorID, buyerID, orderStatus, startTime, endTime, authority) VALUES ('20170822010418235', '010120170819232648875', '25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', 'E5A2F31D73A60CEA941C2BE944DCEB7B7C4DF98EFEA6DDBD', 2, 1503335058235, null, 0);
INSERT INTO `uniform charity`.clothes_order (orderID, clothesID, donorID, buyerID, orderStatus, startTime, endTime, authority) VALUES ('20170828203329787', '010120170809174414334', '25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', 'E5A2F31D73A60CEA941C2BE944DCEB7B7C4DF98EFEA6DDBD', 2, 1503923609787, null, 0);
INSERT INTO `uniform charity`.clothes_order (orderID, clothesID, donorID, buyerID, orderStatus, startTime, endTime, authority) VALUES ('20170917203050906', '291020170807103513698', 'E5A2F31D73A60CEA941C2BE944DCEB7B7C4DF98EFEA6DDBD', '25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', 3, 1505651450906, null, 0);
INSERT INTO `uniform charity`.clothes_order (orderID, clothesID, donorID, buyerID, orderStatus, startTime, endTime, authority) VALUES ('20170918190732801', '291020170807103342120', 'E5A2F31D73A60CEA941C2BE944DCEB7B7C4DF98EFEA6DDBD', '25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', -1, 1505732852801, null, 0);