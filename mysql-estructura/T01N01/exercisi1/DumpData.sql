-- -----------------------------------------------------
-- DATA DUMP
-- -----------------------------------------------------

-- -----------------------------------------------------
-- muntura
-- -----------------------------------------------------
INSERT INTO `culdampolla`.`muntura` (`muntura_id`,`tipus`) VALUES (1,"flotant"), (2,"pasta"), (3,"metàl·lica");

-- -----------------------------------------------------
-- empleat
-- -----------------------------------------------------
INSERT INTO `culdampolla`.`empleat` (`empleat_id`,`nom`) VALUES (1,"Empleat 1"), (2,"Empleat 2");

-- -----------------------------------------------------
-- adreça
-- -----------------------------------------------------
INSERT INTO `culdampolla`.`adreça` (`adreça_id`,`carrer`,`numero`,`pis`,`porta`,`ciutat`,`codi_postal`,`pais`)
VALUES
(1,"Carrer Marina",59,4,"A","Barcelona","08005","Espanya"),
(2,"Carrer Diagonal",34,2,"2","Barcelona","08005","Espanya");

-- -----------------------------------------------------
-- proveidor
-- -----------------------------------------------------
INSERT INTO `culdampolla`.`proveidor` (`proveidor_id`,`nom`,`telefon`,`fax`,`NIF`,`adreça_adreça_id`)
VALUES
(1,"Proveidor 1","123456789","test@gmail.com","12345678A",1),
(2,"Proveidor 2","123456789","test@gmail.com","12345678B",2);

-- -----------------------------------------------------
-- marca
-- -----------------------------------------------------
INSERT INTO `culdampolla`.`marca` (`marca_id`,`nom`,`proveidor_proveidor_id`) VALUES (1,"Oakley", 1), (2,"Rayban", 1), (3,"Arnette", 2);

-- -----------------------------------------------------
-- ullera
-- -----------------------------------------------------
INSERT INTO `culdampolla`.`ullera` (`ullera_id`,`graduacio_vidre_esquerre`,`graduacio_vidre_dret`,`color_muntura`,`color_vidre_esquerre`,`color_vidre_dret`,`preu`,`muntura_muntura_id`,`marca_marca_id`)
VALUES
(1,1.5,1.4,"Vermell","Negre","Negre",'199.99',1,1),
(2,1.5,1.4,"Blau","Negre","Negre",'64.99',1,2),
(3,1.5,1.4,"negre","Vermell","Vermell",'89.99',2,2);

-- -----------------------------------------------------
-- client
-- -----------------------------------------------------
INSERT INTO `culdampolla`.`client` (`client_id`,`nom`,`telefon`,`correu_electronic`,`adreça_adreça_id`,`recomenador_client_id`)
VALUES
(1,"Pol","123456789","poldelahoz@gmail.com",1,NULL),
(2,"Andrea","123456789","test@gmail.com",2,1);

-- -----------------------------------------------------
-- venta
-- -----------------------------------------------------
INSERT INTO `culdampolla`.`venta` (`venta_id`,`empleat_empleat_id`,`client_client_id`) VALUES (1,1,1),(2,1,2),(3,2,1);

-- -----------------------------------------------------
-- venta_ullera
-- -----------------------------------------------------
INSERT INTO `culdampolla`.`venta_ullera` (`venta_venta_id`,`ullera_ullera_id`) VALUES (1,1),(1,2),(2,3),(3,3);