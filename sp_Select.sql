-- Eliminar tabelas se existirem
Drop Table If Exists TB_Produto;
Drop Table If Exists TB_SubCategoria;
Drop Table If Exists TB_Categoria;
Go

-- Criação...
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
	ID_Produto Int Identity(100,1),
	Ds_Produto Varchar(100),
	ID_SubCategoria Int,
	Dt_Vencimento Date Default GetDate(),
	Qt_Estoque Int,
	Primary Key (ID_Produto),
	Foreign Key (ID_SubCategoria)
		References TB_SubCategoria(ID_SubCategoria)
);
Go

-- Inserindo dados...
-- Categ
Insert Into TB_Categoria(Ds_Categoria) Values ('Padaria');
Insert Into TB_Categoria(Ds_Categoria) Values ('Açougue');

-- SubCateg
Insert Into TB_SubCategoria(Ds_SubCategoria, ID_Categoria) Values ('Pão Salgado',   1)
Insert Into TB_SubCategoria(Ds_SubCategoria, ID_Categoria) Values ('Pão Doce',		1)
Insert Into TB_SubCategoria(Ds_SubCategoria, ID_Categoria) Values ('Carne Bovina',	2)
Insert Into TB_SubCategoria(Ds_SubCategoria, ID_Categoria) Values ('Carne Suina',	2)

-- Produtos
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Qt_Estoque, Dt_Vencimento) 
	Values ('Pão Frances',	10, 20, GetDate());
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Qt_Estoque, Dt_Vencimento)
	Values ('Bronha',		10, 10, GetDate()+3);
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Qt_Estoque, Dt_Vencimento)
	Values ('Coxão Mole',	12, 50, GetDate()+7);
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Qt_Estoque, Dt_Vencimento)
	Values ('Coxão Duro',	12, 70, GetDate()+7);
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Qt_Estoque, Dt_Vencimento)
	Values ('Picanha',		12, 30, GetDate()+4);
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Qt_Estoque, Dt_Vencimento)
	Values ('Produto Err',		12, 30, Null);



Select * From TB_Categoria
Select * from TB_SubCategoria
Select * From TB_Produto

-- Categorias e subCategoria (1 => N)

Select		Categ.ID_Categoria, Categ.Ds_Categoria,
			SubCateg.ID_SubCategoria, SubCateg.Ds_SubCategoria
	
	From	TB_Categoria As Categ
	
	Inner Join TB_SubCategoria As SubCateg
		On Categ.ID_Categoria = SubCateg.ID_Categoria


-- Produto e subCategoria (1 => N)
Select p.ID_Produto, p.Ds_Produto, s.ID_SubCategoria, s.Ds_SubCategoria
From TB_Produto As p
Inner Join TB_SubCategoria As s
On p.ID_SubCategoria = s.ID_SubCategoria


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

		Where Cat.ID_Categoria = 2
		  --And Prod.ID_Produto >= 103
		  And SUBSTRING(SubC.Ds_SubCategoria, 1, 1) = 'C'

		Order By Prod.Ds_Produto DESC -- Default ASC



		Select SUBSTRING('MARIANA',1,5) As Nm_Cliente -- MARIA
		Select SUBSTRING('MARIANA',5,3) As Nm_Cliente -- ANA

/*
		Select 6 As Vl_N1, 8 As Vl_N2 
			Into #TB_Temp
		
		Select (Vl_N1+Vl_N2)/2 As Vl_Media
		  From #TB_Temp
		  */


		Select '12345678912' As Nr_CPF
		
		Select Substring('12345678912', 1, 3) + '.' +
			   Substring('12345678912', 4, 3) + '.' +
			   Substring('12345678912', 7, 3) + '-' +
			   Substring('12345678912',10, 2)
		As Nr_CPF


		Select Convert(Varchar(11),12345678910)


		/* For Home
		TB_Cliente

		ID_Cliente  Int
		Nm_Cliente  Varchar(200) -- Todas em maiúsculas
		Nr_CPF      Numeric( 11)  -- 999.999.999-99
		Nr_Telefone Varchar( 10)  -- (99) 9999-9999
		Nr_Celular  Varchar( 11)  -- (99) 9-9999-9999
		Dt_Cadastro date

		 Inserir os nomes em minúsculo!!! */

		 -- Eliminando tabelas existentes
