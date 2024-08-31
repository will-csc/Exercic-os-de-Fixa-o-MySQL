DROP DATABASE IF EXISTS vendas;
#----------- EXERCÍCIO 1 ----------
CREATE DATABASE vendas;
USE vendas;

#----------- EXERCÍCIO 2 ----------
CREATE TABLE produto(codigo_produto INT PRIMARY KEY,
					 descricao_produto VARCHAR(30),
                     preco_produto FLOAT
					);

#----------- EXERCÍCIO 3 ----------
CREATE TABLE nota_fiscal(numero_nf INT PRIMARY KEY,
						 data_nf DATE,
                         valor_nf FLOAT
                         );

#----------- EXERCÍCIO 4 ----------
CREATE TABLE Itens(produto_codigo_produto INT PRIMARY KEY,
				   nota_fiscal_numero_NF INT,
                   num_item INT,
                   qted_item INT
				   );

#----------- EXERCÍCIO 5 ----------
ALTER TABLE produto MODIFY descricao_produto VARCHAR(50);

#----------- EXERCÍCIO 6 ----------
ALTER TABLE nota_fiscal ADD COLUMN ICMS FLOAT AFTER numero_nf;

#----------- EXERCÍCIO 7 ----------
ALTER TABLE produto ADD COLUMN peso FLOAT;

#----------- EXERCÍCIO 8 ----------
ALTER TABLE itens DROP PRIMARY KEY;
ALTER TABLE itens ADD PRIMARY KEY(num_item);

#----------- EXERCÍCIO 9 ----------
SELECT * FROM produto;

#----------- EXERCÍCIO 10 ----------
SELECT * FROM nota_fiscal;

#----------- EXERCÍCIO 11 ----------
ALTER TABLE nota_fiscal RENAME COLUMN valor_nf TO valortotal_nf;

#----------- EXERCÍCIO 12 ----------
ALTER TABLE nota_fiscal DROP COLUMN data_nf;

#----------- EXERCÍCIO 13 ----------
DROP TABLE Itens;

#----------- EXERCÍCIO 14 ----------
RENAME TABLE nota_fiscal TO venda
