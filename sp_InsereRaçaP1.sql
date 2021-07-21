Drop Procedure If Exists sp_InserirRaca;
Go;

Create Procedure sp_InserirRaca (
  @pDs_Raca Varchar(50)
) As
Begin

	Set @pDs_Raca = Upper(LTrim(RTrim(@pDs_Raca)));
	
	Insert Into TB_Raca(Ds_Raca) Values(@pDs_Raca);
End;

-- Exec sp_InserirRaca 'Humans'

