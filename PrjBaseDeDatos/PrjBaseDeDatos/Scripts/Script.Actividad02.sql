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
SP_HELP departments;

-- //////////////////////////////////////////////////////////////////////////////////
-- 2
SELECT emp.employee_id,
	   emp.last_name,
	   emp.job_id,
	   emp.hire_date AS StartDate
FROM employees AS emp;

-- //////////////////////////////////////////////////////////////////////////////////
-- 3
SELECT DISTINCT job_id FROM employees;