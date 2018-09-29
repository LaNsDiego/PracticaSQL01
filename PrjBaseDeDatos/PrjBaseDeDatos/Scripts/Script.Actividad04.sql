-- Actividad N° 04 – Restricción y Ordenamiento

/*01*/
SELECT last_name,salary FROM employees WHERE salary > 12000;
GO

/*02*/
SELECT last_name,department_id FROM employees WHERE employee_id > 176;
GO

/*03*/
SELECT last_name,job_id,salary AS Sal FROM employees WHERE salary > 5000 AND salary < 12000;
GO

/*04*/
SELECT last_name,job_id,hire_date FROM employees WHERE last_name = 'Matos' OR last_name = 'Taylor' ORDER BY hire_date ASC;
GO

/*05*/
SELECT last_name,department_id FROM employees WHERE department_id = 20 OR department_id = 50 ORDER BY last_name ASC;
GO

/*06*/
SELECT last_name 'Empleado',salary 'Salario Mensual' FROM employees WHERE salary > 5000 AND salary < 12000 AND (department_id = 20 OR department_id = 50);
GO

/*07*/
SELECT last_name,hire_date FROM employees WHERE hire_date = '1994'
GO

/*08*/
SELECT last_name,job_id FROM employees WHERE manager_id IS NULL;
GO

/*09*/
SELECT last_name,salary,commission_pct FROM employees ORDER BY salary DESC,commission_pct DESC;
GO

/*10*/
DECLARE @salario AS DECIMAL(9,2);
SET @salario = 12000;
SELECT last_name,salary FROM employees WHERE salary > @salario;
GO

/*11*/
DECLARE @gerente AS INT;
SET @gerente = 103;
SELECT employee_id,last_name,salary,department_id FROM employees WHERE manager_id = @gerente ORDER BY last_name;
SET @gerente = 201;
SELECT employee_id,last_name,salary,department_id FROM employees WHERE manager_id = @gerente ORDER BY salary;
SET @gerente = 124;
SELECT employee_id,last_name,salary,department_id FROM employees WHERE manager_id = @gerente ORDER BY employee_id;
GO

/*12*/
SELECT last_name FROM employees WHERE SUBSTRING(last_name,3,1) = 'a';
GO

/*13*/
SELECT last_name FROM employees WHERE SUBSTRING(last_name,3,1) = 'a' OR SUBSTRING(last_name,3,1) = 'e';
GO

/*14*/
SELECT last_name,job_id,salary FROM employees WHERE (job_id = 'SA_REP' OR job_id = 'ST_CLERK') AND (salary = 2500 OR salary = 3500 OR salary = 7000);
GO

/*15*/
SELECT last_name 'Empleado',salary 'Salario Mensual',commission_pct FROM employees WHERE salary > 5000 AND salary < 12000 AND (department_id = 20 OR department_id = 50) AND commission_pct = 0.20;
GO