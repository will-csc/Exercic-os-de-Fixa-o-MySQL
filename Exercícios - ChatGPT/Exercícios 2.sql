/*-------------- INICIO PARA EXECUTAR EXERCÍCIOS ------------------*/
DROP DATABASE IF EXISTS contas_a_receber;
CREATE DATABASE contas_a_receber;
USE contas_a_receber;

CREATE TABLE duplicata(
		nome CHAR(40),
        numero INT PRIMARY KEY, #PK é por padrão NOT NULL
        valor DECIMAL(10,2),
        banco CHAR(15),
        vencimento DATE
);
INSERT INTO duplicata(nome,numero,valor,banco,vencimento) VALUES
('ABC PAPELARIA',100100,5000,'ITAU','2017-01-20'),
('LIVRARIA FERNANDES',100110,2500,'ITAU','2017-01-22'),
('LIVRARIA FERNANDES',100120,1500,'BRADESCO','2016-10-15'),
('ABC PAPELARIA',100130,8000,'SANTANDER','2016-10-15'),
('LER E SABER',200120,10500,'BANCODOBRASIL','2018-04-26'),
('LIVRO SECIA',200125,2000,'BANCODOBRASIL','2018-04-26'),
('LER E SABER',200130,11000,'ITAU','2018-09-26'),
('PAPELARIA SILVA',250350,1500,'BRADESCO','2018-01-26'),
('LIVROS MM',250360,500,'SANTANDER','2018-12-18'),
('LIVROS MM',250370,3400,'SANTANDER','2018-04-26'),
('PAPELARIA SILVA',250380,3500,'BANCODOBRASIL','2018-04-26'),
('LIVROS E CIA',453360,1500,'ITAU','2018-06-15'),
('LIVROS MM',453365,5400,'BRADESCO','2018-06-15'),
('PAPELARIA SILVA',453370,2350,'ITAU','2017-12-27'),
('LIVROS E CIA',453380,1550,'BANCODOBRASIL','2017-12-27'),
('ABC PAPELARIA',980130,4000,'ITAU','2016-11-12'),
('LIVRARIA FERNANDES',770710,2500,'SANTANDER','2016-11-15'),
('ABC PAPELARIA',985001,3000,'ITAU','2016-11-09'),
('PAPEL E AFINS',985002,2500,'SANTANDER','2016-12-03'),
('LER E SABER',888132,2500,'ITAU','2017-05-03');

/*----------- EXERCÍCIO 1 -------------*/
UPDATE duplicata SET valor = 6000 WHERE numero = 100100;

/*----------- EXERCÍCIO 2 -------------*/
UPDATE duplicata SET banco = "ITAU" WHERE numero = 200125;

/*----------- EXERCÍCIO 3 -------------*/
UPDATE duplicata SET vencimento = "2018-05-01" WHERE numero = 250370;

/*----------- EXERCÍCIO 4 -------------*/
DELETE FROM duplicata WHERE numero = 100120;

/*----------- EXERCÍCIO 5 -------------*/
DELETE FROM duplicata WHERE banco = "BRADESCO";

/*----------- EXERCÍCIO 6 -------------*/
DELETE FROM duplicata WHERE vencimento < "2017-01-01";

/*----------- EXERCÍCIO 7 -------------*/
SELECT nome,valor FROM duplicata;

/*----------- EXERCÍCIO 8 -------------*/
SELECT numero,vencimento FROM duplicata;

/*----------- EXERCÍCIO 9 -------------*/
SELECT numero,vencimento FROM duplicata WHERE valor > 2000;

/*----------- EXERCÍCIO 10 -------------*/
SELECT numero,valor,banco FROM duplicata WHERE valor < 3000;

/*----------- EXERCÍCIO 11 -------------*/
SELECT * FROM duplicata WHERE banco = "ITAU";

/*----------- EXERCÍCIO 12 -------------*/
SELECT * FROM duplicata WHERE vencimento > "2018-01-01";

/*----------- EXERCÍCIO 13 -------------*/
SELECT * FROM duplicata WHERE valor BETWEEN 2000 AND 5000;

/*----------- EXERCÍCIO 14 -------------*/
SELECT * FROM duplicata WHERE valor BETWEEN 2000 AND 5000;

/*----------- EXERCÍCIO 15 -------------*/
SELECT * FROM duplicata LIMIT 5;

/*----------- EXERCÍCIO 16 -------------*/
SELECT * FROM duplicata ORDER BY valor ASC LIMIT 3;

/*----------- EXERCÍCIO 17 -------------*/
SELECT * FROM duplicata WHERE vencimento = "2018-04-26";

/*----------- EXERCÍCIO 18 -------------*/
SELECT * FROM duplicata WHERE vencimento = "2018-04-26" LIMIT 2;

/*----------- EXERCÍCIO 19 -------------*/
SELECT DISTINCT banco FROM duplicata;

/*----------- EXERCÍCIO 20 -------------*/
SELECT DISTINCT valor FROM duplicata;

