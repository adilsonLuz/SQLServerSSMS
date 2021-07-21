/*
	Name: fn_PossuiAlfa
	Author: Adilson da Silva Luz
	Date: 28/03/21 13:30
	Description: Verifica se o paramentro passado para function contém caracteres especiais,
				 acentos ou cedilha, se houver limpa a STRING
*/

Drop Function If Exists fn_LimparStr;
Go

Create Function fn_LimparStr(@pDs_Str Varchar(200)) Returns varchar(200)
Begin
	Declare @Str_Limpa1 Varchar(200)
	Declare @Str_Limpa2 Varchar(200)
	
	-- Limpando os acentos
	Set @Str_Limpa1 = ((@pDs_Str collate sql_latin1_general_cp1250_cs_as)
		Collate sql_latin1_general_cp1251_cs_as)

	-- Limpando os caracteres(OBS.: DEMOREI MUITO PESQUISANDO SE HAVIA ALGUM METODO PARA USAR A TABELA ASCII E NÃO ENCONTREI)
	set @Str_Limpa2 = Replace(Replace(Replace(Replace(Replace(Replace
					 (Replace(Replace(Replace(Replace(Replace(Replace
					 (Replace(Replace(@Str_Limpa1, '*',''), '/',''), '\','')
					 , ';',''), ':',''), '=',''), '+',''), '-',''), '"','')
					 , '''',''), '(',''), ')',''), '&',''), '%','')

	Return @Str_Limpa2
End
Go

--  print dbo.fn_LimparStr('*Á/d\ì;ç:Ús=ô+n-ã"ë''g(r)w&z%')