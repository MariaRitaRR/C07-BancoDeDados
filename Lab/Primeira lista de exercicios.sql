DROP DATABASE IF EXISTS aula3;
CREATE DATABASE aula3;
USE aula3;

#COMANDO PARA DESATIVAR O SAFE MODE
SET SQL_SAFE_UPDATES = 0;

#QUESTAO 1
CREATE TABLE IF NOT EXISTS pessoa(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    endereco VARCHAR(45),
    cargo VARCHAR(45)
);

#RESPONDA A QUESTAO 1 AQUI
insert into pessoa () VALUES (default,'Maria', 'Rua Quito Carneiro','Aluna');
insert into pessoa () VALUES (default,'Bianca','Rua do Sanico','Professora');
insert into pessoa () VALUES (default,'Robson', 'Rua das Maritacas','Educador Físico');

select nome from pessoa;

UPDATE pessoa SET endereco='Rua das FLores' WHERE id = '1';

select * from pessoa;

DELETE from pessoa WHERE id ='3';

select * from pessoa;
#QUESTAO 2
CREATE TABLE IF NOT EXISTS empresa(
	matricula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    cpf VARCHAR(45),
    cargo VARCHAR(45),
    nProjetos INT
);

#RESPONDA A QUESTAO 2 AQUI
INSERT INTO empresa () VALUES(default, 'Junior', '000.000.000-00', 'GP',2);
INSERT INTO empresa ()VALUES(default, 'Maria', '111.111.111-11','Desenvolvedor',3);
INSERT INTO empresa ()VALUES(default, 'Calos','222.222.222-22','Tester',4);
INSERT INTO empresa ()VALUES(default,'Julia','333.333.333-33','Desenvolvedor',5); 

SELECT count(*) AS qtd_funcionarios from empresa where nProjetos >= 4;
SELECT AVG(nProjetos) as media_projetos from empresa where not cargo = 'GP';
select * from empresa; 
SELECT distinct cargo from empresa; 
select nome, cpf, nProjetos from empresa where cargo ='Desenvolvedor';


#QUESTAO 3
CREATE TABLE IF NOT EXISTS aluno(
	matricula INT NOT NULL PRIMARY KEY,
    nome VARCHAR(45),
    endereco VARCHAR(45),
    ano_nasc INT,
    curso VARCHAR(45)
);


#RESPONDA AS QUESTOES 3 
#Atencao: para a resposta da letra A, preencha a linha da tabela da resposta no comando 'CREATE TABLE' com 'NOT NULL PRIMARY KEY'
#RESPOSTA DA LETRA A:A coluna matricula deve ser usada como chave primaria pois ela é unica para cada aluno
INSERT INTO aluno (matricula, nome, endereco, ano_nasc, curso) 
VALUES (333, 'Carlos', 'Rua 0', 2003, 'GEB');

INSERT INTO aluno (matricula, nome, endereco, ano_nasc, curso) 
VALUES (123, 'Janaina', 'Rua 1', 1998, 'GEB');

INSERT INTO aluno (matricula, nome, endereco, ano_nasc, curso) 
VALUES (456, 'Luca', 'Rua 2', 2004, 'GES');


INSERT INTO aluno (matricula, nome, endereco, ano_nasc, curso) 
VALUES (789, 'Paula', 'Rua 3', 2000, 'GEC');

select * from aluno;
#Exemplo: caso você acredite que a chave primária deva ser o campo "ano_nasc" preencha na linha com 'ano_nasc INT NOT NULL PRIMARY KEY'

#RESPONDA A QUESTÃO 4 AQUI

INSERT INTO aluno (matricula, nome, endereco, ano_nasc, curso) VALUES 
(225, 'Pedro', 'Rua 25', 1999, 'GEA'),
(109, 'Jander', 'Rua 10', 2000, 'GES'),
(342, 'Laura', 'Rua 3', 2002, 'GEC');

SELECT nome, matricula, curso FROM aluno WHERE nome LIKE 'Jan%' AND CHAR_LENGTH(nome) = 7;
SELECT nome, curso FROM aluno WHERE nome LIKE 'L%A';
SELECT nome, ano_nasc, curso FROM aluno WHERE ano_nasc <= 2000;
SELECT * FROM aluno limit 4;
UPDATE aluno SET endereco = 'REP' WHERE curso = 'GES';
select * from aluno;
DELETE FROM aluno WHERE curso ='GES';
select * from aluno;



