-- Irapuan / 2020.09.15

-- Drop
Drop Table If Exists TB_Pedido;
Drop Table If Exists TB_Pagto;
Go

-- Criação
Create Table TB_Pagto (
   ID_Pagto Int Identity(1,1),
   Ds_Pagto Varchar(100),
   Primary Key (ID_Pagto)
);

Create Table TB_Pedido (
   Nr_Pedido int identity(1,1),
   ID_Pagto int,
   Vl_Total numeric(12,2),
   Dt_Pedido date Default getdate(),
   Primary Key (Nr_Pedido),
   Foreign Key (Id_Pagto)
      References TB_Pagto(ID_Pagto)
);
Go


Insert Into TB_Pagto(Ds_Pagto) Values ('Cartão Master');
Insert Into TB_Pagto(Ds_Pagto) Values ('Cartão VISA');
Insert Into TB_Pagto(Ds_Pagto) Values ('Cheque');
Insert Into TB_Pagto(Ds_Pagto) Values ('PIX');
Go

Select * From TB_Pagto

Insert Into TB_Pedido(ID_Pagto, Vl_Total, Dt_Pedido) Values ( 2,  100, '2020-09-14');
Insert Into TB_Pedido(ID_Pagto, Vl_Total, Dt_Pedido) Values ( 1, 1000, '2020-09-15');
Insert Into TB_Pedido(ID_Pagto, Vl_Total) Values ( 1, 1000);

Select * from TB_Pedido


