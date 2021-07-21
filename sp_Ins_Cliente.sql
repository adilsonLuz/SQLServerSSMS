DROP PROCEDURE IF EXISTS sp_Ins_Cliente;
GO

CREATE PROCEDURE sp_Ins_Cliente (
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
	
	INSERT INTO TB_Cliente(Nm_Cliente, Ds_Email, Nr_Telefone, Nr_CPF)
	VALUES(@pNm_Cliente, @pDs_Email, @pNr_Telefone, @pNr_CPF);
END;

-- EXEC sp_Ins_Cliente 'IRAPUAN', 'ira@fatec.com', '1199990004', 00011122201
-- SELECT * FROM TB_Cliente