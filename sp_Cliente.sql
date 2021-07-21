Drop Procedure If Exists sp_Sel_GridCliente;
Go

Create Procedure sp_Sel_GridCliente(
	@pNm_Cliente   VarChar (100),
	@pNr_Telefone  Varchar ( 12),
	@pNr_CPF       Numeric ( 15)
)As
Begin
	-- Preparação
	set @pNm_Cliente = Upper(LTrim(RTrim(@pNm_Cliente)));
	Set @pNr_Telefone = '(' + SUBSTRING(@pNr_Telefone,1,2) + ') ' +
							  SUBSTRING(@pNr_Telefone,3,4) + '-' +
							  SUBSTRING(@pNr_Telefone,7,4);
	set @pNr_CPF = SUBSTRING(Convert(VarChar(12), @pNr_CPF+100000000000),2,3) + '.' +  
				   SUBSTRING(Convert(VarChar(12), @pNr_CPF+100000000000),4,3) + '.' +
				   SUBSTRING(Convert(VarChar(12), @pNr_CPF+100000000000),8,3) + '-' +
				   SUBSTRING(Convert(VarChar(12), @pNr_CPF+100000000000),11,2)

Select c.ID_Cliente
	  ,c.Nm_Cliente
	  ,c.Nr_Telefone
      ,c.Nr_CPF

From TB_Cliente As c

	where c.Nm_Cliente Like '%' + @pNm_Cliente + '%'
	And c.Nr_Telefone Like '%' + @pNr_Telefone + '%'
	And c.Nr_CPF Like '%' + @pNr_CPF + '%'

End;

-- Exec sp_Sel_GridCliente 'm', ' ', ' '