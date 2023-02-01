/* 3 - Preciso do nome dos produtos e a soma de suas vendas, agrupadas  */

SELECT PP.Name AS Product, SUM(SOD.LineTotal) AS Total_SUM, PP.ProductID AS Product_ID
FROM Production.Product AS PP
    INNER JOIN Sales.SalesOrderDetail AS SOD
        ON PP.ProductID = SOD.ProductID
GROUP BY PP.ProductID, PP.Name