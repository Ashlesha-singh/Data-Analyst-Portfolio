SELECT attrition, COUNT(*)
FROM employee_attrition
GROUP BY attrition;
SELECT
    attrition,
    LENGTH(attrition) AS value_length,
    '[' || attrition || ']' AS visible_value
FROM employee_attrition
GROUP BY attrition;
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition;
SELECT
    department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY department
ORDER BY attrition_rate DESC;

SELECT
    job_role,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY job_role
ORDER BY attrition_rate DESC;
SELECT
    overtime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY overtime
ORDER BY attrition_rate DESC;
SELECT
    attrition,
    COUNT(*) AS total_employees,
    ROUND(AVG(monthly_income), 2) AS average_monthly_income
FROM employee_attrition
GROUP BY attrition
ORDER BY attrition;
SELECT
    attrition,
    COUNT(*) AS total_employees,
    ROUND(AVG(years_at_company), 2) AS average_years_at_company
FROM employee_attrition
GROUP BY attrition
ORDER BY attrition;
SELECT
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY age_group
ORDER BY attrition_rate DESC;
SELECT
    job_satisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY job_satisfaction
ORDER BY job_satisfaction;
SELECT
    work_life_balance,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY work_life_balance
ORDER BY work_life_balance;
SELECT
    business_travel,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY business_travel
ORDER BY attrition_rate DESC;
SELECT
    overtime,
    job_satisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY overtime, job_satisfaction
ORDER BY overtime, job_satisfaction;
WITH role_attrition AS (
    SELECT
        job_role,
        COUNT(*) AS total_employees,
        SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) AS employees_left,
        ROUND(
            100.0 * SUM(CASE WHEN attrition = '1' THEN 1 ELSE 0 END) / COUNT(*),
            2
        ) AS attrition_rate
    FROM employee_attrition
    GROUP BY job_role
)

SELECT
    job_role,
    total_employees,
    employees_left,
    attrition_rate,
    RANK() OVER (ORDER BY attrition_rate DESC) AS attrition_rank
FROM role_attrition
ORDER BY attrition_rank;







