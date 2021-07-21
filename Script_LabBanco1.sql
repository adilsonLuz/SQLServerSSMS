/*
Name: DB_LabBanco.sql
Author: Adilson luz
Date: 19/02/2021
Description: produção
*/

--Apagando tabelas
Drop Table If Exists TB_OrdemProdução;
Drop Table If Exists TB_Produto;
Drop Table If Exists TB_SubProduto;
Drop Table If Exists TB_Composição;

--Criando Tabelas
Create Table TB_Produto(
ID_Produto  Int Identity   (1,1),
Ds_Produto  VarChar        ( 10),
Pr_Venda    Numeric        (7,2),
Pr_Custo    Numeric        (7,2),
Qt_Estoque  Numeric        ( 10),
	Primary Key(ID_Produto),
);
Go

Create Table TB_SubProduto(
ID_SubProduto  Int Identity   (1,1),
Ds_Produto     VarChar        (10),
Pr_Custo       Numeric        (7,2),
Qt_Estoque     Numeric        (10),
	Primary Key(ID_SubProduto),
);
Go

Create Table TB_Composição(
ID_Produto int,
ID_SubProduto int,
);
Go

Create Table TB_OrdemProdução(
ID_Op       Int Identity        (1001,1),
Dt_Op       Date Default GetDate(      ),
Qt_Prod     Numeric             (    10),
ID_Produto  Int                         ,
	Primary Key(ID_Op),
	Foreign Key(ID_Produto)
		References TB_Produto(ID_Produto)
);
Go

--Inserindo dados na tabela Produto
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Custo, Qt_Estoque) 
	Values('Produto1', 200.00, 100.00, 0);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Custo, Qt_Estoque) 
	Values('Produto2',  60.00,  20.00, 0);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Custo, Qt_Estoque) 
	Values('Produto3',  70.00,  40.00, 0);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Custo, Qt_Estoque) 
	Values('Produto4', 150.00, 120.00, 0);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Custo, Qt_Estoque) 
	Values('Produto5', 220.00, 150.00, 0);

--Inserindo dados na tabela SubProduto
Insert Into TB_SubProduto(Ds_Produto, Pr_Custo, Qt_Estoque) 
	Values('PARAFUSO1',  0.5, 400);
Insert Into TB_SubProduto(Ds_Produto, Pr_Custo, Qt_Estoque) 
	Values('TAMPAO',    5.00,  30);
Insert Into TB_SubProduto(Ds_Produto, Pr_Custo, Qt_Estoque) 
	Values('PERFIL U',  10.00,  20);
Insert Into TB_SubProduto(Ds_Produto, Pr_Custo, Qt_Estoque) 
	Values('PERFIL T',  10.00,  20);
Insert Into TB_SubProduto(Ds_Produto, Pr_Custo, Qt_Estoque) 
	Values('PARAFUSO2',   0.6, 300);

--Inserindo dados na tabela Composição
Insert Into TB_Composição(ID_Produto, ID_SubProduto) 
	Values(1,1);
Insert Into TB_Composição(ID_Produto, ID_SubProduto) 
	Values(1,2);
Insert Into TB_Composição(ID_Produto, ID_SubProduto) 
	Values(1,4);
Insert Into TB_Composição(ID_Produto, ID_SubProduto) 
	Values(2,1);
Insert Into TB_Composição(ID_Produto, ID_SubProduto) 
	Values(2,5);
Insert Into TB_Composição(ID_Produto, ID_SubProduto) 
	Values(3,5);
Insert Into TB_Composição(ID_Produto, ID_SubProduto) 
	Values(4,1);
Insert Into TB_Composição(ID_Produto, ID_SubProduto) 
	Values(4,2);
Insert Into TB_Composição(ID_Produto, ID_SubProduto) 
	Values(4,3);
Insert Into TB_Composição(ID_Produto, ID_SubProduto) 
	Values(4,4);
Insert Into TB_Composição(ID_Produto, ID_SubProduto) 
	Values(4,5);
Insert Into TB_Composição(ID_Produto, ID_SubProduto) 
	Values(5,3);

-- Inserindo dados na tabela Ordem Produção
Insert Into TB_OrdemProdução(Dt_Op, Qt_Prod, ID_Produto)
	Values('2020-02-10', 1, 1);
