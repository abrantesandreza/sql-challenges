/* 2 - Preciso do nome e do endereço completo de todos os meus funcionarios que moram 
na California */

SELECT CONCAT(PP.FirstName, ' ', PP.MiddleName, ' ', PP.LastName) AS Full_Name, CONCAT(PA.AddressLine1, ' ', PA.AddressLine2, ' ', PA.City, ' ', PA.PostalCode) AS Full_Address, PA.StateProvinceID AS State_Code
FROM Person.Person AS PP
    INNER JOIN Person.BusinessEntityAddress AS PBEA
        ON PP.BusinessEntityID = PBEA.BusinessEntityID
    INNER JOIN Person.Address AS PA
        ON PBEA.AddressID = PA.AddressID
WHERE PA.StateProvinceID = 9
ORDER BY Full_Name