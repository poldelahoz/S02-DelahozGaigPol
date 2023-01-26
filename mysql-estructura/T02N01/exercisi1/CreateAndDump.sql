SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- CREATE SCHEMA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `culdampolla2` DEFAULT CHARACTER SET utf8mb4 ;

-- -----------------------------------------------------
-- CREATE TABLES
-- -----------------------------------------------------

-- -----------------------------------------------------
-- muntura
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culdampolla2`.`muntura` (
  `muntura_id` INT NOT NULL AUTO_INCREMENT,
  `tipus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`muntura_id`),
  UNIQUE INDEX `tipus_UNIQUE` (`tipus` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- empleat
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culdampolla2`.`empleat` (
  `empleat_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`empleat_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- adreça
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culdampolla2`.`adreça` (
  `adreça_id` INT NOT NULL AUTO_INCREMENT,
  `carrer` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `pis` INT NULL DEFAULT NULL,
  `porta` VARCHAR(5) NULL DEFAULT NULL,
  `ciutat` VARCHAR(45) NOT NULL,
  `codi_postal` VARCHAR(10) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`adreça_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- proveidor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culdampolla2`.`proveidor` (
  `proveidor_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(15) NOT NULL,
  `fax` VARCHAR(15) NULL DEFAULT NULL,
  `NIF` VARCHAR(15) NOT NULL,
  `adreça_adreça_id` INT NOT NULL,
  PRIMARY KEY (`proveidor_id`, `adreça_adreça_id`),
  UNIQUE INDEX `nom_UNIQUE` (`nom` ASC) VISIBLE,
  INDEX `fk_proveidor_adreça1_idx` (`adreça_adreça_id` ASC) VISIBLE,
  CONSTRAINT `fk_proveidor_adreça1`
    FOREIGN KEY (`adreça_adreça_id`)
    REFERENCES `culdampolla2`.`adreça` (`adreça_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- marca
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culdampolla2`.`marca` (
  `marca_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `proveidor_proveidor_id` INT NOT NULL,
  PRIMARY KEY (`marca_id`, `proveidor_proveidor_id`),
  UNIQUE INDEX `nom_UNIQUE` (`nom` ASC) VISIBLE,
  INDEX `fk_marca_proveidor1_idx` (`proveidor_proveidor_id` ASC) VISIBLE,
  CONSTRAINT `fk_marca_proveidor1`
    FOREIGN KEY (`proveidor_proveidor_id`)
    REFERENCES `culdampolla2`.`proveidor` (`proveidor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- client
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culdampolla2`.`client` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(15) NOT NULL,
  `correu_electronic` VARCHAR(45) NOT NULL,
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `adreça_adreça_id` INT NOT NULL,
  `recomenador_client_id` INT NULL,
  PRIMARY KEY (`client_id`, `adreça_adreça_id`),
  INDEX `fk_client_adreça1_idx` (`adreça_adreça_id` ASC) VISIBLE,
  INDEX `fk_client_client1_idx` (`recomenador_client_id` ASC) VISIBLE,
  UNIQUE INDEX `recomenador_client_id_UNIQUE` (`recomenador_client_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_adreça1`
    FOREIGN KEY (`adreça_adreça_id`)
    REFERENCES `culdampolla2`.`adreça` (`adreça_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_client_client1`
    FOREIGN KEY (`recomenador_client_id`)
    REFERENCES `culdampolla2`.`client` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- ullera
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culdampolla2`.`ullera` (
  `ullera_id` INT NOT NULL AUTO_INCREMENT,
  `graduacio_vidre_esquerre` FLOAT(11) NULL DEFAULT NULL,
  `graduacio_vidre_dret` FLOAT(11) NULL DEFAULT NULL,
  `color_muntura` VARCHAR(45) NOT NULL,
  `color_vidre_esquerre` VARCHAR(45) NOT NULL,
  `color_vidre_dret` VARCHAR(45) NOT NULL,
  `preu` DECIMAL(6,2) NULL DEFAULT NULL,
  `muntura_muntura_id` INT NOT NULL,
  `marca_marca_id` INT NOT NULL,
  PRIMARY KEY (`ullera_id`, `muntura_muntura_id`, `marca_marca_id`),
  INDEX `fk_ullera_muntura_idx` (`muntura_muntura_id` ASC) VISIBLE,
  INDEX `fk_ullera_marca1_idx` (`marca_marca_id` ASC) VISIBLE,
  CONSTRAINT `fk_ullera_muntura`
    FOREIGN KEY (`muntura_muntura_id`)
    REFERENCES `culdampolla2`.`muntura` (`muntura_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ullera_marca1`
    FOREIGN KEY (`marca_marca_id`)
    REFERENCES `culdampolla2`.`marca` (`marca_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- venta
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culdampolla2`.`venta` (
  `venta_id` INT NOT NULL AUTO_INCREMENT,
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `empleat_empleat_id` INT NOT NULL,
  `client_client_id` INT NOT NULL,
  PRIMARY KEY (`venta_id`, `empleat_empleat_id`, `client_client_id`),
  INDEX `fk_venta_empleat1_idx` (`empleat_empleat_id` ASC) VISIBLE,
  INDEX `fk_venta_client1_idx` (`client_client_id` ASC) VISIBLE,
  CONSTRAINT `fk_venta_empleat1`
    FOREIGN KEY (`empleat_empleat_id`)
    REFERENCES `culdampolla2`.`empleat` (`empleat_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_venta_client1`
    FOREIGN KEY (`client_client_id`)
    REFERENCES `culdampolla2`.`client` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- venta_ullera
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culdampolla2`.`venta_ullera` (
  `venta_ullera_id` INT NOT NULL AUTO_INCREMENT,
  `ullera_ullera_id` INT NOT NULL,
  `venta_venta_id` INT NOT NULL,
  PRIMARY KEY (`venta_ullera_id`, `ullera_ullera_id`, `venta_venta_id`),
  INDEX `fk_venta_ullera_ullera1_idx` (`ullera_ullera_id` ASC) VISIBLE,
  INDEX `fk_venta_ullera_venta1_idx` (`venta_venta_id` ASC) VISIBLE,
  CONSTRAINT `fk_venta_ullera_ullera1`
    FOREIGN KEY (`ullera_ullera_id`)
    REFERENCES `culdampolla2`.`ullera` (`ullera_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_venta_ullera_venta1`
    FOREIGN KEY (`venta_venta_id`)
    REFERENCES `culdampolla2`.`venta` (`venta_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- DATA DUMP
-- -----------------------------------------------------

-- -----------------------------------------------------
-- muntura
-- -----------------------------------------------------
INSERT INTO `culdampolla2`.`muntura` (`muntura_id`,`tipus`) VALUES (1,"flotant"), (2,"pasta"), (3,"metàl·lica");

-- -----------------------------------------------------
-- empleat
-- -----------------------------------------------------
INSERT INTO `culdampolla2`.`empleat` (`empleat_id`,`nom`) VALUES (1,"Empleat 1"), (2,"Empleat 2");

-- -----------------------------------------------------
-- adreça
-- -----------------------------------------------------
INSERT INTO `culdampolla2`.`adreça` (`adreça_id`,`carrer`,`numero`,`pis`,`porta`,`ciutat`,`codi_postal`,`pais`)
VALUES
(1,"Carrer Marina",59,4,"A","Barcelona","08005","Espanya"),
(2,"Carrer Diagonal",34,2,"2","Barcelona","08005","Espanya");

-- -----------------------------------------------------
-- proveidor
-- -----------------------------------------------------
INSERT INTO `culdampolla2`.`proveidor` (`proveidor_id`,`nom`,`telefon`,`fax`,`NIF`,`adreça_adreça_id`)
VALUES
(1,"Proveidor 1","123456789","test@gmail.com","12345678A",1),
(2,"Proveidor 2","123456789","test@gmail.com","12345678B",2);

-- -----------------------------------------------------
-- marca
-- -----------------------------------------------------
INSERT INTO `culdampolla2`.`marca` (`marca_id`,`nom`,`proveidor_proveidor_id`) VALUES (1,"Oakley", 1), (2,"Rayban", 1), (3,"Arnette", 2);

-- -----------------------------------------------------
-- ullera
-- -----------------------------------------------------
INSERT INTO `culdampolla2`.`ullera` (`ullera_id`,`graduacio_vidre_esquerre`,`graduacio_vidre_dret`,`color_muntura`,`color_vidre_esquerre`,`color_vidre_dret`,`preu`,`muntura_muntura_id`,`marca_marca_id`)
VALUES
(1,1.5,1.4,"Vermell","Negre","Negre",'199.99',1,1),
(2,1.5,1.4,"Blau","Negre","Negre",'64.99',1,2),
(3,1.5,1.4,"negre","Vermell","Vermell",'89.99',2,2);

-- -----------------------------------------------------
-- client
-- -----------------------------------------------------
INSERT INTO `culdampolla2`.`client` (`client_id`,`nom`,`telefon`,`correu_electronic`,`adreça_adreça_id`,`recomenador_client_id`)
VALUES
(1,"Pol","123456789","poldelahoz@gmail.com",1,NULL),
(2,"Andrea","123456789","test@gmail.com",2,1);

-- -----------------------------------------------------
-- venta
-- -----------------------------------------------------
INSERT INTO `culdampolla2`.`venta` (`venta_id`,`empleat_empleat_id`,`client_client_id`) VALUES (1,1,1),(2,1,2),(3,2,1);

-- -----------------------------------------------------
-- venta_ullera
-- -----------------------------------------------------
INSERT INTO `culdampolla2`.`venta_ullera` (`venta_venta_id`,`ullera_ullera_id`) VALUES (1,1),(1,2),(2,3),(3,3);