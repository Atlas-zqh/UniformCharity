CREATE TABLE `uniform charity`.passage
(
    passage_id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ptitle varchar(100) NOT NULL,
    pcontent varchar(20000),
    ptime bigint(20)
);
CREATE UNIQUE INDEX passage_passage_id_uindex ON `uniform charity`.passage (passage_id);
INSERT INTO `uniform charity`.passage (passage_id, ptitle, pcontent, ptime) VALUES (1, '向XXX学校捐赠20000元人民币', '    向XXX学校捐赠20000元人民币。', 1503928148269);
INSERT INTO `uniform charity`.passage (passage_id, ptitle, pcontent, ptime) VALUES (4, '向XXX学校捐赠30000元人民币', '    向XXX学校捐赠30000元人民币。', 1503928220958);
INSERT INTO `uniform charity`.passage (passage_id, ptitle, pcontent, ptime) VALUES (5, '向XXX学校捐赠40000元人民币', '    向XXX学校捐赠40000元人民币。', 1503930285207);