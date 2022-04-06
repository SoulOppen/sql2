--Cargar el respaldo de la base de datos unidad2.sql--
 psql -U postgres compras < unidad2.sql
--Compra cliente 1--
SELECT id FROM cliente WHERE nombre='usuario01';
SELECT id FROM producto WHERE descripcion='producto9';
SELECT MAX(id) FROM compra;
SELECT MAX(id) FROM detalle_compra;
BEGIN TRANSACTION;
INSERT INTO compra(id,cliente_id,fecha)VALUES (33,1,NOW());
INSERT INTO detalle_compra(id,producto_id,compra_id,cantidad)VALUES (43,9,33,5);
UPDATE producto SET stock=stock-5 WHERE id = 9;
COMMIT;
SELECT stock FROM producto WHERE descripcion='producto9'; 
--Compra cliente 2--
SELECT id FROM cliente WHERE nombre='usuario02';
SELECT id,descripcion,stock FROM producto WHERE descripcion IN('producto1','producto2','producto8');
SELECT MAX(id) FROM compra;
SELECT MAX(id) FROM detalle_compra;
BEGIN TRANSACTION;
--P1--
INSERT INTO compra(id,cliente_id,fecha)VALUES (34,2,NOW());
INSERT INTO detalle_compra(id,producto_id,compra_id,cantidad)VALUES (44,1,34,3);
UPDATE producto SET stock=stock-3 WHERE id = 1;
--P2--
INSERT INTO compra(id,cliente_id,fecha)VALUES (35,2,NOW());
INSERT INTO detalle_compra(id,producto_id,compra_id,cantidad)VALUES (45,2,35,3);
UPDATE producto SET stock=stock-3 WHERE id = 2;
--P8--
INSERT INTO compra(id,cliente_id,fecha)VALUES (36,2,NOW());
INSERT INTO detalle_compra(id,producto_id,compra_id,cantidad)VALUES (46,8,36,3);
UPDATE producto SET stock=stock-3 WHERE id = 8;
COMMIT;
SELECT id,descripcion,stock FROM producto WHERE descripcion IN('producto1','producto2','producto8');
--Consultas-- 
    --Deshabilitar el AUTOCOMMIT--
    \set AUTOCOMMIT OFF
    --Insertar un nuevo cliente--
    INSERT INTO cliente(nombre,email)VALUES ('ari','ar@hotmail.com');
    --Confirmar que fue agregado en la tabla cliente--
    SELECT * FROM cliente;
    --Realizar un ROLLBACK--
    ROLLBACK;
    --Confirmar que se restauró la información, sin considerar la inserción del punto b--
    SELECT * FROM cliente;
    --Habilitar de nuevo el AUTOCOMMIT--
    \set AUTOCOMMIT ON
----