Drop Table If Exists TB_Cliente;
Go

-- Criando tabela
Create Table TB_Cliente (
	ID_Cliente Int Identity(1,1),
	Nm_Cliente Varchar(200), -- Todas em maiúsculas
	Nr_CPF Numeric(11),  -- 999.999.999-99
	Nr_Telefone Varchar(10),  -- (99) 9999-9999
	Nr_Celular Varchar( 11),  -- (99) 9-9999-9999
	Dt_Cadastro Date Default GetDate(),
	Primary Key(ID_Cliente),
);
Go

-- Inserindo dados na tabela
Insert Into TB_Cliente (Nm_Cliente, Nr_CPF, Nr_Telefone, Nr_Celular, Dt_Cadastro) 
	Values ('rodrigo de melo', '29454785965', '1141546669', '11999666555', '2020-10-13');
Insert Into TB_Cliente (Nm_Cliente, Nr_CPF, Nr_Telefone, Nr_Celular, Dt_Cadastro) 
	Values ('adriana melo', '00454784125', '1141546999', '11984658951', '2020-10-13');
Insert Into TB_Cliente (Nm_Cliente, Nr_CPF, Nr_Telefone, Nr_Celular, Dt_Cadastro) 
	Values ('darlei garcia', '30159578955', '1136869969', '11970412582', '2020-10-13');
Insert Into TB_Cliente (Nm_Cliente, Nr_CPF, Nr_Telefone, Nr_Celular, Dt_Cadastro) 
	Values ('elson moraes', '15135785264', '1134877069', '11945070777', '2020-10-13');
Insert Into TB_Cliente (Nm_Cliente, Nr_CPF, Nr_Telefone, Nr_Celular, Dt_Cadastro) 
	Values ('jamel campary', '09137582500', '1146876069', '11974131313', '2020-10-13');


Select    
        ID_Cliente,
        UPPER(Nm_Cliente)  As Nm_Cliente,
        SUBSTRING(Convert(VarChar(12), Nr_CPF+100000000000),2,3) + '.' +  
        SUBSTRING(Convert(VarChar(12), Nr_CPF+100000000000),4,3) + '.' +
        SUBSTRING(Convert(VarChar(12), Nr_CPF+100000000000),8,3) + '-' +
        SUBSTRING(Convert(VarChar(12), Nr_CPF+100000000000),11,2)
        As Nr_CPF,
        '(' + SUBSTRING(Nr_Telefone,1,2) + ') ' +
        SUBSTRING(Nr_Telefone,3,4) + '-' +
        SUBSTRING(Nr_Telefone,7,4) 
        As Nr_Telefone,
        '(' + SUBSTRING(Nr_Celular,1,2) + ') ' +
        SUBSTRING(Nr_Celular,3,4) + '-' +
        SUBSTRING(Nr_Celular,7,4)
        As Nr_Celular,
        Dt_Cadastro As Dt_Cadasro
        From TB_Cliente


Select
 Upper(Nm_Cliente) As Nm_Cliente,

 

    Right(Convert(VarChar(12),Nr_CPF+100000000000),11) As Correto,
 
     SUBSTRING(Right('00000000000'+(Convert(VarChar(11), Nr_CPF)),11),1,3) + '.' +
     SUBSTRING(Right('00000000000'+(Convert(VarChar(11), Nr_CPF)),11),4,3) + '.' +
     SUBSTRING(Right('00000000000'+(Convert(VarChar(11), Nr_CPF)),11),7,3) + '-' +
     SUBSTRING(Right('00000000000'+(Convert(VarChar(11), Nr_CPF)),11),10,2)

 

     As Nr_CPF  From TB_Cliente


