/*
Prova P1
Adilson Luz (Chacal)
02/10/2020 12:30
*/

--Apagando tabelas
Drop Table If exists TB_Remedio;
Drop Table If exists TB_Prateleira;
Drop Table If exists TB_PrincAtivo;
Go

--Criando tabelas
Create Table TB_PrincAtivo (
	ID_PrincAtivo Int Identity (1,1) Not Null,
	Ds_PrincAtivo VarChar (100),
	Primary Key (ID_PrincAtivo),
);
Create Table TB_Prateleira ( 
	ID_Prateleira Int Identity (1,1) Not Null,
	Ds_Prateleira VarChar(100),
	Primary Key (ID_Prateleira),
);
Create Table TB_Remedio ( 
	ID_Remedio Int Identity (1,1) Not Null,
	Nm_Remedio VarChar (100),
	Pr_Vendas Numeric (7,2),
	Vl_Desconto Numeric (5,2),
	ID_PrincAtivo Int,
	ID_Prateleira Int,
	Primary Key (ID_Remedio),
	Foreign Key (ID_PrincAtivo)
		References TB_PrincAtivo(ID_PrincAtivo),
    Foreign Key (ID_Prateleira)
		References TB_Prateleira(ID_Prateleira),
);
Go

insert into TB_Remedio(Nm_Remedio, Pr_Vendas, Vl_Desconto) values ('Dipirona', 7.85, 2.01);
insert into TB_Remedio(Nm_Remedio, Pr_Vendas, Vl_Desconto) values ('Diclofenaco de Sódico', 18.59, 0.12);
insert into TB_Remedio(Nm_Remedio, Pr_Vendas, Vl_Desconto) values ('Nimesulida', 22.54, 3.10);

insert into TB_PrincAtivo(Ds_PrincAtivo) values ('Febre');
insert into TB_PrincAtivo(Ds_PrincAtivo) values ('Analgesico');
insert into TB_PrincAtivo(Ds_PrincAtivo) values ('Anti-inflamatório');

insert into TB_Prateleira(Ds_Prateleira) values ('Azul');
insert into TB_Prateleira(Ds_Prateleira) values ('Amarela');
insert into TB_Prateleira(Ds_Prateleira) values ('Vermelha');

Go

select * from TB_PrincAtivo;
select * from TB_Prateleira;
select * from TB_Remedio;
Go