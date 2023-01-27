-- -----------------------------------------------------
-- DATA DUMP
-- -----------------------------------------------------

-- -----------------------------------------------------
-- client
-- -----------------------------------------------------
INSERT INTO `pizzeria`.`client` (`client_id`,`nom`,`cognoms`,`adreça`,`codi_postal`,`localitat`,`provincia`,`telefon`)
VALUES
(1,"Client 1", "cognom client 1", "Carrer 1", "12345", "localitat 1", "provincia 1", "123456789"),
(2,"Client 2", "cognom client 2", "Carrer 2", "12345", "localitat 1", "provincia 1", "789456123"),
(3,"Client 3", "cognom client 3", "Carrer 3", "54321", "localitat 2", "provincia 2", "456789123");

-- -----------------------------------------------------
-- producte_tipus
-- -----------------------------------------------------
INSERT INTO `pizzeria`.`producte_tipus` (`producte_tipus_id`,`tipus`)
VALUES
(1, "Pizza"),
(2, "Hamburguesa"),
(3, "Beguda");

-- -----------------------------------------------------
-- categoria_pizza
-- -----------------------------------------------------
INSERT INTO `pizzeria`.`categoria_pizza` (`categoria_pizza_id`,`nom`)
VALUES
(1, "Amb Carn"),
(2, "Amb Verdures"),
(3, "Sense Gluten"),
(4, "Especials");

-- -----------------------------------------------------
-- producte
-- -----------------------------------------------------
INSERT INTO `pizzeria`.`producte` (`producte_id`,`nom`,`descripcio`,`imatge`,`preu`,`tipus_producte_tipus_id`,`categoria_pizza_categoria_pizza_id`)
VALUES
(1, "Pizza Barbacoa", "pizza amb carn", "imatge 1", "11.90", 1 ,1),
(2, "Pizza Vegetal", "pizza amb verdures", "imatge 2", "11.90", 1, 2),
(3, "Pizza Catalana", "pizza amb molts ingredients", "imatge 3", "13.40", 1, 2),
(4, "Pizza de la Casa", "pizza especial", "imatge 4", "14.90", 1, 4),
(5, "Hamburguesa completa", "amb tot", "imatge 5", "12.90", 2, NULL),
(6, "Hamburguesa trufada", "amb trufa", "imatge 6", "13.90", 2, NULL),
(7, "Aigua", "Ampolla d'aigua", "imatge 7", "1.90", 3, NULL);

-- -----------------------------------------------------
-- botiga
-- -----------------------------------------------------
INSERT INTO `pizzeria`.`botiga` (`botiga_id`,`adreça`,`codi_postal`,`localitat`,`provincia`)
VALUES
(1, "Carrer botiga 1", "12345", "localitat botiga 1", "provincia botiga 1"),
(2, "Carrer botiga 2", "54321", "localitat botiga 2", "provincia botiga 2");

-- -----------------------------------------------------
-- empleat
-- -----------------------------------------------------
INSERT INTO `pizzeria`.`empleat` (`empleat_id`,`nom`,`cognoms`,`NIF`,`telefon`,`tipus`,`botiga_botiga_id`)
VALUES
(1,"Empleat 1", "cognom empleat 1", "12345678A", "123456789", "cuiner/a", 1),
(2,"Empleat 2", "cognom empleat 2", "12345678B", "456789123", "cuiner/a", 2),
(3,"Empleat 3", "cognom empleat 3", "12345678C", "789123456", "repartidor/a", 1),
(4,"Empleat 4", "cognom empleat 4", "12345678D", "789456123", "repartidor/a", 1),
(5,"Empleat 5", "cognom empleat 5", "12345678E", "456123789", "repartidor/a", 2);

-- -----------------------------------------------------
-- comanda
-- -----------------------------------------------------
INSERT INTO `pizzeria`.`comanda` (`comanda_id`,`tipus`,`botiga_botiga_id`,`empleat_empleat_id`,`client_client_id`,`repartidor_empleat_id`,`hora_lliurament`)
VALUES
(1, "recollida", 1, 3, 1, NULL, NULL),
(2, "recollida", 2, 5, 3, NULL, NULL),
(3, "a domicili", 1, 3, 2, 3, '2023-01-27 14:17:17'),
(4, "a domicili", 1, 4, 1, 4, '2023-01-27 21:17:17'),
(5, "a domicili", 1, 3, 2, 3, '2023-01-27 14:17:17'),
(6, "a domicili", 2, 2, 3, 5, '2023-01-27 21:17:17');

-- -----------------------------------------------------
-- comanda_has_producte
-- -----------------------------------------------------
INSERT INTO `pizzeria`.`comanda_has_producte` (`comanda_comanda_id`,`producte_producte_id`,`quantitat`) VALUES
(1,5,1),
(2,5,1),
(3,5,3),
(3,2,1),
(4,7,5),
(5,4,1),
(5,7,1),
(6,3,2),
(6,7,2);
