-- Practice Questions:
-- 1. Find patients who are in services with above-average staff count.
SELECT p.patient_id, p.name, s.service
FROM patient p
JOIN services_weekly s ON p.service = s.service
WHERE s.staff_morale > (SELECT AVG(staff_morale) FROM services_weekly);


-- 2. List staff who work in services that had any week with patient satisfaction below 70.
SELECT DISTINCT st.staff_id, st.staff_name, s.service
FROM staff st
JOIN services_weekly s ON st.service = s.service
WHERE s.service IN ( SELECT service FROM services_weekly WHERE patient_satisfaction < 70);


-- 3. Show patients from services where total admitted patients exceed 1000.
SELECT p.patient_id, p.name, s.service, s.patients_admitted FROM patient p
JOIN services_weekly s ON p.service = s.service WHERE s.patients_admitted > 1000;


-- Daily Challenge:
-- Find all patients who were admitted to services that had at least one week where patients were refused AND
-- the average patient satisfaction for that service was below the overall hospital average satisfaction. 
-- Show patient_id, name, service, and their personal satisfaction score.
SELECT 
p.patient_id,p.name,s.service,p.satisfaction AS personal_satisfaction
FROM patient p
JOIN services_weekly s ON p.service = s.service
WHERE s.service IN (SELECT service FROM services_weekly WHERE patients_refused > 0) 
AND s.patient_satisfaction < (SELECT AVG(patient_satisfaction) FROM services_weekly);
