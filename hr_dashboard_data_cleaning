-- https://www.youtube.com/watch?v=PzyZI9uLXvY&t=15s

-- Data Analysis

# 1.	What is the gender breakdown of employees in the company?
SELECT gender, COUNT(gender) AS cnt_gender
FROM hr_dashboard.human_resources_staging
GROUP BY gender;
# Male: 11288
# Female: 10321
# Non-Conforming: 605


# 2.	What is the race/ethnicity breakdown of employees in the company?
SELECT race, COUNT(race) AS cnt_race
FROM hr_dashboard.human_resources_staging
GROUP BY race
ORDER BY cnt_race DESC;
/*
White, 6328
Two or More Races, 3648
Black or African American, 3619
Asian, 3562
Hispanic or Latino, 2501
American Indian or Alaska Native, 1327
Native Hawaiian or Other Pacific Islander, 1229
*/


# 3.	What is the age distribution of employees in the company?
SELECT MIN(age) ,MAX(age)
FROM hr_dashboard.human_resources_staging;
# Min age: 23
# Max age: 60


# 4.	How many employees work at headquarters versus remote locations?
SELECT location, COUNT(location)
FROM hr_dashboard.human_resources_staging
GROUP BY location;
# Headquarters, 16715
# Remote, 5499


# 5.	What is the average length of employment for employees who have been terminated?
CREATE TEMPORARY TABLE avg_emp_length (
SELECT AVG(emp_length), FLOOR(DATEDIFF(termdate,hire_date)/30) AS as_months, MOD(DATEDIFF(termdate,hire_date),30) AS as_days,
CAST(CONCAT(FLOOR(DATEDIFF(termdate,hire_date)/30), ".", MOD(DATEDIFF(termdate,hire_date),30)) AS FLOAT) AS as_combo
FROM (SELECT hire_date, termdate,
CASE
	WHEN termdate < CURRENT_DATE() THEN DATEDIFF(termdate,hire_date)
END AS emp_length
FROM hr_dashboard.human_resources_staging
WHERE termdate IS NOT NULL AND termdate < CURRENT_DATE()
) AS subquery
GROUP BY as_combo, as_months, as_days
);
SELECT AVG(as_combo)/12 AS term_avg_emp_length
FROM avg_emp_length;
# 8 years and 5 months

#SELECT ROUND(AVG(DATEDIFF(termdate, hire_date))/365,0) AS avg_length_of_employment
#FROM hr_dashboard.human_resources_staging
#WHERE termdate IS NOT NULL AND termdate < CURRENT_DATE();



# 6.	How does the gender distribution vary across departments and job titles?
SELECT department, gender, COUNT(*) #COUNT(DISTINCT(department)), gender
FROM hr_dashboard.human_resources_staging
GROUP BY department, gender
ORDER BY department;
/* Accounting, Female, 1531
Accounting, Male, 1711
Accounting, Non-Conforming, 91
Auditing, Female, 24
Auditing, Male, 28
Business Development, Female, 757
Business Development, Male, 836
Business Development, Non-Conforming, 49
Engineering, Female, 3120
Engineering, Male, 3373
Engineering, Non-Conforming, 193
Human Resources, Female, 861
Human Resources, Male, 904
Human Resources, Non-Conforming, 42
Legal, Female, 140
Legal, Male, 162
Legal, Non-Conforming, 9
Marketing, Female, 233
Marketing, Male, 256
Marketing, Non-Conforming, 5
Product Management, Female, 277
Product Management, Male, 349
Product Management, Non-Conforming, 15
Research and Development, Female, 513
Research and Development, Male, 531
Research and Development, Non-Conforming, 40
Sales, Female, 839
Sales, Male, 946
Sales, Non-Conforming, 47
Services, Female, 800
Services, Male, 853
Services, Non-Conforming, 33
Support, Female, 437
Support, Male, 481
Support, Non-Conforming, 36
Training, Female, 789
Training, Male, 858
Training, Non-Conforming, 45
*/

