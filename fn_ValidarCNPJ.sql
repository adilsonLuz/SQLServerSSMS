/*
	Name: fn_ValidarCNPJ
	Author: Adilson da Silva Luz
	Date: 29/03/21 16:00
	Description: Function que verifica se o CNPJ passado por paramentro
	é válido, retornando 1 para válido ou 0 para inválido
*/

Drop Function If Exists fn_ValidarCNPJ;
Go

Create Function fn_ValidarCNPJ(@pNr_CNPJ Varchar(14)) returns Int
Begin

Declare @Dv13   int
Declare @Dv14   int
Declare @Ct		int
Declare @Indice	int

set @Dv13 = 0
set @Dv14 = 0
set @Ct = 1
set @Indice = 6

	While(@Ct < len(@pNr_CNPJ)-9)
		Begin
			set @Dv13 = @Dv13 + Substring(@pNr_CNPJ, @Ct, 1) * @Indice
			set @Ct = @Ct + 1
			set @Indice = @Indice + 1
		End;
		
		set @Indice = 2

	While(@Ct < len(@pNr_CNPJ)-1)
		Begin
			set @Dv13 = @Dv13 + Substring(@pNr_CNPJ, @Ct, 1) * @Indice
			set @Ct = @Ct + 1
			set @Indice = @Indice + 1
		End
	Set @Dv13 = @Dv13 % 11
	
	Set @Ct = 1
	Set @Indice = 5

	While(@Ct < len(@pNr_CNPJ)-8)
		Begin		
			set @Dv14 = @Dv14 + Substring(@pNr_CNPJ, @Ct, 1) * @Indice
			set @Ct += 1
			set @Indice +=1
		End;

		set @Indice = 2

	While(@Ct < len(@pNr_CNPJ)-1)
		Begin		
			set @Dv14 = @Dv14 + Substring(@pNr_CNPJ, @Ct, 1) * @Indice
			set @Ct += 1
			set @Indice +=1
		End;
	Set @Dv14 = @Dv14 + @Dv13 * 9
	Set @Dv14 = @Dv14 % 11
	
	/*
	-- ----------------------------------------------------------------------------
	-- SE USAR ESTE MÉTODO APAGAR AS VARIAVEIS @Ct E @Indice, COMENTAR OS LAÇOS E 
	-- DESCOMENTAR ESTE TRECHO!!!

	set @Dv13 = Substring(@pNr_CNPJ, 1,1)*6
	set @Dv13 = @Dv13 + Substring(@pNr_CNPJ, 2,1)*7			
	set @Dv13 = @Dv13 + Substring(@pNr_CNPJ, 3,1)*8 
	set @Dv13 = @Dv13 + Substring(@pNr_CNPJ, 4,1)*9 
	set @Dv13 = @Dv13 + Substring(@pNr_CNPJ, 5,1)*2 
	set @Dv13 = @Dv13 + Substring(@pNr_CNPJ, 6,1)*3 
	set @Dv13 = @Dv13 + Substring(@pNr_CNPJ, 7,1)*4 
	set @Dv13 = @Dv13 + Substring(@pNr_CNPJ, 8,1)*5 
	set @Dv13 = @Dv13 + Substring(@pNr_CNPJ, 9,1)*6 
	set @Dv13 = @Dv13 + Substring(@pNr_CNPJ, 10,1)*7 
	set @Dv13 = @Dv13 + Substring(@pNr_CNPJ, 11,1)*8 
	set @Dv13 = @Dv13 + Substring(@pNr_CNPJ, 12,1)*9 
	set @Dv13 = @Dv13 % 11	
	
	set @Dv14 = Substring(@pNr_CNPJ, 1,1)*5 
	set @Dv14 = @Dv14 + Substring(@pNr_CNPJ, 2,1)*6 
	set @Dv14 = @Dv14 + Substring(@pNr_CNPJ, 3,1)*7 
	set @Dv14 = @Dv14 + Substring(@pNr_CNPJ, 4,1)*8 
	set @Dv14 = @Dv14 + Substring(@pNr_CNPJ, 5,1)*9 
	set @Dv14 = @Dv14 + Substring(@pNr_CNPJ, 6,1)*2 
	set @Dv14 = @Dv14 + Substring(@pNr_CNPJ, 7,1)*3 
	set @Dv14 = @Dv14 + Substring(@pNr_CNPJ, 8,1)*4 
	set @Dv14 = @Dv14 + Substring(@pNr_CNPJ, 9,1)*5 
	set @Dv14 = @Dv14 + Substring(@pNr_CNPJ, 10,1)*6 
	set @Dv14 = @Dv14 + Substring(@pNr_CNPJ, 11,1)*7 
	set @Dv14 = @Dv14 + Substring(@pNr_CNPJ, 12,1)*8 
	set @Dv14 = @Dv14 + @Dv13 * 9 
	set @Dv14 = @Dv14 % 11
	*/
	-- ----------------------------------------------------------------------------
	If Substring(@pNr_CNPJ, 13,1) = @Dv13
	   And Substring(@pNr_CNPJ, 14,1) = @Dv14
	   Begin
		  Return 1;
	   End;
	Return 0;
End

-- print dbo.fn_ValidarCNPJ('37954461000103')