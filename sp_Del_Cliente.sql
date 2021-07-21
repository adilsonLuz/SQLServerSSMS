DROP PROCEDURE IF EXISTS sp_Del_Cliente;
GO

CREATE PROCEDURE sp_Del_Cliente (
  @pID_Cliente INT
) AS
BEGIN

  UPDATE TB_Cliente
    SET St_Ativo = 'I'
  WHERE ID_Cliente = @pID_Cliente

END;