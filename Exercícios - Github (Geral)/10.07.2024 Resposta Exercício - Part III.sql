/* ----------BANCO NECESSÁRIO PARA RESOLVER OS EXERCÍCIOS -----------------*/
DROP DATABASE IF EXISTS Longa_vida;
CREATE DATABASE IF NOT EXISTS Longa_vida;
USE Longa_vida;

CREATE TABLE plano(
	Numero CHAR(2) NOT NULL PRIMARY KEY,
    Descrição CHAR(30),
    Valor DECIMAL(10,2)
);
INSERT INTO plano(Numero,Descrição,Valor)
VALUES
("B1","Básico 1",200),
("B2","Básico 2",150),
("B3","Básico 3",100),
("E1","Executivo 1",350),
("E2","Executivo 2",300),
("E3","Executivo 3",250),
("M1","Master 1",500),
("M2","Master 2",450),
("M3","Master 3",400);

CREATE TABLE associado(
	Plano CHAR(2) NOT NULL,
    Nome CHAR(40) NOT NULL PRIMARY KEY,
    Endereço CHAR(35),
    Cidade CHAR(20),
    Estado CHAR(2),
    CEP CHAR(9)
);
INSERT INTO associado(Plano,Nome,Endereço,Cidade,Estado,CEP)
VALUES
('B1','JOSE ANTONIO DA SILVA','R. FELIPE DO AMARAL, 3450','COTIA','SP','06700-000'),
('B1','MARIA DA SILVA SOBRINHO','R. FELIPE DE JESUS, 1245','DIADEMA','SP','09960-170'),
('B1','PEDRO JOSE DE OLIVEIRA','R. AGRIPINO DIAS, 155','COTIA','SP','06700-011'),
('B2','ANTONIA DE FERNANDES','R. PEZEQUIEL, 567','DIADEMA','SP','09960-175'),
('B2','ANTONIO DO PRADO','R. INDIO TABAJARA, 55','GUARULHOS','SP','07132-999'),
('B3','WILSON DE SENA','R. ARAPIRACA, 1234','OSASCO','SP','06293-001'),
('B3','SILVIA DE ABREU','R. DR. JOAO DA SILVA, 5','SANTO ANDRE','SP','09172-112'),
('E1','ODETE DA CONCEIÇÃO','R. VOLUNTARIOS DA PATRIA, 10','SÃO PAULO','SP','02010-550'),
('E2','JOAO CARLOS MACEDO','R. VISTA ALEGRE 500','SÃO PAULO','SP','04343-990'),
('E3','CONCEIÇÃO DA SILVA','AV. VITORIO DO AMPARO, 11','MAUA','SP','09312-988'),
('E3','PAULO BRUNO AMARAL','R. ARGENZIO BRILHANTE, 88','BARUERI','SP','06460-999'),
('E3','WALDENICE DE OLIVEIRA','R. OURO VELHO, 12','BARUERI','SP','06460-998'),
('E3','MARCOS DO AMARAL','R. DO OUVIDOR, 67','GUARULHOS','SP','07031-555'),
('M1','MURILO DE SANTANA','R. PRATA DA CASA','BARUERI','SP','06455-111'),
('M1','LUIZA ONOFRE FREITAS','R. VICENTE DE ABREU, 55','SANTO ANDRE','SP','09060-667'),
('M2','MELISSA DE ALMEIDA','R. FERNANDO ANTONIO, 2345','SÃO PAULO','SP','04842-987'),
('M2','JOAO INACIO DA CONCEICAO','R. PENELOPE CHARMOSA, 34','SUZANO','SP','08670-888'),
('B3','AUGUSTA DE ABREU','AV. RIO DA SERRA, 909','SANTO ANDRE','SP','09061-333'),
('M3','ILDA DE MELO DA CUNHA','AV. POR DO SOL, 546','SANTO ANDRE','SP','09199-444'),
('M3','MARCOS DA CUNHA','AV. PEDROSO DE MORAES','SÃO PAULO','SP','04040-444');

/*----------------- EXERCÍCIO 1 ---------------------*/
#Campos "Plano" e "Numero"
ALTER TABLE associado ADD CONSTRAINT fk_plano 
FOREIGN KEY(Plano) REFERENCES plano(Numero);

/*----------------- EXERCÍCIO 2 ---------------------*/
SELECT associado.plano AS "Codigo do Plano",associado.nome,plano.Descrição AS "Plano",plano.Valor
FROM associado INNER JOIN plano 
ON associado.plano = plano.numero;

