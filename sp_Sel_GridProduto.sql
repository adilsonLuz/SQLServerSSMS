-- ------------------------------------------------------------------
-- sp_Sel_GridProduto
-- ------------------------------------------------------------------


/*Create Table TB_Categoria (
  ID_Categoria Int Identity(1,1),
  Ds_Categoria Varchar(100),
  Primary Key (ID_Categoria)
);

Create Table TB_Produto (
  ID_Produto Int Identity(1,1),
  Ds_Produto Varchar(200),
  Qt_Estoque Int Default 0,
  ID_Categoria Int,
  Primary Key (ID_Produto),
  Foreign Key (ID_Categoria)
     References TB_Categoria(ID_Categoria)
);

ID_Produto / Ds_Produto / Ds_Categoria / Qt_Est
*/

-- Verif Exists
Drop Procedure If Exists sp_Sel_GridProduto;
Go

-- Criação
Create Procedure sp_Sel_GridProduto(
	@pDs_Produto Varchar(200),
	@pDs_Categoria Varchar(100)
) As
Begin

   Select P.ID_Produto,
          P.Ds_Produto,
		  C.Ds_Categoria,
		  P.Qt_Estoque

      From TB_Produto As P

	  Inner Join TB_Categoria As C
	        ON P.ID_Categoria = C.ID_Categoria

	  Where P.Ds_Produto Like '%' + @pDs_Produto + '%'

	  And   C.Ds_Categoria Like '%' + @pDs_Categoria + '%'

End;

-- Exec Sp_Sel_GridProduto 'RR','G'
