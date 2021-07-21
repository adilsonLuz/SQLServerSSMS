/*
Trabalho Function
Adilson da Silva Luz R.A.: 2830481921027 4� ADS
*/

-- excluindo fun��es se existirem
Drop Function If Exists fn_PossuiNumero;
Drop Function If Exists fn_PossuiAlfa;
Drop Function If Exists fn_PossuiEspecial;
Drop Function If Exists fn_ValidarSenha;
Drop Function If Exists fn_LimparStr;
Drop Function If Exists fn_ValidarCNPJ;
Drop Function If Exists fn_ValidarCPF;
Go


--> 0 para n�o possui ou a posi��o da primeira ocorr�ncia
-- Criando fun��o POSSUI NUMERO
/*Create Function fn_PossuiNumero(@pDs_Str Varchar(200)) Returns Int
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
End*/
-- print AulaLabBanco.dbo.fn_PossuiNumero('adil6sso6')





--> 0 para n�o possui ou a posi��o da primeira ocorr�ncia (Alfabetico)

/*Create Function fn_PossuiAlfa(@pDs_Str Varchar(200)) Returns Int
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
End*/
--print dbo.fn_PossuiAlfa('1541l6ssod6')





--> 0 para n�o possui ou a posi��o da primeira ocorr�ncia
--> acentos, cedilha e * / ; : \ _ = + - " ' ( )

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





--> 1 para v�lido ou 0 para inv�lido (possuir ao menos 1 N�mero, 1 Alpha e 1 Caracter especial)

/*Create Function fn_ValidarSenha(@pDs_Senha Varchar(10), @senha Varchar(200)) Returns Int
Begin
End*/
-- print AulaLabBanco.dbo.fn_ValidarSenha('Ad1l&on', 'A1&')





/*--> String sem acentos, cedilha e * / ; : \ _ = + - " '  � � ( )
-- Relembrar Replace()    � => a        * => <vazio>
-- Injection SQL
--	Select Name from SysObjects where name like 'TB%'

Create Function fn_LimparStr(@pDs_Str Varchar(200), @Limpar Varchar(200)) Returns Int
Begin


End



--> 1 para v�lido ou 0 para inv�lido

Create Function fn_ValidarCNPJ( @pNr_CNPJ Varchar(14), @CNPJ Varchar(14)) returns Int
Begin


End



-- Top Dicas:

-- C�lculo: http://www.cadcobol.com.br/calcula_cpf_cnpj_caepf.htm
-- Resto da Divis�o: % // Exemplo: select  222 % 11 -- resto 2
--> 1 para v�lido ou 0 para inv�lido

Create Function fn_ValidarCPF( @pNr_CPF Varchar(11), @CPF Varchar(11)) Returns Int
Begin


End*/