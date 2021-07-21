Drop Table if Exists TB_Categoria;
Drop Table if Exists TB_Produto;
Go

Create Table TB_Categoria (
ID_Categoria Int Identity(1,1),
Ds_Categoria VarChar (100),
Primary Key (ID_Categoria)
);


Create Table TB_Produto (
ID_Produto Int Identity(1,1),
Ds_Produto VarChar (200),
Qt_Estoque Int Default 0,
ID_Categoria Int,
Primary Key (ID_Produto),
Foreign Key (ID_Categoria)
	References TB_CAtegoria(ID_Categoria)
);
Go

Insert Into TB_Categoria(Ds_Categoria) Values ('Graos');
Insert Into TB_Categoria(Ds_Categoria) Values ('Pereciveis');

Insert Into TB_Produto(Ds_Produto, ID_Categoria, Qt_Estoque) Values ('ARROZ', 1, 100)
Insert Into TB_Produto(Ds_Produto, ID_Categoria, Qt_Estoque) Values ('feijao',1 ,50)

Insert Into TB_Produto(Ds_Produto, ID_Categoria) Values ('Leite Tipo A', 2)