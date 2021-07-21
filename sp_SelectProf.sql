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
	Primary Key (ID_Produto),
	Foreign Key (ID_SubCategoria)
		References TB_SubCategoria(ID_SubCategoria)
);
Go

-- Inserindo dados...
-- Categ
Insert Into TB_Categoria(Ds_Categoria) Values ('Padaria');
Insert Into TB_Categoria(Ds_Categoria) Values ('Açougue');

Select * From TB_Categoria

-- SubCateg
Insert Into TB_SubCategoria(Ds_SubCategoria, ID_Categoria) Values ('Pão Salgado',   1)
Insert Into TB_SubCategoria(Ds_SubCategoria, ID_Categoria) Values ('Pão Doce',		1)
Insert Into TB_SubCategoria(Ds_SubCategoria, ID_Categoria) Values ('Carne Bovina',	2)
Insert Into TB_SubCategoria(Ds_SubCategoria, ID_Categoria) Values ('Carne Suina',	2)

Select * from TB_SubCategoria

-- Produtos
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria) Values ('Pão Frances',	10);
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria) Values ('Bronha',		10);
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria) Values ('Coxão Mole',	12);
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria) Values ('Coxão Duro',	12);
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria) Values ('Picanha',		12);

Select * From TB_Produto



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


		Select 6 As Vl_N1, 8 As Vl_N2 
			Into #TB_Temp
		
		Select (Vl_N1+Vl_N2)/2 As Vl_Media
		  From #TB_Temp



		Select '12345678912' As Nr_CPF
		
		Select Substring('12345678912', 1, 3) + '.' +
			   Substring('12345678912', 4, 3) + '.' +
			   Substring('12345678912', 7, 3) + '-' +
			   Substring('12345678912',10, 2)
		As Nr_CPF


		Select Convert(Varchar(11),12345678910)





