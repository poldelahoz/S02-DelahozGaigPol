-- TIENDA
-- 1
SELECT nombre FROM producto;
-- 2
SELECT nombre, precio FROM producto;
-- 3
SELECT * FROM producto;
-- 4
SELECT nombre, precio, ROUND(precio*1.08, 2) FROM producto;
-- 5
SELECT nombre AS 'nom de producto', precio AS euro, ROUND(precio*1.08, 2) AS dolar FROM producto;
-- 6
SELECT UPPER(nombre), precio FROM producto;
-- 7
SELECT LOWER(nombre), precio FROM producto;
-- 8
SELECT nombre, CONCAT(UPPER(LEFT(nombre,2)), SUBSTRING(nombre, 3)) FROM fabricante;
-- 9
SELECT nombre, ROUND(precio,0) FROM producto;
-- 10
SELECT nombre, TRUNCATE(precio,0) FROM producto;
-- 11
SELECT codigo_fabricante FROM producto;
-- 12
SELECT distinct(codigo_fabricante) FROM producto;
-- 13
SELECT nombre FROM fabricante ORDER BY nombre ASC;
-- 14
SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- 15
SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;
-- 16
SELECT * FROM fabricante LIMIT 5;
-- 17
SELECT * FROM fabricante LIMIT 3, 2;
-- 18
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
-- 19
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
-- 20
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
-- 21 
SELECT p.nombre AS "Producto", p.precio AS "Precio", f.nombre AS "Fabricante" FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
-- 22
SELECT p.nombre AS "Producto", p.precio AS "Precio", f.nombre AS "Fabricante" FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;
-- 23
SELECT p.codigo AS "Codigo Producto", p.nombre AS "Producto", f.codigo AS "Codigo Fabricante", f.nombre AS "Fabricante" FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
-- 24
SELECT p.nombre AS "Producto", p.precio AS "Precio", f.nombre AS "Fabricante" FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio ASC LIMIT 1;
-- 25
SELECT p.nombre AS "Producto", p.precio AS "Precio", f.nombre AS "Fabricante" FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;
-- 26
SELECT p.codigo, p.nombre, p.precio, f.nombre as "fabricante" FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo";
-- 27
SELECT p.codigo, p.nombre, p.precio, f.nombre as "fabricante" FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Crucial" AND p.precio > 200;
-- 28
SELECT p.codigo, p.nombre, p.precio, f.nombre as "fabricante" FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Asus" OR f.nombre = "Hewlett-Packard" oR f.nombre = "Seagate";
-- 29
SELECT p.codigo, p.nombre, p.precio, f.nombre as "fabricante" FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ("Asus","Hewlett-Packard","Seagate");
-- 30
SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE RIGHT(f.nombre, 1) = "e";
-- 31
SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE "%w%";
-- 32
SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;
-- 33
SELECT f.codigo, f.nombre FROM fabricante f WHERE f.codigo IN (SELECT codigo_fabricante FROM producto);
-- 34
SELECT f.nombre AS "Fabricante", p.nombre AS "Producto" FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante ORDER BY f.nombre;
-- 35
SELECT f.nombre AS "Fabricante" FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.nombre IS NULL ORDER BY f.nombre;
-- 36
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = "Lenovo");
-- 37
SELECT * FROM producto p WHERE p.precio = (SELECT precio FROM producto WHERE codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre = "Lenovo") ORDER BY p.precio DESC LIMIT 1);
-- 38
SELECT p.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo" ORDER BY p.precio DESC LIMIT 1;
-- 39
SELECT p.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Hewlett-Packard" ORDER BY p.precio ASC LIMIT 1;
-- 40
SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= (SELECT p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo" ORDER BY p.precio DESC LIMIT 1);
-- 41
SET @total_price = (select SUM(precio) from producto), @total_products = (select count(*) from producto); SELECT p.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Asus" AND p.precio > (select @total_price / @total_products);

-- QUERIES UNIVERSIDAD
-- 1
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = "alumno" ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
-- 2
SELECT CONCAT(nombre," ",apellido1," ",apellido2) AS "Nom complet" FROM persona WHERE  tipo = "alumno" AND telefono IS NULL;
-- 3
SELECT * FROM persona WHERE tipo = "alumno" AND YEAR(fecha_nacimiento) = "1999";
-- 4
SELECT * FROM persona WHERE tipo = "profesor" AND telefono IS NULL AND RIGHT(nif, 1) = "K";
-- 5
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
-- 6
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS "Departamento" FROM persona p INNER JOIN profesor pr ON pr.id_profesor = p.id INNER JOIN departamento d ON pr.id_departamento = d.id;
-- 7
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM alumno_se_matricula_asignatura aa INNER JOIN asignatura a ON aa.id_asignatura = a.id INNER JOIN persona p ON aa.id_alumno = p.id INNER JOIN curso_escolar ce ON aa.id_curso_escolar = ce.id WHERE p.nif = "26902806M";
-- 8
SELECT distinct(d.nombre) FROM departamento d INNER JOIN profesor p ON p.id_departamento = d.id INNER JOIN asignatura a ON a.id_profesor = p.id_profesor INNER JOIN grado g ON a.id_grado = g.id WHERE g.nombre = "Grado en Ingeniería Informática (Plan 2015)";
-- 9
SELECT * FROM persona p INNER JOIN alumno_se_matricula_asignatura ams ON ams.id_alumno = p.id INNER JOIN curso_escolar ce ON ams.id_curso_escolar = ce.id WHERE anyo_inicio in (2018,2019);

-- UNIVERSIDAD: CONSULTES LEFT JOIN I RIGHT JOIN
-- 1
SELECT d.nombre AS "Departament", p.apellido1, p.apellido2, p.nombre, p.tipo FROM profesor pr RIGHT JOIN  persona p ON p.id = pr.id_profesor RIGHT JOIN departamento d ON pr.id_departamento = d.id WHERE p.tipo = "profesor" ORDER BY d.nombre, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
-- 2
SELECT p.apellido1, p.apellido2, p.nombre, p.tipo, pr.id_departamento FROM profesor pr RIGHT JOIN  persona p ON p.id = pr.id_profesor WHERE p.tipo = "profesor" AND id_departamento IS NULL;
-- 3
SELECT d.nombre FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id WHERE id_departamento IS NULL;
-- 4
SELECT p.apellido1, p.apellido2, p.nombre FROM profesor pr RIGHT JOIN  persona p ON p.id = pr.id_profesor LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor WHERE p.tipo = "profesor" AND a.nombre IS NULL;
-- 5
SELECT a.nombre, a.id_profesor FROM asignatura a LEFT JOIN profesor pr ON a.id_profesor = pr.id_profesor WHERE a.id_profesor IS NULL;
-- 5: sense LEFT/RIGHT JOIN
SELECT a.nombre, a.id_profesor FROM asignatura a WHERE a.id_profesor IS NULL;
-- 6
SELECT distinct(d.nombre) FROM asignatura a LEFT JOIN alumno_se_matricula_asignatura ama ON ama.id_asignatura = a.id LEFT JOIN profesor pr ON a.id_profesor = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE ama.id_curso_escolar IS NULL AND d.nombre IS NOT NULL;

-- UNIVERSIDAD: CONSULTES RESUM
-- 1
SELECT COUNT(*) FROM persona WHERE tipo = "alumno";
-- 2
SELECT COUNT(*) FROM persona WHERE YEAR(fecha_nacimiento) = "1999";
-- 3
SELECT d.nombre, COUNT(pr.id_profesor) AS "Nº profesores" FROM departamento d INNER JOIN profesor pr ON pr.id_departamento = d.id GROUP BY d.nombre ORDER BY COUNT(pr.id_profesor) DESC;
-- 4
SELECT d.nombre, COUNT(pr.id_profesor) AS "Nº profesores" FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id GROUP BY d.nombre ORDER BY COUNT(pr.id_profesor) DESC;
-- 5
SELECT g.nombre, COUNT(a.id) AS "Nº asignaturas" FROM grado g LEFT JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre ORDER BY COUNT(a.id) DESC;
-- 6
SELECT g.nombre, count(g.nombre) AS "Nº asignaturas" FROM grado g INNER JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre HAVING count(g.nombre) > 40;
-- 7
SELECT g.nombre, a.tipo, SUM(a.creditos) AS "Nº Crèdits" FROM grado g INNER JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre, a.tipo;
-- 8
SELECT ce.anyo_inicio, COUNT(ama.id_alumno) AS "Nº alumnos matriculados" FROM alumno_se_matricula_asignatura ama INNER JOIN curso_escolar ce ON ama.id_curso_escolar = ce.id GROUP BY ce.anyo_inicio;
-- 9
SELECT p.id, p.apellido1, p.apellido2, COUNT(a.id) AS "Nº asignaturas" FROM persona p LEFT JOIN asignatura a ON a.id_profesor = p.id WHERE p.tipo = "profesor" GROUP BY p.id ORDER BY COUNT(a.id) DESC;
-- 10
SELECT * FROM persona p WHERE p.tipo = "alumno" ORDER BY p.fecha_nacimiento DESC LIMIT 1;
-- 11
SELECT p.apellido1, p.apellido2, p.nombre FROM profesor pr INNER JOIN  persona p ON p.id = pr.id_profesor LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor WHERE p.tipo = "profesor" AND a.nombre IS NULL;
