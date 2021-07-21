create view vlistaprodutos as 
	Select p.ID as Código, p.Ds_Produto as Produto, p.Ds_Preco as Preço,
	   p.Qt_Estoque as Estoque, f.Nm_Fornecedor as Fornecedor From TB_Produtos as p
inner join TB_Fornecedores as f on (p.For_ID = f.ID)