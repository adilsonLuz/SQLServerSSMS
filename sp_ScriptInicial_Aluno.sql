Drop Table If Exists TB_VendaItem;
Drop Table If Exists TB_Venda;
Drop Table If Exists TB_ProdutoPDV;
Drop Table If Exists TB_SubCategoriaPDV;
Drop Table If Exists TB_CategoriaPDV;
Drop Table If Exists TB_Usuario;
Go

Create Table TB_Usuario (
	ID_Usuario int identity(1,1),
	Nm_Usuario varchar(100),
	Ds_Login Varchar(30),
	Ds_Password Varchar(20),
	Primary Key (ID_Usuario)
);

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

Create Table TB_Venda(
  ID_Venda Int Identity(1,1),
  Dt_Venda Date Default GetDate(),
  Nr_CPF Numeric(11),
  Vl_Total Numeric(10,2),
  Primary Key (ID_Venda)
);

Create Table TB_VendaItem (
  ID_VendaItem Int Identity(1,1),
  ID_Venda Int,
  ID_Produto Int,
  Qt_Produto Int,
  Pr_Venda Numeric(6,2),
  Primary Key (ID_VendaItem),
  Foreign Key (ID_Produto)
	References TB_ProdutoPDV(ID_Produto),
  Foreign Key (ID_Venda)
    References TB_Venda(ID_Venda)
);


Go

-- ---------------------------------------------------------
-- Carga Inicial -------------------------------------------
-- ---------------------------------------------------------
-- Usuário
Insert Into TB_Usuario(Nm_Usuario, Ds_Login, Ds_Password)
   Values ('JOAO','JJ','2J');

-- Categoria
Insert Into TB_CategoriaPDV (Ds_Categoria) Values ('Lanche');
Insert Into TB_CategoriaPDV (Ds_Categoria) Values ('Bebida');
Insert Into TB_CategoriaPDV (Ds_Categoria) Values ('Doce');

-- SubCategoria
Insert Into TB_SubCategoriaPDV (Ds_SubCategoria, ID_Categoria) Values ('Burguer' ,1);
Insert Into TB_SubCategoriaPDV (Ds_SubCategoria, ID_Categoria) Values ('Salgado' ,1);
Insert Into TB_SubCategoriaPDV (Ds_SubCategoria, ID_Categoria) Values ('Refrigerante', 2);
Insert Into TB_SubCategoriaPDV (Ds_SubCategoria, ID_Categoria) Values ('Suco', 2);
Insert Into TB_SubCategoriaPDV (Ds_SubCategoria, ID_Categoria) Values ('Água', 2);

-- Produtos
Insert Into TB_ProdutoPDV (Ds_Produto, Ds_produtoPDV, ID_SubCategoria, Pr_Venda, Qt_Estoque) 
	Values ('X-Burguer','XBurguer',1, 8.0,15);
Insert Into TB_ProdutoPDV (Ds_Produto, Ds_produtoPDV, ID_SubCategoria, Pr_Venda, Qt_Estoque) 
	Values ('X-Salada Burguer','XSalad' ,1, 10.0,5);

Insert Into TB_ProdutoPDV (Ds_Produto, Ds_produtoPDV, ID_SubCategoria, Pr_Venda, Qt_Estoque) 
	Values ('Coxinha de Frango','CoxFrang' ,2, 5.0, 20);
Insert Into TB_ProdutoPDV (Ds_Produto, Ds_produtoPDV, ID_SubCategoria, Pr_Venda, Qt_Estoque) 
	Values ('Kibe Simples','Kibe' ,2, 5.0,10);


-- Vendas
Insert Into TB_Venda (Nr_CPF, Vl_Total) Values ('12345678901',13.00)
Insert Into TB_Venda (Nr_CPF, Vl_Total) Values ('22345678901',16.00)

-- Item de Vendas
Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) Values (1, 1,1,8.00)
Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) Values (1, 4,1,5.00)

Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) Values (2, 1,2,8.00)




-- Verificar Conteúdos
Select * from TB_Usuario

