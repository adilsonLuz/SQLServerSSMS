Drop Table If Exists TB_PartidaUnidade;
Go

Create Table TB_PartidaUnidade (
   ID_PartidaUnidade Int Identity(1,1),
   ID_Partida Int,
   ID_Jogador Int,
   ID_Unidade Int,
   Vl_HP int,
   St_Ativo Varchar(1) Default 'A',
   Vl_PosX Int,
   Vl_PosY int,
   Primary Key (ID_PartidaUnidade)
);
Go

/*
Raça: 1
Unidade 100 "Sonda"   
Partida 524
Jogador 15
Pos X,Y 100,40
HP: 10
*/

Insert Into TB_PartidaUnidade(ID_Partida,ID_Jogador, ID_Unidade,Vl_HP,Vl_PosX,Vl_PosY) 
   Values (524, 15, 100, 10, 100,40)



/*
Raça: 1
Unidade 100 "Sonda"   
Partida 524
Jogador 15
Pos X,Y 120,50
HP: 10
*/

Insert Into TB_PartidaUnidade(ID_Partida, ID_Jogador, ID_Unidade,Vl_HP,Vl_PosX,Vl_PosY) 
   Values (524, 15, 100, 10, 120, 50)


Select * from TB_PartidaUnidade;

Update TB_PartidaUnidade
Set Vl_HP = 0, St_Ativo='I'
Where ID_PartidaUnidade = 1


