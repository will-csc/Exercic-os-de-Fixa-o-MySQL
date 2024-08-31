/*--------------- DADOS NECESSÁRIOS PARA RESOLUÇÃO DOS EXERCÍCIOS ---------------*/
DROP DATABASE IF EXISTS escola;
CREATE DATABASE IF NOT EXISTS escola;
USE escola;

CREATE TABLE IF NOT EXISTS alunos(ra INT PRIMARY KEY 
								 ,nome VARCHAR(50)
                                 ,nascimento DATE);
                                 
CREATE TABLE IF NOT EXISTS cursos(codigo INT PRIMARY KEY AUTO_INCREMENT
								 ,nome VARCHAR(50)
                                 ,ch INT
                                 ,inicio DATE
                                 ,termino DATE);

CREATE TABLE IF NOT EXISTS matricula(curso INT 
								 ,ra INT
                                 ,data_ DATE
                                 ,valor DECIMAL(10,2));
                                 
ALTER TABLE matricula ADD CONSTRAINT curso_fk FOREIGN KEY(curso) REFERENCES cursos(codigo);
ALTER TABLE matricula ADD CONSTRAINT ra_fk FOREIGN KEY(ra) REFERENCES alunos(ra);

INSERT INTO alunos VALUES
(123456,"Ana","1972-01-10"),
(123457,"Bianca","1973-02-11"),
(123458,"Carla","1987-12-12"),
(123459,"Danilo","1990-10-02"),
(123460,"Eliana","1987-01-01");

INSERT INTO cursos(nome,ch,inicio,termino) VALUES
("java",360,"2007-12-01","2008-10-10"),
("auto cad",60,"2008-01-10","2008-05-10"),
("php",90,"2008-02-15","2008-07-10"),
("redes",60,"2008-01-20","2008-03-20");

INSERT INTO matricula VALUES
(1,123456,"2007-09-10",100.00),
(3,123456,"2007-10-01",60.00),
(1,123457,"2007-09-01",100.00),
(2,123458,"2008-01-11",50.00),
(2,123459,"2007-07-20",50.00),
(1,123460,"2007-08-10",80.00);

/*------------ RESPOSTA EXERCÍCIO 1 --------------*/
SELECT alunos.ra,alunos.nome,cursos.nome FROM matricula 
INNER JOIN cursos ON matricula.curso = cursos.codigo
INNER JOIN alunos ON matricula.ra = alunos.ra;

/*------------ RESPOSTA EXERCÍCIO 2 --------------*/
SELECT alunos.ra,alunos.nome,cursos.nome FROM matricula 
INNER JOIN cursos ON matricula.curso = cursos.codigo
INNER JOIN alunos ON matricula.ra = alunos.ra
ORDER BY cursos.nome;

/*------------ RESPOSTA EXERCÍCIO 3 --------------*/
SELECT cursos.nome,COUNT(matricula.curso) AS "Total Matriculados" FROM matricula
INNER JOIN cursos ON matricula.curso = cursos.codigo
GROUP BY cursos.nome;

/*------------ RESPOSTA EXERCÍCIO 4 --------------*/
SELECT cursos.nome,COUNT(matricula.curso) AS "Total Matriculados" FROM matricula
RIGHT JOIN cursos ON matricula.curso = cursos.codigo
GROUP BY cursos.nome;

/*------------ RESPOSTA EXERCÍCIO 5 --------------*/
SELECT cursos.nome,SUM(matricula.valor) AS "Valor total Recebido" FROM cursos
INNER JOIN matricula ON matricula.curso = cursos.codigo
GROUP BY cursos.nome;

/*------------ RESPOSTA EXERCÍCIO 6 --------------*/
SELECT cursos.nome,SUM(matricula.valor) AS "Valor total Recebido" FROM cursos
INNER JOIN matricula ON matricula.curso = cursos.codigo
GROUP BY cursos.nome WITH ROLLUP;

/*------------ RESPOSTA EXERCÍCIO 7 --------------*/
SELECT ROUND(AVG(matricula.valor),2) AS "Valor médio" FROM matricula;