Insert Into TB_OrdemProdução(Dt_Op, Qt_Prod, ID_Produto)
	Values('2020-02-12', 2, 2);
Insert Into TB_OrdemProdução(Dt_Op, Qt_Prod, ID_Produto)
	Values('2020-02-23', 4, 1);
Insert Into TB_OrdemProdução(Dt_Op, Qt_Prod, ID_Produto)
	Values('2020-02-28', 1, 2);
Insert Into TB_OrdemProdução(Dt_Op, Qt_Prod, ID_Produto)
	Values('2020-02-01', 3, 3);

--(Q01) Listar todas as Op's que produziram o produto1

Select op.ID_Op,
    Convert(VarChar(10), op.Dt_Op, 103) As Dt_Op,
	op.Qt_Prod, op.ID_Produto
	From TB_OrdemProdução As op
	where ID_Produto = 1
	Order By op.ID_Produto

--(Q02) Listar todos os produtos que forem vendidos com margem maior que 10%

Select prod.ID_Produto, prod.Ds_Produto, prod.Pr_Venda
	From TB_Produto As prod
	where prod.Pr_Venda > (prod.Pr_Custo * 1.1)
	Order By prod.ID_Produto

--(Q03) Listar todas as Op's que usarem o SubProduto 2

Select op.ID_Op, Convert(VarChar(10), op.Dt_Op, 103) As Dt_Op, op.Qt_Prod,
	ID_Produto
	From TB_OrdemProdução As op
	where ID_Produto = 2
	Order By op.ID_Op

--(Q04) Listar Todos os produtos e suas Op's se houverem!

Select prod.ID_Produto, prod.Ds_produto, prod.Pr_Venda, Prod.Pr_Custo,
	   prod.Qt_Estoque, IsNull(op.ID_Op,0) As ID_Op,
	   IsNull(Convert(VarChar(10), op.Dt_Op, 103),'-  -  -  -') As Dt_Op,	   
	   --IsNull(op.Dt_Op,0) As Dt_Op,
	   IsNull(op.Qt_Prod,0) As Qt_Prod
	   From TB_Produto As prod
	   Left Join TB_OrdemProdução As op
	   on prod.ID_Produto = op.ID_Produto
	   Order By prod.ID_Produto

/*(Q05) Listar todos os produtos que tenham o resultado final (Pr_Venda-Pr_Custo) 
        maior ou igual a 100 (Relatorio de curva ABC, Provavel produto A)*/

Select p.ID_Produto, p.Ds_Produto, p.Pr_Venda, p.Pr_Custo, p.Qt_Estoque
	  From TB_Produto As p
      Where Pr_Venda - Pr_Custo >= 100
	  Order By p.ID_Produto
			
/*(Q06) Listar todos os produtos que tenham o resultado final entre 50 e 90 
        (Relatorio de curva ABC, Provavel produto B)*/

Select p.ID_Produto, p.Ds_Produto, p.Pr_Venda, p.Pr_Custo, p.Qt_Estoque
	  From TB_Produto As p
	  Where Pr_Venda - Pr_Custo Between 50 and 90
	  Order By p.ID_Produto

/*(Q07) Listar todos os produtos que tenham o resultado final inferior a 50
        (Relatorio de curva ABC, Provavel produto C)*/

Select p.ID_Produto, p.Ds_Produto, p.Pr_Venda, p.Pr_Custo, p.Qt_Estoque
	  From TB_Produto As p
	  Where Pr_Venda - Pr_Custo < 50
	  Order By p.ID_Produto

/*(Q08) Listar as Op's, seus produtos (descrição e estoque) e seus SubProdutos (descrição e estoque)*/

Select op.ID_Op, Convert(VarChar(10), op.Dt_Op, 103) As DT_Op,
	  op.Qt_Prod, p.ID_Produto, p.Ds_Produto, p.Pr_Venda, p.Pr_Custo, p.Qt_Estoque,
	  su.ID_SubProduto, su.Ds_Produto
	  From TB_OrdemProdução As op
	  Left Join TB_Produto As p
	  on op.ID_Produto = p.ID_Produto
	  Left Join TB_Composição As com
	  on p.ID_Produto = com.ID_Produto
	  Left Join TB_SubProduto AS su
	  on su.ID_SubProduto = com.ID_SubProduto
	  Order By op.ID_Op