SELECT jobtitle, gender, COUNT(*) AS cnt
FROM hr_dashboard.human_resources_staging
#WHERE gender = "Non-Conforming"
GROUP BY jobtitle, gender
ORDER BY cnt DESC;
/*
Account Coordinator, Male, 2
Account Executive, Female, 258
Account Executive, Male, 237
Account Executive, Non-Conforming, 10
Account Manager, Female, 102
Account Manager, Male, 107
Account Manager, Non-Conforming, 5
Accountant I, Female, 30
Accountant I, Male, 46
Accountant I, Non-Conforming, 3
Accountant II, Female, 48
Accountant II, Male, 39
Accountant II, Non-Conforming, 2
Accountant III, Female, 45
Accountant III, Male, 38
Accountant III, Non-Conforming, 3
Accountant IV, Female, 38
Accountant IV, Male, 46
Accountant IV, Non-Conforming, 3
Accounting Assistant I, Female, 42
Accounting Assistant I, Male, 44
Accounting Assistant I, Non-Conforming, 3
Accounting Assistant II, Female, 34
Accounting Assistant II, Male, 47
Accounting Assistant II, Non-Conforming, 2
Accounting Assistant III, Female, 34
Accounting Assistant III, Male, 35
Accounting Assistant III, Non-Conforming, 3
Accounting Assistant IV, Female, 49
Accounting Assistant IV, Male, 46
Actuary, Female, 13
Actuary, Male, 15
Administrative Assistant, Female, 20
Administrative Assistant, Male, 19
Administrative Assistant, Non-Conforming, 1
Administrative Assistant I, Female, 90
Administrative Assistant I, Male, 103
Administrative Assistant I, Non-Conforming, 3
Administrative Assistant II, Female, 24
Administrative Assistant II, Male, 21
Administrative Assistant II, Non-Conforming, 1
Administrative Assistant III, Female, 9
Administrative Assistant III, Male, 7
Administrative Assistant IV, Female, 3
Administrative Assistant IV, Male, 5
Administrative Officer, Female, 27
Administrative Officer, Male, 30
Administrative Officer, Non-Conforming, 2
Analog Circuit Design manager, Female, 20
Analog Circuit Design manager, Male, 27
Analog Circuit Design manager, Non-Conforming, 1
Analyst Programmer, Female, 181
Analyst Programmer, Male, 179
Analyst Programmer, Non-Conforming, 12
Assistant Manager, Female, 21
Assistant Manager, Male, 23
Assistant Manager, Non-Conforming, 1
Assistant Professor, Male, 1
Assistant Trainer, Female, 85
Assistant Trainer, Male, 93
Assistant Trainer, Non-Conforming, 4
Associate Professor, Male, 1
Attorney, Female, 14
Attorney, Male, 23
Attorney, Non-Conforming, 3
Automation Specialist I, Female, 8
Automation Specialist I, Male, 16
Automation Specialist I, Non-Conforming, 4
Automation Specialist II, Female, 14
Automation Specialist II, Male, 14
Automation Specialist II, Non-Conforming, 2
Automation Specialist III, Female, 7
Automation Specialist III, Male, 5
Automation Specialist III, Non-Conforming, 1
Automation Specialist IV, Female, 13
Automation Specialist IV, Male, 7
Automation Specialist IV, Non-Conforming, 1
Budget/Accounting Analyst I, Female, 80
Budget/Accounting Analyst I, Male, 79
Budget/Accounting Analyst I, Non-Conforming, 2
Budget/Accounting Analyst II, Female, 69
Budget/Accounting Analyst II, Male, 93
Budget/Accounting Analyst II, Non-Conforming, 4
Budget/Accounting Analyst III, Female, 77
Budget/Accounting Analyst III, Male, 78
Budget/Accounting Analyst III, Non-Conforming, 5
Budget/Accounting Analyst IV, Female, 82
Budget/Accounting Analyst IV, Male, 94
Budget/Accounting Analyst IV, Non-Conforming, 5
Business Analyst, Female, 333
Business Analyst, Male, 351
Business Analyst, Non-Conforming, 24
Business Development Manager, Female, 1
Business Development Manager, Male, 4
Business Systems Development Analyst, Female, 155
Business Systems Development Analyst, Male, 172
Business Systems Development Analyst, Non-Conforming, 14
Chief Design Engineer, Female, 44
Chief Design Engineer, Male, 46
Chief Design Engineer, Non-Conforming, 2
Community Outreach Specialist, Female, 18
Community Outreach Specialist, Male, 11
Community Outreach Specialist, Non-Conforming, 1
Compensation Analyst, Female, 13
Compensation Analyst, Male, 17
Compensation Analyst, Non-Conforming, 1
Computer Systems Analyst I, Female, 45
Computer Systems Analyst I, Male, 43
Computer Systems Analyst I, Non-Conforming, 2
Computer Systems Analyst II, Female, 43
Computer Systems Analyst II, Male, 48
Computer Systems Analyst II, Non-Conforming, 1
Computer Systems Analyst III, Female, 34
Computer Systems Analyst III, Male, 40
Computer Systems Analyst III, Non-Conforming, 2
Computer Systems Analyst IV, Female, 30
Computer Systems Analyst IV, Male, 41
Computer Systems Analyst IV, Non-Conforming, 1
Content Developer, Female, 21
Content Developer, Male, 33
Content Developer II, Female, 20
Content Developer II, Male, 29
Content Developer II, Non-Conforming, 5
Content Developer III, Female, 25
Content Developer III, Male, 27
Content Developer III, Non-Conforming, 2
Cost Accountant, Female, 139
Cost Accountant, Male, 158
Cost Accountant, Non-Conforming, 11
Customer Success Manager, Female, 88
Customer Success Manager, Male, 119
Customer Success Manager, Non-Conforming, 7
Data Coordiator, Female, 162
Data Coordiator, Male, 179
Data Coordiator, Non-Conforming, 15
Data Visualization Specialist, Female, 202
Data Visualization Specialist, Male, 242
Data Visualization Specialist, Non-Conforming, 13
Database Administrator I, Female, 36
Database Administrator I, Male, 44
Database Administrator I, Non-Conforming, 4
Database Administrator II, Female, 41
Database Administrator II, Male, 49
Database Administrator II, Non-Conforming, 1
Database Administrator III, Female, 44
Database Administrator III, Male, 36
Database Administrator III, Non-Conforming, 3
Database Administrator IV, Female, 43
Database Administrator IV, Male, 38
Database Administrator IV, Non-Conforming, 2
Design Engineer, Female, 28
Design Engineer, Male, 25
Design Engineer, Non-Conforming, 1
Desktop Support Technician, Female, 133
Desktop Support Technician, Male, 172
Desktop Support Technician, Non-Conforming, 16
Developer I, Female, 47
Developer I, Male, 30
Developer I, Non-Conforming, 4
Developer II, Female, 31
Developer II, Male, 29
Developer II, Non-Conforming, 7
Developer III, Female, 36
Developer III, Male, 46
Developer III, Non-Conforming, 1
Developer IV, Female, 39
Developer IV, Male, 37
Director of Sales, Female, 5
Director of Sales, Male, 3
Director of Sales, Non-Conforming, 1
Editor, Female, 46
Editor, Male, 46
Electrical Engineer, Female, 17
Electrical Engineer, Male, 13
Electrical Engineer, Non-Conforming, 1
Engineer I, Female, 4
Engineer I, Male, 5
Engineer II, Female, 1
Engineer II, Male, 5
Engineer III, Female, 2
Engineer III, Male, 3
Engineer IV, Female, 1
Engineer IV, Male, 2
Executive Assistant, Female, 18
Executive Assistant, Male, 21
Executive Assistant, Non-Conforming, 1
Executive Secretary, Female, 1
Executive Secretary, Male, 1
Financial Advisor, Female, 14
Financial Advisor, Male, 12
Financial Advisor, Non-Conforming, 2
Financial Analyst, Female, 36
Financial Analyst, Male, 30
Financial Analyst, Non-Conforming, 2
General Manager, Female, 15
General Manager, Male, 16
General Manager, Non-Conforming, 1
Graphic Designer, Female, 9
Graphic Designer, Male, 3
Help Desk Operator, Female, 50
Help Desk Operator, Male, 39
Help Desk Operator, Non-Conforming, 3
Help Desk Technician, Female, 160
Help Desk Technician, Male, 169
Help Desk Technician, Non-Conforming, 7
HR Manager, Female, 93
HR Manager, Male, 109
HR Manager, Non-Conforming, 2
Human Resources Analyst, Female, 178
Human Resources Analyst, Male, 220
Human Resources Analyst, Non-Conforming, 10
Human Resources Analyst II, Female, 308
Human Resources Analyst II, Male, 292
Human Resources Analyst II, Non-Conforming, 13
Human Resources Assistant I, Female, 4
Human Resources Assistant I, Male, 11
Human Resources Assistant II, Female, 5
Human Resources Assistant II, Male, 5
Human Resources Assistant III, Female, 8
Human Resources Assistant III, Male, 6
Human Resources Assistant III, Non-Conforming, 1
Human Resources Assistant IV, Female, 5
Human Resources Assistant IV, Male, 6
Human Resources Assistant IV, Non-Conforming, 1
Human Resources Manager, Female, 36
Human Resources Manager, Male, 26
Human Resources Manager, Non-Conforming, 1
Information Systems Manager, Female, 17
Information Systems Manager, Male, 17
Information Systems Manager, Non-Conforming, 1
Internal Auditor, Female, 24
Internal Auditor, Male, 28
Junior Trainer, Female, 89
Junior Trainer, Male, 87
Junior Trainer, Non-Conforming, 5
Legal Assistant, Female, 12
Legal Assistant, Male, 7
Legal Assistant, Non-Conforming, 1
Librarian, Female, 8
Librarian, Male, 18
Librarian, Non-Conforming, 1
Marketing Assistant, Female, 4
Marketing Assistant, Male, 4
Marketing Manager, Female, 1
Mechanical Systems Engineer, Female, 17
Mechanical Systems Engineer, Male, 10
Mechanical Systems Engineer, Non-Conforming, 1
Media Manager I, Female, 58
Media Manager I, Male, 69
Media Manager I, Non-Conforming, 2
Media Manager II, Female, 21
Media Manager II, Male, 26
Media Manager II, Non-Conforming, 2
Office Assistant I, Female, 4
Office Assistant I, Male, 3
Office Assistant II, Non-Conforming, 1
Office Assistant IV, Male, 1
Operator, Female, 117
Operator, Male, 99
Operator, Non-Conforming, 9
Paralegal, Female, 36
Paralegal, Male, 27
Paralegal, Non-Conforming, 1
Payment Adjustment Coordinator, Female, 8
Payment Adjustment Coordinator, Male, 15
Pre-Sales Consultant, Female, 93
Pre-Sales Consultant, Male, 116
Pre-Sales Consultant, Non-Conforming, 5
Product Engineer, Female, 26
Product Engineer, Male, 33
Programmer Analyst I, Female, 46
Programmer Analyst I, Male, 43
Programmer Analyst I, Non-Conforming, 5
Programmer Analyst II, Female, 43
Programmer Analyst II, Male, 49
Programmer Analyst II, Non-Conforming, 1
Programmer Analyst III, Female, 36
Programmer Analyst III, Male, 44
Programmer Analyst IV, Female, 34
Programmer Analyst IV, Male, 39
Programmer Analyst IV, Non-Conforming, 3
Programmer I, Female, 39
Programmer I, Male, 41
Programmer I, Non-Conforming, 6
Programmer II, Female, 37
Programmer II, Male, 40
Programmer II, Non-Conforming, 2
Programmer III, Female, 41
Programmer III, Male, 40
Programmer IV, Female, 26
Programmer IV, Male, 36
Programmer IV, Non-Conforming, 1
Project Manager, Female, 135
Project Manager, Male, 191
Project Manager, Non-Conforming, 14
Quality Control Specialist, Female, 76
Quality Control Specialist, Male, 58
Quality Control Specialist, Non-Conforming, 4
Quality Engineer, Female, 25
Quality Engineer, Male, 37
Recruiter, Female, 115
Recruiter, Male, 114
Recruiter, Non-Conforming, 5
Recruiting Manager, Female, 12
Recruiting Manager, Male, 8
Recruiting Manager, Non-Conforming, 2
Relationshiop Manager, Female, 93
Relationshiop Manager, Male, 115
Relationshiop Manager, Non-Conforming, 6
Research Assistant, Female, 14
Research Assistant, Male, 26
Research Assistant I, Female, 251
Research Assistant I, Male, 274
Research Assistant I, Non-Conforming, 13
Research Assistant II, Female, 359
Research Assistant II, Male, 374
Research Assistant II, Non-Conforming, 21
Research Assistant III, Female, 8
Research Assistant III, Male, 10
Research Assistant IV, Female, 3
Research Assistant IV, Male, 3
Research Assistant IV, Non-Conforming, 1
Research Associate, Female, 101
Research Associate, Male, 102
Research Associate, Non-Conforming, 5
Sales Associate, Female, 4
Sales Associate, Male, 3
Sales Representative, Female, 2
Sales Representative, Male, 3
Senior Attorney, Female, 18
Senior Attorney, Male, 21
Senior Attorney, Non-Conforming, 1
Senior Cost Accountant, Female, 148
Senior Cost Accountant, Male, 160
Senior Cost Accountant, Non-Conforming, 9
Senior Developer, Female, 184
Senior Developer, Male, 172
Senior Developer, Non-Conforming, 5
Senior Editor, Female, 66
Senior Editor, Male, 74
Senior Editor, Non-Conforming, 1
Senior Financial Analyst, Female, 27
Senior Financial Analyst, Male, 31
Senior Financial Analyst, Non-Conforming, 1
Senior Quality Engineer, Female, 75
Senior Quality Engineer, Male, 75
Senior Quality Engineer, Non-Conforming, 2
Senior Recruiter, Female, 97
Senior Recruiter, Male, 99
Senior Recruiter, Non-Conforming, 8
Senior Sales Associate, Female, 5
Senior Sales Associate, Male, 9
Senior Trainer, Female, 82
Senior Trainer, Male, 95
Senior Trainer, Non-Conforming, 5
Service Coordinator, Female, 161
Service Coordinator, Male, 163
Service Coordinator, Non-Conforming, 3
Service Manager, Female, 160
Service Manager, Male, 161
Service Manager, Non-Conforming, 6
Service Tech, Female, 154
Service Tech, Male, 162
Service Tech, Non-Conforming, 11
Service Tech II, Female, 147
Service Tech II, Male, 172
Service Tech II, Non-Conforming, 8
Service Tech III, Female, 157
Service Tech III, Male, 177
Service Tech III, Non-Conforming, 5
Software Consultant, Female, 146
Software Consultant, Male, 180
Software Consultant, Non-Conforming, 10
Software Engineer I, Female, 192
Software Engineer I, Male, 193
Software Engineer I, Non-Conforming, 12
Software Engineer II, Female, 37
Software Engineer II, Male, 45
Software Engineer II, Non-Conforming, 2
Software Engineer III, Female, 50
Software Engineer III, Male, 49
Software Engineer III, Non-Conforming, 1
Software Engineer IV, Female, 44
Software Engineer IV, Male, 49
Software Engineer IV, Non-Conforming, 1
Software Test Engineer I, Female, 41
Software Test Engineer I, Male, 45
Software Test Engineer I, Non-Conforming, 2
Software Test Engineer II, Female, 33
Software Test Engineer II, Male, 38
Software Test Engineer II, Non-Conforming, 3
Software Test Engineer III, Female, 43
Software Test Engineer III, Male, 43
Software Test Engineer III, Non-Conforming, 1
Software Test Engineer IV, Female, 39
Software Test Engineer IV, Male, 49
Solutions Engineer, Female, 86
Solutions Engineer, Male, 120
Solutions Engineer, Non-Conforming, 8
Solutions Engineer Manager, Female, 98
Solutions Engineer Manager, Male, 112
Solutions Engineer Manager, Non-Conforming, 4
Staff Accountant I, Female, 195
Staff Accountant I, Male, 237
Staff Accountant I, Non-Conforming, 9
Staff Accountant II, Female, 36
Staff Accountant II, Male, 40
Staff Accountant II, Non-Conforming, 4
Staff Accountant III, Female, 40
Staff Accountant III, Male, 48
Staff Accountant III, Non-Conforming, 8
Staff Accountant IV, Female, 55
Staff Accountant IV, Male, 44
Staff Accountant IV, Non-Conforming, 3
Staff Scientist, Female, 18
Staff Scientist, Male, 13
Staff Scientist, Non-Conforming, 2
Statistician I, Female, 6
Statistician I, Male, 6
Statistician II, Female, 8
Statistician II, Male, 4
Statistician III, Female, 4
Statistician IV, Female, 2
Structural Analysis Engineer, Female, 24
Structural Analysis Engineer, Male, 24
Structural Engineer, Female, 129
Structural Engineer, Male, 164
Structural Engineer, Non-Conforming, 14
Support Staff, Female, 44
Support Staff, Male, 54
Support Staff, Non-Conforming, 6
Support Staff II, Female, 24
Support Staff II, Male, 33
Support Staff II, Non-Conforming, 2
Support Staff III, Female, 7
Support Staff III, Male, 13
Systems Administrator I, Female, 162
Systems Administrator I, Male, 203
Systems Administrator I, Non-Conforming, 9
Systems Administrator II, Female, 36
Systems Administrator II, Male, 36
Systems Administrator II, Non-Conforming, 2
Systems Administrator III, Female, 34
Systems Administrator III, Male, 48
Systems Administrator III, Non-Conforming, 2
Systems Administrator IV, Female, 32
Systems Administrator IV, Male, 51
Systems Administrator IV, Non-Conforming, 5
Tax Accountant, Female, 128
Tax Accountant, Male, 170
Tax Accountant, Non-Conforming, 5
Trainer I, Female, 93
Trainer I, Male, 78
Trainer I, Non-Conforming, 11
Trainer II, Female, 89
Trainer II, Male, 90
Trainer II, Non-Conforming, 3
Trainer III, Female, 81
Trainer III, Male, 100
Trainer III, Non-Conforming, 1
Training Manager, Female, 87
Training Manager, Male, 90
Training Manager, Non-Conforming, 5
VP Accounting, Female, 35
VP Accounting, Male, 41
VP Accounting, Non-Conforming, 1
VP Marketing, Female, 15
VP Marketing, Male, 27
VP of Training and Development, Male, 1
VP Product Management, Female, 19
VP Product Management, Male, 21
VP Product Management, Non-Conforming, 1
VP Quality Control, Female, 21
VP Quality Control, Male, 20
VP Quality Control, Non-Conforming, 2
VP Sales, Female, 5
VP Sales, Non-Conforming, 1
Web Designer I, Female, 12
Web Designer I, Male, 22
Web Designer II, Male, 3
Web Designer II, Non-Conforming, 1
Web Designer III, Female, 6
Web Designer III, Male, 7
Web Designer IV, Female, 4
Web Designer IV, Male, 4
Web Developer I, Female, 44
Web Developer I, Male, 51
Web Developer I, Non-Conforming, 4
Web Developer II, Female, 36
Web Developer II, Male, 37
Web Developer II, Non-Conforming, 4
Web Developer III, Female, 30
Web Developer III, Male, 40
Web Developer III, Non-Conforming, 1
Web Developer IV, Female, 31
Web Developer IV, Male, 35
*/

