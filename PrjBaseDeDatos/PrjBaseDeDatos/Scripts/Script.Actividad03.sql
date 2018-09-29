-- Actividad N° 03 - Consultas Básicas

/* 1. El departamento de Recursos Humanos requiere ampliar el reporte anterior (4.2.2) para hacerlo más
comprensible, por lo que se requiere que los encabezados de las columnas sean: Emp N°, Empleado,
Puesto y Fecha Contratación */
SELECT emp.employee_id AS 'Emp N°',
	   emp.last_name AS 'Empleado',
	   emp.job_id AS 'Puesto',
	   emp.hire_date AS 'Fecha de contratación'
FROM employees AS emp;

/* 2. Adicionalmente el departamento de Recursos Humanos requiere un reporte más sencillo, en el que se
muestre los campos: last_name y job_id en una sola y única columna (los datos deben estar separados
por una coma) que tenga como alias Empleado y Puesto. */
SELECT CONCAT(emp.last_name,',',emp.job_id) AS 'Empleado y Puesto'
FROM employees AS emp;

/* 3. Finalmente a modo de práctica, realizar una consulta que muestre todos los campos de la tabla
EMPLOYEES, en una sola y única columna, los datos deben estar separados por una coma y la columna
debe tener como encabezado Los Empleados. */
SELECT CONCAT(emp.employee_id,',',
			  emp.first_name,',',
			  emp.last_name,',',
			  emp.email,',',
			  emp.phone_number,',',
			  emp.hire_date,',',
			  emp.job_id,',',
			  emp.salary,',',
			  emp.commission_pct,',',
			  emp.manager_id,',',
			  emp.department_id) AS 'Los empleados'
FROM employees AS emp;