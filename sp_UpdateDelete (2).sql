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
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Qt_Estoque, Dt_Venc)
	Values ('Produto Err',		12, 30, Null);



Select    
        SUBSTRING(Right('00'  +(Convert(VarChar(2), Cat.ID_Categoria)),2),1,2) + '.' +
        SUBSTRING(Right('000' +(Convert(VarChar(3), SubC.ID_SubCategoria)),3),1,3) + '.' +
        SUBSTRING(Right('0000'+(Convert(VarChar(4), Prod.ID_Produto)),4),1,4) 
        As 'Produto'

        , Prod.Ds_Produto
        , Substring(Convert(VarChar(30), (Prod.Dt_Venc),103), 1,5)        
        As Dt_VencimentoErr
		                        
        From    TB_Produto As Prod

        Inner Join TB_SubCategoria As SubC
            On Prod.ID_SubCategoria = SubC.ID_SubCategoria

        Inner Join TB_Categoria As Cat
            On SubC.ID_Categoria = Cat.ID_Categoria

		Where Not Prod.Dt_Venc Is Null

        Order By Prod.Dt_Venc







--	= '' é um dado!
--  = Null não é dado (Não ocupa espaço)

-- Produto COM erro
Select
	ID_Produto
	, Dt_Venc
	From  TB_Produto As Prod
	Where Dt_Venc Is Null


-- Produto SEM erro
Select
	ID_Produto
	, Dt_Venc
	From  TB_Produto As Prod
	Where Not Dt_Venc Is Null


-- Alternativas
/*
        Prod.Ds_Produto, 
        Substring(Convert(VarChar(30), (Prod.Dt_Venc),103), 4,5)        
        As Dt_Vencimento,






		Left(Convert(Varchar(3),100+Month(Prod.Dt_Venc)),2) + '/' +
		Left(Convert(Varchar(5),Year(Prod.Dt_Venc)),2) as Dt_Venc

*/





-- Delete

/*
Elimina FISICAMENTE os registros.
Não há como recuperar.

Sintaxe:
Delete From <Tabela>
   [ Where <condição> ]    -- não colocar essa parte faz mudar de emprego!

Ex:
*/
Select * from TB_Produto

Delete From TB_Produto 
   Where ID_Produto = 101












-- Update
/*

Sintaxe:

Update <Tabela>
   Set <campo1> = <conteudo1>
       [, <campo2> = <conteudo2>]
   [Where <condições>]

   Ex:
*/

-- Upper <=> Lower
-- Up <=> Down

Update TB_Produto
   Set Ds_Produto = Upper(Ds_Produto)
   Where ID_Produto = 104

Select * from TB_Produto

Update TB_Produto
   Set Ds_Produto = Lower(Ds_Produto)



-- Eliminar FISICAMENTE e LOGICAMENTE

Drop Table If Exists TB_Categoria;
Go

-- Criação...  
-- St_Ativo: 'A' Ativo /  'I' Inativo
Create Table TB_Categoria (
	  ID_Categoria Int Identity(1,1)
	, Ds_Categoria Varchar(100)
	, St_Ativo Char Default 'A'
	, Primary Key (ID_Categoria)
);

-- Categ
Insert Into TB_Categoria(Ds_Categoria) Values ('Padaria');
Insert Into TB_Categoria(Ds_Categoria) Values ('Açougue');
Insert Into TB_Categoria(Ds_Categoria) Values ('UD');
Insert Into TB_Categoria(Ds_Categoria) Values ('Ferramentas');

Select * From TB_Categoria

/*-- Fisicamente
Delete From TB_Categoria 
  Where ID_Categoria = 1
  */

-- Apagar Logicamente
UpDate TB_Categoria
   Set St_Ativo = 'I'
   Where ID_Categoria = 1

Select ID_Categoria, Ds_Categoria, St_Ativo
  From TB_Categoria
  Where St_Ativo='A'

UpDate TB_Categoria
   Set St_Ativo = 'A'
   Where ID_Categoria = 1

 
/*  O registro dependia de outra tabela:

A instrução DELETE conflitou com a restrição do REFERENCE "FK__TB_SubCat__ID_Ca__56B3DD81". 
O conflito ocorreu no banco de dados "AulaBD", tabela "dbo.TB_SubCategoria", column 'ID_Categoria'.
A instrução foi finalizada.
*/




















/* Atividade
Crie a tabela funcionário com:
nome do funcionário, salario, vale alimentação, telefone, 
cpf, data de admissão e data de demissao, e-mail


Insira 10 funcionários (com e sem data de demissão)

(1) Coloque todos os nomes dos funcionários em maiúsculo
(2) Lista apenas os que estão trabalhando
(3) Exiba todos os funcionários demitidos
(4) Liste os nomes e salarios totais (salario com Vale alimentação)
(5) Adicione 10% sobre o vale alimentação
(6) Dê aumento de 15% para o funcionário 4, se ele não foi demitido
(7) Transformar todos os e-mails em minúsculo

*/


