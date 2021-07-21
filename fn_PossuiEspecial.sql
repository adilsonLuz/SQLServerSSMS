/*
	Name: fn_PossuiEspecial
	Author: Adilson da Silva Luz
	Date: 26/03/21 11:15
	Description: Verifica se o paramentro passado para function cont�m caracteres especiais, 
				 acentos e cedilha, retornando 0 para n�o ou a posi��o da primeira ocorrencia.
*/

Drop Function If Exists fn_PossuiEspecial;
Go

Create Function fn_PossuiEspecial(@pDs_Str Varchar(200)) Returns Int
Begin

	Declare @Ct AS int
	Declare @Indice As int

	Set @Ct = 0;
	Set @Indice = Null;

	While (@Ct <= Len(@pDs_Str))
		Begin
			If Substring(@pDs_Str, @Ct, 1) = '*'
			   or Substring(@pDs_Str, @Ct, 1) = '/'
			   or Substring(@pDs_Str, @Ct, 1) = '\'
			   or Substring(@pDs_Str, @Ct, 1) = ';'
			   or Substring(@pDs_Str, @Ct, 1) = ':'
			   or Substring(@pDs_Str, @Ct, 1) = '_'
			   or Substring(@pDs_Str, @Ct, 1) = '='
			   or Substring(@pDs_Str, @Ct, 1) = '+'
			   or Substring(@pDs_Str, @Ct, 1) = '-'
			   or Substring(@pDs_Str, @Ct, 1) = '"'
			   or Substring(@pDs_Str, @Ct, 1) = ''''
			   or Substring(@pDs_Str, @Ct, 1) = '('
			   or Substring(@pDs_Str, @Ct, 1) = ')'
			   or Substring(@pDs_Str, @Ct, 1) = '&'
			   or Substring(@pDs_Str, @Ct, 1) = '�'
			   or Substring(@pDs_Str, @Ct, 1) = '�'
			   or Substring(@pDs_Str, @Ct, 1) = '�'
			   or Substring(@pDs_Str, @Ct, 1) = '�'
			   or Substring(@pDs_Str, @Ct, 1) = '�'
			   or Substring(@pDs_Str, @Ct, 1) = '�'
			   or Substring(@pDs_Str, @Ct, 1) = '�'
			   or Substring(@pDs_Str, @Ct, 1) = '�'
			   or Substring(@pDs_Str, @Ct, 1) = '�'
			   or Substring(@pDs_Str, @Ct, 1) = '�'
			   or Substring(@pDs_Str, @Ct, 1) = '�'
			   or Substring(@pDs_Str, @Ct, 1) = '�'
			   or Substring(@pDs_Str, @Ct, 1) = '�'
			   or Substring(@pDs_Str, @Ct, 1) = '�'
			   or Substring(@pDs_Str, @Ct, 1) = '�'
			   or Substring(@pDs_Str, @Ct, 1) = '�'
			   or Substring(@pDs_Str, @Ct, 1) = '�'
			   or Substring(@pDs_Str, @Ct, 1) = '�'
			   
				Begin
					If @Indice Is Null
						Set @Indice = @Ct
				End
			Set @Ct = @Ct + 1
		End
	-- Retorna o �ndice ---------
	Return IsNull(@Indice,0)

End
-- print AulaLabBanco.dbo.fn_PossuiEspecial('Adil&on')