Select	
		ID_Cliente,
		UPPER(Nm_Cliente)  As Nm_Cliente,
		SUBSTRING(Convert(VarChar(12), Nr_CPF+100000000000),2,3) + '.' +  
		SUBSTRING(Convert(VarChar(12), Nr_CPF+100000000000),4,3) + '.' +
		SUBSTRING(Convert(VarChar(12), Nr_CPF+100000000000),8,3) + '-' +
		SUBSTRING(Convert(VarChar(12), Nr_CPF+100000000000),11,2)
	    As Nr_CPF,
	    '(' + SUBSTRING(Nr_Telefone,1,2) + ') ' +
		SUBSTRING(Nr_Telefone,3,4) + '-' +
		SUBSTRING(Nr_Telefone,7,4) 
	    As Nr_Telefone,
	    '(' + SUBSTRING(Nr_Celular,1,2) + ') ' +
		SUBSTRING(Nr_Celular,3,4) + '-' +
	    SUBSTRING(Nr_Celular,7,4)
	    As Nr_Celular,
		Dt_Cadastro As Dt_Cadasro
	    From TB_Cliente

-- ---------------------------------------------------------------------------------------------

		Select    
        SUBSTRING(Right('00'+(Convert(VarChar(2), Cat.ID_Categoria)),2),1,2) + '.' +
        SUBSTRING(Right('000'+(Convert(VarChar(3), SubC.ID_SubCategoria)),3),1,3) + '.' +
        SUBSTRING(Right('0000'+(Convert(VarChar(4), Prod.ID_Produto)),4),1,4) 
        As 'ID_Categ/ID_SubCateg/ID_Prod',

        Prod.Ds_Produto, 
        Substring(Convert(VarChar(30), (Prod.Dt_Vencimento),103), 4,7)        
        As Dt_Vencimento
                        
        From    TB_Produto As Prod
		
        Inner Join TB_SubCategoria As SubC
            On Prod.ID_SubCategoria = SubC.ID_SubCategoria
			
        Inner Join TB_Categoria As Cat
            On SubC.ID_Categoria = Cat.ID_Categoria
			 
        Order By Prod.Dt_Vencimento  -- Default ASC

-- -------------------------------------------------------------------------------------------
-- Apagando tabelas existentes
Drop Table If Exists TB_Funcionario;
Go

--Criando tabelas
Create Table TB_Funcionario(
	ID_Funcionario		Int				Identity(1,1),
	Nm_Funcionario		VarChar( 200),
	Vl_Salario			Numeric(12,2),
	Vl_ValeAlimentacao	Numeric( 7,2),
	Nr_Telefone			VarChar(  11),
	Nr_CPF				VarChar(  11),
	Dt_Admissao			Date			Default GetDate(),
	Dt_Demissao			Date,
	Ds_Email			VarChar( 150),
	St_Ativo			Char			Default 'A',
		Primary Key (ID_Funcionario)
);
Go

--inserindo dados na tabela
Insert Into TB_Funcionario(Nm_Funcionario, Vl_Salario, Vl_ValeAlimentacao, Nr_Telefone, Nr_CPF, Dt_Admissao, Dt_Demissao, Ds_Email)
	Values('Manoel José da Silva',       1279.66, 700.00, 11972181818, 00536698875, '2020-01-05', Null, 'dasilvamanoelmanoel@teste.com.br')
Insert Into TB_Funcionario(Nm_Funcionario, Vl_Salario, Vl_ValeAlimentacao, Nr_Telefone, Nr_CPF, Dt_Admissao, Dt_Demissao, Ds_Email)
	Values('Antonio Barbosa Lima',       3226.69, 923.13, 11934125896, 53669128875, '1992-03-25', Null,'limalimaBarbosa@teste.com.br')
Insert Into TB_Funcionario(Nm_Funcionario, Vl_Salario, Vl_ValeAlimentacao, Nr_Telefone, Nr_CPF, Dt_Admissao, Dt_Demissao, Ds_Email)
	Values('Jéssica Monteiro da Cruz',   1613.44, 830.22, 11984202122, 35489698875, '2015-02-03', Null, 'montjessicacruz@teste.com.br')
Insert Into TB_Funcionario(Nm_Funcionario, Vl_Salario, Vl_ValeAlimentacao, Nr_Telefone, Nr_CPF, Dt_Admissao, Dt_Demissao, Ds_Email)
	Values('Carlos Abreu Soares',        1279.66, 700.00, 11972308477, 66984569782, '2019-05-15', Null, 'abreucarloso@teste.com.br')
