DROP PROCEDURE IF EXISTS sp_Sel_ClienteEspecifico;
GO

CREATE PROCEDURE sp_Sel_ClienteEspecifico (
  @pID_Cliente INT
) AS
BEGIN

  SELECT c.ID_Cliente, c.Nm_Cliente, c.Ds_Email, c.Nr_Telefone, c.Nr_CPF
  FROM TB_Cliente AS c
  WHERE c.ID_Cliente = @pID_Cliente

END;