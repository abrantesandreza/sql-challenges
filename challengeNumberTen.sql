/* 10 - Quero o nome dos produtos que custam mais que um determinado valor e seus
respectivos valores */

CREATE OR ALTER FUNCTION precoProduto(@valorMinimo MONEY)
RETURNS Table
AS 
RETURN (
	SELECT PP.Name, SOD.UnitPrice
	FROM Production.Product AS PP
		JOIN Sales.SalesOrderDetail AS SOD 
			ON PP.ProductID = SOD.ProductID
	WHERE SOD.UnitPrice >= @valorMinimo
	)

SELECT Name, UnitPrice
FROM precoProduto(2500.00)