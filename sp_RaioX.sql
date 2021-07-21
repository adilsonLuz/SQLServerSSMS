Drop Procedure If Exists sp_RaioX;
Go

Create procedure sp_RaioX As
Begin

Select
	(Select Count(*) From TB_Cliente)			  As Nr_TotalRegs,
	(Select Max(Vl_UltimaCompra) From TB_Cliente) As Vl_Maximo,
	(Select Sum(Vl_UltimaCompra) From TB_Cliente) As Vl_SomaCompras,
	(Select AVG(Vl_UltimaCompra) From TB_Cliente) As Vl_MediaCompras

End;
Go

Exec sp_RaioX


Drop Table If Exists TB_cliente;
Go

Create Table TB_Cliente (
ID_Cliente Int identity (1,1),
Nm_Cliente Varchar (100),
Nr_ComprasRealizadas Int Default 0,
Vl_UltimaCompra Numeric(10,2),
	Primary Key (ID_Cliente)
);
Go

Insert Into TB_Cliente (Nm_Cliente,Nr_ComprasRealizadas, Vl_UltimaCompra)
Values ('Matheus', 5, 4.20)

Insert Into TB_Cliente (Nm_Cliente,Nr_ComprasRealizadas, Vl_UltimaCompra)
Values ('Julio', 2, 10.20)

Insert Into TB_Cliente (Nm_Cliente,Nr_ComprasRealizadas, Vl_UltimaCompra)
Values ('Jefferson', 7, 19)

Insert Into TB_Cliente (Nm_Cliente,Nr_ComprasRealizadas, Vl_UltimaCompra)
Values ('Maria', 3, 3)

Select * from TB_Cliente