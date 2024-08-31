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

/*------------- EXERCÍCIO 1 ---------------*/
SELECT nome,vencimento,valor FROM duplicata;

/*------------- EXERCÍCIO 2 ---------------*/
SELECT numero FROM duplicata WHERE banco = "ITAU";

/*------------- EXERCÍCIO 3 ---------------*/
SELECT COUNT(banco) FROM duplicata WHERE banco = "ITAU";

/*------------- EXERCÍCIO 4 ---------------*/
SELECT numero,vencimento,valor,nome FROM duplicata
WHERE YEAR(vencimento) = "2017";

/*------------- EXERCÍCIO 5 ---------------*/
SELECT numero,vencimento,valor,nome FROM duplicata
WHERE banco <> "ITAU" AND banco <> "SANTANDER";

/*------------- EXERCÍCIO 6 ---------------*/
SET @cliente = "PAPELARIA SILVA";
SELECT numero,valor FROM duplicata WHERE nome = @cliente
UNION ALL
SELECT "TOTAL" AS numero, SUM(valor) AS valor FROM duplicata
WHERE nome = @cliente;

/*------------- EXERCÍCIO 7 ---------------*/
DELETE FROM duplicata WHERE numero = 770710;

/*------------- EXERCÍCIO 8 ---------------*/
SELECT * FROM duplicata ORDER BY nome;

/*------------- EXERCÍCIO 9 ---------------*/
SELECT nome,banco,valor,vencimento FROM duplicata ORDER BY vencimento;

/*------------- EXERCÍCIO 10 ---------------*/
UPDATE duplicata SET banco = "SANTANDER" WHERE banco = "BANCO DO BRASIL";

/*------------- EXERCÍCIO 11 ---------------*/
SELECT nome,banco FROM duplicata WHERE banco = "BRADESCO";

/*------------- EXERCÍCIO 12 ---------------*/
SELECT numero,nome,valor,vencimento FROM duplicata 
WHERE vencimento BETWEEN "2016-01-01" AND "2016-12-31"
UNION ALL
SELECT "Total" AS numero,NULL,SUM(valor),NULL FROM duplicata 
WHERE vencimento BETWEEN "2016-01-01" AND "2016-12-31";

/*------------- EXERCÍCIO 13 ---------------*/
SELECT numero,nome,valor,vencimento FROM duplicata 
WHERE vencimento BETWEEN "2016-08-01" AND "2016-08-30"
UNION ALL
SELECT "Total" AS numero,NULL,SUM(valor),NULL FROM duplicata 
WHERE vencimento BETWEEN "2016-08-01" AND "2016-08-30";

/*------------- EXERCÍCIO 14 ---------------*/
#Não tem item
SELECT numero,nome FROM duplicata WHERE nome = "ABC PAPELARIA";

/*------------- EXERCÍCIO 15 ---------------*/
UPDATE duplicata SET valor = valor * 1.15
WHERE vencimento BETWEEN "2016-08-01" AND "2016-08-30";

/*------------- EXERCÍCIO 16 ---------------*/
UPDATE duplicata SET valor = valor * 1.05 
WHERE vencimento BETWEEN "2017-01-01" AND "2017-05-31";

/*------------- EXERCÍCIO 17 ---------------*/
SELECT ROUND(AVG(valor),2) AS "Média", "2016" AS "Ano"
FROM duplicata WHERE YEAR(vencimento) = "2016";

/*------------- EXERCÍCIO 18 ---------------*/
SELECT numero,nome FROM duplicata WHERE valor > 10000;

/*------------- EXERCÍCIO 19 ---------------*/
SELECT SUM(valor) AS "Total","Santander" AS "Banco"
FROM duplicata WHERE banco = "SANTANDER";

/*------------- EXERCÍCIO 20 ---------------*/
SELECT nome FROM duplicata WHERE banco = "BRADESCO" OR banco = "ITAU"

