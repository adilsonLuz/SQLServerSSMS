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



