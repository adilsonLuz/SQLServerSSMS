/*
Name: DB_TrabalhoN2.sql
Author: Adilson luz
Date: 06/11/2020
Description: O script visa simular um sistema de vendas (ERP) de uma 
			 empresa de produtos de informatica.
*/

-- Apagando tabelas existentes
Drop Table If Exists TB_Cliente;
Drop Table If Exists TB_NF;
Drop Table If Exists TB_NFItem;
Drop Table If Exists TB_Produto;
Go

--Criando tabelas
Create Table TB_Cliente(
ID_Cliente   Int Identity (1,1),
Nm_Cliente   VarChar      ( 50),
ID_UF        VarChar      (  2),
Nr_Telefone  VarChar      ( 10),
Nr_Celular   VarChar      ( 11),
	Primary Key(ID_Cliente),
);

Create Table TB_Produto(
ID_Produto   Int Identity (321,1),
Ds_Produto   VarChar      (  200),
Pr_Venda     Numeric      (  7,2),
Pr_Compra    Numeric      (  7,2),
Qt_Estoque   Int                 ,
	Primary Key(ID_Produto),
);

Create Table TB_NF(
Nr_NF        Int Identity (100101,1),
Dt_NF        Date Default GetDate (),
Vl_NF        Numeric      (     7,2),
ID_Cliente   int                    ,
	Primary Key(Nr_NF),
	Foreign Key(ID_Cliente)
		References TB_Cliente(ID_Cliente)
);

Create Table TB_NFItem(
ID_NFItem    Int Identity (1,1),
Nr_NFItem    Int               ,
Nr_NF        Int               ,
ID_Produto   Int               ,
Qt_Vendida   Int               ,
Pr_Unitario  numeric      (7,2),
Vl_SubTotal  As (Qt_Vendida * Pr_Unitario),
	Primary Key(ID_NFItem),
	Foreign Key(Nr_NF)
		References TB_NF(Nr_NF),
	Foreign Key(ID_Produto)
		References TB_Produto(ID_Produto)
);
Go

-- Inserindo dados na tabela cliente
Insert Into TB_Cliente(Nm_Cliente, ID_UF, Nr_Telefone, Nr_Celular) 
	Values('JOAO',     'SP', 1155880101, 1198800101);
Insert Into TB_Cliente(Nm_Cliente, ID_UF, Nr_Telefone, Nr_Celular) 
	Values('MARIA',    'MG', 1155880202, 1198800202);
Insert Into TB_Cliente(Nm_Cliente, ID_UF, Nr_Telefone, Nr_Celular) 
	Values('MARCOS',   'BA', 1155880303, 1198800202);
Insert Into TB_Cliente(Nm_Cliente, ID_UF, Nr_Telefone, Nr_Celular) 
	Values('ANTONIO',  'SP', 1155880404, 1198800303);
Insert Into TB_Cliente(Nm_Cliente, ID_UF, Nr_Telefone, Nr_Celular) 
	Values('GABRIELA', 'RJ', 1155880505, 1198800404);
	
-- Inserindo dados na tabela produto
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Compra, Qt_Estoque) 
	Values('MONITOR LCD LG',              250.00, 150.00,  20);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Compra, Qt_Estoque) 
	Values('MONITOR LCD PHILIPS',         300.00, 200.00,  15);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Compra, Qt_Estoque) 
	Values('IMPRESSORA EPSON MOD1',       150.00, 350.00,  10);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Compra, Qt_Estoque) 
	Values('HD Externo 1T SEAGATE',       320.00, 200.00, 100);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Compra, Qt_Estoque) 
	Values('HD Externo 2T SEAGATE',       399.90, 250.00,  50);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Compra, Qt_Estoque) 
	Values('HD INTERNO 4T SEAGATE BARRA', 679.90, 400.00, 120);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Compra, Qt_Estoque) 
	Values('CABO SATA PLUS',                3.90,   1.50, 500);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Compra, Qt_Estoque) 
	Values('CABO ADAPTADOR USB3 SSD',      49.90,  30.00,  10);

-- Inserindo dados na tabela NF
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente)
	Values('2020-11-01', 250.00, 1);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente)
	Values('2020-11-02',  78.00, 2);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente)
	Values('2020-11-02', 323.90, 3);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente)
	Values('2020-11-03', 679.90, 4);

