-- -----------------------------------------------------
-- DATA DUMP
-- -----------------------------------------------------

-- -----------------------------------------------------
-- user
-- -----------------------------------------------------
INSERT INTO `spotify`.`user`(`user_id`,`email`,`password`,`username`,`dob`,`gender`,`postal_code`,`country`)
VALUES
(1,"user1@user1.com","encryptedPassword1","user1","2023-02-02","M","12345","Country 1"),
(2,"user2@user2.com","encryptedPassword2","user2","2023-02-02","F","12345","Country 2"),
(3,"user3@user3.com","encryptedPassword3","user3","2023-02-02","M","12345","Country 3");

-- -----------------------------------------------------
-- credit_card
-- -----------------------------------------------------
INSERT INTO `spotify`.`credit_card`(`credit_card_id`,`number`,`expire_month`,`expire_year`,`cvv`)
VALUES
(1,"encryptedNumber1",2,"2023","encryptedCVV"),
(1,"encryptedNumber1",2,"2023","encryptedCVV")
(1,"encryptedNumber1",2,"2023","encryptedCVV");


-- -----------------------------------------------------
-- paypal
-- -----------------------------------------------------