--Base de datos--
CREATE DATABASE biblioteca
--Cambiar a la bd--
\c biblioteca
--Creacion de tablas-- 
CREATE TABLE "Ciudades" (id serial NOT NULL,nombre character varying(15) NOT NULL,PRIMARY KEY (id));
CREATE TABLE "Socios" (rut character varying(15) NOT NULL,id_ciudad integer NOT NULL,nombre character varying(15) NOT NULL,apellido character varying(15) NOT NULL,direccion character varying(15) NOT NULL,telefono integer NOT NULL,FOREIGN KEY(id_ciudad) REFERENCES "Ciudades"(id),PRIMARY KEY (rut));
CREATE TABLE "Libros" (isbn character varying(20) NOT NULL,titulos character varying(25) NOT NULL,num_pag integer NOT NULL,PRIMARY KEY (isbn));
CREATE TABLE "Prestamos" (id serial NOT NULL,rut character varying(15) NOT NULL,isbn character varying(20) NOT NULL,f_prestamo date NOT NULL,f_e_d date NOT NULL,f_r_d date NOT NULL,FOREIGN KEY(rut) REFERENCES "Socios"(rut),FOREIGN KEY(isbn) REFERENCES "Libros"(isbn),PRIMARY KEY (id));
CREATE TABLE "Autores" (cod_autor serial NOT NULL,nombre character varying(15) NOT NULL,apellido character varying(15) NOT NULL,nacimiento integer,muerte integer,PRIMARY KEY (cod_autor));
CREATE TABLE "Rels_lib_aut" (id serial NOT NULL,cod_autor integer NOT NULL,isbn character varying(20) NOT NULL,tipo character varying(15) NOT NULL,FOREIGN KEY(cod_autor) REFERENCES "Autores"(cod_autor),FOREIGN KEY(isbn) REFERENCES "Libros"(isbn),PRIMARY KEY (id));
-- Llenado--
\COPY "Ciudades" (id,nombre) FROM 'C:\Users\AOppen\Documents\GitHub\Trabajo\Curso\sql\biblioteca\assets\csv\ciudades.csv' csv header;
\COPY "Socios" (rut,id_ciudad,nombre,apellido,direccion,telefono) FROM 'C:\Users\AOppen\Documents\GitHub\Trabajo\Curso\sql\biblioteca\assets\csv\socios.csv'  csv header;
\COPY "Libros" (isbn,titulos,num_pag) FROM 'C:\Users\AOppen\Documents\GitHub\Trabajo\Curso\sql\biblioteca\assets\csv\libros.csv'  csv header;
\COPY "Prestamos" (id,rut,isbn,f_prestamo,f_e_d,f_r_d) FROM 'C:\Users\AOppen\Documents\GitHub\Trabajo\Curso\sql\biblioteca\assets\csv\prestamos.csv'  csv header;
\COPY "Autores" (cod_autor,nombre,apellido,nacimiento,muerte) FROM 'C:\Users\AOppen\Documents\GitHub\Trabajo\Curso\sql\biblioteca\assets\csv\autores.csv'  csv header;
\COPY "Rels_lib_aut" (id,cod_autor,isbn,tipo) FROM 'C:\Users\AOppen\Documents\GitHub\Trabajo\Curso\sql\biblioteca\assets\csv\rel.csv'  csv header;
