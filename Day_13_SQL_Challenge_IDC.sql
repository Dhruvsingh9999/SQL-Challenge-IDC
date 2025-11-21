-- 1. Join patients and staff based on their common service field
SELECT
    p.patient_id,
    p.name AS patient_name,
    s.staff_name AS staff_name,
    p.service
FROM patient p
JOIN staff s ON p.service = s.service;


-- 2. Join services_weekly with staff
SELECT
    sw.*,            
    s.staff_name AS staff_name,
    s.role           
FROM services_weekly sw
JOIN staff s ON sw.service = s.service;


-- 3. Report showing patient information along with staff assigned
SELECT
    p.patient_id,
    p.name AS patient_name,
    p.age,
    p.condition,
    s.name AS assigned_staff,
    s.role
FROM patient p
JOIN staff s ON p.service = s.service
ORDER BY p.patient_id;


-- Daily Challenge
-- Create a comprehensive report showing patient details and the total number of staff in their service, filtering for services with more than 5 staff members.
SELECT
    p.patient_id,
    p.name AS patient_name,
    p.age,
    p.service,
    service_stats.total_staff
FROM patient p
JOIN (
    SELECT service, COUNT(*) AS total_staff
    FROM staff
    GROUP BY service
    HAVING COUNT(*) > 5
) service_stats ON p.service = service_stats.service
ORDER BY
    service_stats.total_staff DESC,
    p.name ASC;