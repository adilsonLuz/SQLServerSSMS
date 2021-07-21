-- ------------------------------------------------------------------
-- Correção do Exercício de Funcionários
-- ------------------------------------------------------------------

/*
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


-- ------------------------------------------------------------------
-- Se existir, Apague!
Drop Table If Exists TB_Funcionario;
Go

 
-- ------------------------------------------------------------------
-- Tabelas
Create Table TB_Funcionario(
    ID_Funcionario			Int				Identity( 1, 1)
    , Nm_Funcionario		VarChar( 200)
    , Vl_Salario			Numeric(12,2)
    , Vl_ValeAlimentacao	Numeric( 7,2)
    , Nr_Telefone			VarChar(  10)  -- 99 9999 9999
    , Nr_CPF				VarChar(  11)  -- Usar Numeric() se for usado como Índice
    , Dt_Admissao			Date			Default GetDate()
    , Dt_Demissao			Date
    , Ds_Email				VarChar( 150)
    , St_Ativo				Char			Default 'A'
    , Primary Key (ID_Funcionario)
);
Go

 

-- ------------------------------------------------------------------
-- Funcionários 
Insert Into TB_Funcionario(Nm_Funcionario, Vl_Salario, Vl_ValeAlimentacao, Nr_Telefone, Nr_CPF, Dt_Admissao, Dt_Demissao, Ds_Email)
    Values('Maria', 1200.00, 500.00, '1197234231', '32434698875', '2020-08-01', Null, 'maria@gmail.com')
Insert Into TB_Funcionario(Nm_Funcionario, Vl_Salario, Vl_ValeAlimentacao, Nr_Telefone, Nr_CPF, Dt_Admissao, Dt_Demissao, Ds_Email)
    Values('Joao',  1100.00, 500.00, '1192343289', '53222348875', '2020-02-10', Null,'japarecido@gmail.com')
Insert Into TB_Funcionario(Nm_Funcionario, Vl_Salario, Vl_ValeAlimentacao, Nr_Telefone, Nr_CPF, Dt_Admissao, Dt_Demissao, Ds_Email)
    Values('José',  1600.00, 500.00, '1192342412', '64564598875', '2019-12-03', Null, 'JOSE@GMAIL.COM')
Insert Into TB_Funcionario(Nm_Funcionario, Vl_Salario, Vl_ValeAlimentacao, Nr_Telefone, Nr_CPF, Dt_Admissao, Dt_Demissao, Ds_Email)
    Values('Mario', 1450.00, 500.00, '1192434324', '96865765482', '2019-11-15', '2020-01-23', 'Msouza@gmail.com')
Go


-- ------------------------------------------------------------------
-- (Q01) Coloque todos os nomes dos funcionários em maiúsculo
Update TB_Funcionario
    set Nm_Funcionario = Upper(Nm_Funcionario)

	-- Checando...
	Select Nm_Funcionario
	    From TB_Funcionario;

-- ------------------------------------------------------------------
-- (Q02) Lista apenas os que estão trabalhando
Select ID_Funcionario, Nm_Funcionario, Dt_Admissao, Dt_Demissao
  From TB_Funcionario
  Where Dt_Demissao Is Null

-- ------------------------------------------------------------------
-- (Q03) Exiba todos os funcionários demitidos
Select ID_Funcionario, Nm_Funcionario, Dt_Admissao, Dt_Demissao
  From TB_Funcionario
  Where Dt_Demissao Is Not Null


-- ------------------------------------------------------------------
-- (Q04) Liste os nomes e salarios totais (salario com Vale alimentação)
Select Nm_Funcionario
       , (Vl_Salario + Vl_ValeAlimentacao) as Vl_TotalSalario
  From TB_Funcionario
  Where St_Ativo = 'A'
   
-- ------------------------------------------------------------------
-- (Q05) Adicione 10% sobre o vale alimentação
UPDATE TB_Funcionario
  SET Vl_ValeAlimentacao = Vl_ValeAlimentacao * 1.10
  WHERE St_Ativo = 'A'


-- ------------------------------------------------------------------
-- (Q06) Dê aumento de 15% para o funcionário 4, se ele não foi demitido
UPDATE TB_Funcionario
  SET Vl_Salario = Vl_Salario * 1.15
  WHERE ID_Funcionario = 4 And Not Dt_Demissao Is Null


-- ------------------------------------------------------------------
-- (Q07) Transformar todos os e-mails em minúsculo
Select Ds_EMail From TB_Funcionario

Update TB_Funcionario
  Set  Ds_Email = Lower(Ds_Email)

Select Ds_EMail From TB_Funcionario


-- St_Ativo é o controle de Exclusao Lógica

-- Funcionário demitido tem o campo Dt_Demissao preenchido




-- Duvida do Guilherme

Select Nm_Funcionario, Dt_Demissao
from TB_Funcionario WHERE ID_Funcionario = 3 And St_Ativo = 'A'

Update TB_Funcionario
  Set  Dt_Demissao = GetDate()
     , St_Ativo = 'I'
  Where ID_Funcionario = 3

