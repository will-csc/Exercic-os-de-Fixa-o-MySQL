/*--------- DADOS NECESSARIOS PARA AS QUESTÕES -------------*/
DROP DATABASE IF EXISTS william;
CREATE DATABASE IF NOT EXISTS william;
USE william;
CREATE TABLE tbl_pessoas(id_pessoa INT PRIMARY KEY AUTO_INCREMENT, 
						 nome_pessoa VARCHAR(100), 
                         nasc_pessoa DATE, 
                         depto_pessoa INT);
CREATE TABLE tbL_deptos(id_depto INT PRIMARY KEY AUTO_INCREMENT, 
						nome_depto VARCHAR(100), 
						gestor_depto VARCHAR(100));

ALTER TABLE tbl_pessoas ADD CONSTRAINT fk_depto FOREIGN KEY(depto_pessoa) REFERENCES tbL_deptos(id_depto);

INSERT INTO tbL_deptos(nome_depto,gestor_depto) VALUES 
("Produtos","Matheus Melo"), 
("T.I.","Adriana Carvalho"), 
("Inovação","Isaac Ferreira"), 
("R.H","Michaela Vicare"), 
("Operações","Denise Senise");

INSERT INTO tbl_pessoas(nome_pessoa,nasc_pessoa,depto_pessoa) VALUES 
("Gabriel Moura","2008-08-15",1), 
("Guilherme Faria","1986-12-19",3), 
("Kelly Silva","1977-01-30",5), 
("Andrea Paiva","1980-09-07",4), 
("Ariele Santos","2003-03-03",2);

/*------------ EXERCÍCIO 1 -----------
ALTER TABLE tbl_pessoas ADD COLUMN email VARCHAR(100);

/*------------ EXERCÍCIO 2 ----------
UPDATE tbl_deptos SET gestor_depto = "Carlos Souza" WHERE nome_depto = "Inovação";

/*------------ EXERCÍCIO 3 -----------
UPDATE tbl_pessoas SET nome_pessoa = "Kelly Santos" WHERE nome_pessoa = "Kelly Silva";

/*------------ EXERCÍCIO 4 -----------
DELETE FROM tbl_pessoas WHERE nome_pessoa = "Andrea Paiva";

/*------------ EXERCÍCIO 5 -----------
SELECT nome_pessoa,nasc_pessoa FROM tbl_pessoas WHERE depto_pessoa =
(SELECT id_depto FROM tbl_deptos WHERE nome_depto = "Operações");

/*------------ EXERCÍCIO 6 -----------
INSERT INTO tbl_deptos(nome_depto,gestor_depto) VALUES
("Marketing","Paula Lima");

/*------------ EXERCÍCIO 7 -----------
UPDATE tbl_pessoas SET nasc_pessoa = "2002-03-03" 
WHERE nome_pessoa = "Ariele Santos";

/*------------ EXERCÍCIO 8 -----------
SELECT gestor_depto,nome_depto FROM tbl_deptos;

/*------------ EXERCÍCIO 9 -----------
INSERT INTO tbl_pessoas(nome_pessoa,nasc_pessoa,depto_pessoa) VALUES
("Lucas Pereira","1995-05-20",2);

/*------------ EXERCÍCIO 10 -----------
ALTER TABLE tbl_pessoas MODIFY COLUMN nasc_pessoa DATETIME

/*------------ EXERCÍCIO 11 -----------
ALTER TABLE tbl_pessoas ADD COLUMN email VARCHAR(100);

/*------------ EXERCÍCIO 12 -----------
ALTER TABLE tbl_pessoas MODIFY nasc_pessoa DATETIME;

/*------------ EXERCÍCIO 13 -----------
ALTER TABLE tbl_pessoas RENAME COLUMN nome_pessoa TO full_name;

/*------------ EXERCÍCIO 14 -----------
ALTER TABLE tbl_pessoas DROP COLUMN email;

/*------------ EXERCÍCIO 15 -----------
RENAME TABLE tbl_pessoas TO people;

/*------------ EXERCÍCIO 16 -----------
RENAME TABLE tbl_deptos TO departments;

/*------------ EXERCÍCIO 17 -----------
RENAME TABLE people TO tbl_pessoas;

/*------------ EXERCÍCIO 18 -----------
RENAME TABLE departments TO tbl_deptos;

/*------------ EXERCÍCIO 19 -----------
ALTER TABLE tbl_deptos ADD CONSTRAINT depto_unique UNIQUE(nome_depto);

/*------------ EXERCÍCIO 20 -----------
ALTER TABLE tbl_pessoas ADD CONSTRAINT chk_nasc
CHECK (nasc_pessoa<"2024-07-28");

/*------------ EXERCÍCIO 21 -----------
ALTER TABLE tbl_pessoas DROP CONSTRAINT chk_nasc;

/*------------ EXERCÍCIO 22 -----------
ALTER TABLE tbl_deptos ALTER gestor_depto SET DEFAULT "N/A";

/*------------ EXERCÍCIO 23 -----------
UPDATE tbl_deptos SET gestor_depto = "Carlos Souza" 
WHERE nome_depto = "T.I";

/*------------ EXERCÍCIO 24 -----------
ALTER TABLE tbl_pessoas ADD COLUMN idade_pessoa INT;
UPDATE tbl_pessoas SET idade_pessoa = YEAR(CURDATE()) - YEAR(nasc_pessoa);
ALTER TABLE tbl_pessoas DROP COLUMN nasc_pessoa;
	
/*------------ EXERCÍCIO 25 -----------
UPDATE tbl_pessoas SET depto_pessoa = 2 WHERE full_name = "Gabriel Moura";

/*------------ EXERCÍCIO 26 -----------
UPDATE tbl_deptos SET gestor_depto = "Desconhecido";

/*------------ EXERCÍCIO 27 -----------
DELETE FROM tbl_pessoas WHERE depto_pessoa =
(SELECT id_depto FROM tbl_deptos WHERE nome_depto = "R.H");

/*------------ EXERCÍCIO 28 -----------
DELETE FROM tbl_pessoas WHERE depto_pessoa IN
(SELECT id_depto FROM tbl_deptos WHERE nome_depto LIKE "Inovação");

/*------------ EXERCÍCIO 29 -----------
DELETE FROM tbl_pessoas WHERE id_pessoa = 3;

/*------------ EXERCÍCIO 30 -----------
DELETE FROM tbl_pessoas WHERE idade_pessoa = (YEAR(NOW()) - 2000);

/*------------ EXERCÍCIO 31	-----------*/
SELECT * FROM tbl_pessoas;

