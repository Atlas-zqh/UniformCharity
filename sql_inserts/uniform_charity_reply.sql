CREATE TABLE `uniform charity`.reply
(
    reply_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    reply_uid varchar(100) NOT NULL COMMENT '评论用户ID',
    reply_content varchar(500) COMMENT '评论内容',
    reply_pid int(11) NOT NULL COMMENT '评论的帖子id',
    reply_time bigint(20) NOT NULL COMMENT '评论时间',
    reply_layer smallint(6) NOT NULL COMMENT '评论层数',
    reply_rid int(11) COMMENT '层数为2时，记录回复的回复的id，否则为-1'
);
CREATE INDEX reply_reply_pid_index ON `uniform charity`.reply (reply_pid);
INSERT INTO `uniform charity`.reply (reply_id, reply_uid, reply_content, reply_pid, reply_time, reply_layer, reply_rid) VALUES (1, '25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', '1', 1, 1502261201630, 1, 0);
INSERT INTO `uniform charity`.reply (reply_id, reply_uid, reply_content, reply_pid, reply_time, reply_layer, reply_rid) VALUES (2, '25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', '2', 1, 1502262410813, 1, 0);
INSERT INTO `uniform charity`.reply (reply_id, reply_uid, reply_content, reply_pid, reply_time, reply_layer, reply_rid) VALUES (3, '25DB915956EF3205FE6A75C151868FFB7A4F446AB4734DF2', 'ea', 1, 1502262446831, 1, 0);