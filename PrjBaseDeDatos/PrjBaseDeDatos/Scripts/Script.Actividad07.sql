/*
Plantilla de script posterior a la implementación							
--------------------------------------------------------------------------------------
 Este archivo contiene instrucciones de SQL que se anexarán al script de compilación.		
 Use la sintaxis de SQLCMD para incluir un archivo en el script posterior a la implementación.			
 Ejemplo:      :r .\miArchivo.sql								
 Use la sintaxis de SQLCMD para hacer referencia a una variable en el script posterior a la implementación.		
 Ejemplo:      :setvar TableName miTabla							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


-- 1

SELECT ROUND(MAX(salary),0) AS Maximo, ROUND(MIN(salary),0) AS Minimo, ROUND(SUM(salary),0)
AS Sumatoria, ROUND(AVG(salary),0) AS Promedio
FROM employees;

-- 2
SELECT ROUND(MAX(salary),0) AS Maximo, ROUND(MIN(salary),0) AS Minimo, ROUND(SUM(salary),0)
AS Sumatoria, ROUND(AVG(salary),0) AS Promedio
FROM employees GROUP by employees.job_id;

-- 3

SELECT COUNT(*)
FROM employees
GROUP BY job_id;

-- 4
SELECT COUNT(DISTINCT manager_id) AS Numero_de_Administradores
FROM employees;

-- 5
SELECT (MAX(salary) - MIN(salary)) AS diferencia
FROM employees;

-- 6
SELECT salman.minimo,
salman.manager_id
FROM (SELECT MIN(salary) AS minimo,
manager_id
FROM employees
WHERE salary <= 6000
GROUP BY manager_id AS salman
ORDER BY salman.minimo;

-- 7
SELECT count(*) as totalempleados , (SELECT count(*)
from employees
where hire_date between '1995-01-01' and '1999-01-01') AS PORAÑO
from employees

-- 8
SELECT e.employee_id 'ID empleado' , j.job_title ' Nombre trabajo', e.salary 'Salario', e.department_id 'Nro Departamento'
FROM jobs as j
join employees as e
on j.job_id = e.job_id
	