use project_medical_data_history;
# 1. Display male patients, first name, lastname, and gender
select first_name,last_name,gender from patients
where gender='M';

# 2.Display patients who do not have allergies.
select first_name,last_name from patients
where allergies is null;

# 3. Display firstname starting with C.
SELECT first_name FROM patients
WHERE first_name LIKE 'C%';

# 4. Display patients weighing between 100 and 120, inclusive.
SELECT first_name, last_name FROM patients
WHERE weight BETWEEN 100 AND 120;

# 5. Replace NULL allergies with NKA.
SELECT patient_id, first_name, last_name,
    CASE
        WHEN allergies IS NULL THEN 'NKA'
        ELSE allergies
    END AS allergies
FROM patients;
# Explanation: The CASE statement checks whether allergies are NULL. 
If NULL, it displays 'NKA'; otherwise, it displays the existing allergy.
 It does not modify the original table.
 
 # 6. Display the full name in one column.
 SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM patients;

# 7. Display first name, last name, and full province name.
SELECT 
    p.first_name, p.last_name, pr.province_name
FROM
    patients AS p
        JOIN
    province_names AS pr ON p.province_id = pr.province_id;
# Explanation: JOIN matches each patient with their province.
# This assumes the province table is named province_names, as in the common version of this SQL exercise.

# 8. count patients born in 2010.
SELECT COUNT(*) AS total_patients
FROM patients
WHERE YEAR(birth_date) = 2010;

# 9. Display the tallest patients name and height.
SELECT first_name, last_name, height
FROM patients
WHERE height = (
    SELECT MAX(height)
    FROM patients
);

# 10. Display all columns for patient IDs 1, 45, 534, 879, and 1000.
SELECT * FROM patients
WHERE patient_id IN (1, 45, 534, 879, 1000);

#. 11. Show the total number of admissions.
SELECT COUNT(*) AS total_admissions
FROM admissions;

# 12. Show admissions where the patient was admitted and discharged on the same day.
SELECT * FROM admissions
WHERE admission_date = discharge_date;

# 13. Count admissions for patient ID 579.
SELECT COUNT(*) AS total_admissions
FROM admissions
WHERE patient_id = 579;

# 14. Display unique cities for patients in province NS.
SELECT DISTINCT city
FROM patients
WHERE province_id = 'NS';

# 15. Display patients whose height is greater than 160 and weight is greater than 70.
SELECT first_name, last_name, birth_date
FROM patients
WHERE height > 160
  AND weight > 70;
  
# 16. Display unique birth years in ascending order.
SELECT DISTINCT YEAR(birth_date) AS birth_year
FROM patients
ORDER BY birth_year ASC;
# Explanation: YEAR() extracts the year, DISTINCT removes duplicates, and ASC sorts from smallest to largest.

# 17. Display first names that occur only once.
SELECT first_name FROM patients
GROUP BY first_name
HAVING COUNT(*) = 1;

# 18. Find patient IDs and first names that start and end with S and are at least six characters long.
SELECT patient_id, first_name
FROM patients
WHERE first_name LIKE 'S%s'
  AND LENGTH(first_name) >= 6;
  # Explanation: LIKE 'S%s' checks the first and last letters, while LENGTH() checks the name length.
  
# 19. Find patients whose admission diagnosis is Dementia.
SELECT DISTINCT p.patient_id, p.first_name, p.last_name
FROM patients AS p
JOIN admissions AS a
ON p.patient_id = a.patient_id
WHERE a.diagnosis = 'Dementia';  

# 20. Display every patient's first name, sorted by name length and then alphabetically.
SELECT first_name FROM patients
ORDER BY LENGTH(first_name) ASC,
first_name ASC;
# Explanation: Names are sorted by increasing length first. Names of equal length are then sorted alphabetically.

# 21. Show the total number of male and female patients in the same row.
SELECT
    SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_patients,
    SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_patients
FROM patients;
# Explanation: CASE assigns 1 to matching patients and 0 to others. SUM() totals each group in separate columns.

# 22. Show male and female patient totals in the same row.
SELECT
    SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_patients,
    SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_patients
FROM patients;

# 23. Find patients admitted multiple times for the same diagnosis.
SELECT patient_id, diagnosis
FROM admissions
GROUP BY patient_id, diagnosis
HAVING COUNT(*) > 1;

# 24. Display each city and its total number of patients, from most to fewest.
SELECT city, COUNT(*) AS total_patients
FROM patients
GROUP BY city
ORDER BY total_patients DESC, city ASC;

# 25. Display first name, last name, and role for every patient or doctor.
SELECT first_name, last_name, 'Patient' AS role
FROM patients
UNION ALL
SELECT first_name, last_name, 'Doctor' AS role
FROM doctors;
# Explanation: UNION ALL combines the patient and doctor lists while retaining duplicate rows. 
# The role column identifies the source of each row.

# 26. Display allergies ordered by popularity, excluding NULL values.
SELECT allergies, COUNT(*) AS total_patients
FROM patients
WHERE allergies IS NOT NULL
GROUP BY allergies
ORDER BY total_patients DESC;

# 27. Find patients born in the 1970s, from earliest birth date to latest.
SELECT first_name, last_name, birth_date
FROM patients
WHERE birth_date >= '1970-01-01'
  AND birth_date < '1980-01-01'
ORDER BY birth_date ASC;

# 28. Display last name in uppercase followed by first name in lowercase, separated by a comma. Sort by first name descending.
SELECT CONCAT(
    UPPER(last_name), ',', LOWER(first_name)
) AS full_name
FROM patients
ORDER BY first_name DESC;

# 29. province IDs whose patients' combined height is at least 7,000.
SELECT province_id, SUM(height) AS total_height
FROM patients
GROUP BY province_id
HAVING SUM(height) >= 7000;

# 30. Find the difference between the largest and smallest weight for patients with last name Maroni.
SELECT MAX(weight) - MIN(weight) AS weight_difference
FROM patients
WHERE last_name = 'Maroni';

# 31. Count admissions for each day of the month.
SELECT
    DAY(admission_date) AS day_of_month,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY DAY(admission_date)
ORDER BY total_admissions DESC;

# 32. Group patients by weight in groups of 10.
SELECT
    FLOOR(weight / 10) * 10 AS weight_group,
    COUNT(*) AS total_patients
FROM patients
WHERE weight IS NOT NULL
GROUP BY FLOOR(weight / 10) * 10
ORDER BY weight_group DESC;

# 33. Display patient ID, weight, height, and obesity status as 0 or 1.
SELECT patient_id, weight, height,
CASE WHEN weight / POWER(height / 100.0, 2) >= 30
THEN 1
ELSE 0
END AS isObese
FROM patients
WHERE height > 0;

# 34. Find patients diagnosed with Epilepsy whose attending doctor's first name is Lisa.
SELECT DISTINCT p.patient_id, p.first_name, p.last_name, d.specialty
FROM patients AS p
JOIN admissions AS a
    ON p.patient_id = a.patient_id
JOIN doctors AS d
    ON a.attending_doctor_id = d.doctor_id
WHERE a.diagnosis = 'Epilepsy'
AND d.first_name = 'Lisa';
  
