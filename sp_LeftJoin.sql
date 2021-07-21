-- Eliminar tabelas se existirem
Drop Table If Exists TB_VendaItem;
Drop Table If Exists TB_Venda;
Drop Table If Exists TB_Cliente;
Drop Table If Exists TB_Produto;
Drop Table If Exists TB_SubCategoria;
Drop Table If Exists TB_Categoria;
Go

-- Criação...
Create Table TB_Cliente (
   ID_Cliente Int Identity(1,1)
   , Nm_Cliente Varchar(200)
   , Primary key (ID_Cliente)
);


Create Table TB_Categoria (
	ID_Categoria Int Identity(1,1),
	Ds_Categoria Varchar(100),
	Primary Key (ID_Categoria)
);

Create Table TB_SubCategoria (
	ID_SubCategoria Int Identity(10,1),
	Ds_SubCategoria Varchar(100),
	ID_Categoria Int,
	Primary Key (ID_SubCategoria),
	Foreign Key (ID_Categoria)
		References TB_Categoria(ID_Categoria)
);

Create Table TB_Produto (
	  ID_Produto Int Identity(100,1)
	, Ds_Produto Varchar(100)
	, ID_SubCategoria Int
	, Pr_Venda Numeric(7,2)
	, Primary Key (ID_Produto)
	, Foreign Key (ID_SubCategoria)
		References TB_SubCategoria(ID_SubCategoria)
);

Create Table TB_Venda (
   ID_Venda Int Identity(1000,1)
   , ID_Cliente Int
   , Vl_Venda Numeric(12,2)
   , Primary Key (ID_Venda)
   , Foreign Key (ID_Cliente)
        References TB_Cliente(ID_Cliente)
);

Create Table TB_VendaItem (
   ID_VendaItem Int Identity(1,1)
   , ID_Venda Int
   , ID_Produto Int
   , Qt_Produto Numeric(6,2)
   , Pr_Venda Numeric(10,2)
   , Vl_SubTotal As (Qt_Produto * Pr_Venda) 
   , Primary Key (ID_VendaItem)
   , Foreign Key (ID_Venda)
        References TB_Venda(ID_Venda)
   , Foreign Key (ID_Produto)
        References TB_Produto(ID_Produto)
);

Go

-- Inserindo dados...

-- Cliente
Insert Into TB_Cliente (Nm_Cliente) Values ('JOAO');
Insert Into TB_Cliente (Nm_Cliente) Values ('MARIA');
Insert Into TB_Cliente (Nm_Cliente) Values ('MARCOS');
Insert Into TB_Cliente (Nm_Cliente) Values ('ANA');


-- Categ
Insert Into TB_Categoria(Ds_Categoria) Values ('Padaria');
Insert Into TB_Categoria(Ds_Categoria) Values ('Açougue');

-- SubCateg
Insert Into TB_SubCategoria(Ds_SubCategoria, ID_Categoria) Values ('Pão Salgado',   1)
Insert Into TB_SubCategoria(Ds_SubCategoria, ID_Categoria) Values ('Pão Doce',		1)
Insert Into TB_SubCategoria(Ds_SubCategoria, ID_Categoria) Values ('Carne Bovina',	2)
Insert Into TB_SubCategoria(Ds_SubCategoria, ID_Categoria) Values ('Carne Suina',	2)
Insert Into TB_SubCategoria(Ds_SubCategoria, ID_Categoria) Values ('Lanches',     	1)


-- Produtos
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Pr_Venda) 
	Values ('Pão Frances',	10, 16);	-- 100
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Pr_Venda) 
	Values ('Bronha',		10, 20);	-- 101
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Pr_Venda) 
	Values ('Coxao Mole',	12, 40);	-- 102
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Pr_Venda) 
	Values ('Coxão Duro',	12, 35);	-- 103
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Pr_Venda) 
	values ('Picanha',		12, 50);	-- 104

Select * From TB_Produto


-- Vendas
Insert Into TB_Venda (ID_Cliente, Vl_Venda) Values (1, 100.00);
Insert Into TB_Venda (ID_Cliente, Vl_Venda) Values (3, 157.80);
Insert Into TB_Venda (ID_Cliente, Vl_Venda) Values (1,   3.20);
Insert Into TB_Venda (ID_Cliente, Vl_Venda) Values (4, 212.60);

Select * From TB_Venda

-- VendasItem
Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1000, 100, 0.5, 16);
Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1000, 102, 2.3, 40);

Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1001, 100, 0.3, 16);
Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1001, 104, 2.1, 50);
Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1001, 102, 1.2, 40);

Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1002, 100, 0.2, 16);

Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1003, 100, 1.1, 16);
Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1003, 104, 2.1, 50);
Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1003, 102, 1.2, 40);
Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1003, 101, 2.1, 20);

