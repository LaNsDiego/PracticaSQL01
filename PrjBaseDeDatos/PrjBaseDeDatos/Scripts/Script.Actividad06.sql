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
-- Actividad N° 06 -  Funciones de Conversión

/* 1. Crear un reporte que muestre lo siguiente por cada empleado. */
	SELECT 'Sueldos Soñados'=(last_name + ' gana ' + Cast(salary as varchar(18)) + ' pero quisiera ' + Cast((salary * 3) as varchar(18))) from dbo.employees

/* 2. Realizar una consulta que muestre el Apellido del empleado, fecha de contratación y la Fecha de
Revisión del Salario, la cual es el primer Lunes después de cada seis meses de servicio, etiquetar la
columna como Revisión. */
	SELECT last_name, hire_date as Revision from employees 
	WHERE hire_date between '2003-06-17' and '2005-09-21' ;

	SELECT last_name, hire_date  FROM employees 
	WHERE  hire_date LIKE ('200%-06-*') ;

/* 3. Mostrar un reporte que tenga los Apellidos, Fecha de Contratación y el Día de Inicio de cada empleado
(Lunes, Martes, etc…), etiquetar la última columna como Día. Ordenar los resultados por el Día de Inicio
empezando por Lunes.*/
	SELECT e.last_name, e.hire_date, DateName(WEEKDAY, jh.START_DATE)as 'Dia' 
	FROM dbo.employees as e inner join dbo.job_history as jh on e.employee_id=jh.employee_id
    
/* 4. Crear un listado que muestre los Apellidos de los empleados y sus Montos de Comisión, en caso no
tenga comisión deberá mostrar el texto ‘Sin Comisión’, etiquetar esta ultima columna como Comisión.*/

	--muestras texto comision, si no tiene monto
	SELECT last_name AS 'Apellidos', 'Comision'='Sin Comision' FROM dbo.employees WHERE commission_pct <= 0 
	UNION
	--muestra comision y el calculo de dicha
	SELECT last_name as 'Apellidos', 'Comision'= Cast((salary * commission_pct) as varchar(20)) from dbo.employees where commission_pct > 0

/* 5. Utilizando la función DECODE, crear un reporte que muestre los apellidos, los puestos y los grados de
los empleados basados en sus puestos.*/

/* 6. Rescribir la consulta anterior utilizando la función CASE.
Guardar los comandos y las respuestas en el archivo lab_04_06.sql*/
	SELECT e.last_name as 'Apellidos', j.job_title, case 
	when j.job_id = 'AD_PRES' THEN 'A'
	WHEN j.job_id = 'ST_MAN' THEN 'B'
	WHEN j.job_id = 'IT_PROG' THEN 'C'
	WHEN j.job_id = 'SA_REP' THEN 'D'
	WHEN j.job_id = 'ST_CLERK' THEN 'E'
	ELSE '0' END AS 'Grados' FROM dbo.employees AS e INNER JOIN dbo.jobs AS j ON e.job_id=j.job_id
	GO