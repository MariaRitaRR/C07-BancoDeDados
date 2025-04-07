DROP DATABASE if exists Banco;
create database Banco;
use Banco;

create table clientes(
	id 	INT NOT NULL auto_increment primary KEY,
    nome varchar(100) not null,
    cpf varchar(11),
    endereco varchar(200) not null
    );
    
insert into clientes (nome, cpf,endereco) values
('Mary','123456789','Rua Quito Carneiro, 201 - MG'),
('Simone', '987654321', 'Joao Marcos Lopes, 317 -MG ');
select * from clientes;

alter table clientes add ano_nascimento int;

select * from clientes;

update clientes  set  ano_nascimento = 2005 where id =1;
update clientes  set  ano_nascimento = 1980 where id =2;

select * from clientes;

delete from clientes where id = 1;
select * from clientes;


	