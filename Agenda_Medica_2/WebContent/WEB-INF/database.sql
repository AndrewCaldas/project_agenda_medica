create database agenda_medica;
use agenda_medica;

create table credenciado ( 
	id int AUTO_INCREMENT PRIMARY KEY, 
	nome varchar(100), 
	cpf int,
	cep int,
	datanasc date,
	end varchar(50),
	bairro varchar(50),
	cidade varchar(30),
	estado varchar(20),
	tel varchar(15),
	cel varchar(15),
	escolha varchar(10)
);