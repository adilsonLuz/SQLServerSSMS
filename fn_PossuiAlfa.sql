/*
	Name: fn_PossuiAlfa
	Author: Adilson da Silva Luz
	Date: 26/03/21 9:30
	Description: Verifica se o paramentro passado para function contém caracteres 
				 alfabeticos, retornando 0 para não ou a posição da primeira ocorrencia.
*/

Drop Function If Exists fn_PossuiAlfa;
Go

Create Function fn_PossuiAlfa(@pDs_Str Varchar(200)) Returns Int
Begin

-- Declarando variaveis
	Declare @Ct           As Int
	Declare @Indice       As Int
	
	-- Atribuindo valores as variaveis
	set @Ct = 0;
	set @Indice = NULL;

	-- Laço que percorre caracteres da string
	While(@Ct <= Len(@pDS_Str))
		Begin
			IF Substring(@pDS_Str, @Ct, 1) Between 'A' And 'Z'
			   or Substring(@pDS_Str, @Ct, 1) Between 'a' And 'z'
				Begin
					If @Indice Is NULL
						set @Indice = @Ct;
				End
			Set @Ct = @Ct + 1

		End
	-- Retorna o indice
	Return IsNull(@Indice,0)
End
--print dbo.fn_PossuiAlfa('4di1&03')