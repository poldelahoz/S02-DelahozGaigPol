SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- CREATE SCHEMA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `spotify1` DEFAULT CHARACTER SET utf8mb4 ;

-- -----------------------------------------------------
-- CREATE TABLES
-- -----------------------------------------------------

-- -----------------------------------------------------
-- user
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify1`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `dob` DATE NOT NULL,
  `gender` ENUM('M', 'F') NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- subscription
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify1`.`subscription` (
  `subscription_id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` DATETIME NOT NULL,
  `payment_payment_id` INT NOT NULL,
  PRIMARY KEY (`subscription_id`, `payment_payment_id`),
  INDEX `fk_subscription_payment1_idx` (`payment_payment_id` ASC) VISIBLE,
  CONSTRAINT `fk_subscription_payment1`
    FOREIGN KEY (`payment_payment_id`)
    REFERENCES `spotify1`.`payment` (`payment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- credit_card
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify1`.`credit_card` (
  `credit_card_id` INT NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(255) NOT NULL,
  `expire_month` TINYINT NOT NULL,
  `expire_year` TINYINT NOT NULL,
  `cvv` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`credit_card_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- paypal
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify1`.`paypal` (
  `paypal_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`paypal_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- payment_method
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify1`.`payment_method` (
  `payment_method_id` INT NOT NULL AUTO_INCREMENT,
  `user_user_id` INT NOT NULL,
  `credit_card_credit_card_id` INT NULL DEFAULT NULL,
  `paypal_paypal_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`payment_method_id`, `user_user_id`),
  INDEX `fk_payment_method_user1_idx` (`user_user_id` ASC) VISIBLE,
  INDEX `fk_payment_method_credit_card1_idx` (`credit_card_credit_card_id` ASC) VISIBLE,
  INDEX `fk_payment_method_paypal1_idx` (`paypal_paypal_id` ASC) VISIBLE,
  UNIQUE INDEX `credit_card_credit_card_id_UNIQUE` (`credit_card_credit_card_id` ASC) VISIBLE,
  UNIQUE INDEX `paypal_paypal_id_UNIQUE` (`paypal_paypal_id` ASC) VISIBLE,
  CONSTRAINT `fk_payment_method_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `spotify1`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_method_credit_card1`
    FOREIGN KEY (`credit_card_credit_card_id`)
    REFERENCES `spotify1`.`credit_card` (`credit_card_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_method_paypal1`
    FOREIGN KEY (`paypal_paypal_id`)
    REFERENCES `spotify1`.`paypal` (`paypal_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- payment
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify1`.`payment` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `order_number` VARCHAR(45) NOT NULL,
  `total` DECIMAL NOT NULL,
  `payment_method_payment_method_id` INT NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`, `payment_method_payment_method_id`),
  UNIQUE INDEX `order_number_UNIQUE` (`order_number` ASC) VISIBLE,
  INDEX `fk_payment_payment_method1_idx` (`payment_method_payment_method_id` ASC) VISIBLE,
  CONSTRAINT `fk_payment_payment_method1`
    FOREIGN KEY (`payment_method_payment_method_id`)
    REFERENCES `spotify1`.`payment_method` (`payment_method_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- playlist
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify1`.`playlist` (
  `playlist_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 1,
  `delete_date` DATETIME NOT NULL,
  `shared` TINYINT NOT NULL DEFAULT 0,
  `user_user_id` INT NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`playlist_id`, `user_user_id`),
  INDEX `fk_playlist_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `spotify1`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- album
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify1`.`album` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `published` YEAR NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `artist_artist_id` INT NOT NULL,
  PRIMARY KEY (`album_id`, `artist_artist_id`),
  INDEX `fk_album_artist_idx` (`artist_artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_album_artist`
    FOREIGN KEY (`artist_artist_id`)
    REFERENCES `spotify1`.`artist` (`artist_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- artist
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify1`.`artist` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- song
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify1`.`song` (
  `song_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `duration` TIME NOT NULL,
  `album_album_id` INT NOT NULL,
  PRIMARY KEY (`song_id`, `album_album_id`),
  INDEX `fk_song_album1_idx` (`album_album_id` ASC) VISIBLE,
  CONSTRAINT `fk_song_album1`
    FOREIGN KEY (`album_album_id`)
    REFERENCES `spotify1`.`album` (`album_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- playlist_has_songs
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify1`.`playlist_has_songs` (
  `playlist_has_songs_id` INT NOT NULL AUTO_INCREMENT,
  `song_song_id` INT NOT NULL,
  `playlist_playlist_id` INT NOT NULL,
  `user_user_id` INT NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`playlist_has_songs_id`, `song_song_id`, `playlist_playlist_id`, `user_user_id`),
  INDEX `fk_playlist_has_songs_song1_idx` (`song_song_id` ASC) VISIBLE,
  INDEX `fk_playlist_has_songs_playlist1_idx` (`playlist_playlist_id` ASC) VISIBLE,
  INDEX `fk_playlist_has_songs_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_has_songs_song1`
    FOREIGN KEY (`song_song_id`)
    REFERENCES `spotify1`.`song` (`song_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_playlist_has_songs_playlist1`
    FOREIGN KEY (`playlist_playlist_id`)
    REFERENCES `spotify1`.`playlist` (`playlist_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_playlist_has_songs_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `spotify1`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- user_lovelist
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify1`.`user_lovelist` (
  `user_lovelist_id` INT NOT NULL AUTO_INCREMENT,
  `user_user_id` INT NOT NULL,
  `song_song_id` INT NULL DEFAULT NULL,
  `album_album_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`user_lovelist_id`, `user_user_id`),
  INDEX `fk_user_lovelist_user1_idx` (`user_user_id` ASC) VISIBLE,
  INDEX `fk_user_lovelist_song1_idx` (`song_song_id` ASC) VISIBLE,
  INDEX `fk_user_lovelist_album1_idx` (`album_album_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_lovelist_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `spotify1`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_lovelist_song1`
    FOREIGN KEY (`song_song_id`)
    REFERENCES `spotify1`.`song` (`song_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_lovelist_album1`
    FOREIGN KEY (`album_album_id`)
    REFERENCES `spotify1`.`album` (`album_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- user_follows_artists
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify1`.`user_follows_artists` (
  `user_follows_artists_id` INT NOT NULL AUTO_INCREMENT,
  `user_user_id` INT NOT NULL,
  `artist_artist_id` INT NOT NULL,
  PRIMARY KEY (`user_follows_artists_id`, `user_user_id`, `artist_artist_id`),
  INDEX `fk_user_follows_artists_user1_idx` (`user_user_id` ASC) VISIBLE,
  INDEX `fk_user_follows_artists_artist1_idx` (`artist_artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_follows_artists_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `spotify1`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_follows_artists_artist1`
    FOREIGN KEY (`artist_artist_id`)
    REFERENCES `spotify1`.`artist` (`artist_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- user_plays_songs
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify1`.`user_plays_songs` (
  `user_plays_songs_id` INT NOT NULL AUTO_INCREMENT,
  `user_user_id` INT NOT NULL,
  `song_song_id` INT NOT NULL,
  `quantity` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`user_plays_songs_id`, `user_user_id`, `song_song_id`),
  INDEX `fk_user_plays_songs_user1_idx` (`user_user_id` ASC) VISIBLE,
  INDEX `fk_user_plays_songs_song1_idx` (`song_song_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_plays_songs_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `spotify1`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_plays_songs_song1`
    FOREIGN KEY (`song_song_id`)
    REFERENCES `spotify1`.`song` (`song_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- music_style
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify1`.`music_style` (
  `music_style_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`music_style_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- artist_has_styles
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify1`.`artist_has_styles` (
  `artist_has_styles_id` INT NOT NULL AUTO_INCREMENT,
  `artist_artist_id` INT NOT NULL,
  `music_style_music_style_id` INT NOT NULL,
  PRIMARY KEY (`artist_has_styles_id`, `artist_artist_id`, `music_style_music_style_id`),
  INDEX `fk_artist_has_styles_artist1_idx` (`artist_artist_id` ASC) VISIBLE,
  INDEX `fk_artist_has_styles_music_style1_idx` (`music_style_music_style_id` ASC) VISIBLE,
  CONSTRAINT `fk_artist_has_styles_artist1`
    FOREIGN KEY (`artist_artist_id`)
    REFERENCES `spotify1`.`artist` (`artist_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_artist_has_styles_music_style1`
    FOREIGN KEY (`music_style_music_style_id`)
    REFERENCES `spotify1`.`music_style` (`music_style_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- styles_relations
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify1`.`styles_relations` (
  `styles_relations_id` INT NOT NULL AUTO_INCREMENT,
  `music_style_music_style_id` INT NOT NULL,
  `music_style_music_style_id1` INT NOT NULL,
  PRIMARY KEY (`styles_relations_id`, `music_style_music_style_id`, `music_style_music_style_id1`),
  INDEX `fk_styles_relations_music_style1_idx` (`music_style_music_style_id` ASC) VISIBLE,
  INDEX `fk_styles_relations_music_style2_idx` (`music_style_music_style_id1` ASC) VISIBLE,
  CONSTRAINT `fk_styles_relations_music_style1`
    FOREIGN KEY (`music_style_music_style_id`)
    REFERENCES `spotify1`.`music_style` (`music_style_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_styles_relations_music_style2`
    FOREIGN KEY (`music_style_music_style_id1`)
    REFERENCES `spotify1`.`music_style` (`music_style_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
