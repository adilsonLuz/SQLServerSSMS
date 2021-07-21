-- SC2.sql
--  PARCIAL


-- Eliminar tabelas
Drop Table If Exists TB_PartidaUnidade;
Drop Table If Exists TB_PartidaJogador;
Drop Table If Exists TB_Partida;
Drop Table If Exists TB_Unidade;
Go

-- Criando tabelas

Create Table TB_Unidade (
	ID_Unidade int Identity(1,1),
	Ds_Unidade Varchar(100) Not Null,
	ID_Raca int,
	Primary Key (ID_Unidade)
	);

Create Table TB_Partida (
	ID_Partida Int Identity(1,1),
	Dt_Partida datetime default GetDate(),
	St_Ativo Int,
	Primary Key (ID_Partida)
);

Create Table TB_PartidaJogador (
    ID_Partida Int,
	ID_Jogador Int,
	ID_Raca Int,
	Primary Key (ID_Partida, ID_Jogador)
);

-- Problema!!! Se tiverem 2 unidades iguais...
Create Table TB_PartidaUnidade (
    ID_Unidade Int,
	ID_Jogador Int,
	ID_Partida Int,
	Vl_PosX Int,
	Vl_PosY Int,
	Primary Key (ID_unidade, ID_Jogador, ID_Partida)
);


-- Solução!
Create Table TB_PartidaUnidade (
    ID_PartidaUnidade int Identity(1,1),
    ID_Unidade Int,
	ID_Jogador Int,
	ID_Partida Int,
	Vl_PosX Int,
	Vl_PosY Int,
	Primary Key (Id_PartidaUnidade)
);


Go


-- Simular Partida

Insert Into TB_Partida(St_Ativo) Values (1);

Insert Into TB_PartidaJogador(ID_Partida, ID_Jogador, ID_Raca) Values (1,10,1);
Insert Into TB_PartidaJogador(ID_Partida, ID_Jogador, ID_Raca) Values (1,12,2);

Insert Into TB_PartidaUnidade (ID_Unidade, ID_Jogador, ID_Partida, Vl_PosX, Vl_PosY) Values (100, 12, 1, 120, 250);

-- E se criar 2 unidade iguais?

Insert Into TB_PartidaUnidade (ID_Unidade, ID_Jogador, ID_Partida, Vl_PosX, Vl_PosY) Values (100, 12, 1, 40, 10);


-- Verificar Dados
Select * from TB_Partida;
Select * from TB_PartidaJogador;
Select * from TB_PartidaUnidade;
