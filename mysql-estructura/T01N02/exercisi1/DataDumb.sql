-- -----------------------------------------------------
-- DATA DUMP
-- -----------------------------------------------------

-- -----------------------------------------------------
-- user
-- -----------------------------------------------------
INSERT INTO `youtube`.`user` (`user_id`,`email`,`password`,`username`,`gender`,`birth_date`,`postal_code`,`country`)
VALUES
(1,"User 1", "encryptedPassword1", "user1", "M", "1993-01-13", "12345", "Country User 1"),
(2,"User 2", "encryptedPassword2", "user2", "F", "1993-01-13", "12345", "Country User 2"),
(3,"User 3", "encryptedPassword3", "user3", "M", "1993-01-13", "12345", "Country User 3"),
(4,"User 4", "encryptedPassword4", "user4", "F", "1993-01-13", "12345", "Country User 4");

-- -----------------------------------------------------
-- playlist
-- -----------------------------------------------------
INSERT INTO `youtube`.`playlist` (`playlist_id`,`name`,`status`,`creator_user_id`)
VALUES
(1,"Playlist User 1", "public", 1),
(2,"Playlist User 2", "private", 1),
(3,"Playlist User 3", "private", 2),
(4,"Playlist User 4", "public", 2);

-- -----------------------------------------------------
-- channel
-- -----------------------------------------------------
INSERT INTO `youtube`.`channel` (`channel_id`,`name`,`description`,`user_user_id`)
VALUES
(1,"Channel User 1", "Channel User 1", 1),
(2,"Channel User 2", "Channel User 2", 2),
(3,"Channel User 3", "Channel User 3", 3),
(4,"Channel User 4", "Channel User 4", 4);

-- -----------------------------------------------------
-- video
-- -----------------------------------------------------
INSERT INTO `youtube`.`video` (`video_id`,`title`,`description`,`size`,`file_name`,`duration`,`thumbnail`,`status`,`creator_user_id`)
VALUES
(1,"Video 1", "Description Video 1", "123456", "video1", "00:01:30", "video1_thumbnail.png", "public", 1),
(2,"Video 2", "Description Video 2", "654321", "video2", "00:05:30", "video2_thumbnail.png", "hidden", 1),
(3,"Video 3", "Description Video 3", "123456", "video3", "00:01:30", "video3_thumbnail.png", "public", 2),
(4,"Video 4", "Description Video 4", "123456", "video4", "00:05:30", "video4_thumbnail.png", "private", 3);

-- -----------------------------------------------------
-- tag
-- -----------------------------------------------------
INSERT INTO `youtube`.`tag` (`tag_id`,`name`)
VALUES
(1, "viral"),
(2, "gato"),
(3, "perro"),
(4, "risas"),
(5, "tutorial");

-- -----------------------------------------------------
-- video_has_tags
-- -----------------------------------------------------
INSERT INTO `youtube`.`video_has_tags` (`video_video_id`,`tag_tag_id`)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(3, 1),
(3, 5);

-- -----------------------------------------------------
-- playlist_has_video
-- -----------------------------------------------------
INSERT INTO `youtube`.`playlist_has_video` (`playlist_playlist_id`,`video_video_id`)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(3, 4);

-- -----------------------------------------------------
-- comment
-- -----------------------------------------------------
INSERT INTO `youtube`.`comment` (`comment_id`,`content`,`video_video_id`)
VALUES
(1,"Comment 1 on Video 1", 1),
(2,"Comment 2 on Video 1", 1),
(3,"Comment 1 on Video 2", 2);

-- -----------------------------------------------------
-- user_view
-- -----------------------------------------------------
INSERT INTO `youtube`.`user_view` (`user_user_id`,`video_video_id`,`quantity`)
VALUES
(1, 1, 10),
(1, 2, 1),
(2, 3, 3);

-- -----------------------------------------------------
-- user_interaction
-- -----------------------------------------------------
INSERT INTO `youtube`.`user_interaction` (`type`,`user_user_id`,`channel_channel_id`,`video_video_id`,`comment_comment_id`)
VALUES
("channel_subscribe", 1, 2, NULL, NULL),
("channel_subscribe", 1, 3, NULL, NULL),
("like_video", 1, NULL, 1, NULL),
("like_video", 1, NULL, 2, NULL),
("dislike_video", 1, NULL, 3, NULL),
("dislike_video", 1, NULL, 4, NULL),
("like_comment", 1, NULL, NULL, 2),
("dislike_comment", 1, NULL, NULL, 3);