/*------------ EXERCÍCIO 32	-----------*/
SELECT * FROM tbl_deptos;

/*------------ EXERCÍCIO 33	-----------*/
SELECT nome_pessoa, nasc_pessoa FROM tbl_pessoas;

/*------------ EXERCÍCIO 34	-----------*/
SELECT nome_pessoa FROM tbl_pessoas;
ALTER TABLE tbl_pessoas RENAME COLUMN nome_pessoa TO Nome;

/*------------ EXERCÍCIO 35	-----------*/
SELECT * FROM  tbl_deptos WHERE id_depto = 1;

/*------------ EXERCÍCIO 36	-----------*/
SELECT * FROM  tbl_pessoas LIMIT 3;

/*------------ EXERCÍCIO 37	-----------*/
SELECT DISTINCT id_depto FROM tbl_deptos;

/*------------ EXERCÍCIO 38	-----------*/
SELECT * FROM tbl_pessoas WHERE YEAR(nasc_pessoa) = 1986;

/*------------ EXERCÍCIO 39	-----------*/
SELECT nome FROM tbl_pessoas WHERE depto_pessoa = 
(SELECT depto_pessoa FROM tbl_pessoas WHERE nome = "Gabriel Moura");

/*------------ EXERCÍCIO 40	-----------*/
SELECT * FROM tbl_pessoas ORDER BY nasc_pessoa DESC;

/*------------ EXERCÍCIO 41	-----------*/
SELECT nome FROM tbl_pessoas;
ALTER TABLE tbl_pessoas RENAME COLUMN nome TO Employee_Name;

/*------------ EXERCÍCIO 42	-----------*/
SELECT * FROM tbl_pessoas WHERE depto_pessoa <> 2






