SELECT * FROM h1b_petitions.h1b_petitions;

/*Default Partition*/
SELECT employee_id, first_name, last_name, employer_name, job_title, prevailing_wage,
max(prevailing_wage) over() as max_prevailing_wage
FROM h1b_petitions.h1b_petitions;

/*The PARTITION BY clause is used with the OVER() clause to form clusters based on a specified column. */
SELECT employee_id, first_name, last_name, employer_name, job_title, prevailing_wage,
max(prevailing_wage) over(partition by job_title) as max_prevailing_wage
FROM h1b_petitions.h1b_petitions;

/*Cumulative SUM*/
SELECT employee_id, FIRST_NAME, job_title, prevailing_wage, 
SUM(prevailing_wage) OVER(ORDER BY job_title rows between UNBOUNDED PRECEDING AND CURRENT ROW) AS SUM
FROM h1b_petitions.h1b_petitions;

SELECT employee_id, FIRST_NAME, job_title, prevailing_wage, 
SUM(prevailing_wage) OVER(ORDER BY job_title, FIRST_NAME rows between UNBOUNDED PRECEDING AND CURRENT ROW) AS SUM
FROM h1b_petitions.h1b_petitions;

SELECT employee_id, FIRST_NAME, job_title, prevailing_wage, 
SUM(prevailing_wage) OVER(ORDER BY FIRST_NAME rows between UNBOUNDED PRECEDING AND CURRENT ROW) AS SUM
FROM h1b_petitions.h1b_petitions;

SELECT employee_id, FIRST_NAME, job_title, prevailing_wage, 
SUM(prevailing_wage) OVER(PARTITION BY job_title ORDER BY FIRST_NAME rows between UNBOUNDED PRECEDING AND CURRENT ROW) AS SUM
FROM h1b_petitions.h1b_petitions
limit 20;

SELECT employee_id, FIRST_NAME, job_title, prevailing_wage, 
SUM(prevailing_wage) OVER(PARTITION BY job_title ORDER BY FIRST_NAME rows between UNBOUNDED PRECEDING AND CURRENT ROW) AS SUM
FROM h1b_petitions.h1b_petitions
ORDER BY job_title, first_name
limit 20;

/* Rows that have the same value in the ORDER BY clause are considered peers. The ranking functions give the same answer for any two peer rows.*/
SELECT employee_id, FIRST_NAME, job_title, prevailing_wage, 
SUM(prevailing_wage) OVER(ORDER BY FIRST_NAME DESC rows between UNBOUNDED PRECEDING AND CURRENT ROW) AS SUM
FROM h1b_petitions.h1b_petitions;

/* Two distinct windows. Logically evaluated in multiple phases*/
Select employee_id, first_name, job_title, prevailing_wage,
avg(prevailing_wage) OVER(partition by job_title) AS AVG,
prevailing_wage - avg(prevailing_wage) OVER(partition by job_title) AS diff
FROM h1b_petitions.h1b_petitions
ORDER BY diff DESC
LIMIT 5;

/* Multiple window functions per window. Will be evaluated in the same phase. Better readability*/
Select employee_id, first_name, job_title, prevailing_wage,
avg(prevailing_wage) OVER w AS AVG,
prevailing_wage-avg(prevailing_wage) OVER w as diff
FROM h1b_petitions.h1b_petitions
WINDOW w as(partition by job_title)
ORDER BY diff DESC
LIMIT 5;

/*sliding avgerae*/
SELECT job_title, FILING_YEAR, prevailing_wage,
avg(prevailing_wage) OVER w AS AVG
FROM h1b_petitions.h1b_petitions
WINDOW w AS(ORDER BY FILING_YEAR RANGE BETWEEN 1 PRECEDING AND 1 FOLLOWING)
Limit 10;

/*ROW_NUMBER - gets a unique sequential number for each row in the specified data. it gives the rank one for the first row and increments the value by one for each row. We get different ranks for the rows having similar values as well*/
Select first_name, filing_year, job_title, prevailing_wage,
ROW_NUMBER() OVER W AS '#ROW'
FROM h1b_petitions.h1b_petitions
WINDOW W AS(partition by job_title ORDER BY prevailing_wage DESC, first_name ASC)
ORDER BY job_title, '#ROW';

Select first_name, filing_year, job_title, prevailing_wage,
ROW_NUMBER() OVER W AS '#ROW'
FROM h1b_petitions.h1b_petitions
WINDOW W AS(ORDER BY prevailing_wage DESC, first_name ASC)
ORDER BY job_title, '#ROW'
LIMIT 5;

USE WORLD;
SELECT continent, name, capital, population,
ROW_NUMBER() OVER W AS '#ROW'
FROM world.country
WINDOW W AS(partition by continent ORDER BY population DESC, name ASC)
ORDER by continent, '#ROW';

/*Rank()*/
SELECT continent, name, capital, population,
RANK() OVER W AS '#RANK'
FROM world.country
WINDOW W AS(partition by continent ORDER BY population DESC, name ASC)
ORDER by continent, '#RANK';

/*nTILE()*/
SELECT continent, name, capital, population,
NTILE(5) OVER W AS 'BUCKETS'
FROM world.country
WINDOW W AS (PARTITION BY continent ORDER BY population DESC, name ASC)
ORDER BY  'BUCKETS';

/*LEAD & LAG*/
SELECT continent, name, capital, population, LifeExpectancy,
LAG(LifeExpectancy,1) OVER W AS 'PREVIOUS_LIFEEXPECTANCY'
FROM world.country
WINDOW W AS (PARTITION BY continent ORDER BY POPULATION DESC, LifeExpectancy ASC)
ORDER BY continent;

SELECT continent, name, capital, population, LifeExpectancy,
LAG(LifeExpectancy,1,60) OVER W AS 'PREVIOUS_LIFEEXPECTANCY'
FROM world.country
WINDOW W AS (PARTITION BY continent ORDER BY POPULATION DESC, LifeExpectancy ASC)
ORDER BY continent;

SELECT continent, name, capital, population, LifeExpectancy,
LEAD(LifeExpectancy,2,60) OVER W AS 'NEXT_LIFEEXPECTANCY'
FROM world.country
WINDOW W AS (PARTITION BY continent ORDER BY POPULATION DESC, LifeExpectancy ASC)
ORDER BY continent;

USE AP;
CREATE VIEW VENDORS_MIN AS
SELECT vendor_name, vendor_state, vendor_phone
FROM vendors;

CREATE VIEW vendors_phone_list AS
SELECT vendor_name, vendor_contact_first_name, vendor_contact_last_name, vendor_phone
FROM vendors
WHERE vendor_id IN
(SELECT DISTINCT vendor_id FROM invoices);

CREATE OR REPLACE VIEW invoice_summary AS
SELECT vendor_name,
COUNT(*) AS invoice_count,
SUM(invoice_total) AS invoice_total_sum
FROM vendors JOIN invoices
ON vendors.vendor_id = invoices.vendor_id
GROUP BY vendor_name;