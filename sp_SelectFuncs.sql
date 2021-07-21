-- For Home
/*
		TB_Cliente

		ID_Cliente  Int
		Nm_Cliente  Varchar(200) -- Todas em maiúsculas
		Nr_CPF      Numeric( 11)  -- 999.999.999-99
		Nr_Telefone Varchar( 10)  -- (99) 9999-9999
		Nr_Celular  Varchar( 11)  -- (99) 9-9999-9999
		Dt_Cadastro date

		-- Inserir os nomes em minúsculo!!!
*/


-- Eliminando tabelas existentes
Drop Table If Exists TB_Cliente;-- Criando tabela
Go
Create Table TB_Cliente (
ID_Cliente Int Identity(1,1),
Nm_Cliente Varchar(200), -- Todas em maiúsculas
Nr_CPF Numeric(11), -- 999.999.999-99
Nr_Telefone Varchar(10), -- (99) 9999-9999
Nr_Celular Varchar( 11), -- (99) 9-9999-9999
Dt_Cadastro Date Default GetDate(),
Primary Key(ID_Cliente),
);
Go-- Inserindo dados na tabela
Insert Into TB_Cliente (Nm_Cliente, Nr_CPF, Nr_Telefone, Nr_Celular, Dt_Cadastro) Values ('rodrigo de melo', '29454785965', '1141546669',
'11999666555', '2020-10-13');
Insert Into TB_Cliente (Nm_Cliente, Nr_CPF, Nr_Telefone, Nr_Celular, Dt_Cadastro) Values ('adriana melo', '30454784125', '1141546999',
'11984658951', '2020-10-13');
Insert Into TB_Cliente (Nm_Cliente, Nr_CPF, Nr_Telefone, Nr_Celular, Dt_Cadastro) Values ('darlei garcia', '30159578955', '1136869969',
'11970412582', '2020-10-15');
Insert Into TB_Cliente (Nm_Cliente, Nr_CPF, Nr_Telefone, Nr_Celular, Dt_Cadastro) Values ('elson moraes', '15135785264', '1134877069',
'01945070777', '2020-10-13');
Insert Into TB_Cliente (Nm_Cliente, Nr_CPF, Nr_Telefone, Nr_Celular, Dt_Cadastro) 
	Values ('jamel campary', '19137582500', '1146876069','11974131313', '2020-09-13');
Insert Into TB_Cliente (Nm_Cliente, Nr_CPF, Nr_Telefone, Nr_Celular, Dt_Cadastro) 
	Values ('teste de zero', '05135785264', '1134877069','01945070777', '2020-10-13');

select * from TB_Cliente


Select 
	ID_Cliente, 
	Upper(Nm_Cliente) As Nm_Cliente, 
	SUBSTRING(Convert(VarChar(11), Nr_CPF),1,3) + '.' +
	SUBSTRING(Convert(VarChar(11), Nr_CPF),4,3) + '.' +
	SUBSTRING(Convert(VarChar(11), Nr_CPF),7,3) + '-' +
	SUBSTRING(Convert(VarChar(11), Nr_CPF),10,2)
	As Nr_CPF,
	'(' + SUBSTRING(Nr_Telefone,1,2) + ') ' +
	SUBSTRING(Nr_Telefone,3,4) + '-' +
	SUBSTRING(Nr_Telefone,7,4)
	As Nr_Telefone,
	'(' + SUBSTRING(Nr_Celular,1,2) + ') ' +
	SUBSTRING(Nr_Celular,3,4) + '-' +
	SUBSTRING(Nr_Celular,7,4)
	As Nr_Celular,
	Dt_Cadastro

From TB_Cliente














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
	Dt_Venc Date Default GetDate(),
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
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Qt_Estoque, Dt_Venc) 
	Values ('Pão Frances',	10, 20, GetDate());
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Qt_Estoque, Dt_Venc)
	Values ('Bronha',		10, 10, GetDate()+3);
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Qt_Estoque, Dt_Venc)
	Values ('Coxão Mole',	12, 50, GetDate()+7);
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Qt_Estoque, Dt_Venc)
	Values ('Coxão Duro',	12, 70, GetDate()+7);
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Qt_Estoque, Dt_Venc)
	Values ('Picanha',		12, 30, GetDate()+4);

-- Verificando...
Select * from TB_Produto

-- Funções

--  Funções x Comandos



/*
Extração de Strings
-------------------

Substring( <string>, <Inicio> , <Qt>)

Left ( <string>, <Qt_a_Partir_Esq> )

Right ( <string>, <Qt_a_Partir_Dir> )

Exs:*/