/*------------ RESPOSTA EXERCÍCIO 8 --------------*/
SELECT cursos.nome,ROUND(AVG(matricula.valor),2) AS "Valor médio" FROM cursos
INNER JOIN matricula ON matricula.curso = cursos.codigo
GROUP BY cursos.nome;

/*------------ RESPOSTA EXERCÍCIO 9 --------------*/
SELECT cursos.nome,COUNT(matricula.curso) AS "Total Matriculados" FROM matricula
RIGHT JOIN cursos ON matricula.curso = cursos.codigo
GROUP BY cursos.nome HAVING COUNT(matricula.curso) > 1;

/*------------ RESPOSTA EXERCÍCIO 10 --------------*/
SELECT cursos.nome FROM cursos WHERE ch = 
(SELECT ch FROM cursos WHERE nome = "auto cad");

/*------------ RESPOSTA EXERCÍCIO 11 --------------*/
SELECT alunos.nome FROM alunos WHERE MONTH(nascimento) = 
(SELECT MONTH(nascimento) FROM alunos WHERE nome = "Ana");

/*------------ RESPOSTA EXERCÍCIO 12 --------------*/
SELECT DISTINCT cursos.nome,cursos.inicio FROM cursos INNER JOIN matricula
ON cursos.codigo = matricula.curso AND MONTH(inicio) = 1 AND YEAR(inicio) = 2008;

/*------------ RESPOSTA EXERCÍCIO 13 --------------*/
SELECT DISTINCT cursos.nome,cursos.inicio FROM cursos LEFT JOIN matricula
ON cursos.codigo = matricula.curso AND MONTH(inicio) = 1 AND YEAR(inicio) = 2008;

/*------------ RESPOSTA EXERCÍCIO 14 --------------*/
SELECT alunos.nome,cursos.nome FROM matricula 
INNER JOIN cursos ON cursos.codigo = matricula.curso
INNER JOIN alunos ON alunos.ra = matricula.ra 
WHERE matricula.data_ < cursos.inicio;

/*------------ RESPOSTA EXERCÍCIO 15 --------------*/
SELECT cursos.nome,cursos.inicio FROM cursos
WHERE cursos.inicio < NOW();

/*------------ RESPOSTA EXERCÍCIO 16 --------------*/
SELECT DISTINCT alunos.nome, 
    CASE 
        WHEN WEEKDAY(matricula.data_) = 0 THEN 'Segunda-feira'
        WHEN WEEKDAY(matricula.data_) = 1 THEN 'Terça-feira'
        WHEN WEEKDAY(matricula.data_) = 2 THEN 'Quarta-feira'
        WHEN WEEKDAY(matricula.data_) = 3 THEN 'Quinta-feira'
        WHEN WEEKDAY(matricula.data_) = 4 THEN 'Sexta-feira'
        WHEN WEEKDAY(matricula.data_) = 5 THEN 'Sábado'
        WHEN WEEKDAY(matricula.data_) = 6 THEN 'Domingo'
    END AS "Dia da Semana"
FROM alunos 
INNER JOIN matricula ON matricula.ra = alunos.ra
WHERE WEEKDAY(matricula.data_) = 5;

/*------------ RESPOSTA EXERCÍCIO 17 --------------*/
UPDATE matricula SET valor = valor * 1/2  
WHERE WEEKDAY(matricula.data_) = 5;
SELECT alunos.nome,matricula.valor FROM alunos
INNER JOIN matricula ON matricula.ra = alunos.ra
WHERE WEEKDAY(matricula.data_) = 5;

/*------------ RESPOSTA EXERCÍCIO 18 --------------*/
SELECT nome,YEAR(NOW()) - YEAR(nascimento) AS "Idade Aluno" FROM alunos;

/*------------ RESPOSTA EXERCÍCIO 19 --------------*/
SELECT cursos.nome,PERIOD_DIFF(REPLACE(LEFT(termino,7),"-",""),REPLACE(LEFT(inicio,7),"-","")) 
AS "Diferença Inicio e termino em Meses"
FROM cursos;







