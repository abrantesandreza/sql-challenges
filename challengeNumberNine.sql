/* 9 - Faça um procedimento que retorne o nome do produto, a quantidade comprada e 
o valor total, com retorno de mensagem */

CREATE OR ALTER PROCEDURE person_ShoppingCart(@IDProduct AS INT, @quantidadeProduto AS INT, @Cod AS INT = 2)
AS 
SET NOCOUNT ON
	IF @IDProduct >= 100 
			BEGIN
				SELECT DISTINCT PP.Name AS Nome, SO.UnitPrice AS Valor_Unitario, @quantidadeProduto AS Quantidade, (SO.UnitPrice * @quantidadeProduto) AS Total
				FROM Production.Product AS PP
					JOIN Sales.SalesOrderDetail AS SO 
						ON PP.ProductID = SO.ProductID
				WHERE PP.ProductID = @IDProduct
				RETURN 1
			END
	ELSE
		RETURN @Cod

DECLARE @infoExists INT
EXEC @infoExists = person_ShoppingCart @IDProduct = 709, @quantidadeProduto =  2
PRINT @infoExists