-- Inserindo dados na tabela NFItem
Insert Into TB_NFItem(Nr_NFItem, Nr_NF, ID_Produto, Qt_Vendida, Pr_Unitario)
	Values(1, 100101, 321,  1, 250.00);
Insert Into TB_NFItem(Nr_NFItem, Nr_NF, ID_Produto, Qt_Vendida, Pr_Unitario)
	Values(1, 100102, 327, 20,   3.90);
Insert Into TB_NFItem(Nr_NFItem, Nr_NF, ID_Produto, Qt_Vendida, Pr_Unitario)
	Values(1, 100103, 324,  1, 320.00);
Insert Into TB_NFItem(Nr_NFItem, Nr_NF, ID_Produto, Qt_Vendida, Pr_Unitario)
	Values(2, 100103, 327,  1,   3.90);
Insert Into TB_NFItem(Nr_NFItem, Nr_NF, ID_Produto, Qt_Vendida, Pr_Unitario)
	Values(1, 100104, 326,  1, 679.90);

-- (Q01) Exiba todas as NF existentes.
Select nf.ID_Cliente,nf.Nr_NF, 
	   Convert(VarChar(10), nf.Dt_NF, 103) As Dt_NF,
	   nf.Vl_NF
	   From TB_NF As nf
	   Order By nf.ID_Cliente

-- (Q02) Altere o preço de venda para R$ 399,90 de todos os produtos que custarem R$ 410,00
UpDate TB_Produto
	set Pr_Venda = 399.90
		where Pr_Venda = 410.00
-- Não foi nenhuma linha alterada, pois não existe nenhum produto com preço de venda com valor de R$ 410,00

-- (Q03) Elimine o cliente MARCOS
Delete TB_Cliente
	where Nm_Cliente = 'MARCOS'
-- Impossivel excluir cliente pois o ID da tabela cliente é Foreing Key na TB_NF

-- (Q04) Liste todas as NFs em que o valor for superior a R$ 260,00
Select nf.ID_Cliente,nf.Nr_NF, 
	   Convert(VarChar(10), nf.Dt_NF, 103) As Dt_NF,
	   nf.Vl_NF
	   From TB_NF As nf
	where Vl_NF > 260.00
	Order By nf.Nr_NF

	-- (Q05) Altere a quantidade vendida para 21 e o subtotal da NF 100102 item comprado 327
Update TB_NFItem
	set Qt_Vendida = 21
	where Nr_NF = 100102 and ID_Produto = 327

-- (Q06) Atualize o valor total da NF 100102
Update TB_NF
	set Vl_NF = 81.90
	where Nr_NF = 100102

-- (Q07) Liste todos os clientes que forem de São Paulo
Select c.ID_Cliente, c.Nm_cliente, c.ID_UF
	From TB_Cliente As c
	where ID_UF = 'SP'
	Order By c.ID_Cliente

-- (Q08) Exiba todos os produtos que tiverem na sua descrição a palavra "HD"
Select p.ID_Produto, p.Ds_Produto
	From TB_Produto As p
	where Ds_Produto Like 'HD%'
	Order By p.ID_Produto

-- (Q09) Elimine todos os clientes que começarem por ‘G’
Delete TB_Cliente
	where Nm_Cliente Like 'G%'

-- (Q10) Elimine o produto 321
Delete TB_Produto
	where ID_Produto = 321
-- Não foi possivel excluir pois o ID do produto é Foreign Key na tabela NFItem

-- (Q11) Transforme todas as descrições dos produtos em maiúsculo
Update TB_Produto
	Set Ds_Produto = UPPER(Ds_Produto)

-- (Q12) Elimine todas as NF superior a R$ 690,00
Delete TB_NF
	where Vl_NF > 690.00
-- Nenhuma linha afetada pois não existem notas com valor maior que R$ 690,00

-- (Q13) Exiba o total de vendas do cliente 1
Select nf.ID_Cliente,  nf.Vl_NF
	From TB_NF As nf
	where ID_Cliente = 1
	Order By nf.ID_Cliente

-- (Q14) Liste a quantidade de clientes do Minas Gerais
Select Count(*) As Qt_ClienteMG
	From TB_Cliente
	where ID_UF = 'MG'
	
-- (Q15) Elimine todas as impressoras da EPSON do arquivo de produtos
Delete TB_Produto
	where Ds_Produto Like '%Impressora EPSON%'

