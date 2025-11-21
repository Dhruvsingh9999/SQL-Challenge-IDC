-- Practice Questions
-- Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores
SELECT 
    patient_id,
    name,
    satisfaction,
    CASE 
        WHEN satisfaction >= 85 THEN 'High'
        WHEN satisfaction BETWEEN 70 AND 84 THEN 'Medium'
        ELSE 'Low'
    END AS satisfaction_level
FROM patient;


-- Label staff roles as 'Medical' or 'Support' based on role type
SELECT 
    staff_id,
    staff_name,
    role,
    CASE 
        WHEN role IN ('Doctor', 'Nurse', 'Surgeon') THEN 'Medical'
        ELSE 'Support'
    END AS staff_category
FROM staff;


-- Create age groups for patients (0–18, 19–40, 41–65, 65+)
SELECT 
    patient_id,
    name,
    age,
    CASE
        WHEN age BETWEEN 0 AND 18 THEN '0–18 (Child)'
        WHEN age BETWEEN 19 AND 40 THEN '19–40 (Young Adult)'
        WHEN age BETWEEN 41 AND 65 THEN '41–65 (Adult)'
        ELSE '65+ (Senior)'
    END AS age_group
FROM patient;


-- Daily Challenge
-- Service Performance Report
SELECT 
    s.service,
    COUNT(p.patient_id) AS total_patient,
    ROUND(AVG(p.satisfaction), 2) AS avg_satisfaction,
    CASE
        WHEN AVG(p.satisfaction) >= 85 THEN 'Excellent'
        WHEN AVG(p.satisfaction) >= 75 THEN 'Good'
        WHEN AVG(p.satisfaction) >= 65 THEN 'Fair'
        ELSE 'Needs Improvement'
    END AS performance_category
FROM patient p
JOIN services_weekly s 
    ON p.service = s.service
GROUP BY s.service
ORDER BY avg_satisfaction DESC;

-- Compare each patient’s satisfaction score to the overall average
SELECT 
    patient_id,
    name,
    satisfaction,
    CASE 
        WHEN satisfaction >= (SELECT AVG(satisfaction) FROM patient) 
            THEN 'Above Average'
        ELSE 'Below Average'
    END AS satisfaction_level
FROM patient;


-- Assign priority levels to departments based on patient count
SELECT 
    name,
    COUNT(patient_id) AS total_patient,
    CASE
        WHEN COUNT(patient_id) > 100 THEN 'High Priority'
        WHEN COUNT(patient_id) BETWEEN 50 AND 100 THEN 'Medium Priority'
        ELSE 'Low Priority'
    END AS department_priority
FROM patient
GROUP BY name;