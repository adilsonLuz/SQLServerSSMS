/*
	Name: fn_PossuiEspecial
	Author: Adilson da Silva Luz
	Date: 26/03/21 11:15
	Description: Verifica se o paramentro passado para function contém caracteres especiais, 
				 acentos e cedilha, retornando 0 para não ou a posição da primeira ocorrencia.
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
			   or Substring(@pDs_Str, @Ct, 1) = 'ç'
			   or Substring(@pDs_Str, @Ct, 1) = 'á'
			   or Substring(@pDs_Str, @Ct, 1) = 'é'
			   or Substring(@pDs_Str, @Ct, 1) = 'í'
			   or Substring(@pDs_Str, @Ct, 1) = 'ó'
			   or Substring(@pDs_Str, @Ct, 1) = 'ú'
			   or Substring(@pDs_Str, @Ct, 1) = 'à'
			   or Substring(@pDs_Str, @Ct, 1) = 'è'
			   or Substring(@pDs_Str, @Ct, 1) = 'ì'
			   or Substring(@pDs_Str, @Ct, 1) = 'ò'
			   or Substring(@pDs_Str, @Ct, 1) = 'ù'
			   or Substring(@pDs_Str, @Ct, 1) = 'ã'
			   or Substring(@pDs_Str, @Ct, 1) = 'õ'
			   or Substring(@pDs_Str, @Ct, 1) = 'â'
			   or Substring(@pDs_Str, @Ct, 1) = 'ê'
			   or Substring(@pDs_Str, @Ct, 1) = 'ô'
			   or Substring(@pDs_Str, @Ct, 1) = 'ü'
			   or Substring(@pDs_Str, @Ct, 1) = 'ë'
			   
				Begin
					If @Indice Is Null
						Set @Indice = @Ct
				End
			Set @Ct = @Ct + 1
		End
	-- Retorna o índice ---------
	Return IsNull(@Indice,0)

End
-- print AulaLabBanco.dbo.fn_PossuiEspecial('Adil&on')