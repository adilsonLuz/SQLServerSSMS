Create Table TB_PrincAtivo(
	ID_PrincAtivo Int Identity(1,1),
	Ds_PrincAtivo VarChar(200) Not Null,
	Primary key (ID_PrincAtivo)
);

Create Table TB_Prateleira(
	ID_Prateleira Int Identity(1,1),
	Ds_Prateleira VarChar(200) Not Null,
	Primary key (ID_Prateleira)
);

Create Table TB_Preco(
	ID_Preco Int Identity(1,1),
	Pr_Venda Numeric(10, 2) Not Null,
	Primary key (ID_Preco)
);

Create Table TB_DescontoPorc(
	ID_DescontoPorc Int Identity(1,1),
	Vl_DescontoPorc Numeric(4, 2) Not Null,
	Primary key (ID_DescontoPorc)
);

Create Table TB_Remedio(
	ID_Remedio Int Identity(1,1),
	Nm_Remedio VarChar(200) Not Null,
	ID_PrincAtivo Int,
	ID_Prateleira Int,
	ID_Preco Int,
	ID_DescontoPorc Int,
	Primary Key(ID_Remedio),
	Foreign Key (ID_PrincAtivo)
		References TB_PrincAtivo(ID_PrincAtivo),
	Foreign Key (ID_Prateleira)
		References TB_Prateleira(ID_Prateleira),
	Foreign Key (ID_Preco)
		References TB_Preco(ID_Preco),
	Foreign Key (ID_DescontoPorc)
		References TB_DescontoPorc(ID_DescontoPorc)
);
Go