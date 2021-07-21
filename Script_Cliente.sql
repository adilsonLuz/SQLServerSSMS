-- Excluindo tablelas
Drop Table If Exists Tb_Cliente;
Go

Create Table TB_Cliente (
ID_Cliente   int Identity (1,1),
Nm_Cliente   VarChar      (100),
Ds_Email     VarChar      (100),
Nr_CPF       Numeric      ( 11),
Nr_Telefone  Varchar      ( 10)
	Primary Key (ID_Cliente)
);
Go


Insert Into TB_Cliente(Nm_Cliente, Ds_Email, Nr_CPF, Nr_Telefone) 
	Values ('Maria Angela Nascimento' , 'marangimento@gmail.com', 49857462512, 8841589634);
Insert Into TB_Cliente(Nm_Cliente, Ds_Email, Nr_CPF, Nr_Telefone) 
	Values ('Angela Maria Jesus'      , 'angemaresus@gmail.com' , 01648269813, 3237895412);
Insert Into TB_Cliente(Nm_Cliente, Ds_Email, Nr_CPF, Nr_Telefone) 
	Values ('José Arimateia Celestino', 'josarimeles@gmail.com' , 16948875932, 1528964782);
Insert Into TB_Cliente(Nm_Cliente, Ds_Email, Nr_CPF, Nr_Telefone) 
	Values ('Pedro Justino Alves    ' , 'pedralvesjus@gmail.com', 14589763255, 2198753214);
Insert Into TB_Cliente(Nm_Cliente, Ds_Email, Nr_CPF, Nr_Telefone) 
	Values ('Maria José de Paula'     , 'marosepau@gmail.com'   , 29455687531, 1136872030);