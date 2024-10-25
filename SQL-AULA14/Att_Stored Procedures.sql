create database clientes_bd;

create table Clientes(
id int primary key auto_increment not null,
nome varchar (100) not null,
idade int not null,
sexo char (1) not null,
email varchar (100) not null,
telefone varchar (15) not null,
endereco varchar (255) not null
);

insert Clientes (nome, idade, sexo, email, telefone, endereco)
   values ("Aline Corrêa", "32", "F", "Aline@gmail.com.br", "11 9999-000", "Rua Amoras Encantas, Bairro Aurora, 120"),
		  ("Brenda Silva", "17", "F", "Brenda@gmail.com.br", "11 8889-070", "Rua Sempre Brilhará, Bairro Superbacana, 382"),
          ("Cecília Seabra", "4", "F", "Cecília@gmail.com.br", "11 0000-000", "Rua Sem História Sem Destino, Bairro Alecrim, 200"),
          ("Daniel Campos", "18", "M", "Daniel@gmail.com.br", "11 3333-000", "Rua Sem fim , Bairro Com fim, 30"),
          ("Eduardo Oliveira", "43", "M", "EduardoO@gmail.com.br", "11 9769-000", "Rua nova esperança, Bairro Cabana, 194"),
          ("Gustavo Lima", "52", "M", "GustavoL@gmail.com.br", "11 9068-000", "Rua Era uma vez, Bairro Encanto ,10");
          
select * from Clientes;
          
DELIMITER $$
CREATE PROCEDURE Maiores_18(IN idades INT)
BEGIN
    IF idades > 18 THEN
       SELECT * FROM Clientes WHERE idade >= 18;
    ELSEIF idades < 18 THEN
       SELECT * FROM Clientes WHERE idade < 18;
    END IF;
END $$
DELIMITER ;

drop procedure Maiores_18;

#LISTA Menores DE 18
CALL Maiores_18 (17);
#LISTA Maiores 18
CALL Maiores_18(19);