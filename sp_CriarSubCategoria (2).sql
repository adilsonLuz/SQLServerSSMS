Drop Table If Exists TB_SubCategoria;
Go

Create Table TB_SubCategoria(
  ID_SubCategoria Int,
  Ds_SubCategoria varchar(100),
  ID_Categoria Int,
  Primary Key (ID_SubCategoria)
  )
Go

Insert into TB_SubCategoria (ID_SubCategoria, Ds_SubCategoria, ID_Categoria)
	Values (100, 'PARBORIZADO', 10);

Insert into TB_SubCategoria (ID_SubCategoria, Ds_SubCategoria, ID_Categoria)
	Values (101, 'TIPO1', 10);


Select * From TB_SubCategoria



