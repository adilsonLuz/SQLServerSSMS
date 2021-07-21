/*
	Name: fn_PossuiAlfa
	Author: Adilson da Silva Luz
	Date: 23/03/21 1:48
	Description: Verifica se o paramentro passado para function cont�m n�meros,
				 retornando 0 para n�o ou a posi��o da primeira ocorrencia.
*/


--> 0 para n�o possui ou a posi��o da primeira ocorr�ncia
-- Criando fun��o POSSUI NUMERO
Drop Function If Exists fn_PossuiNumero;
Go
Create Function fn_PossuiNumero(@pDs_Str Varchar(200)) Returns Int
Begin

	-- Declarando variaveis
	Declare @Ct           As Int
	Declare @Indice       As Int
	
	-- Atribuindo valores as variaveis
	set @Ct = 0;
	set @Indice = NULL;

	-- La�o que percorre caracteres da string
	While(@Ct <= Len(@pDS_Str))
		Begin
			IF Substring(@pDS_Str, @Ct, 1) between '0' and '9'
				Begin
					If @Indice Is NULL
						set @Indice = @Ct;
				End
			Set @Ct = @Ct + 1
		End
	-- Retorna o indice
	Return IsNull(@Indice,0)
End
-- print AulaLabBanco.dbo.fn_PossuiNumero('adil06sso6')