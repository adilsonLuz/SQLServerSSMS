-- ------------------------------------------------------------------
-- sp_ListarCliente
-- ------------------------------------------------------------------
--
-- Eliminar se existe
Drop Procedure If Exists sp_ListarCliente;
Go

-- Criar SP
Create Procedure sp_ListarCliente As
Begin

	Select ID_Cliente, Nm_Cliente
	  From TB_Cliente
	  Order By Nm_Cliente;

End;
