Drop Procedure If Exists sp_CriarEstrutura;
Go

Create Procedure sp_CriarEstrutura As
Begin

	Drop Table If Exists TB_Cliente;

	Create Table TB_Cliente (
	  ID_Cliente Int identity(1,1),
	  Nm_Cliente Varchar(250) Not Null,
	  Nr_telefone Varchar(20),
	  Primary Key (ID_Cliente)
	);

End;


Select * From TB_Cliente;