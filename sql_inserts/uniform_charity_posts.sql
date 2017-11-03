CREATE TABLE `uniform charity`.posts
(
    post_id int(11) PRIMARY KEY NOT NULL COMMENT '帖子ID' AUTO_INCREMENT,
    post_uid varchar(100) NOT NULL COMMENT '发帖用户ID',
    post_topic varchar(200) NOT NULL COMMENT '帖子主题',
    post_commentcount int(11) DEFAULT '0' COMMENT '帖子评论数',
    post_updatetime bigint(20) NOT NULL COMMENT '最后回复时间',
    post_createtime bigint(20) NOT NULL COMMENT '发帖时间',
    post_islocked bit(1) DEFAULT b'0' COMMENT '帖子是否被锁定',
    post_bid int(11) NOT NULL COMMENT '帖子所属板块ID',
    post_content varchar(500)
);
CREATE UNIQUE INDEX posts_post_id_uindex ON `uniform charity`.posts (post_id);
INSERT INTO `uniform charity`.posts (post_id, post_uid, post_topic, post_commentcount, post_updatetime, post_createtime, post_islocked, post_bid, post_content) VALUES (1, '25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', '111', 3, 1502262446877, 1502211708548, false, 1, 'sadfsaf');