create database bd_clientes;   #Criando banco de dados#  #DDL criadno#
use bd_clienets; #Usado para manipupar e usar o banco (FICANDO EM NEGRITO)#

create table tbl_clientes(  #Criando tabela#
codigo int primary key auto_increment not null,   #Variavel do tipo inteiro, chave primaria e auto incrementada 
nome varchar (40) not null,      #DDL# 
sexo char(1) not null       #Tipo char no qual é especifico para utilizar os dados semelhantes (uma letra)# se nao tivar not nul o campo fica sem nada
);
insert into tbl_clientes(nome, sexo)   # inserindo valores              #DML#
   values ("Humbrto", "M"), ("Ayrton Sena", "M"),("Xuxa", "F");
   
select * from tbl_clientes;   #Consultando table          #DML#


DELIMITER $$   #Abrindo comando#
create procedure sp_lista_cliente(in opcao int)
begin
     if opcao = 0 then
        select * from tbl_clientes where sexo = "F";
     elseif opcao = 1 then
         select * from tbl_clientes where sexo = "M";
	 else
		select * from tbl_clientes;
     end if;
end$$
DELIMITER ;     #Fechando#


show procedure status;
#lista sexo feminino:
call sp_lista_cliente (0);
#lista sexo masculino:
call sp_lista_cliente(1);
#Lista todos: 
call sp_lista_cliente(2);

#exemplo 2 Stored Proedure
DELIMITER $$
    
create procedure sp_busca_cliente_por_nome (in nome_parcial varchar(100))

begin
    select * from tbl_clientes
    where nome like concat ('%', nome_parcial, '%');#Especifio, como se um nome tiver a ira aperecer, caso seja apenas A #
end $$

DELIMITER ;    

call sp_busca_cliente_por_nome ("A"); 
