DROP PROCEDURE IF EXISTS sp_Upd_Cliente;
GO

CREATE PROCEDURE sp_Upd_Cliente (
  @pID_Cliente INT,

  @pNm_Cliente VARCHAR(200),
  @pDs_Email VARCHAR(200),
  @pNr_Telefone VARCHAR(12),
  @pNr_CPF NUMERIC(11)
) AS
BEGIN

	SET @pNm_Cliente = UPPER(LTRIM(RTRIM(@pNm_Cliente)));
	SET @pDs_Email = LTRIM(RTRIM(@pDs_Email));
	SET @pNr_Telefone = LTRIM(RTRIM(@pNr_Telefone));
	SET @pNr_CPF = ISNULL(@pNr_CPF, 0);

  UPDATE TB_Cliente
    SET Nm_Cliente = @pNm_Cliente,
    Ds_Email = @pDs_Email,
    Nr_Telefone = @pNm_Cliente,
    Nr_CPF = @pNr_CPF
  WHERE ID_Cliente = @pID_Cliente
END;

-- select * from TB_Cliente
-- exec sp_Upd_Cliente 1, 'RAFAEL_JESUS', 'rafael.jesus@fatec.sp.gov.br', '1143778549', 12345678900