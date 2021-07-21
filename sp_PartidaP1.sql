Drop Procedure If Exists sp_Partida;
Go

Create Procedure sp_Partida()As
Begin

Select p.ID_Jogador, p.ID_Raca, p.ID_Unidade, p.Qt_HpAtual

	From TB_PartidaUnid As p
	   Order By Ds_Raca and Ds_Unidade and Qt_HpPadrao



End;
-- Exec sp_Partida 
