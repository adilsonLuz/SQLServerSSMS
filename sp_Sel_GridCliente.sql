-- --------------------------------------------------------------
-- sp_Sel_GridCliente
-- --------------------------------------------------------------

Drop Procedure If exists sp_Sel_GridCliente;
Go

CREATE PROCEDURE sp_Sel_GridCliente AS
BEGIN

	SELECT c.ID_Cliente, c.Nm_Cliente,
	'(' + SUBSTRING(c.Nr_Telefone, 1, 2) + ') ' + 
	SUBSTRING(c.Nr_Telefone, 3, 4) + '-' + 
	SUBSTRING(c.Nr_Telefone, 7, 4) AS Nr_Telefone,

	SUBSTRING(c.Nr_CPF, 1, 3) + '.' +
	SUBSTRING(c.Nr_CPF, 4, 3) + '.' +
	SUBSTRING(c.Nr_CPF, 7, 3) + '/' +
	SUBSTRING(c.Nr_CPF, 10, 2)  AS Nr_CPF

	FROM TB_Cliente AS c
END;

-- exec sp_Sel_GridCliente