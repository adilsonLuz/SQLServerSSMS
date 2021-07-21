drop table if exists TB_Produto;
drop table if exists TB_SubCategoria;
drop table if exists TB_Categoria;
Go

Create table TB_Categoria(
ID_Categoria   Int Identity (1,1),
Ds_Categoria   VarChar      ( 50),
	primary key (ID_Categoria),
);

Create table TB_SubCategoria(
ID_SubCategoria   Int Identity (1,1),
Ds_SubCategoria   VarChar      ( 50),
ID_Categoria int,
	primary key (ID_SubCategoria),
	Foreign Key(ID_Categoria)
		References TB_Categoria(ID_Categoria)
);

Create table TB_Produto(
ID_Produto   Int Identity (1,1),
Ds_Produto   VarChar      ( 50),
Dt_Validade Date Default GetDate (),
ID_SubCategoria int,
	primary key (ID_SubCategoria),
	Foreign Key(ID_SubCategoria)
		References TB_SubCategoria(ID_SubCategoria)
);
Go

Select c.Ds_Categoria, s.Ds_SubCategoria, Ds_Produto
	From TB_Produto As p
	Inner Join TB_SubCategoria As s
	on p.ID_SubCategoria = s.ID_SubCategoria
	Inner Join TB_Categoria As c
	on s.ID_Categoria = c.ID_Categoria
	Order By ID_Produto


Delete TB_SubCategoria
	where ID_SubCategoria = 5

Update TB_Produto
	Set Ds_Produto = Upper(Ds_Produto)


Delete TB_produto;
Delete TB_SubCategoria;
Delete TB_Categoria;

Select c.Ds_Categoria, s.Ds_SubCategoria, Ds_Produto
	From TB_Categoria As c
	Left Join TB_SubCategoria As s
	on c.ID_Categoria = s.ID_Categoria
	Left Join TB_Produto As p
	on s.ID_SubCategoria = p.ID_SubCategoria
	Order By ID_Produto