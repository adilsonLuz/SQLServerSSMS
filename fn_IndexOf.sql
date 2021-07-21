
Drop Function If Exists fn_IndexOf;
Go

/*

print dbo.fn_IndexOf('Teste-Teste','-')

print dbo.fn_IndexOf('ABBB','B')

*/
Create  Function fn_IndexOf(@Palavra Varchar(1000), @Caracter Varchar(1000)) Returns Int
Begin
	
	-----------------------------------------------------------------
	--    A função recebe uma palavra, um caracter e retorna a po- --
	-- sição do caracter na palavra.							   --
	-----------------------------------------------------------------

	-- Declarar variáveis -------------------------------------------
    Declare @Ct			 AS int 
	Declare @Indice		 As int 
    Declare @IndiceArray AS int

    Set @Palavra = ltrim(Rtrim(@Palavra));
    
	-- Seta null ao indice ------------------------------------------
	Set @Ct = 0;
	Set @Indice = Null;

	-- Obtém o indice -----------------------------------------------
    While (@Ct <= Len(@Palavra))
		Begin
  
			If Substring(@Palavra, @Ct, Len(@Caracter)) = @Caracter
				Begin
					-------------------------------------------------
					--    Obtém o índice da primeira vez que o ca- --
					-- ractere aparece.							   --
					-------------------------------------------------
					If @Indice Is Null
						Set @Indice = @Ct;

				End
			
			Set @Ct = @Ct + 1;

		End
	
	-- Retorna o índice ---------------------------------------------
	Return  IsNull(@Indice,0);

End
