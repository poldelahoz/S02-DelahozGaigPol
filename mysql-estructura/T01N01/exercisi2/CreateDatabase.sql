SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- CREATE SCHEMA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8mb4;

-- -----------------------------------------------------
-- CREATE TABLES
-- -----------------------------------------------------

-- -----------------------------------------------------
-- client
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`client` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `cognoms` VARCHAR(45) NOT NULL,
  `adreça` VARCHAR(45) NOT NULL,
  `codi_postal` VARCHAR(45) NOT NULL,
  `localitat` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- botiga
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`botiga` (
  `botiga_id` INT NOT NULL AUTO_INCREMENT,
  `adreça` VARCHAR(45) NOT NULL,
  `codi_postal` VARCHAR(45) NOT NULL,
  `localitat` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`botiga_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- empleat
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`empleat` (
  `empleat_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `cognoms` VARCHAR(45) NOT NULL,
  `NIF` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `tipus` ENUM('cuiner/a', 'repartidor/a') NOT NULL,
  `botiga_botiga_id` INT NOT NULL,
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`empleat_id`, `botiga_botiga_id`),
  INDEX `fk_empleat_botiga1_idx` (`botiga_botiga_id` ASC) VISIBLE,
  CONSTRAINT `fk_empleat_botiga1`
    FOREIGN KEY (`botiga_botiga_id`)
    REFERENCES `pizzeria`.`botiga` (`botiga_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- comanda
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`comanda` (
  `comanda_id` INT NOT NULL AUTO_INCREMENT,
  `tipus` ENUM('a domicili', 'recollida') NOT NULL,
  `botiga_botiga_id` INT NOT NULL,
  `empleat_empleat_id` INT NOT NULL,
  `client_client_id` INT NOT NULL,
  `repartidor_empleat_id` INT NULL DEFAULT NULL,
  `hora_lliurament` DATETIME NULL DEFAULT NULL,
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comanda_id`, `botiga_botiga_id`, `client_client_id`),
  INDEX `fk_comanda_client_idx` (`client_client_id` ASC) VISIBLE,
  INDEX `fk_comanda_empleat1_idx` (`repartidor_empleat_id` ASC) VISIBLE,
  INDEX `fk_comanda_botiga1_idx` (`botiga_botiga_id` ASC) VISIBLE,
  INDEX `fk_comanda_empleat2_idx` (`empleat_empleat_id` ASC) VISIBLE,
  CONSTRAINT `fk_comanda_client`
    FOREIGN KEY (`client_client_id`)
    REFERENCES `pizzeria`.`client` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_empleat1`
    FOREIGN KEY (`repartidor_empleat_id`)
    REFERENCES `pizzeria`.`empleat` (`empleat_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_botiga1`
    FOREIGN KEY (`botiga_botiga_id`)
    REFERENCES `pizzeria`.`botiga` (`botiga_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_empleat2`
    FOREIGN KEY (`empleat_empleat_id`)
    REFERENCES `pizzeria`.`empleat` (`empleat_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- producte
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`producte` (
  `producte_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `descripcio` VARCHAR(90) NOT NULL,
  `imatge` VARCHAR(45) NOT NULL,
  `preu` DECIMAL(4,2) NOT NULL,
  `tipus_producte_tipus_id` INT NOT NULL,
  `categoria_pizza_categoria_pizza_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`producte_id`, `tipus_producte_tipus_id`),
  INDEX `fk_producte_producte_tipus1_idx` (`tipus_producte_tipus_id` ASC) VISIBLE,
  INDEX `fk_producte_categoria_pizza1_idx` (`categoria_pizza_categoria_pizza_id` ASC) VISIBLE,
  CONSTRAINT `fk_producte_producte_tipus1`
    FOREIGN KEY (`tipus_producte_tipus_id`)
    REFERENCES `pizzeria`.`producte_tipus` (`producte_tipus_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_producte_categoria_pizza1`
    FOREIGN KEY (`categoria_pizza_categoria_pizza_id`)
    REFERENCES `pizzeria`.`categoria_pizza` (`categoria_pizza_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- categoria_pizza
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`categoria_pizza` (
  `categoria_pizza_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`categoria_pizza_id`),
  UNIQUE INDEX `nom_UNIQUE` (`nom` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- comanda_has_producte
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`comanda_has_producte` (
  `comanda_id` INT NOT NULL AUTO_INCREMENT,
  `comanda_comanda_id` INT NOT NULL,
  `producte_producte_id` INT NOT NULL,
  `quantitat` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`comanda_id`, `comanda_comanda_id`, `producte_producte_id`),
  INDEX `fk_comanda_has_producte_producte1_idx` (`producte_producte_id` ASC) VISIBLE,
  INDEX `fk_comanda_has_producte_comanda1_idx` (`comanda_comanda_id` ASC) VISIBLE,
  CONSTRAINT `fk_comanda_has_producte_comanda1`
    FOREIGN KEY (`comanda_comanda_id`)
    REFERENCES `pizzeria`.`comanda` (`comanda_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_has_producte_producte1`
    FOREIGN KEY (`producte_producte_id`)
    REFERENCES `pizzeria`.`producte` (`producte_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- producte_tipus
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`producte_tipus` (
  `producte_tipus_id` INT NOT NULL AUTO_INCREMENT,
  `tipus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`producte_tipus_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
