/* Script Original */
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

/* Correção */

/*
(Q01) CRUD para TB_CategoriaPDV
Dados para Cadastro: 'Bebida' e 'Lanches'
*/
Insert Into TB_CategoriaPDV(Ds_Categoria)
	Values('Bebids');

Insert Into TB_CategoriaPDV(Ds_Categoria)
	Values('Lanches');

--Exibir dados de Categoria
Select ID_Categoria, Ds_Categoria
    From TB_CategoriaPDV
    Where St_Ativo='A';

--Update dos dados de Categoria
Update    TB_CategoriaPDV
	Set   Ds_Categoria = 'Bebidas'
	Where ID_Categoria = 1;

--Eliminação física dos dados de Categoria
Delete From TB_CategoriaPDV
	Where ID_Categoria = 9999;



/*
(Q02) CRUD para TB_SubCategoriaPDV
Dados para Cadastro: para a categoria Lanches terá 'Burguer' e 'Salgados'
*/

Insert Into TB_SubCategoriaPDV(Ds_SubCategoria, ID_Categoria)
	Values('Burguer', 2);

Insert Into TB_SubCategoriaPDV(Ds_SubCategoria, ID_Categoria)
	Values('Salgados', 2);

--Exibir dados de SubCategoria
Select SubC.ID_SubCategoria, SubC.Ds_SubCategoria, Cat.Ds_Categoria
    From TB_SubCategoriaPDV SubC
	Inner Join TB_CategoriaPDV Cat
	  On Cat.ID_Categoria = SubC.ID_Categoria
    Where St_Ativo='A';

--Update dos dados de Categoria
Update    TB_CategoriaPDV
	Set   Ds_Categoria = 'Burguer'
	Where ID_Categoria = 1;

--Eliminação física dos dados de Categoria
Delete From TB_SubCategoriaPDV
	Where ID_SubCategoria = 9999;

/*
(Q03) CRUD para TB_ProdutoPDV
Dados para Cadastro: Ds: 'X-Burguer', PDV: 'XBurguer', Subcateg 'Burguer', 
	estoque de 1, a R$ 8,00
*/

Insert Into TB_ProdutoPDV(Ds_Produto, Ds_ProdutoPDV, ID_SubCategoria, Qt_Estoque, Pr_Venda)
	Values('X-Burguer', 'XBurguer', 1, 1, 8.00 )

--Exibir dados
Select P.ID_Produto, P.Ds_ProdutoPDV, Cat.ID_Categoria, Cat.Ds_Categoria, 
       SubC.ID_SubCategoria, Ds_SubCategoria
    From TB_ProdutoPDV P
	Inner Join TB_SubCategoriaPDV SubC
	  On P.ID_SubCategoria = SubC.ID_SubCategoria
	Inner Join TB_CategoriaPDV Cat
	  On Cat.ID_Categoria = SubC.ID_Categoria
    Where P.St_Ativo='A';


--Update dos dados de Categoria
Update    TB_Produto
	Set   Ds_Produto = 'Bebidas'
	    , Qt_Estoque = 1
	Where ID_Produto = 1;

--Eliminação física dos dados de Categoria
Delete From TB_Produto
	Where ID_Produto = 9999;





/*
(Q04) Exibir os produtos, categoria e subcategorias
*/


Select P.ID_Produto, P.Ds_ProdutoPDV, Cat.ID_Categoria, Cat.Ds_Categoria, 
       SubC.ID_SubCategoria, Ds_SubCategoria
    From TB_ProdutoPDV P
	Inner Join TB_SubCategoriaPDV SubC
	  On P.ID_SubCategoria = SubC.ID_SubCategoria
	Inner Join TB_CategoriaPDV Cat
	  On Cat.ID_Categoria = SubC.ID_Categoria
    Where P.St_Ativo='A';

