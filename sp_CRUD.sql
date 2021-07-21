Drop Table If Exists TB_ProdutoPDV;
Drop Table If Exists TB_SubCategoriaPDV;
Drop Table If Exists TB_CategoriaPDV;
Go

Create Table TB_CategoriaPDV (
	ID_Categoria int identity(1,1),
	Ds_Categoria varchar(100),
	St_Ativo Char Default 'A',
	Primary Key (ID_Categoria)
);

Create Table TB_SubCategoriaPDV (
	ID_SubCategoria int identity(1,1),
	Ds_SubCategoria varchar(100),
	ID_Categoria int,
	St_Ativo Char Default 'A',
	Primary Key (ID_SubCategoria),
	Foreign key (ID_Categoria)
	   References TB_CategoriaPDV(ID_Categoria)
);


Create Table TB_ProdutoPDV (
	ID_Produto int identity(1,1),
	Ds_Produto varchar(100),
	Ds_ProdutoPDV Varchar(10),
	ID_SubCategoria int,
	Qt_Estoque int Default 0,
	St_Ativo Char Default 'A',
	Pr_Venda numeric(6,2)
	Primary Key (ID_Produto)
);
Go

-- Q01

Insert Into TB_CategoriaPDV(Ds_Categoria)
	Values('Bebida')
Insert Into TB_CategoriaPDV(Ds_Categoria)
	Values('Lanche')

Select PDV.Ds_Categoria, PDV.St_Ativo

	From TB_CategoriaPDV As PDV



-- Q02

Insert Into TB_SubCategoriaPDV(Ds_SubCategoria, ID_Categoria, St_Ativo)
	Values('Burguer', 2, '')
Insert Into TB_SubCategoriaPDV(Ds_SubCategoria, ID_Categoria, St_Ativo)
	Values('Salgado', 2, '')

--Q03

Insert Into TB_ProdutoPDV(Ds_Produto, Ds_ProdutoPDV, ID_SubCategoria, Qt_Estoque, Pr_Venda)
	Values('X-Burguer', 'Xburguer', 1, 1, 8.00)

--Q04

Select PDV.Ds_Produto, Categ.Ds_Categoria, SubCateg.Ds_SubCategoria, PDV.St_Ativo

	From TB_ProdutoPDV As PDV

	Inner Join TB_SubCategoriaPDV As SubCateg
		On PDV.ID_SubCategoria = SubCateg.ID_SubCategoria
	Inner Join TB_CategoriaPDV As Categ
		On Categ.ID_Categoria = SubCateg.ID_Categoria
		where PDV.St_Ativo = 'A'