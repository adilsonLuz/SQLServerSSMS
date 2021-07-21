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
--Insert Into TB_SubCategoria(Ds_SubCategoria, ID_Categoria) Values ('Lanches',		1)


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

/* Relação

TB_Cliente		(1,0/n) TB_Venda
TB_Venda		(1,n)	TB_VendaItem
TB_VendaItem	(0/1,n) TB_Produto  
TB_Produto		(n,1)	TB_SubCategoria
TB_SubCategoria (n,1)	TB_Categoria

*/


Select VI.ID_Venda, Sum(VI.Vl_Subtotal) As Vl_Total
From TB_VendaItem As VI
Group By VI.ID_Venda


Select P.ID_Produto, IsNull(Sum(VI.Qt_Produto),0) As Qt_Vendida
   From TB_Produto P
   Left Join TB_VendaItem VI
      On P.ID_Produto = VI.ID_Produto
   Group By P.ID_Produto 

-- IsNull() => MSSQL // NVL() => Oracle


Select Top 2
        Ds_Produto
   From TB_Produto P
   Order By P.Ds_Produto Desc

-- Maior Vnd
   Select Top 1 Vl_Venda
     From TB_Venda As V
	 Order By Vl_Venda Desc

-- Menor Vnd
   Select Top 1 Vl_Venda
     From TB_Venda As V
	 Order By Vl_Venda 



Select 'Maior Venda' As Ds_Item
       , (Select Top 1 Vl_Venda
            From TB_Venda As V
	        Order By Vl_Venda Desc) As Vl_Vendida

Union

Select 'Menor Venda' As Ds_Item
     , (Select Top 1 Vl_Venda
           From TB_Venda As V
	       Order By Vl_Venda ) As Vl_Vendida

Union

Select 'Média', 100



-- Não cai na prova! [
Declare @Vl_TotalVenda Numeric(10,2);

Set @Vl_TotalVenda = (Select Sum(VI.Vl_Subtotal) From TB_VendaItem As VI Where VI.ID_Venda = 1001)

Update TB_Venda 
	Set Vl_Venda = @Vl_TotalVenda
	Where ID_Venda = 1001
-- ]


/*

-- Totalizando por Venda

-- Top / Count / Avg
-- Select Cols
-- Select Select
-- Union  
*/




/*

-- Qtos clientes existem?
Select Count(*) As Qt_Clientes
From TB_Cliente

*/

-- (Q01) Quais os clientes mais lucrativos? (5 primeiros)
Select Top 5

-- (Q02) Qual o total de produtos (QT) vendidos por categoria?
	-- R$?

-- (Q03) Quais a média dos tickets de vendas?

-- (Q04) Quais a média de itens vendidas por tickets?

-- (Q05) Quais os 2 produtos mais vendidos?

