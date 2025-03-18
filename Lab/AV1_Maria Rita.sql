CREATE DATABASE AV1_Maria;
USE AV1_Maria;
#COMANDO PARA DESATIVAR O SAFE MODE
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE Heroi(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    nome_heroi VARCHAR(50) NOT NULL,
    poder VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    nome_inimigo VARCHAR(50) NOT NULL
);

-- Responda a letra a) aqui
insert into Heroi () VALUES (default,'Peter Parker', 'Homem Aranha', 'soltar teia', 16, 'Duende Verde');
insert into Heroi () VALUES (default,'Tony Stark', 'Homem de Ferro', 'tecnologia', 53, 'Mandarim');
insert into Heroi () VALUES (default,'Steve Rogers', 'Capitão América', 'super força', 105, 'Caveira Vermelha');
insert into Heroi () VALUES (default,'Stephen Strange', 'Doutor Estranho', 'magia', 95, 'Dormammu');
insert into Heroi () VALUES (default,'Natasha Romanoff', 'Viuva Negra', 'nenhum', 39, 'Bullseye');
insert into Heroi () VALUES (default,'Wanda Maximoff', 'Feiticeira Escarlate', 'magia', 30, 'Agatha Harkness');
drop table Heroi;
#select * from Heroi;
-- Respoda a letra b) aqui
select * from Heroi where idade >= 18;

-- Responda a letra c) aqui
select max(idade) from Heroi;

-- Responda a letra d) aqui
update Heroi set idade = 18 where id = 1;
select nome, idade, poder from Heroi where id=1;

-- Responda a letra e) aqui
delete from Heroi where poder = 'nenhum';
#select * from Heroi;

-- Responda a letra f) aqui
select nome from Heroi where nome_inimigo = 'Agatha Harkness';

-- Responda a letra g) aqui
select * from Heroi where poder = 'magia' and idade > 50;

-- Responda a letra h) aqui
select * from Heroi where nome_heroi like 'Ho%' and char_length(nome_heroi)>=5;

-- Responda a letra i) 
select distinct poder from Heroi;
