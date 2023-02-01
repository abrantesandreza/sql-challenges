/* 5 - Preciso de uma lista com todas as pessoas que possuem o cartao de credito 'SuperiorCard' */

SELECT CONCAT(PP.FirstName, ' ', PP.MiddleName, ' ', PP.LastName) AS Full_Name, CC.CardType AS Card_Type
FROM Person.Person AS PP
    INNER JOIN Sales.PersonCreditCard AS PCC
        ON PP.BusinessEntityID = PCC.BusinessEntityID
    INNER JOIN Sales.CreditCard AS CC
        ON PCC.CreditCardID = CC.CreditCardID
WHERE CC.CardType LIKE 'SuperiorCard'
ORDER BY Full_Name