-- 1. Convert all patient names to uppercase.
SELECT UPPER(name) AS uppercase_name FROM patient LIMIT 5;

-- 2. Find the length of each patient's name. (Adapted from "staff")
SELECT name, LENGTH(name) AS name_length FROM patient LIMIT 5;

-- 3. Concatenate patient_id and name with a hyphen. (Adapted from "staff")
SELECT patient_id || ' - ' || name AS patient_summary FROM patient LIMIT 5;

-- Daily Challenge:
-- Create a patient summary that shows patient_id, full name in uppercase, service in lowercase, age category 
-- (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), and name length. Only show patients
-- whose name length is greater than 10 characters.
SELECT patient_id, UPPER(name) AS full_name_upper, LOWER(service) AS service_lower, CASE 
WHEN age >= 65 THEN 'Senior' WHEN age >= 18 THEN 'Adult' ELSE 'Minor' END AS age_category,
LENGTH(name) AS name_length FROM patient WHERE LENGTH(name) > 10 LIMIT 5;

-- 1. Find all unique services that were affected by a 'flu' event. Show the service names in lowercase.
SELECT DISTINCT LOWER(service) AS service_name FROM services_weekly WHERE event = 'flu';

-- 2. Find all patients whose first name is 'Richard'.
SELECT name, age, service FROM patient WHERE name LIKE 'Richard %';

-- 3. Find the 3 most common first names in the patients table.
SELECT SPLIT_PART(name, ' ', 1) AS first_name, COUNT(*) AS name_count FROM patient
GROUP BY first_name ORDER BY name_count DESC LIMIT 3;