# 7.	What is the distribution of job titles across the company?
SELECT DISTINCT(jobtitle)
FROM hr_dashboard.human_resources_staging
ORDER BY jobtitle;

SELECT COUNT(DISTINCT(jobtitle))
FROM hr_dashboard.human_resources_staging;
# 185 job titles

# 8.	Which department has the highest turnover rate?
# "Turnover rate" typically refers to the rate at which employees leave a company or department and need to be replaced. 
# It can be calculated as the number of employees who leave over a given time period divided by the average number of 
# employees in the company or department over that same time period.

SELECT DISTINCT(over_department), department
FROM (
SELECT department, COUNT(termdate) OVER(PARTITION BY department) AS over_department
FROM hr_dashboard.human_resources_staging
WHERE termdate IS NOT NULL
AND termdate < CURRENT_DATE()
) AS sub
ORDER BY over_department DESC;
# Engineering with 822 terminated compared to next Accounting at 400

SELECT department, terminated_count, -- Number of employees with termination dates
    total_count, -- Total number of employees
    ROUND((terminated_count / total_count) * 100, 2) AS termination_rate -- Termination rate as a percentage
FROM (
SELECT department, 
		COUNT(CASE WHEN termdate IS NOT NULL AND termdate < CURRENT_DATE() THEN 1 END) AS terminated_count, -- Counts terminated employees
        COUNT(*) AS total_count -- Counts total employees
FROM hr_dashboard.human_resources_staging
GROUP BY department -- Group by department for aggregation
) AS sub
ORDER BY termination_rate DESC; 
/*
Auditing, 9, 52, 17.31
Legal, 47, 311, 15.11
Training, 217, 1692, 12.83
Human Resources, 223, 1807, 12.34
Engineering, 822, 6686, 12.29
Research and Development, 133, 1084, 12.27
Support, 117, 954, 12.26
Sales, 221, 1832, 12.06
Accounting, 400, 3333, 12.00
Services, 200, 1686, 11.86
Product Management, 75, 641, 11.70
Business Development, 180, 1642, 10.96
Marketing, 50, 494, 10.12
*/

