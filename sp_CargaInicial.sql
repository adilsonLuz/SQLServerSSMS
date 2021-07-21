--
-- sp_CargaInicial
--

Drop Procedure If Exists sp_CargaInicial;
Go

Create Procedure sp_CargaInicial As
Begin
	-- Inserir dados prévios

	-- TB_Cliente
	Insert Into TB_Cliente(Nm_Cliente) Values ('MARIA');
	Insert Into TB_Cliente(Nm_Cliente) Values ('MARCOS');
	Insert Into TB_Cliente(Nm_Cliente) Values ('JOSE');


End;

