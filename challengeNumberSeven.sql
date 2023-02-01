/* 7 - Desafio: Quero todas as pessoas pertencentes ao departamento 'Research and Development' 
e que eu possa futuramente trocar o departamento e fazer uma nova consulta sem precisar 
reescrever um novo codigo */

CREATE OR ALTER FUNCTION departmentPeople(@nameDepartment AS VARCHAR(60)) 
RETURNS Table
AS
RETURN (
	SELECT CONCAT(PP.FirstName, ' ', PP.MiddleName, ' ', PP.LastName) AS Full_Name, HE.JobTitle AS Job, HD.GroupName AS Department
	FROM Person.Person AS PP
		INNER JOIN HumanResources.Employee AS HE 
            ON PP.BusinessEntityID = HE.BusinessEntityID
		INNER JOIN HumanResources.EmployeeDepartmentHistory AS EPH 
            ON HE.BusinessEntityID = EPH.BusinessEntityID
		INNER JOIN HumanResources.Department AS HD 
            ON EPH.DepartmentID = HD.DepartmentID
	WHERE HD.GroupName = @nameDepartment
	)


SELECT Full_Name, Job, Department
FROM departmentPeople('Research and Development')
ORDER BY Full_Name