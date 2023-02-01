/* 4 - Preciso da contagem de todas as pessoas registradas com cartoes de credito no sistema 
agrupados por tipo de cartao */

SELECT COUNT(PCC.BusinessEntityID) AS Total_People, CC.CardType AS Card_Type
FROM Sales.CreditCard AS CC
    INNER JOIN Sales.PersonCreditCard AS PCC
        ON CC.CreditCardID = PCC.CreditCardID
GROUP BY CC.CardType
