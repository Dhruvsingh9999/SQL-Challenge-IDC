-- Hospital Database Schema - Generated from pgAdmin Learning Session

-- =======================================================
-- 1. Table: patient
-- Stores individual patient records and their outcomes.
-- =======================================================
CREATE TABLE patient (
    patient_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    arrival_date DATE,
    departure_date DATE,
    service VARCHAR(50), -- e.g., 'surgery', 'ICU', 'emergency'
    satisfaction INT -- Rating from 1 to 100
);

-- Example Data (based on screenshots - actual inserts would use the full path)
/*
-- This is how you would normally insert data:
INSERT INTO patient (patient_id, name, age, arrival_date, departure_date, service, satisfaction)
VALUES
('PAT-09494759', 'Richard Rodriguez', 24, '2025-12-13', '2025-12-14', 'surgery', 61),
('PAT-05444084', 'Shannon Walker', 6, '2025-12-29', '2025-12-22', 'general_medicine', 83);
-- ... and so on for all 1000 rows
*/


-- =======================================================
-- 2. Table: services_weekly
-- Stores weekly operational metrics for different hospital services.
-- =======================================================
CREATE TABLE services_weekly (
    week INT,
    month INT,
    service VARCHAR(50), -- Foreign key relationship often goes here, but for simplicity, it's a string
    available_beds INT,
    patients_request INT,
    patients_admitted INT,
    patients_refused INT,
    patient_satisfaction INT,
    staff_morale INT,
    event VARCHAR(100)
);

-- =======================================================
-- 3. Key Queries Demonstrated
-- =======================================================

-- Select all data from the patient table
SELECT * FROM patient;

-- Select only the patient_id, name, and age columns from the patients table
SELECT patient_id, name, age FROM patient;

--Display the first 10 records from the services_weekly table.
SELECT service FROM services_weekly LIMIT 10;

-- Retrieve only the unique list of services offered
SELECT DISTINCT service
FROM services_weekly;

-- Select distinct combinations of week and service
SELECT DISTINCT week, service
FROM services_weekly;

-- =======================================================
-- 4. Advanced SELECT Queries (WHERE, ORDER BY, LIMIT)
-- =======================================================

-- Q1: Retrieve the name and service of all patients who have an age over 50.
SELECT name, service FROM patient WHERE age > 50;

-- Q2: Find all columns for patients whose service is exactly 'surgery'.
SELECT * FROM patient WHERE service = 'surgery';

-- Q3: List all patients' name and satisfaction, ordered from highest satisfaction to lowest.
SELECT name, satisfaction FROM patient ORDER BY satisfaction DESC;

-- Q4: Get the patient_id and age of the 5 oldest patients admitted.
SELECT patient_id, age FROM patient ORDER BY age DESC LIMIT 5;

-- Q5: Show the patient_id and name for all patients who arrived before '2025-12-01'.
SELECT patient_id, name FROM patient WHERE arrival_date < '2025-12-01';

-- Q7: List the name and departure_date of all patients, sorted by their departure date (earliest first).
SELECT name, departure_date FROM patient ORDER BY departure_date ASC;

-- Q8: Display records 11 through 20 from the patient table (10 records total).
SELECT * FROM patient LIMIT 10 OFFSET 10;



