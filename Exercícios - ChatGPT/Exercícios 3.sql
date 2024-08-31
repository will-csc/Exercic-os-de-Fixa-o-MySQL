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

/*------------ EXERCÍCIO 1 ----------*/
SELECT alunos.nome,cursos.nome FROM alunos
INNER JOIN matricula ON alunos.ra = matricula.ra
INNER JOIN cursos ON cursos.codigo = matricula.curso;

/*------------ EXERCÍCIO 2 ----------*/
SELECT alunos.nome FROM alunos JOIN matricula
ON alunos.ra = matricula.ra AND matricula.curso =
(SELECT codigo FROM cursos WHERE nome = "java");

/*------------ EXERCÍCIO 3 ----------*/
SELECT alunos.nome,matricula.data_ AS "Data Matricula" FROM alunos
JOIN matricula ON matricula.ra = alunos.ra;

/*------------ EXERCÍCIO 4 ----------*/
SELECT alunos.nome, matricula.valor FROM alunos
JOIN matricula ON matricula.ra = alunos.ra;

/*------------ EXERCÍCIO 5 ----------*/
SELECT DISTINCT cursos.nome FROM cursos JOIN matricula
ON matricula.curso = cursos.codigo AND cursos.codigo IN 
(SELECT curso FROM matricula);

/*------------ EXERCÍCIO 6 ----------*/
SELECT cursos.nome,alunos.nome FROM matricula 
RIGHT JOIN alunos ON matricula.ra = alunos.ra
RIGHT JOIN cursos ON cursos.codigo = matricula.curso;

/*------------ EXERCÍCIO 7 ----------*/
SELECT cursos.nome FROM matricula
RIGHT JOIN cursos ON cursos.codigo = matricula.curso
WHERE matricula.curso IS NULL;

/*------------ EXERCÍCIO 8 ----------*/
SELECT cursos.nome,matricula.valor FROM matricula
RIGHT JOIN cursos ON cursos.codigo = matricula.curso;

/*------------ EXERCÍCIO 9 ----------*/
SELECT cursos.nome,matricula.data_ FROM matricula
RIGHT JOIN cursos ON cursos.codigo = matricula.curso;

/*------------ EXERCÍCIO 10 ----------*/
SELECT DISTINCT cursos.nome,COUNT(matricula.ra) AS "Matriculado" 
FROM matricula RIGHT JOIN cursos ON cursos.codigo = matricula.curso 
GROUP BY cursos.nome;

/*------------ EXERCÍCIO 11 ----------*/
SELECT alunos.nome,cursos.nome FROM alunos
LEFT JOIN matricula ON alunos.ra = matricula.ra
LEFT JOIN cursos ON matricula.curso = cursos.codigo;

/*------------ EXERCÍCIO 12 ----------*/
SELECT alunos.nome,cursos.nome FROM alunos
LEFT JOIN matricula ON alunos.ra = matricula.ra
LEFT JOIN cursos ON matricula.curso = cursos.codigo
WHERE cursos.nome IS NULL;

/*------------ EXERCÍCIO 13 ----------*/
SELECT alunos.nome,matricula.valor FROM alunos
LEFT JOIN matricula ON alunos.ra = matricula.ra;

/*------------ EXERCÍCIO 14 ----------*/
SELECT alunos.nome,matricula.data_ AS "Data de Matricula" FROM alunos
LEFT JOIN matricula ON alunos.ra = matricula.ra;

/*------------ EXERCÍCIO 15 ----------*/
SELECT alunos.nome FROM alunos
LEFT JOIN matricula ON alunos.ra = matricula.ra
LEFT JOIN cursos ON matricula.curso = cursos.codigo;

/*------------ EXERCÍCIO 16 ----------*/
SELECT alunos_a.nome AS "Aluno 1",alunos_b.nome AS "Aluno 2",alunos_a.nascimento
FROM alunos AS alunos_a JOIN alunos AS alunos_b
ON alunos_a.ra <> alunos_b.ra AND alunos_a.nascimento = alunos_b.nascimento;

/*------------ EXERCÍCIO 17 ----------*/
SELECT a.nome AS "Aluno 1",b.nome AS "Aluno 2"
FROM alunos AS a JOIN alunos AS b
ON a.ra <> b.ra AND a.nome = b.nome;

