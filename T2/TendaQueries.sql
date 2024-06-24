
--1
SELECT nombre FROM producto;
--2
SELECT nombre, precio FROM producto;
--3
SELECT * FROM producto;
--4
SELECT nombre, precio AS precio_euros, precio * 1.10 AS precio_usd FROM producto;
--5
SELECT nombre AS nombreproducto, precio AS euros, precio * 1.10 AS dolars FROM producto;
--6
SELECT UPPER(nombre), precio FROM producto;
--7
SELECT LOWER(nombre), precio FROM producto;
--8
SELECT nombre, UPPER(LEFT(nombre, 2)) AS dos_majuscules FROM fabricante;
--9
SELECT nombre, ROUND(precio) AS arrodonit FROM producto;
--10
SELECT nombre, TRUNCATE(precio,0) AS truncat FROM producto;
--11
SELECT codigo_fabricante FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante;;
--12
SELECT DISTINCT codigo_fabricante FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante;;
--13
SELECT nombre FROM fabricante ORDER BY nombre;
--14
SELECT nombre FROM fabricante ORDER BY nombre DESC;
--15
SELECT nombre, precio FROM producto  ORDER BY nombre ASC, precio DESC;
--16
SELECT * FROM fabricante LIMIT 5;
--17
SELECT * FROM fabricante LIMIT 3,2;
--18
SELECT nombre, precio ORDER BY precio LIMIT 1;
--19
SELECT nombre, precio ORDER BY precio DESC LIMIT 1;
--20
SELECT nombre FROM producto WHERE codigo_fabricante = 2;






