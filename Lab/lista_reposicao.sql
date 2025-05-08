-- Criando o banco de dados
CREATE DATABASE IF NOT EXISTS herois_db;
USE herois_db;

-- Tabela Heroi
CREATE TABLE IF NOT EXISTS Heroi (
    idHeroi INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    poder VARCHAR(45) NOT NULL,
    nivel INT NOT NULL
);

-- Tabela Vilao
CREATE TABLE IF NOT EXISTS Vilao (
    idVilao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    crimes INT DEFAULT 0,
    periculosidade VARCHAR(20)
);

-- Tabela Missao
CREATE TABLE IF NOT EXISTS Missao (
    idMissao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    duracao INT,
    Heroi_idHeroi INT NOT NULL,
    Vilao_idVilao INT NOT NULL,
    CONSTRAINT fk_Missao_Heroi
        FOREIGN KEY (Heroi_idHeroi)
        REFERENCES Heroi (idHeroi)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_Missao_Vilao
        FOREIGN KEY (Vilao_idVilao)
        REFERENCES Vilao (idVilao)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- Inserindo heróis
INSERT INTO Heroi (nome, poder, nivel) VALUES 
('Super Homem', 'Força e voo', 10),
('Batman', 'Inteligência e artes marciais', 9),
('Mulher Maravilha', 'Força e laço da verdade', 9),
('Flash', 'Velocidade', 8),
('Aquaman', 'Comunicação com animais marinhos', 7);

-- Inserindo vilões
INSERT INTO Vilao (nome, crimes, periculosidade) VALUES 
('Lex Luthor', 15, 'Alta'),
('Coringa', 20, 'Muito Alta'),
('Cheetah', 12, 'Média'),
('Flash Reverso', 8, 'Alta'),
('Mestre dos Oceanos', 5, 'Baixa');

-- Inserindo missões
INSERT INTO Missao (nome, duracao, Heroi_idHeroi, Vilao_idVilao) VALUES 
('Salvar Metrópolis', 5, 1, 1),
('Proteger Gotham', 3, 2, 2),
('Defender Themyscira', 4, 3, 3),
('Correr no tempo', 2, 4, 4),
('Proteger Atlantis', 6, 5, 5),
('Batalha Final', 8, 1, 2),
('Caça ao Tesouro', 3, 2, 3),
('Resgate Submarino', 4, 3, 4),
('Velocidade Máxima', 2, 4, 5),
('Invasão Alienígena', 7, 5, 1),
('Guerra nas Estrelas', 5, 1, 3),
('Ameaça Robótica', 4, 2, 4),
('Fuga da Prisão', 3, 3, 5),
('Ataque Cibernético', 2, 4, 1),
('Sequestro Internacional', 6, 5, 2);


SELECT h.nome AS Heroi, m.nome AS Missao, v.nome AS Vilao
FROM Heroi h
JOIN Missao m ON h.idHeroi = m.Heroi_idHeroi
JOIN Vilao v ON m.Vilao_idVilao = v.idVilao
ORDER BY h.nome;


SELECT h.nome AS Heroi, 
       SUM(m.duracao) AS 'Duração Total', 
       COUNT(m.idMissao) AS 'Quantidade de Missões'
FROM Heroi h
LEFT JOIN Missao m ON h.idHeroi = m.Heroi_idHeroi
GROUP BY h.idHeroi
ORDER BY h.nome;

SELECT m.nome AS Missao, h.nome AS Heroi, v.crimes AS 'Crimes do Vilão'
FROM Missao m
JOIN Heroi h ON m.Heroi_idHeroi = h.idHeroi
JOIN Vilao v ON m.Vilao_idVilao = v.idVilao
ORDER BY m.nome;