/*------------ EXERCÍCIO 18 ----------*/
SELECT DISTINCT a.nome AS "Aluno 1", MONTH(a.nascimento) AS "Mês Nasc 1",
                b.nome AS "Aluno 2", MONTH(b.nascimento) AS "Mês Nasc 2"
FROM alunos AS a 
JOIN alunos AS b
ON a.ra <> b.ra AND MONTH(a.nascimento) = MONTH(b.nascimento)
ORDER BY a.nome, b.nome;

/*------------ EXERCÍCIO 19 ----------*/
SELECT a.nome AS "Aluno 1",b.nome AS "Aluno 2",DAY(a.nascimento) AS "Dia de Nascimento"
FROM alunos AS a JOIN alunos AS b
ON a.ra <> b.ra AND DAY(a.nascimento) = DAY(b.nascimento);

/*------------ EXERCÍCIO 20 ----------*/
SELECT a.nome AS "Aluno 1",b.nome AS "Aluno 2",
	   DAY(a.nascimento) AS "Dia de Nascimento",MONTH(a.nascimento) AS "Mês Nascimento"
FROM alunos AS a JOIN alunos AS b
ON a.ra <> b.ra AND DAY(a.nascimento) = DAY(b.nascimento) AND MONTH(a.nascimento) = MONTH(b.nascimento);

/*------------ EXERCÍCIO 21 ----------*/
SELECT alunos.nome FROM alunos
UNION ALL
SELECT cursos.nome FROM cursos;

/*------------ EXERCÍCIO 22 ----------*/
SELECT alunos.nome FROM alunos JOIN matricula
ON matricula.ra = alunos.ra
UNION
SELECT alunos.nome FROM alunos JOIN matricula
ON alunos.ra <> matricula.ra;

/*------------ EXERCÍCIO 23 ----------*/
SELECT cursos.nome FROM cursos
UNION
SELECT alunos.nome FROM alunos;

/*------------ EXERCÍCIO 24 ----------*/
SELECT alunos.nome FROM matricula JOIN alunos
ON alunos.ra = matricula.ra WHERE matricula.curso =
(SELECT codigo FROM cursos WHERE nome = "java")
UNION
SELECT alunos.nome FROM matricula JOIN alunos
ON alunos.ra = matricula.ra WHERE matricula.curso =
(SELECT codigo FROM cursos WHERE nome = "php");

/*------------ EXERCÍCIO 25 ----------*/
SELECT alunos.nome FROM matricula JOIN alunos
ON matricula.ra = alunos.ra WHERE YEAR(data_) = 2008
UNION 
SELECT cursos.nome FROM cursos WHERE YEAR(inicio) = 2008;

/*------------ EXERCÍCIO 26 ----------*/
CREATE VIEW alunos_view AS
SELECT alunos.nome AS "Nome_Aluno",cursos.nome AS "Nome_Curso" FROM matricula 
JOIN alunos ON alunos.ra = matricula.ra
JOIN cursos ON cursos.codigo = matricula.curso;

/*------------ EXERCÍCIO 27 ----------*/
CREATE VIEW alunos_valor_view AS
SELECT alunos.nome,SUM(matricula.valor) AS "Soma_Matriculas" FROM matricula 
JOIN alunos ON alunos.ra = matricula.ra GROUP BY alunos.nome;

/*------------ EXERCÍCIO 28 ----------*/
CREATE VIEW cursos_cargahr_view AS
SELECT cursos.nome,cursos.ch AS "Carga_Horaria",cursos.inicio FROM cursos;

/*------------ EXERCÍCIO 29 ----------*/
CREATE VIEW alunos_inicio2008 AS
SELECT alunos.nome,cursos.nome AS "Curso_Nome" FROM matricula 
JOIN alunos ON alunos.ra = matricula.ra
JOIN cursos ON cursos.codigo = matricula.curso
WHERE YEAR(cursos.inicio) = 2008;

/*------------ EXERCÍCIO 30 ----------*/
CREATE VIEW cursos_matriculas AS
SELECT cursos.nome,COUNT(matricula.ra) FROM matricula
JOIN cursos ON matricula.curso = cursos.codigo
GROUP BY cursos.nome;

