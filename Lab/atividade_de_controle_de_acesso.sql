create database if not exists C207;
use C207;

create table alunos(
	matricula INT,
    curso VARCHAR(20),
    nome VARCHAR (50),
    periodo INT,
    PRIMARY KEY (matricula,curso)
    );
    
CREATE USER 'usuario1' IDENTIFIED BY '0000#GES';
CREATE USER 'usuario2' IDENTIFIED BY '0000#GEC';

SELECT * FROM mysql.user;
SHOW GRANTS FOR 'usuario1';
SHOW GRANTS FOR 'usuario2';

GRANT ALL PRIVILEGES ON C207.alunos TO 'usuario1';
GRANT CREATE , ALTER, DROP ON C207.alunos TO 'usuario2';

SELECT * FROM mysql.user;
SHOW GRANTS FOR 'usuario1';
SHOW GRANTS FOR 'usuario2';


REVOKE INSERT , UPDATE, DELETE ON C207.alunos FROM 'usuario1';
REVOKE CREATE , DROP ON C207.alunos FROM 'usuario2';

SELECT * FROM mysql.user;
SHOW GRANTS FOR 'usuario1';
SHOW GRANTS FOR 'usuario2';


