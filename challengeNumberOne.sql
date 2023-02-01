/* 1 - Preciso do nome completo de todos os meus funcionarios, suas respectivas datas de nascimento e qual
o seu cargo na empresa */

SELECT CONCAT(PP.FirstName, ' ', PP.MiddleName, ' ', PP.LastName) AS Full_Name, HRE.BirthDate AS Birth_Date, HRE.JobTitle AS Job_Title
FROM Person.Person AS PP
    INNER JOIN HumanResources.Employee AS HRE
	    ON PP.BusinessEntityID = HRE.BusinessEntityID
ORDER BY Full_Name

