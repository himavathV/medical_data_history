## Medical Data History – SQL Project

## Project Overview

The Medical Data History project is a SQL-based data analysis project that uses patient, admission, doctor, and province information. The project demonstrates how SQL queries can retrieve, filter, organize, and analyze healthcare-related data stored in a relational database.

## Project Objectives

- Retrieve patient information based on specific conditions.
- Analyze patient demographics, including gender, age, height, and weight.
- Identify common allergies and medical diagnoses.
- Calculate patient and admission statistics.
- Combine information from multiple database tables using JOIN operations.
- Practice SQL functions, aggregate functions, and subqueries.
- Generate meaningful information from healthcare data.

## Technologies Used

- Database: MySQL
- Query Language: SQL
- Database Management Tool: MySQL Workbench or a compatible SQL editor

## Database Schema

The project uses four main tables.

Patients Table

Stores information about patients.

Columns:

- "patient_id"
- "first_name"
- "last_name"
- "gender"
- "birth_date"
- "city"
- "allergies"
- "height"
- "weight"
- "province_id"

Admissions Table

Stores patient admission information.

Columns:

- "patient_id"
- "admission_date"
- "discharge_date"
- "diagnosis"
- "attending_doctor_id"

Doctors Table

Stores information about doctors.

Columns:

- "doctor_id"
- "first_name"
- "last_name"
- "specialty"

Province Names Table

Stores province information.

Columns:

- "province_id"
- "province_name"

## SQL Concepts Used

This project covers the following SQL concepts:

- SELECT statements
- WHERE conditions
- ORDER BY
- GROUP BY
- HAVING
- DISTINCT
- BETWEEN
- IN operator
- LIKE operator
- Aggregate functions such as COUNT(), SUM(), MAX(), and MIN()
- String functions such as CONCAT(), UPPER(), and LOWER()
- Date functions such as YEAR() and DAY()
- CASE statements
- Subqueries
- INNER JOIN
- UNION ALL
- NULL value handling
- Mathematical calculations

## Project Tasks

The project contains 34 SQL queries covering the following tasks:

1. Retrieve male patients.
2. Find patients without recorded allergies.
3. Find patients whose first names begin with C.
4. Find patients whose weight is between 100 and 120.
5. Display NKA when allergy information is NULL.
6. Combine first and last names into a full name.
7. Display patient names and their province names.
8. Count patients born in 2010.
9. Find the patient or patients with the greatest height.
10. Retrieve patients using specific patient IDs.
11. Count the total number of admissions.
12. Find admissions where admission and discharge occurred on the same day.
13. Count admissions for patient ID 579.
14. Display unique cities in province NS.
15. Find patients with height greater than 160 and weight greater than 70.
16. Display unique birth years in ascending order.
17. Find first names that appear only once.
18. Find names starting and ending with S with at least six characters.
19. Find patients diagnosed with Dementia.
20. Sort first names by length and alphabetically.
21. Count male and female patients in the same row.
22. Repeat the male and female patient count query.
23. Find patients admitted multiple times for the same diagnosis.
24. Count patients in each city.
25. Display patients and doctors with their respective roles.
26. Display allergies ordered by popularity.
27. Find patients born in the 1970s.
28. Format full names using uppercase last names and lowercase first names.
29. Find provinces with a combined patient height of at least 7,000.
30. Calculate the difference between the maximum and minimum weights for patients with the last name Maroni.
31. Count admissions by day of the month.
32. Group patients into weight groups of 10.
33. Calculate obesity status using BMI.
34. Find patients diagnosed with Epilepsy whose attending doctor's first name is Lisa.

## Example SQL Queries

Example 1: Retrieve Male Patients

SELECT first_name, last_name, gender
FROM patients
WHERE gender = 'M';

Example 2: Find Patients Without Recorded Allergies

SELECT first_name, last_name
FROM patients
WHERE allergies IS NULL;

Example 3: Count Total Admissions

SELECT COUNT(*) AS total_admissions
FROM admissions;

Example 4: Find Patients Diagnosed With Dementia

SELECT DISTINCT
    p.patient_id,
    p.first_name,
    p.last_name
FROM patients AS p
JOIN admissions AS a
    ON p.patient_id = a.patient_id
WHERE a.diagnosis = 'Dementia';

Example 5: Find the Tallest Patient or Patients

SELECT first_name, last_name, height
FROM patients
WHERE height = (
    SELECT MAX(height)
    FROM patients
);

8. Database Setup

1. Open MySQL Workbench or another compatible SQL editor.
2. Connect to your database server.
3. Select the project database:

## USE project_medical_data_history;

4. Verify that the required tables exist.
5. Execute the SQL queries individually.
6. Review the results to understand the information returned by each query.

## Project Outcomes

Through this project, the following skills are demonstrated:

- Retrieving and filtering healthcare-related information.
- Analyzing patient demographics.
- Calculating statistics using aggregate functions.
- Combining related tables using JOIN operations.
- Identifying patterns in admissions and diagnoses.
- Handling missing values.
- Applying SQL functions to transform and analyze data.
- Organizing data into meaningful groups.

## Conclusion

The Medical Data History project provides practical experience in SQL-based data retrieval and analysis. It demonstrates the use of filtering, sorting, grouping, aggregate functions, joins, subqueries, and conditional expressions to analyze healthcare-related information.

This project strengthens fundamental SQL skills and demonstrates how relational databases can be used to organize and analyze patient and hospital admission records.

## Repository Structure

Medical-Data-History/
│
├── README.md
└── medical_data_history.sql

The "README.md" file documents the project, while "medical_data_history.sql" contains the SQL queries used to complete the 34 tasks.

 ## Security Note

Never publish database passwords, access tokens, or other confidential credentials in a public GitHub repository.