# 8a. Which state has the highest turnover rate?
SELECT DISTINCT(over_state), location_state
FROM (
SELECT location_state, COUNT(termdate) OVER(PARTITION BY location_state) AS over_state
FROM hr_dashboard.human_resources_staging
WHERE termdate IS NOT NULL
AND termdate < CURRENT_DATE()
) AS sub
ORDER BY over_state DESC;
# Ohio with 2212 terminated compared to next Pennsylvania at 121

SELECT location_state, terminated_count, -- Number of employees with termination dates
    total_count, -- Total number of employees
    ROUND((terminated_count / total_count) * 100, 2) AS termination_rate -- Termination rate as a percentage
FROM (
SELECT location_state, 
		COUNT(CASE WHEN termdate IS NOT NULL AND termdate < CURRENT_DATE() THEN 1 END) AS terminated_count, -- Counts terminated employees
        COUNT(*) AS total_count -- Counts total employees
FROM hr_dashboard.human_resources_staging
GROUP BY location_state -- Group by department for aggregation
) AS sub
ORDER BY termination_rate DESC; 

# 8b. Which race has the highest turnover rate?
SELECT DISTINCT(over_race), race
FROM (
SELECT race, COUNT(termdate) OVER(PARTITION BY race) AS over_race
FROM hr_dashboard.human_resources_staging
WHERE termdate IS NOT NULL
AND termdate < CURRENT_DATE()
) AS sub
ORDER BY over_race DESC;

