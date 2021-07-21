Drop Table If Exists TB_Categoria;
Go

Create Table TB_Categoria(
  ID_Categoria Int,
  Ds_Categoria varchar(100),
  ID_SubCategoria Int,
  Primary Key (ID_Categoria)
  )
Go

Insert into TB_Categoria (ID_Categoria, Ds_Categoria, ID_SubCategoria)
	Values (10, 'GRAOS', 100);

Insert into TB_Categoria (ID_Categoria, Ds_Categoria, ID_SubCategoria)
	Values (10, 'GRAOS', 101); -- ERRO!


Select * From TB_Categoria