/*----------------- EXERCÍCIO 3 ---------------------*/
SELECT "B1" AS "Plano",COUNT(nome) AS "Total"
FROM associado WHERE plano = "B1";

/*----------------- EXERCÍCIO 4 ---------------------*/
SELECT associado.nome,associado.plano,plano.valor FROM associado
INNER JOIN plano ON plano.numero = associado.plano;

/*----------------- EXERCÍCIO 5 ---------------------*/
SELECT nome,cidade FROM associado WHERE cidade = "COTIA" OR cidade = "DIADEMA";

/*----------------- EXERCÍCIO 6 ---------------------*/
SELECT associado.nome,associado.plano,plano.valor FROM associado
INNER JOIN plano ON plano.numero = associado.plano 
AND (associado.cidade = "BARUERI" OR associado.plano =  "M1");

/*----------------- EXERCÍCIO 7 ---------------------*/
SELECT associado.nome,associado.plano,plano.valor FROM associado
INNER JOIN plano ON plano.numero = associado.plano AND associado.cidade = "SÃO PAULO";
 
/*----------------- EXERCÍCIO 8 ---------------------*/
SELECT * FROM associado WHERE nome LIKE "%SILVA%";

/*----------------- EXERCÍCIO 9 ---------------------*/
UPDATE plano SET valor = valor * 1.10 WHERE numero LIKE "%B%";
UPDATE plano SET valor = valor * 1.05 WHERE numero LIKE "%E%";
UPDATE plano SET valor = valor * 1.03 WHERE numero LIKE "%M%";
#Prova Final
SELECT * FROM plano;

/*----------------- EXERCÍCIO 10 ---------------------*/
UPDATE associado SET plano = "E3" WHERE nome = "PEDRO JOSE DE OLIVEIRA";
#Prova Final
SELECT * FROM associado;

/*----------------- EXERCÍCIO 11 ---------------------*/
SELECT COUNT(plano) AS "Total", "E3" AS "Plano" FROM associado
WHERE plano = "E3";

/*----------------- EXERCÍCIO 12 ---------------------*/
SELECT associado.nome, plano.valor FROM associado
INNER JOIN plano ON plano.numero = associado.plano 
AND associado.plano LIKE "%1%";

/*----------------- EXERCÍCIO 13 ---------------------*/
SELECT nome,plano FROM associado WHERE plano LIKE "%E%";

/*----------------- EXERCÍCIO 14 ---------------------*/
SELECT nome,plano FROM associado WHERE plano LIKE "%B%" OR plano LIKE "%M%";

/*----------------- EXERCÍCIO 15 ---------------------*/
DELETE FROM associado WHERE cidade = "SANTO ANDRE";

/*----------------- EXERCÍCIO 16 ---------------------*/
SELECT associado.nome,associado.plano,plano.valor FROM associado 
INNER JOIN plano ON associado.plano = plano.numero AND
associado.cidade = "SÃO PAULO" ORDER BY associado.nome;

/*----------------- EXERCÍCIO 17 ---------------------*/
SELECT * FROM associado ORDER BY plano;

/*----------------- EXERCÍCIO 18 ---------------------*/
SELECT nome,plano FROM associado ORDER BY plano ASC,nome DESC;

/*----------------- EXERCÍCIO 19 ---------------------*/
SELECT nome,plano FROM associado WHERE plano NOT LIKE "%M%";

/*----------------- EXERCÍCIO 20 ---------------------*/
SELECT associado.nome,plano.Descrição FROM associado INNER JOIN plano
ON plano.numero = associado.plano ORDER BY associado.nome DESC;
 
/*----------------- EXERCÍCIO 21 ---------------------*/
SELECT numero,descrição,valor FROM plano WHERE valor BETWEEN 300 AND 500;

/*----------------- EXERCÍCIO 22 ---------------------*/
SELECT associado.nome,associado.plano,plano.descrição,plano.valor FROM associado 
INNER JOIN plano ON plano.numero = associado.plano AND
nome LIKE "%AMARAL%";

/*----------------- EXERCÍCIO 23 ---------------------*/
SELECT nome,cidade FROM associado WHERE cidade = "DIADEMA";

/*----------------- EXERCÍCIO 24 ---------------------*/
UPDATE plano SET valor = valor * 1.06 WHERE numero REGEXP'[1-3]' AND
numero LIKE "%M%";

/*----------------- EXERCÍCIO 25 ---------------------*/
SELECT nome,cep FROM associado WHERE cep LIKE "09%";


