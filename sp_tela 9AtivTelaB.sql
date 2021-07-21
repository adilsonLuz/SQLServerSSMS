/*
Pagina 9 visio atividade tela B
Adilson Luz (Chacal)
24/09/2020 20:05
*/

--Apagando tabelas
Drop Table If exists TB_Produto;
Drop Table If exists TB_Fornecedor;
Drop Table If exists TB_PlanoConta;
Drop Table If exists TB_Pagamento;
Drop Table If exists TB_PedidoItem;
Drop Table If exists TB_Pedido;


--Criando tabelas
Create Table TB_Fornecedor (
	ID_Fornecedor Int Identity(1,1) Not Null,
	Nm_Fornecedor VarChar(200),
	Primary Key (ID_Fornecedor),
);

Create Table TB_Produto (
	ID_Produto Int Identity(1,1) Not Null,
	Nm_Produto VarChar(200),
	Vl_Unitario Numeric (15,2),
	Vl_Ipi numeric (8,2),
	ID_Fornecedor Int
	Primary Key (ID_Produto),
	foreign Key (ID_Fornecedor)
		References TB_Fornecedor (ID_Fornecedor),
);

Create Table TB_PlanoConta (
	ID_PlanoConta Int identity (1,1) Not Null,
	Ds_PlanoConta VarChar(200),
	Primary Key (ID_PlanoConta),
);

Create Table TB_Pagamento (
	ID_Pagamento Int Identity(1,1) Not Null,
	Ds_Pagamento VarChar(200),
	Primary Key (ID_Pagamento),
);

Create Table TB_PedidoItem (
	ID_Produto Int,
	ID_Pedido Int,
	Qt_Produto Int,	
	Primary Key (ID_Produto, ID_Pedido),
);


Create Table TB_Pedido (
	ID_Pedido Int Identity(1,1),
	ID_PlanoConta Int,
	ID_Pagamento Int,
	Vl_SubTotal Numeric (15,2),
	Vl_TotalIpi Numeric (8,2),
	Vl_Desconto Numeric (8,2),
	Dt_Entrega Date,
	Vl_Total Numeric (15,2),
	Primary Key (ID_Pedido),
);
Go


Insert Into TB_Pagamento(Ds_Pagamento) Values ('Cartão Master');
Insert Into TB_Pagamento(Ds_Pagamento) Values ('Cartão VISA');
Insert Into TB_Pagamento(Ds_Pagamento) Values ('Cheque');
Insert Into TB_Pagamento(Ds_Pagamento) Values ('PIX');
Go

Select * From TB_Pagamento

Insert Into TB_Pedido(ID_Pagamento, Vl_Total, Dt_Entrega) Values ( 2, 100, '2020-09-14');
Insert Into TB_Pedido(ID_Pagamento, Vl_Total, Dt_Entrega) Values ( 1, 1000, '2020-09-15');
Insert Into TB_Pedido(ID_Pagamento, Vl_Total) Values ( 1, 1000);

Select * from TB_Pedido


