SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- CREATE SCHEMA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8mb4 ;

-- -----------------------------------------------------
-- user
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `gender` ENUM('M', 'F') NOT NULL,
  `birth_date` DATE NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- video
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`video` (
  `video_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(155) NOT NULL,
  `size` INT NOT NULL,
  `file_name` VARCHAR(45) NOT NULL,
  `duration` TIME NOT NULL,
  `thumbnail` VARCHAR(45) NOT NULL,
  `status` ENUM('public', 'private', 'hidden') NOT NULL,
  `creator_user_id` INT NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`video_id`, `creator_user_id`),
  INDEX `fk_video_user_idx` (`creator_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_video_user`
    FOREIGN KEY (`creator_user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- channel
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`channel` (
  `channel_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(155) NOT NULL,
  `user_user_id` INT NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`channel_id`, `user_user_id`),
  INDEX `fk_canal_channel1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- user_view
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`user_view` (
  `user_view_id` INT NOT NULL AUTO_INCREMENT,
  `user_user_id` INT NOT NULL,
  `video_video_id` INT NOT NULL,
  `quantity` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`user_view_id`, `user_user_id`, `video_video_id`),
  INDEX `fk_user_view_video1_idx` (`video_video_id` ASC) VISIBLE,
  INDEX `fk_user_view_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_view_video1`
    FOREIGN KEY (`video_video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_view_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- user_interaction
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`user_interaction` (
  `user_interaction_id` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('channel_subscribe', 'like_video', 'dislike_video', 'like_comment', 'dislike_comment') NOT NULL,
  `user_user_id` INT NOT NULL,
  `channel_channel_id` INT NULL DEFAULT NULL,
  `video_video_id` INT NULL DEFAULT NULL,
  `comment_comment_id` INT NULL DEFAULT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_interaction_id`, `user_user_id`),
  INDEX `fk_user_interaction_user1_idx` (`user_user_id` ASC) VISIBLE,
  INDEX `fk_user_interaction_channel1_idx` (`channel_channel_id` ASC) VISIBLE,
  INDEX `fk_user_interaction_video1_idx` (`video_video_id` ASC) VISIBLE,
  INDEX `fk_user_interaction_comment1_idx` (`comment_comment_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_interaction_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_interaction_channel1`
    FOREIGN KEY (`channel_channel_id`)
    REFERENCES `youtube`.`channel` (`channel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_interaction_video1`
    FOREIGN KEY (`video_video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_interaction_comment1`
    FOREIGN KEY (`comment_comment_id`)
    REFERENCES `youtube`.`comment` (`comment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- playlist
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`playlist` (
  `playlist_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `status` ENUM('public', 'private') NOT NULL,
  `creator_user_id` INT NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`playlist_id`, `creator_user_id`),
  INDEX `fk_playlist_user1_idx` (`creator_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_user1`
    FOREIGN KEY (`creator_user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- comment
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`comment` (
  `comment_id` INT NOT NULL AUTO_INCREMENT,
  `video_video_id` INT NOT NULL,
  `content` VARCHAR(155) NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`, `video_video_id`),
  INDEX `fk_comment_video1_idx` (`video_video_id` ASC) VISIBLE,
  CONSTRAINT `fk_comment_video1`
    FOREIGN KEY (`video_video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- playlist_has_video
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`playlist_has_video` (
  `playlist_has_video_id` INT NOT NULL AUTO_INCREMENT,
  `playlist_playlist_id` INT NOT NULL,
  `video_video_id` INT NOT NULL,
  PRIMARY KEY (`playlist_has_video_id`, `playlist_playlist_id`, `video_video_id`),
  INDEX `fk_playlist_has_video_playlist1_idx` (`playlist_playlist_id` ASC) VISIBLE,
  INDEX `fk_playlist_has_video_video1_idx` (`video_video_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_has_video_playlist1`
    FOREIGN KEY (`playlist_playlist_id`)
    REFERENCES `youtube`.`playlist` (`playlist_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_playlist_has_video_video1`
    FOREIGN KEY (`video_video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- tag
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`tag` (
  `tag_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tag_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `youtube`.`video_has_tags` (
  `video_has_tags_id` INT NOT NULL AUTO_INCREMENT,
  `video_video_id` INT NOT NULL,
  `tag_tag_id` INT NOT NULL,
  PRIMARY KEY (`video_has_tags_id`, `video_video_id`, `tag_tag_id`),
  INDEX `fk_video_has_tags_video1_idx` (`video_video_id` ASC) VISIBLE,
  INDEX `fk_video_has_tags_tag1_idx` (`tag_tag_id` ASC) VISIBLE,
  CONSTRAINT `fk_video_has_tags_video1`
    FOREIGN KEY (`video_video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_video_has_tags_tag1`
    FOREIGN KEY (`tag_tag_id`)
    REFERENCES `youtube`.`tag` (`tag_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