/*----------- EXERCÍCIO 21 -------------*/
SELECT DISTINCT vencimento FROM duplicata;

/*----------- EXERCÍCIO 22 -------------*/
SELECT * FROM duplicata WHERE nome = "LIVROS MM";

/*----------- EXERCÍCIO 23 -------------*/
SELECT * FROM duplicata WHERE vencimento = "2017-12-27";

/*----------- EXERCÍCIO 24 -------------*/
SELECT * FROM duplicata WHERE valor > 
(SELECT AVG(valor) FROM duplicata);

/*----------- EXERCÍCIO 25 -------------*/
SELECT banco FROM duplicata WHERE valor > 5000;

/*----------- EXERCÍCIO 26 -------------*/
SELECT * FROM duplicata WHERE VALOR > 
(SELECT valor FROM duplicata WHERE numero = 100100);

/*----------- EXERCÍCIO 27 -------------*/
SELECT * FROM duplicata WHERE VALOR > 
(SELECT valor FROM duplicata WHERE numero = 100100);

/*----------- EXERCÍCIO 28 -------------*/
SELECT * FROM duplicata ORDER BY valor DESC;

/*----------- EXERCÍCIO 29 -------------*/
SELECT * FROM duplicata ORDER BY vencimento ASC;

/*----------- EXERCÍCIO 29 -------------*/
SELECT * FROM duplicata ORDER BY nome ASC;

/*----------- EXERCÍCIO 30 -------------*/
SELECT COUNT(banco) AS "Quantidade","ITAU" AS "Banco" 
FROM duplicata WHERE banco = "ITAU";

/*----------- EXERCÍCIO 31 -------------*/
SELECT SUM(valor) AS "Total" FROM duplicata;

/*----------- EXERCÍCIO 32 -------------*/
SELECT ROUND(AVG(valor),2) AS "Media" FROM duplicata;

/*----------- EXERCÍCIO 33 -------------*/
SELECT MAX(valor) AS "Maior Valor" FROM duplicata;

/*----------- EXERCÍCIO 34 -------------*/
SELECT MIN(valor) AS "Menor Valor" FROM duplicata;

/*----------- EXERCÍCIO 35 -------------*/
SELECT SUM(valor) AS "Total" FROM duplicata;

/*----------- EXERCÍCIO 36 -------------*/
SELECT banco,SUM(valor) AS "Total" FROM duplicata
GROUP BY banco;

/*----------- EXERCÍCIO 36 -------------*/
SELECT nome,ROUND(AVG(valor),2) AS "Total" FROM duplicata
GROUP BY nome;

/*----------- EXERCÍCIO 37 -------------*/
SELECT COUNT(vencimento) AS "Total",vencimento FROM duplicata 
GROUP BY vencimento ORDER BY Total DESC;

/*----------- EXERCÍCIO 37 -------------*/
SELECT banco,SUM(valor) AS "Total" FROM duplicata
GROUP BY banco HAVING Total > 10000;

/*----------- EXERCÍCIO 38 -------------*/
SELECT nome,COUNT(numero) AS "Total_Duplicatas" FROM duplicata
GROUP BY nome HAVING Total_Duplicatas > 2;

/*----------- EXERCÍCIO 39 -------------*/
SELECT vencimento,COUNT(numero) AS "Total_Duplicatas" FROM duplicata
GROUP BY vencimento HAVING Total_Duplicatas > 3;

/*----------- EXERCÍCIO 40 -------------*/
CREATE VIEW v_duplas_itau AS
SELECT numero FROM duplicata WHERE banco = "ITAU";

/*----------- EXERCÍCIO 41 -------------*/
CREATE VIEW v_duplicatas_acima_5000 AS
SELECT * FROM duplicata WHERE valor > 5000;

/*----------- EXERCÍCIO 42 -------------*/
CREATE VIEW v_duplicatas_vencidas_2018 AS
SELECT * FROM duplicata WHERE YEAR(vencimento) = 2018;

/*----------- EXERCÍCIO 43 -------------*/
ALTER VIEW v_duplas_itau AS
SELECT numero,vencimento FROM duplicata WHERE banco = "ITAU";

/*----------- EXERCÍCIO 44 -------------*/
ALTER VIEW v_duplicatas_acima_5000 AS
SELECT * FROM duplicata WHERE YEAR(vencimento) = 2018;

/*----------- EXERCÍCIO 45 -------------*/
ALTER VIEW v_duplicatas_vencidas_2018 AS
SELECT * FROM duplicata WHERE YEAR(vencimento) IN (2018,2019);

/*----------- EXERCÍCIO 46 -------------*/
DROP VIEW IF EXISTS v_duplas_itau;

/*----------- EXERCÍCIO 46 -------------*/
DROP VIEW IF EXISTS v_duplicatas_acima_5000;

/*----------- EXERCÍCIO 46 -------------*/
DROP VIEW IF EXISTS v_duplicatas_vencidas_2018;