SELECT race, terminated_count, -- Number of employees with termination dates
    total_count, -- Total number of employees
    ROUND((terminated_count / total_count) * 100, 2) AS termination_rate -- Termination rate as a percentage
FROM (
SELECT race, 
		COUNT(CASE WHEN termdate IS NOT NULL AND termdate < CURRENT_DATE() THEN 1 END) AS terminated_count, -- Counts terminated employees
        COUNT(*) AS total_count -- Counts total employees
FROM hr_dashboard.human_resources_staging
GROUP BY race -- Group by department for aggregation
) AS sub
ORDER BY termination_rate DESC; 

# 8c. Which gender has the highest turnover rate?
SELECT DISTINCT(over_gender), gender
FROM (
SELECT gender, COUNT(termdate) OVER(PARTITION BY gender) AS over_gender
FROM hr_dashboard.human_resources_staging
WHERE termdate IS NOT NULL
AND termdate < CURRENT_DATE()
) AS sub
ORDER BY over_gender DESC;

SELECT gender, terminated_count, -- Number of employees with termination dates
    total_count, -- Total number of employees
    ROUND((terminated_count / total_count) * 100, 2) AS termination_rate -- Termination rate as a percentage
FROM (
SELECT gender, 
		COUNT(CASE WHEN termdate IS NOT NULL AND termdate < CURRENT_DATE() THEN 1 END) AS terminated_count, -- Counts terminated employees
        COUNT(*) AS total_count -- Counts total employees
FROM hr_dashboard.human_resources_staging
GROUP BY gender -- Group by department for aggregation
) AS sub
ORDER BY termination_rate DESC; 



