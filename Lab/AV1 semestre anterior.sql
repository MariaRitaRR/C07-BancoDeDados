DROP DATABASE IF EXISTS AV1;
CREATE DATABASE AV1;
USE AV1;

#COMANDO PARA DESATIVAR O SAFE MODE
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE IF NOT EXISTS Ninja (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    dinheiro INT NOT NULL,
    tipoChakra VARCHAR(50) NOT NULL,
    qtdChakra INT NOT NULL
);

# Responda aqui a letra A
insert into Ninja () VALUES (default,'Naruto',13, 'Genin', 0, 'Vento', 600);
insert into Ninja () VALUES (default,'Sasuke',14, 'Chunin', 500, 'Raio', 400);
insert into Ninja () VALUES (default,'Sakura',12, 'Genin', 150, 'Terra', 500);
insert into Ninja () VALUES (default,'Gaara',15, 'Chunin', 400, 'Areia', 550);
insert into Ninja () VALUES (default,'Kakashi',28, 'Jounin', 1000, 'Raio', 200);
insert into Ninja () VALUES (default,'Minato',35, 'Hokage', 5000, 'Vento', 300);


# Responda aqui a letra B
update Ninja set idade=14 where id=1;
# Responda aqui a letra C
select * from Ninja where titulo ='Genin';
# Responda aqui a letra D
#Para o erro 1175
SET SQL_SAFE_UPDATES = 0;
delete from Ninja WHERE qtdChakra = 550;

# Responda aqui a letra E
select titulo from Ninja where tipoChakra = 'Vento';
# Responda aqui a letra F
select max(idade) as idadeMaxima from Ninja;
# Responda aqui a letra G
UPDATE Ninja SET titulo = "Chunin" WHERE nome = "Naruto" OR nome = "Sakura";
# Responda aqui a letra H
select nome from Ninja where nome like 'Sa%' and char_length(nome) = 6;
# Responda aqui a letra I
select count(*) as totalNinjas from Ninja where dinheiro <= 1000;



#PRINCIPAIS COMANDOS 
-- Selecionar todos os campos de uma tabela
SELECT * FROM Ninja;

-- Selecionar colunas específicas
SELECT nome, idade FROM Ninja;

-- Renomear colunas usando AS
SELECT nome AS Nome_Ninja, idade AS Idade_Anos FROM Ninja;

-- Filtrar registros com WHERE
SELECT * FROM Ninja WHERE idade > 18;

-- Filtrar com múltiplas condições (AND, OR)
SELECT * FROM Ninja WHERE idade > 18 AND dinheiro < 1000;

-- Filtrar por valores específicos com IN
SELECT * FROM Ninja WHERE titulo IN ('Genin', 'Chunin');

-- Filtrar por padrões de texto com LIKE
SELECT * FROM Ninja WHERE nome LIKE 'Sa%'; -- Começa com "Sa"
SELECT * FROM Ninja WHERE nome LIKE '%ra'; -- Termina com "ra"
SELECT * FROM Ninja WHERE nome LIKE '%ka%'; -- Contém "ka"

-- Ordenar resultados (ASC = crescente, DESC = decrescente)
SELECT * FROM Ninja ORDER BY idade ASC;
SELECT * FROM Ninja ORDER BY idade DESC;

-- Limitar a quantidade de resultados
SELECT * FROM Ninja ORDER BY dinheiro DESC LIMIT 3;

-- Contar quantos registros existem na tabela
SELECT COUNT(*) AS total_ninjas FROM Ninja;

-- Obter idade máxima e mínima
SELECT MAX(idade) AS mais_velho, MIN(idade) AS mais_novo FROM Ninja;

-- Calcular a média de um campo
SELECT AVG(dinheiro) AS media_dinheiro FROM Ninja;

-- Somar valores de uma coluna
SELECT SUM(dinheiro) AS total_dinheiro FROM Ninja;

-- Agrupar por tipo de Chakra e contar quantos ninjas existem por tipo
SELECT tipoChakra, COUNT(*) AS total FROM Ninja GROUP BY tipoChakra;

-- Filtrar grupos com HAVING (usado após GROUP BY)
SELECT tipoChakra, COUNT(*) AS total FROM Ninja 
GROUP BY tipoChakra HAVING total > 2;

-- Juntar tabelas com JOIN (Exemplo: Missao e Ninja)
SELECT Ninja.nome, Missao.nomeMissao 
FROM Ninja 
JOIN Missao ON Ninja.id = Missao.idNinja;
