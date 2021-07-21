/*
Pagina 8 exercicio banco
Adilson Luz (Chacal)
19/09/2020 19:11
*/

--Apagando tabelas
Drop Table if exists TB_CC;
Drop Table If exists TB_Empresa;
Drop Table If exists TB_Banco;
Drop Table If exists TB_Agencia;
Go

--Criando tabelas
Create Table TB_empresa (
	ID_Empresa Int Identity (1,1),
	Nm_Empresa VarChar (200),
	Primary Key (ID_Empresa),
);
Create Table TB_CC ( 
	Nr_Banco Int,
	Nr_CC Int,
	ID_Agencia Int,
	ID_empresa Int,
	Vl_Saldo Numeric (12,2),
	Primary Key (Nr_Banco, Nr_CC, ID_Agencia),
	Foreign Key (ID_Empresa)
		References TB_Empresa(ID_Empresa),
);



Create Table TB_Banco (
	Nr_Banco Int ,
	Nm_Banco VarChar (200),
	Primary Key (Nr_Banco),
);

Create Table TB_Agencia (
	ID_Agencia Int Identity (1,1),
	Nm_Agencia VarChar (200),
	Primary Key (ID_Agencia),
);
Go