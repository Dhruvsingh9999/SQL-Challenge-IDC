-- Practice Question
-- 1. Join patients, staff, and staff_schedule to show patient service and staff availability.
SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.service,
    st.staff_id,
    st.staff_name,
    st.role
FROM patient p
INNER JOIN staff ss
    ON p.service = ss.service
INNER JOIN staff st
    ON ss.staff_id = st.staff_id;


-- 2. Combine services_weekly with staff and staff_schedule for comprehensive service analysis.
SELECT 
    p.patient_id,
    p.name AS patient_name,
    s.service,
    s.week
FROM patient p
LEFT JOIN services_weekly s
ON p.service = s.service;


-- 3. Create a multi-table report showing patient admissions with staff information.
SELECT 
    s.service,
    s.week,
    p.name AS patient_name
FROM patient p
RIGHT JOIN services_weekly s
ON p.service = s.service;


--Daily Challenge:
-- Create a comprehensive service analysis report for week 20 showing: service name, total patients admitted 
-- that week, total patients refused, average patient satisfaction, count of staff assigned to service, and count
-- of staff present that week. Order by patients admitted descending.
SELECT 
    sw.service AS service_name,
    SUM(sw.patients_admitted) AS total_patients_admitted,
    SUM(sw.patients_refused) AS total_patients_refused,
    ROUND(AVG(sw.patient_satisfaction), 2) AS avg_patient_satisfaction,
    COUNT(DISTINCT st.staff_id) AS total_staff_assigned,
    COUNT(DISTINCT sw.week) AS staff_present_week
FROM services_weekly sw
LEFT JOIN staff st
    ON sw.service = st.service
LEFT JOIN staff sc
    ON st.staff_id = sc.staff_id
   AND sc.service = sw.service
WHERE sw.week = 20
GROUP BY sw.service
ORDER BY total_patients_admitted DESC;