Select * from TB_VendaItem












-- Totalizando por Venda
Select Max(ID_Venda) As ID_Venda, 
       Sum(Vl_SubTotal) as Vl_SubTotal
From TB_VendaItem
Group By ID_Venda








-- Categorias e subCategoria (1 => N)

Select		Categ.ID_Categoria, Categ.Ds_Categoria,
			SubCateg.ID_SubCategoria, SubCateg.Ds_SubCategoria
	
	From	TB_Categoria As Categ
	
	Inner Join TB_SubCategoria As SubCateg
		On Categ.ID_Categoria = SubCateg.ID_Categoria



-- -----------------------------------------------
-- Produto (1 =>N) SubCategoria (N => 1) Categoria
-- -----------------------------------------------
Select	Prod.ID_Produto, Prod.Ds_Produto, SubC.ID_SubCategoria, SubC.Ds_SubCategoria, 
		Cat.ID_Categoria, Cat.Ds_Categoria
				
		From	TB_Produto As Prod

		Inner Join TB_SubCategoria As SubC
			On Prod.ID_SubCategoria = SubC.ID_SubCategoria

		Inner Join TB_Categoria As Cat
			On SubC.ID_Categoria = Cat.ID_Categoria

		Order By Prod.Ds_Produto DESC -- Default ASC

/* Relação

TB_Cliente		(1,0/n) TB_Venda
TB_Venda		(1,n)	TB_VendaItem
TB_VendaItem	(0/1,n) TB_Produto  
TB_Produto		(n,1)	TB_SubCategoria
TB_SubCategoria (n,1)	TB_Categoria

*/

-- Clientes e Vendas
Select C.ID_Cliente, C.Nm_Cliente, V.ID_Venda
  From TB_Cliente As C
  Inner Join TB_Venda As V
	On C.ID_Cliente = V.ID_Cliente
  Order By ID_Cliente

-- Qtos clientes existem?
Select Count(*) As Qt_Clientes
From TB_Cliente

Select Distinct C.ID_Cliente, C.Nm_Cliente
  From TB_Cliente As C
  Inner Join TB_Venda As V
	On C.ID_Cliente = V.ID_Cliente
  Order By ID_Cliente

/*
Inner => igual! Existir
Left => Esq=>Dir => Independente se existir
*/

-- Mostrar TUDO
Select C.ID_Cliente, C.Nm_Cliente, V.ID_Venda
  From TB_Cliente As C
  Left Join TB_Venda As V
	On C.ID_Cliente = V.ID_Cliente
  Order By ID_Cliente



  -- Atividade

  -- Mostrar (ID/Ds):

 -- (a) Categoria => SubCategoria => Produto
Select	Cat.ID_Categoria, Cat.Ds_Categoria, SubC.ID_SubCategoria, SubC.Ds_SubCategoria, Prod.ID_Produto, Prod.Ds_Produto
						
		From	TB_Categoria As Cat

		Left Join TB_SubCategoria As SubC
			On Cat.ID_Categoria = SubC.ID_Categoria
			
		Left Join TB_Produto As Prod
			On SubC.ID_SubCategoria = Prod.ID_SubCategoria

		Order By ID_Categoria
		
		
-- (b) Cliente => Produto
Select c.ID_cliente, c.Nm_cliente, 
	   p.ID_Produto, p.Ds_Produto
	   	From TB_Cliente As c
	Left Join TB_Venda As v
		on c.ID_Cliente = v.ID_Cliente
	Left Join TB_VendaItem As vi
		on v.ID_Venda = vi.ID_Venda
	Left Join TB_Produto As p
		on vi.ID_Produto = p.ID_Produto
	Order By ID_Cliente, ID_Produto;

-- (c) Cliente => Categoria (sem repetição)

Select Distinct c.ID_Cliente, c.Nm_Cliente,
	            ca.ID_Categoria, ca.Ds_Categoria
	   From TB_Cliente As c
	Left Join TB_Venda As v
		on c.ID_Cliente = v.ID_Cliente
	Left Join TB_VendaItem As vi
		on v.ID_Venda = vi.ID_Venda
	Left Join TB_Produto As p
		on vi.ID_Produto = p.ID_Produto
	Left Join TB_SubCategoria As sc
		on p.ID_SubCategoria = sc.ID_SubCategoria
	Left Join TB_Categoria As ca
		on ca.ID_Categoria = sc.ID_Categoria
	Order By ID_Cliente, ID_Categoria;