# 9.	What is the distribution of employees across locations by state?
SELECT location, location_state, COUNT(*)
FROM hr_dashboard.human_resources_staging
GROUP BY location, location_state;
/*
Headquarters, Ohio, 16715
Remote, Michigan, 673
Remote, Pennsylvania, 1115
Remote, Wisconsin, 382
Remote, Ohio, 1310
Remote, Illinois, 868
Remote, Indiana, 700
Remote, Kentucky, 451
*/


# 10.	How has the company's employee count changed over time based on hire and term dates?
SELECT YEAR(hire_date) AS `year`, COUNT(*) AS hires, 
SUM(CASE 
		WHEN termdate <= CURRENT_DATE() THEN 1 
        ELSE 0 
	END) AS terminations, 
COUNT(*) - SUM(
	CASE 
		WHEN termdate <= CURRENT_DATE() THEN 1 
        ELSE 0 
	END) AS net_change,
ROUND(((COUNT(*) - SUM(
	CASE 
		WHEN termdate <= CURRENT_DATE() THEN 1 
        ELSE 0 
	END)) / COUNT(*) * 100),2) AS net_change_percent
FROM hr_dashboard.human_resources_staging
GROUP BY YEAR(hire_date)
ORDER BY YEAR(hire_date);
/*
2000, 220, 31, 189, 85.91
2001, 1122, 203, 919, 81.91
2002, 1067, 174, 893, 83.69
2003, 1142, 203, 939, 82.22
2004, 1135, 210, 925, 81.50
2005, 1097, 199, 898, 81.86
2006, 1118, 194, 924, 82.65
2007, 1090, 161, 929, 85.23
2008, 1108, 151, 957, 86.37
2009, 1140, 163, 977, 85.70
2010, 1099, 145, 954, 86.81
2011, 1101, 125, 976, 88.65
2012, 1103, 127, 976, 88.49
2013, 1105, 105, 1000, 90.50
2014, 1053, 99, 954, 90.60
2015, 1059, 94, 965, 91.12
2016, 1122, 81, 1041, 92.78
2017, 1091, 68, 1023, 93.77
2018, 1147, 60, 1087, 94.77
2019, 1083, 60, 1023, 94.46
2020, 1012, 42, 970, 95.85
*/