/*------------ EXERCÍCIO 31 ----------*/
ALTER VIEW alunos_view AS
SELECT alunos.nome,cursos.nome AS "Nome Curso",matricula.data_ AS "Curso_Nome" 
FROM matricula 
JOIN alunos ON alunos.ra = matricula.ra
JOIN cursos ON cursos.codigo = matricula.curso
WHERE YEAR(cursos.inicio) = 2008;

/*------------ EXERCÍCIO 32 ----------*/
ALTER VIEW alunos_valor_view AS
SELECT alunos.nome,SUM(matricula.valor) AS "Soma_Matriculas", cursos.nome AS "Nome Curso"
FROM matricula 
JOIN alunos ON alunos.ra = matricula.ra 
JOIN cursos ON cursos.codigo = matricula.curso
GROUP BY alunos.nome;

/*------------ EXERCÍCIO 33 ----------*/
ALTER VIEW cursos_matriculas AS
SELECT cursos.nome,COUNT(matricula.ra),cursos.termino FROM matricula
JOIN cursos ON matricula.curso = cursos.codigo
GROUP BY cursos.nome;

/*------------ EXERCÍCIO 34 ----------*/
ALTER VIEW alunos_inicio2008 AS
SELECT alunos.nome,cursos.nome AS "Curso_Nome",matricula.valor
FROM matricula 
JOIN alunos ON alunos.ra = matricula.ra
JOIN cursos ON cursos.codigo = matricula.curso
WHERE YEAR(cursos.inicio) = 2008;

/*------------ EXERCÍCIO 35 ----------*/
ALTER VIEW cursos_matriculas AS
SELECT cursos.nome,COUNT(matricula.ra),cursos.termino,cursos.ch AS "Carga_Horaria"
FROM matricula JOIN cursos ON matricula.curso = cursos.codigo
GROUP BY cursos.nome;

/*------------ EXERCÍCIO 36 ----------*/
DELIMITER $$
CREATE TRIGGER atualizar_data_termino AFTER INSERT
ON cursos FOR EACH ROW
BEGIN
    UPDATE cursos
    SET termino = DATE_ADD(NEW.inicio, INTERVAL 6 MONTH)
    WHERE codigo = NEW.codigo;
END $$
DELIMITER ;

/*------------ EXERCÍCIO 37 ----------*/
CREATE TABLE IF NOT EXISTS log_matricula (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    curso INT,
    ra INT,
    data_ DATE,
    valor DECIMAL(10,2),
    data_log TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER $$
CREATE TRIGGER log_matricula_insert AFTER INSERT
ON matricula FOR EACH ROW
BEGIN
    INSERT INTO log_matricula (curso, ra, data_, valor)
    VALUES (NEW.curso, NEW.ra, NEW.data_, NEW.valor);
END $$
DELIMITER ;

/*------------ EXERCÍCIO 38 ----------*/
DELIMITER $$
CREATE TRIGGER atualizar_ch AFTER INSERT
ON cursos FOR EACH ROW
BEGIN
	UPDATE cursos SET ch = NEW.ch 
    WHERE matricula.curso = cursos.codigo;
END $$
DELIMITER ;

/*------------ EXERCÍCIO 39 ----------*/
ALTER TABLE alunos ADD COLUMN msg_aluno VARCHAR(150);
DELIMITER $$

CREATE TRIGGER notificacao_aluno 
AFTER UPDATE ON alunos 
FOR EACH ROW
BEGIN
    UPDATE alunos 
    SET msg_aluno = CONCAT('Os dados foram atualizados em ', DATE())
    WHERE id = NEW.id;
END $$

DELIMITER ;

/*------------ EXERCÍCIO 40 ----------*/
DELIMITER $$
CREATE TRIGGER check_valor BEFORE INSERT
ON matricula FOR EACH ROW
BEGIN
    IF NEW.valor <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A matrícula deve ser maior que 0';
    END IF;
END $$
DELIMITER ;

/*------------ EXERCÍCIO 41 ----------*/
DROP TRIGGER atualizar_data_termino;

/*------------ EXERCÍCIO 42 ----------*/
DROP TRIGGER log_matricula_insert;

/*------------ EXERCÍCIO 43 ----------*/
DROP TRIGGER atualizar_ch;

/*------------ EXERCÍCIO 44 ----------*/
DROP TRIGGER notificacao_aluno;

/*------------ EXERCÍCIO 45 ----------*/
DROP TRIGGER check_valor;