Insert Into TB_Funcionario(Nm_Funcionario, Vl_Salario, Vl_ValeAlimentacao, Nr_Telefone, Nr_CPF, Dt_Admissao, Dt_Demissao, Ds_Email)
	Values('Samanta Pires Fonseca',      2879.66, 923.13, 11948876654, 65478932175, '1990-03-05', Null, 'piresamantaseca@teste.com.br')
Insert Into TB_Funcionario(Nm_Funcionario, Vl_Salario, Vl_ValeAlimentacao, Nr_Telefone, Nr_CPF, Dt_Admissao, Dt_Demissao, Ds_Email)
	Values('Maria Aparecida dos Santos', 1200.00, 490.00, 11973996521, 12365498755, '2018-02-15', Null, 'mariariasantos@teste.com.br')
Insert Into TB_Funcionario(Nm_Funcionario, Vl_Salario, Vl_ValeAlimentacao, Nr_Telefone, Nr_CPF, Dt_Admissao, Dt_Demissao, Ds_Email)
	Values('Pedro Paulo de Oliveira',    2115.22, 700.00, 11996578523, 29444838822, '2004-06-10', Null, 'paulpedoliv@teste.com.br')
Insert Into TB_Funcionario(Nm_Funcionario, Vl_Salario, Vl_ValeAlimentacao, Nr_Telefone, Nr_CPF, Dt_Admissao, Dt_Demissao, Ds_Email)
	Values('Adriana Fagundes dos Reis',  1225.15, 490.99, 11973016524, 35416598755, '2002-10-31', Null, 'reisfagundesdrika@teste.com.br')
Insert Into TB_Funcionario(Nm_Funcionario, Vl_Salario, Vl_ValeAlimentacao, Nr_Telefone, Nr_CPF, Dt_Admissao, Dt_Demissao, Ds_Email)
	Values('Emanoele Bacchio',           1300.00, 450.00, 11884526484, 42158796522, '2018-12-17', Null, 'emanoelebacchio@teste.com.br')
Insert Into TB_Funcionario(Nm_Funcionario, Vl_Salario, Vl_ValeAlimentacao, Nr_Telefone, Nr_CPF, Dt_Admissao, Dt_Demissao, Ds_Email)
	Values('Judith Ramon Santana',       3849.56, 923.13, 15938401027, 16359874155, '1984-11-01', Null, 'dasilvamanoelmanoel@teste.com.br')
-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Q01	Colocando nomes em maiusculo
Update TB_Funcionario
	set Nm_Funcionario = Upper(Nm_Funcionario)
Select ID_Funcionario, Nm_Funcionario
	From TB_Funcionario
-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Demitindo Funcionarios
Update TB_Funcionario
	set St_Ativo = 'I'
	where ID_Funcionario = (2)
Update TB_Funcionario
	set Dt_Demissao = '2000-01-15'
	where ID_Funcionario = (2)
Update TB_Funcionario
	set St_Ativo = 'I'
	where ID_Funcionario = (7)
Update TB_Funcionario
	set Dt_Demissao = '2003-09-30'
	where ID_Funcionario = (7)
Update TB_Funcionario
	set St_Ativo = 'I'
	where ID_Funcionario = (9)
Update TB_Funcionario
	set Dt_Demissao = '2020-04-30'
	where ID_Funcionario = (9)
Update TB_Funcionario
	set St_Ativo = 'I'
	where ID_Funcionario = (5)
Update TB_Funcionario
	set Dt_Demissao = '1996-05-27'
	where ID_Funcionario = (5)
-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Q02  Mostrando funcionarios ativos
Select Func.ID_Funcionario ,Func.Nm_Funcionario,
'R$ ' + (Convert(VarChar(8),Func.Vl_Salario)) As Vl_Salario, 
'R$ ' + (Convert(VarChar(8),Func.Vl_ValeAlimentacao))As Vl_ValeAlimentacao, 
'(' + SUBSTRING(Func.Nr_Telefone,1,2) + ') ' +
	  SUBSTRING(Func.Nr_Telefone,3,4) + '-' +
	  SUBSTRING(Func.Nr_Telefone,7,4) As Nr_Telefone, 
	  SUBSTRING(Convert(VarChar(12), Func.Nr_CPF+100000000000),2,3) + '.' +  
      SUBSTRING(Convert(VarChar(12), Func.Nr_CPF+100000000000),4,3) + '.' +
      SUBSTRING(Convert(VarChar(12), Func.Nr_CPF+100000000000),8,3) + '-' +
      SUBSTRING(Convert(VarChar(12), Func.Nr_CPF+100000000000),11,2) As Nr_CPF, 
	  Convert(VarChar(10),(Func.Dt_Admissao),103) As Dt_Admnissao,
      Convert(VarChar(10),(Func.Dt_Demissao),103) As Dt_Demissao, 
	  Func.Ds_Email, St_Ativo
	From TB_Funcionario As Func
	where Dt_Demissao Is Null
