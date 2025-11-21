-- 1. Display the first 5 patients from the patients table.
select * from patient limit 5;

-- 2. Show patients 11-20 using OFFSET.
select * from patient OFFSET 10 LIMIT 10;

-- 3. Get the 10 most recent patient admissions based on arrival_date.
select * from patient order by arrival_date desc limit 10;

-- 4. Find the 3rd to 7th highest patient satisfaction scores from the patients table,
--    showing patient_id, name, service, and satisfaction. Display only these 5 records.
select patient_id, name, service, satisfaction from patient ORDER BY satisfaction desc OFFSET 2 LIMIT 5;

--Extra Practice Questions

-- Who are the 5 oldest patients in the hospital? Show their name, age, and service.
select name, age, service from patient order by arrival_date desc limit 5;

-- What are the 10 lowest satisfaction scores given by patients? Show the patient_id, service, and satisfaction score.
select patient_id, service, satisfaction from patient order by satisfaction asc limit 10;

-- Who are the 10 most recently admitted patients? Show their name, arrival_date, and service. (This would require converting the date column).
select name , arrival_date, service from patient order by arrival_date desc limit 10;

-- Find the 5 patients with the 6th to 10th highest satisfaction scores. Show their name, service, and satisfaction.
select name, service, satisfaction from patient order by satisfaction desc OFFSET 5 limit 5;

-- How many patients has each service (e.g., surgery, ICU) treated? Sort the results from the busiest service to the quietest.
select count(patient), service from patient group by service having service = 'surgery,ICU';

-- What is the average satisfaction score for each service? Sort the results from highest average satisfaction to lowest.


-- What was the total number of patients refused by each service over the entire year?


-- Which event (e.g., 'flu', 'strike') has the biggest negative impact on staff_morale? 
-- (Find the average staff_morale for each event type).


-- Using the service column from both tables,
-- how would you find the average weekly patient satisfaction (services_weekly table) 
--   alongside the average individual patient satisfaction (patients table) for the 'ICU' service?


-- For every patient in the patients table who was in 'surgery', 
what was the average number of patients_refused in the 'surgery' service for the month they arrived? 
(This is a complex join and group by).

