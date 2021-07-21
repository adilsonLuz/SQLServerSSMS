-- -----------------------------------------------------------------------------------------
--sp_Sel_GridCliente
-- -----------------------------------------------------------------------------------------

/* Tabela


*/

Drop Procedure If Exists sp_Sel_GridProduto;
Go

Create Procedure sp_Sel_GridProduto(
	@pDs_Produto VarChar(200),
	@pDS_Categoria VarChar (100),
	@pQt_Estoque int

)As
Begin

	Select p.ID_Produto,
		   p.Ds_Produto,
		   C.Ds_Categoria,
		   p.Qt_Estoque

		From TB_Produto As p

		Inner Join TB_Categoria As c
			ON p.ID_Categoria = c.ID_Categoria

			where p.Ds_Produto Like '%'+ @pDs_Produto + '%'
			And	C.Ds_Categoria Like '%' + @pDS_Categoria + '%'
			
End;

-- Exec Sp_Sel_GridProduto '' , '' , 0