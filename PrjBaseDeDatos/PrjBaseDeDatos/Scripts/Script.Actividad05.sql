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
-- Actividad N° 05 - Funciones
	

/* 1. Se requiere realizar una consulta que visualice la fecha del sistema.*/
	SELECT CONVERT (DATE, SYSDATETIME())
    ,CONVERT (DATE, SYSDATETIMEOFFSET())
    ,CONVERT (DATE, SYSUTCDATETIME())
    ,CONVERT (DATE, CURRENT_TIMESTAMP)
    ,CONVERT (DATE, GETDATE())
    ,CONVERT (DATE, GETUTCDATE());

/* 2. El departamento de Recursos Humanos necesita un reporte de todos los empleados que muestre el N°
de Empleado, Apellidos, Salario y una columna más con el cálculo del salario incrementado en 15.5%
(expresado solo en enteros) esta columna debe etiquetarse Nuevo Salario.*/
	SELECT employee_id,last_name,salary,salary*0.155 AS newsalary FROM employees

/* 3. Modificar la consulta anterior y adicionar una columna que muestre el resultado de la resta entre el
antiguo salario y el nuevo salario. Etiquetar esta columna como Incremento.*/
	SELECT employee_id,last_name,salary,salary*0.155 AS newsalary,salary-(salary*0.155) AS incremento FROM employees

/* 4. Crear un reporte que muestre los Apellidos (con la primera letra en Mayúsculas y las demás en
Minúsculas) y la longitud de los apellidos (colocar alias Longitud), para todos aquellos empleados
quienes sus apellidos empiecen con las letras ‘J’, ‘A’ y ‘M’. Ordenar los resultados por la columna
Apellido.*/
	SELECT UPPER(LEFT(last_name,1))+ (LOWER(SUBSTRING(last_name,1,LEN(last_name)))) AS ALEAS FROM employees WHERE last_name LIKE 'J%' OR last_name LIKE 'M%' OR last_name LIKE 'A%' ORDER BY last_name ASC;
 
	SELECT UPPER(last_name) "Apellido", (LOWER(first_name)) "Longitud" 
	FROM employees 
	WHERE last_name like 'A%'
      or last_name like 'J%'
      or last_name like 'M%' order by last_name asc;

/* 5. Modificar la consulta anterior a fin de que consulte primero al usuario con que letra empieza el apellido
a buscar. Considerar que no importa si la letra esta mayúscula o minúscula de igual manera debe
mostrar los resultados.*/
	SELECT initcap(FIRSST_NAME) AS "name", length(first_name) AS "Length" FROM employees WHERE UPPER(substr(first_name,1,1))=UPPER('&Inicial') ORDER BY first_name; 

/* 6. El departamento de Recursos Humanos la duración o tiempo de permanencia de cada empleado,
mostrar el Apellido y el calculo del número de meses entre la fecha de hoy y la fecha en que fue
contratado el empleado, Etiquetar la columna como Meses Trabajados, ordenar los resultados por el
resultado de los números de meses, Redondear el número de meses al entero más cercano.*/
	SELECT LAST_NAME, ROUND(MONTH_BETWEEN(SYSDATE,HIRE_DATE),0) "MONTHS_WORK" FROM employees ORDER BY MONTHS_BETWEEN (HIRE_DATE,SYSDATE);

/* 7. Crear una consulta que devuelva los Apellidos y Salarios de todos los empleados, Formatear la columna
salario para que muestre 15 caracteres, completar con el símbolo ‘$’ los espacios previos al valor de la
columna salario, ejemplo: $$$$$$$$$$10000. Etiquetar esta columna como Salario.*/
	SELECT last_name, lpad(salary,15,'$') as salary from employees;

/* 8. Crear una consulta que muestre en una única columna los primeros 8 caracteres del apellido de los
empleados e indique sus salarios representados por asteriscos (‘*’), cada asterisco representa el valor
1000. Ordenar el listado por el salario de los empleados. Asimismo Etiquetar la columna como
‘Empleados y sus Salarios’*/
	SELECT substr(last_name,1,8) || rpad(' ', salary/1000, '*') AS "EMPLOYEES_AND_THEIR_SALARIES" FROM employees ORDER BY salary;

/* 9. Finalmente crear una consulta que muestre los Apellidos de los empleados y el N° de Semanas
Empleado hasta la actualidad para todos los empleados del departamento N° 90, truncar el número de
semanas a sin decimales. Ordenar el resultado por el N° de Semanas y etiquetar la columna tendencia.*/
	SELECT last_name, TRUNC(((SYSDATE-hire_date)/7),0) as TENURE from employees where department_id=90 ORDER BY hire_date DESC;