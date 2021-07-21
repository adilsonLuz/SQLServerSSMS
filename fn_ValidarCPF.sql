/*
	Name: fn_ValidarCPF
	Author: Adilson da Silva Luz
	Date: 29/03/21 16:54
	Description: Function que verifica se o CPF passado por paramentro
	é válido, retornando 1 para válido ou 0 para inválido
*/
Drop Function If Exists fn_ValidarCPF;
Go

Create Function fn_ValidarCPF( @pNr_CPF Varchar(11)) Returns Int
Begin

Declare @Dv10   int
Declare @Dv11   int
Declare @Ct		int
Declare @Indice int

Set @Dv10   = 0
Set @Dv11   = 0
Set @Ct     = 1
Set @Indice = 1

	While(@Ct < len(@pNr_CPF)-1)
		Begin
			set @Dv10 = @Dv10 + Substring(@pNr_CPF, @Ct, 1) * @Indice
			set @Ct = @Ct + 1
			set @Indice = @Indice + 1
		End
	Set @Dv10 = @Dv10 % 11
	
	Set @Ct =1
	Set @Indice = 0

	While(@Ct < len(@pNr_CPF)-1)
		Begin
			set @Dv11 = @Dv11 + Substring(@pNr_CPF, @Ct, 1) * @Indice
			set @Ct = @Ct + 1
			set @Indice = @Indice + 1
		End
	Set @Dv11 = @Dv11 + @Dv10 * 9
	Set @Dv11 = @Dv11 % 11
	
	/*
	-- ----------------------------------------------------------------------------
	-- SE USAR ESTE MÉTODO APAGAR AS VARIAVEIS @Ct E @Indice, COMENTAR OS LAÇOS E 
	-- DESCOMENTAR ESTE TRECHO!!!

	set @Dv10 = Substring(@pNr_CPF, 1,1)*1 
	set @Dv10 = @Dv10 + Substring(@pNr_CPF, 2,1)*2			
	set @Dv10 = @Dv10 + Substring(@pNr_CPF, 3,1)*3 
	set @Dv10 = @Dv10 + Substring(@pNr_CPF, 4,1)*4
	set @Dv10 = @Dv10 + Substring(@pNr_CPF, 5,1)*5
	set @Dv10 = @Dv10 + Substring(@pNr_CPF, 6,1)*6
	set @Dv10 = @Dv10 + Substring(@pNr_CPF, 7,1)*7
	set @Dv10 = @Dv10 + Substring(@pNr_CPF, 8,1)*8
	set @Dv10 = @Dv10 + Substring(@pNr_CPF, 9,1)*9
	set @Dv10 = @Dv10 % 11	

	set @Dv11 = Substring(@pNr_CPF, 1,1)*0 
	set @Dv11 = @Dv11 + Substring(@pNr_CPF, 2,1)*1			
	set @Dv11 = @Dv11 + Substring(@pNr_CPF, 3,1)*2 
	set @Dv11 = @Dv11 + Substring(@pNr_CPF, 4,1)*3
	set @Dv11 = @Dv11 + Substring(@pNr_CPF, 5,1)*4
	set @Dv11 = @Dv11 + Substring(@pNr_CPF, 6,1)*5
	set @Dv11 = @Dv11 + Substring(@pNr_CPF, 7,1)*6
	set @Dv11 = @Dv11 + Substring(@pNr_CPF, 8,1)*7
	set @Dv11 = @Dv11 + Substring(@pNr_CPF, 9,1)*8
	set @Dv11 = @Dv11 + @Dv10 * 9
	set @Dv11 = @Dv11 % 11
	-- ----------------------------------------------------------------------------
	*/

	If Substring(@pNr_CPF, 10,1) = @Dv10
	   And Substring(@pNr_CPF, 11,1) = @Dv11
	   Begin
		  Return 1;
	   End;
	Return 0;
End

-- print dbo.fn_ValidarCPF('15487963282')