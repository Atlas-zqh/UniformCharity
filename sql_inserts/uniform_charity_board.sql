CREATE TABLE `uniform charity`.board
(
    board_id int(11) PRIMARY KEY NOT NULL COMMENT '板块编号' AUTO_INCREMENT,
    board_name varchar(20) NOT NULL COMMENT '板块名'
);
CREATE UNIQUE INDEX board_board_name_uindex ON `uniform charity`.board (board_name);
INSERT INTO `uniform charity`.board (board_id, board_name) VALUES (1, 'Board1');
INSERT INTO `uniform charity`.board (board_id, board_name) VALUES (2, 'Board2');
INSERT INTO `uniform charity`.board (board_id, board_name) VALUES (3, 'Board3');