-- (Q16) Liste todos os produtos que começarem por “C”
Select p.ID_Produto, p.Ds_Produto
	From TB_Produto As p
	where Substring(Ds_Produto, 1,1) = 'C'
	Order By p.ID_Produto

-- (Q17) Exclua todos os produtos que o preço de venda for entre R$ 1.000,00 e R$ 1.500,00
Delete TB_Produto
	where Pr_Venda Between 1000.00 and 1500.00
-- Nenhum item foi alterado, pois não existe nenhum produto na tabela produto com preço de venda entre R$ 1.000,00 e R$ 1.500,00

-- (Q18) Adicione 15% ao preço de venda do produto 321
Update TB_Produto
	set Pr_Venda = Pr_Venda * 1.15
	where ID_Produto = 321

-- (Q19) Liste todas os Números de NF que contiverem o número 101
Select nf.Nr_NF
	From TB_NF As nf
	where nf.Nr_NF Like '%101%'
	Order By nf.Nr_NF

-- (Q20) Elimine os itens da NF 100103
Delete TB_NFitem
	where Nr_NF = 100103

-- (Q21) Liste todas os Números de NF, Data de NF, Total da NF e o código do produto vendido e sua descrição
Select nf.Nr_NF,
	   Convert(VarChar(10), nf.Dt_NF, 103) As Dt_NF,
	   nf.Vl_NF,
	   IsNull(p.ID_Produto,0) As ID_Produto,
	   IsNull(p.Ds_produto,'') As Ds_Produto
	From TB_NF As nf
	Left Join TB_NFItem As nfi
	on nf.Nr_NF = nfi.Nr_NF
	Left Join TB_Produto As p
	on p.ID_Produto = nfi.ID_Produto
	Order By nf.Nr_NF

-- (Q22) Elimine a NF 100103
Delete TB_NF
	where Nr_NF = 100103

-- (Q23) Exiba o nome do cliente, a data da NF e o total da NF
Select c.ID_Cliente, c.Nm_Cliente,
	   IsNull(Convert(VarChar(10), nf.Dt_NF, 103),0) As Dt_NF,
	   IsNull(nf.Vl_NF,0) As Vl_NF
	From TB_Cliente As c
	Left Join TB_NF As nf
	on c.ID_Cliente = nf.ID_Cliente
	Order By c.ID_Cliente

-- (Q24) Elimine todos os clientes que tenham no nome a palavra MARCOS
Delete TB_Cliente
	where Nm_Cliente = 'MARCOS'

-- (Q25) Exiba o nome do cliente, seu telefone e celular formatados: (99) 9999-9999
Select c.ID_Cliente,
	   c.Nm_cliente,
	   '(' + SUBSTRING(c.Nr_Telefone,1,2) + ') ' +
        SUBSTRING(c.Nr_Telefone,3,4) + '-' +
        SUBSTRING(c.Nr_Telefone,7,4) As Nr_Telefone,
        '(' + SUBSTRING(c.Nr_Celular,1,2) + ') ' +
        SUBSTRING(c.Nr_Celular,3,4) + '-' +
        SUBSTRING(c.Nr_Celular,7,4) As Nr_Celular
	From TB_Cliente As c
	Order By ID_Cliente



-- Script resultado final

-- 1.	Qual o total em R$ de todas as Notas Fiscais?

Select 'Valor Todas NF' As Ds_Item,
	(Select 'R$ ' + Convert(VarChar(7), Sum(nf.Vl_NF)) 
	From TB_NF As nf) As Valores

	Union
-- 2.	Quantos clientes a empresa possui?

Select 'Total Cliente' As Ds_Item,
	(Select Convert(Varchar(50),Count(ID_Cliente))
	From TB_Cliente) As Valores

	Union

-- 3.	Se a empresa vendesse tudo quanto ela teria arrecadado?

Select 'Vl Arrecadado venda total' As Ds_Item,
	(Select 'R$ ' + Convert(VarChar(15), Sum(p.Pr_venda * p.Qt_Estoque)) 
	From TB_Produto As p) As Valores

	Union

-- 4.	Qual o lucro que ela teria se vendesse todos os HDs que tem no estoque?

Select 'Lucro Venda HDs' As Ds_Item,
	(Select 'R$ ' + Convert(VarChar(15), Sum((p.Pr_Venda - p.Pr_Compra) * p.Qt_Estoque)) As Vl_LucroHD
	From TB_Produto As p
	where p.DS_Produto Like 'HD%') As Valores