# 11.	What is the tenure distribution for each department?
CREATE TEMPORARY TABLE temp_tenure_per_department (
SELECT department, AVG(emp_length), FLOOR(DATEDIFF(termdate,hire_date)/30) AS as_months, MOD(DATEDIFF(termdate,hire_date),30) AS as_days,
CAST(CONCAT(FLOOR(DATEDIFF(termdate,hire_date)/30), ".", MOD(DATEDIFF(termdate,hire_date),30)) AS FLOAT) AS as_combo
FROM (SELECT department, hire_date, termdate,
CASE
	WHEN termdate < CURRENT_DATE() THEN DATEDIFF(termdate,hire_date)
END AS emp_length
FROM hr_dashboard.human_resources_staging
WHERE termdate IS NOT NULL AND termdate < CURRENT_DATE()
) AS subquery
GROUP BY as_combo, as_months, as_days, department
);
SELECT department, AVG(as_combo)/12 AS tenure
FROM temp_tenure_per_department
GROUP BY department
ORDER BY tenure DESC;
/*
Sales, 9.05410195821315
Marketing, 8.65040001988411
Services, 8.467150668253
Engineering, 8.389199250395118
Accounting, 8.217563757508183
Research and Development, 8.133377508909414
Business Development, 8.020296602487115
Human Resources, 8.006799254453544
Auditing, 7.972870252750538
Training, 7.878503162384409
Support, 7.855229885242451
Legal, 7.710212818274261
Product Management, 7.423499980502658
*/
