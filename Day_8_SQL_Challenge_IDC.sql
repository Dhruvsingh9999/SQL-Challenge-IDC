-- 1. Convert all patient names to uppercase.
SELECT UPPER(name) AS uppercase_name FROM patient LIMIT 5;

-- 2. Find the length of each patient's name.
SELECT name, LENGTH(name) AS name_length FROM patient LIMIT 5;

-- 3. Concatenate patient_id and name with a hyphen separator.

SELECT patient_id || ' - ' || name AS patient_summary
FROM patient LIMIT 5;

-- Daily Challenge
-- 1. Create a patient summary that shows patient_id, full name in UPPERCASE, 
--    service in lowercase, age_category (Senior/Adult/Minor), and name_length.
--    Only show patients whose name length is greater than 10 characters.

SELECT 
    patient_id,
    UPPER(name) AS full_name_upper,
    LOWER(service) AS service_lower,
    CASE 
        WHEN age >= 65 THEN 'Senior'
        WHEN age >= 18 THEN 'Adult'
        ELSE 'Minor'
    END AS age_category,
    LENGTH(name) AS name_length
FROM 
    patient
WHERE 
    LENGTH(name) > 10
LIMIT 5;

-- Extra questions 
-- 1. Create a 3-character id_code from the patient_id by extracting the 3 characters that come after the 'PAT-' prefix.
SELECT patient_id, SUBSTRING(patient_id, 5, 3) AS id_code FROM patient LIMIT 5;

-- 2. Create a "welcome summary" for the 5 oldest patients (age 65+) 
-- in the format: "Name (Age: X) - Service: Y" (with the service in uppercase).
SELECT 
    name || ' (Age: ' || CAST(age AS VARCHAR) || ') - Service: ' || 
	UPPER(service) AS welcome_summary
FROM 
    patient
WHERE 
    age >= 65
ORDER BY 
    age DESC
LIMIT 5;

-- Find the patient 'Shannon Walker' without worrying about whether the name is stored in upper or lower case.
SELECT patient_id, name, service FROM patient WHERE LOWER(name) = 'shannon walker';

-- Find all patients whose last name ends in 'son'.
SELECT name, age, service FROM patient WHERE name LIKE '%son';