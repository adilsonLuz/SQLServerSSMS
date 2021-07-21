Drop Table if Exists TB_Produto;
Drop Table if Exists TB_Categoria;
Go

Create Table TB_Categoria (
	ID_Categoria Int Identity(1,1),
	Ds_Categoria Varchar(100) Not Null,

	Primary Key(ID_Categoria)
)

-- Exec sp_Sel_GridCliente

Create Table Tb_Produto (
	ID_Produto Int Identity(1,1),
	Ds_Produto Varchar(200) Not Null,
	Qt_Estoque Int Not Null Default 0,
	ID_Categoria Int Not Null,

	Primary Key(ID_Produto),
	Foreign Key(ID_Categoria)
		References TB_Categoria(ID_Categoria)
);

Insert Into TB_Categoria(Ds_Categoria) Values('Graos');
Insert Into TB_Categoria(Ds_Categoria) Values('Pereciveis');

Insert into Tb_Produto(Ds_Produto, ID_Categoria, Qt_Estoque) Values('Arroz', 1, 100);
Insert into Tb_Produto(Ds_Produto, ID_Categoria, Qt_Estoque) Values('Feijão', 1, 50);
Insert into Tb_Produto(Ds_Produto, ID_Categoria, Qt_Estoque) Values('Lentilha', 1, 0);
Insert into Tb_Produto(Ds_Produto, ID_Categoria, Qt_Estoque) Values('Leite', 2, 238);


Select * From Tb_Produto
Select * From TB_Categoria


    
-- sp_Sel_ClienteEspecifico  OK
    
-- sp_Ins_Cliente  OK
    
-- sp_Upd_Cliente
    
-- sp_Del_Cliente