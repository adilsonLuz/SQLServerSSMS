/*
	Name: fn_ValidarSenha
	Author: Adilson da Silva Luz
	Date: 26/03/21 10:00
	Description: Verifica se a senha passada por paramentro para a function contém ao menos
				 1 número, 1 caracteres alfabetico e 1 caracter especial retornando 1 para válido 
				 ou 0 para inválido.
*/

Drop Function If Exists fn_ValidarSenha;
Go
--> 1 para válido ou 0 para inválido (possuir ao menos 1 Número, 1 Alpha e 1 Caracter especial)

Create Function fn_ValidarSenha(@pDs_Senha Varchar(10)) Returns Int
Begin

	If dbo.fn_PossuiNumero(@pDs_Senha)>0
	   And dbo.fn_PossuiAlfa(@pDs_Senha)>0
	   And dbo.fn_PossuiEspecial(@pDs_Senha)>0
	   Begin
			return 1;
	   End;
	   return 0;
End
-- print AulaLabBanco.dbo.fn_ValidarSenha('4di1&03')