select Left('MARIANA',5)
select Right('MARIANA',3)











/*
Convert()
---------

Sintaxe: Convert( <Tipo>, <conteúdo>)
*/
Select Convert(Varchar(11),12345678910)
-- Result: '12345678910'


























/* RTrim() / LTrim() / Trim()

Tira espaços das extremidades
LTrim = Left (esquerda)
RTrim = Right (Direita)
Trim = ambos

Sintaxe: LTrim( <string> )
idem para os demais

Exs:
*/

Select '|'+ (' a ') + '|' as Puro,

	   '|'+ Trim(' a ') + '|' as Usando_TRIM,

       '|'+ LTrim(' a ') + '|' as Usando_LTRIM,

	   '|'+ RTrim(' a ') + '|' as Usando_RTRIM

Select '|'+Trim(' a b c ')+'|' as Usando_Trim












-- Responda a cada uma das etapas das 'receitas' para colocar zeros a esq.

-- 'Receita' 1
-- (1) Escolha um número
-- 123

-- (2) Exiba convertendo para string
Select Convert(Varchar(5),123) as Numero

-- (3) Tire os espaços das extremindades
Select Trim(Convert(Varchar(5),123)) as Numero

-- (4) Adicione a quantidade de zeros do tamanho máximo de exibição, 
--     por exemplo 5 posições '00000'
Select '00000'+Trim(Convert(Varchar(5),123)) as Numero

-- (5) Extraia apenas as posições a partir da direita
Select Right('00000'+Trim(Convert(Varchar(5),123)),5) as Numero



















-- 'Receita' 2
-- (1) Escolha um número
-- 123

-- (2) Some 10^Qt_Posições, por exemplo 5 pos: 100000
Select 123+100000

-- (3) Converta para String
Select convert(varchar(6),123+100000) As Numero

-- (4) Extraia apenas as posições a partir da direita
Select Right(convert(varchar(6),123+100000),5) As Numero


-- Considere as possibilidades:
-- O CPF 5135785264 = "051.357.852-64"
-- O CPF 135785264  = "001.357.852-64"

Select 
	Upper(Nm_Cliente) As Nm_Cliente, 
	SUBSTRING(Convert(VarChar(11), Nr_CPF),1,3) + '.' +
	SUBSTRING(Convert(VarChar(11), Nr_CPF),4,3) + '.' +
	SUBSTRING(Convert(VarChar(11), Nr_CPF),7,3) + '-' +
	SUBSTRING(Convert(VarChar(11), Nr_CPF),10,2)
	As Nr_CPF
From TB_Cliente
 Where ID_Cliente = 6

















-- Datas

Select Day(GetDate())

Select Month(GetDate())

Select Year(GetDate())



Select DatePart(hh,GetDate()) As Hora, 
       DatePart(mi,GetDate()) AS Minuto,
       DatePart(ss,GetDate()) as Segundo
-- https://docs.microsoft.com/pt-br/sql/t-sql/functions/datepart-transact-sql?view=sql-server-ver15


Select DateDiff(yy,'1980-07-01',GetDate())
Select DateDiff(mm,'1980-07-01',GetDate())
-- https://docs.microsoft.com/pt-br/sql/t-sql/functions/datediff-transact-sql?view=sql-server-ver15


-- Apresentando no formato britânico (PT)
Select CONVERT(VARCHAR(30),GETDATE(),103) AS 'Formato 103'


-- -----------------------------------------------
-- Produto (1 =>N) SubCategoria (N => 1) Categoria
-- -----------------------------------------------
/*
Exibir ID do Produto, Ds_Produto, Dt_Venc (dia/mes) por ordem de vencimento mais próximo

ID do Produto:    
				00 - Categ
				000 - subcateg
				0000 - ID produto
Exibir como 00.000.0000
*/
-- Script Inicial
Select	Prod.ID_Produto, Prod.Ds_Produto, SubC.ID_SubCategoria, SubC.Ds_SubCategoria, 
		Cat.ID_Categoria, Cat.Ds_Categoria
				
		From	TB_Produto As Prod

		Inner Join TB_SubCategoria As SubC
			On Prod.ID_SubCategoria = SubC.ID_SubCategoria

		Inner Join TB_Categoria As Cat
			On SubC.ID_Categoria = Cat.ID_Categoria

		Where Cat.ID_Categoria = 2
		  And SUBSTRING(SubC.Ds_SubCategoria, 1, 1) = 'C'

		Order By Prod.Ds_Produto DESC -- Default ASC
