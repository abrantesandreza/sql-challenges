/* 8 - Faça um procedimento que retorne o nome do produto, a quantidade comprada e 
o valor total */

CREATE OR ALTER PROCEDURE person_ShoppingCart(@IDProduct AS INT, @quantidadeProduto AS INT)
AS
	BEGIN
		SELECT DISTINCT PP.Name AS Nome, SO.UnitPrice AS Valor_Unitario, @quantidadeProduto AS Quantidade, (SO.UnitPrice * @quantidadeProduto) AS Total
		FROM Production.Product AS PP
			JOIN Sales.SalesOrderDetail AS SO 
				ON PP.ProductID = SO.ProductID
		WHERE PP.ProductID = @IDProduct
	END

EXEC person_ShoppingCart @IDProduct = 862, @quantidadeProduto =  3