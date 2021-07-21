Drop Procedure If Exists sp_AtualizarPosicao;
GO

Create Procedure sp_AtualizarPosicao (
  @pNr_PosX Int,
  @pNr_PosY Int
) As
BEGIN

  UpDate TB_Cliente
    Set Nr_PosX = @pNr_PosX;
    Set Nr_PosY = @pNr_PosY;
END;

-- Exec sp_AtualizarPosicao 30, 65