-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Q03 Mostrando funcionarios Demitidos
Select Func.ID_Funcionario ,Func.Nm_Funcionario,
'R$ ' + (Convert(VarChar(8),Func.Vl_Salario)) As Vl_Salario, 
'R$ ' + (Convert(VarChar(8),Func.Vl_ValeAlimentacao))As Vl_ValeAlimentacao, 
'(' + SUBSTRING(Func.Nr_Telefone,1,2) + ') ' +
	  SUBSTRING(Func.Nr_Telefone,3,4) + '-' +
	  SUBSTRING(Func.Nr_Telefone,7,4) As Nr_Telefone, 
	  SUBSTRING(Convert(VarChar(12), Func.Nr_CPF+100000000000),2,3) + '.' +  
      SUBSTRING(Convert(VarChar(12), Func.Nr_CPF+100000000000),4,3) + '.' +
      SUBSTRING(Convert(VarChar(12), Func.Nr_CPF+100000000000),8,3) + '-' +
      SUBSTRING(Convert(VarChar(12), Func.Nr_CPF+100000000000),11,2) As Nr_CPF, 
	  Convert(VarChar(10),(Func.Dt_Admissao),103) As Dt_Admnissao,
      Convert(VarChar(10),(Func.Dt_Demissao),103) As Dt_Demissao, 
	  Func.Ds_Email, St_Ativo
	From TB_Funcionario As Func
	where Dt_Demissao Is Not Null
-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Q04 Lista dos nomes e salários
Select Func.ID_Funcionario ,Func.Nm_Funcionario, 
	'R$ ' + (Convert(VarChar(8),Func.Vl_Salario)) As Vl_Salario,
	St_Ativo
	From TB_Funcionario As Func
	where St_Ativo = 'A'
Select Func.ID_Funcionario ,Func.Nm_Funcionario, 
	'R$ ' + (Convert(VarChar(8),Func.Vl_Salario)) As Vl_Salario,
	St_Ativo
	From TB_Funcionario As Func
	where St_Ativo = 'I'
-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Q05 Adicionando 10% sobre o Vale alimentação
select ID_Funcionario, Nm_Funcionario,
	'R$ ' + (Convert(VarChar(8),Func.Vl_ValeAlimentacao))As Vl_ValeAlimAnt,
	St_Ativo
	From TB_Funcionario As Func
	where St_Ativo = 'A'
Update TB_Funcionario
	set Vl_ValeAlimentacao = Vl_ValeAlimentacao + (Vl_ValeAlimentacao * 0.10)
	where St_Ativo = 'A'
select ID_Funcionario, Nm_Funcionario,
	'R$ ' + (Convert(VarChar(8),Func.Vl_ValeAlimentacao))As Vl_ValeAlimAtual,
	St_Ativo
	From TB_Funcionario As Func
	where St_Ativo = 'A'
-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Q06 Aumento de 15% para o funcionario 4
Select Func.ID_Funcionario ,Func.Nm_Funcionario,
	'R$ ' + (Convert(VarChar(8),Func.Vl_Salario)) As Vl_SalarioAnterior
	From TB_Funcionario As Func
	where ID_Funcionario = 4 and St_Ativo = 'A'
Update TB_Funcionario
	set Vl_Salario = Vl_Salario + (Vl_Salario * 0.15)
	where ID_Funcionario = 4 and St_Ativo = 'A'
Select Func.ID_Funcionario ,Func.Nm_Funcionario,
	'R$ ' + (Convert(VarChar(8),Func.Vl_Salario)) As Vl_SalarioAtual
	From TB_Funcionario As Func
	where ID_Funcionario = 4 and St_Ativo = 'A'
-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- CRUD

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