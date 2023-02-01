/* 6 - Este ano de 2022 foi excelente, e estamos muito felizes que a empresa atingiu suas metas. 
Por isso, queremos presentear alguns dos nossos funcionários mais antigos. Quero enviar 
um panetone ao endereço de cada um dos nossos engenheiros. Por isso, preciso visualizar 
o endereço completo de todos os engenheiros que começaram na empresa antes de 2022. 
Quero enviar junto com o presente, uma carta e um email agradecendo pelo tempo de 
trabalho e dedicação.*/

SELECT CONCAT(PP.FirstName, ' ', PP.MiddleName, ' ', PP.LastName) AS Full_Name , CONCAT(PA.AddressLine1, ' ' , PA.AddressLine2, ' ', PA.City, ' ', PA.PostalCode) AS Address, HE.HireDate AS Hire_Date, PEA.EmailAddress AS Email
FROM Person.Address AS PA
	INNER JOIN Person.BusinessEntityAddress AS PB
		ON PA.AddressID = PB.AddressID
	INNER JOIN Person.Person AS PP 
		ON PP.BusinessEntityID = PB.BusinessEntityID
	INNER JOIN HumanResources.Employee AS HE
		ON PP.BusinessEntityID = HE.BusinessEntityID
	INNER JOIN Person.EmailAddress AS PEA
		ON PP.BusinessEntityID = PEA.BusinessEntityID
WHERE HE.HireDate < '20220101' AND HE.JobTitle LIKE '%Engineer%'
ORDER BY Full_Name
