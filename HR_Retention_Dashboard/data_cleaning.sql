-- https://www.youtube.com/watch?v=PzyZI9uLXvY&t=15s

CREATE DATABASE hr_dashboard;

SELECT *
FROM hr_dashboard.human_resources;

-- Data Cleaning --
## Copy original table to make changes
CREATE TABLE hr_dashboard.human_resources_staging
LIKE hr_dashboard.human_resources;

## fix weird characters in id column header
ALTER TABLE hr_dashboard.human_resources 
RENAME COLUMN ï»¿id TO id;


INSERT hr_dashboard.human_resources_staging 
SELECT * FROM hr_dashboard.human_resources;

-- add uniformity to birthdate and hire_date columns
## Check birthdate column values
SELECT birthdate, DATE(STR_TO_DATE(birthdate, "%m-%d-%y"))
FROM hr_dashboard.human_resources_staging;
#WHERE birthdate IS NULL;

## Convert all dates to same format
UPDATE hr_dashboard.human_resources_staging
SET birthdate = 
CASE
	WHEN birthdate LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%c/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m-%d-%y'), '%Y-%m-%d')
    ELSE NULL
END;

## Make sure all birthdates in the past
UPDATE hr_dashboard.human_resources_staging
SET birthdate = 
(
DATE_SUB( birthdate,
INTERVAL
CASE
	WHEN birthdate <= CURRENT_DATE THEN 0
    ELSE 100
END YEAR )
);

ALTER TABLE hr_dashboard.human_resources_staging
MODIFY birthdate DATE;

## Check if hire date is before birthdate
SELECT birthdate, hire_date,
CASE
	WHEN hire_date LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%c/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m-%d-%y'), '%Y-%m-%d')
    ELSE NULL
END AS adjusted_date
FROM hr_dashboard.human_resources_staging
WHERE DATE(hire_date) < birthdate;


## Update hire_date column
UPDATE hr_dashboard.human_resources_staging
SET hire_date = 
CASE
	WHEN hire_date LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%c/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m-%d-%y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE hr_dashboard.human_resources_staging
MODIFY hire_date DATE;

## Rename termdate column
ALTER TABLE hr_dashboard.human_resources_staging
RENAME COLUMN termdate TO termdatetime;

## Add two new columns separating termdatetime to termdate and termtime 
ALTER TABLE hr_dashboard.human_resources_staging
ADD COLUMN termdate DATE,
ADD COLUMN termtime TIME;

## Check if can change datatypes
SELECT CAST(termdatetime AS DATETIME), DATE(STR_TO_DATE(termdatetime, '%Y-%m-%d %H:%i:%s UTC')), TIME(termdatetime)
FROM hr_dashboard.human_resources_staging
WHERE termdatetime IS NOT NULL AND termdatetime != "";

## Add values to termdate and termtime
UPDATE hr_dashboard.human_resources_staging
SET termdate = DATE(STR_TO_DATE(termdatetime, '%Y-%m-%d %H:%i:%s UTC')),
	termtime = TIME(STR_TO_DATE(termdatetime, '%Y-%m-%d %H:%i:%s UTC'))
	WHERE termdatetime IS NOT NULL AND termdatetime != "";


## Add age column and calculate age 
ALTER TABLE hr_dashboard.human_resources_staging
ADD COLUMN age INT;
UPDATE hr_dashboard.human_resources_staging
SET age = YEAR(CURRENT_DATE) - YEAR(birthdate);

## Check table after transformations
SELECT *
FROM hr_dashboard.human_resources_staging;

