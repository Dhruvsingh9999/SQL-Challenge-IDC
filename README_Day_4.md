# 📘 Day 4: Limiting, Offsetting, and Ordering Results  

Today's focus was on **controlling the quantity and order** of our query results.  
We learned how to use:  
- `LIMIT` → Get the top *N* rows  
- `ORDER BY` → Sort our data  
- `OFFSET` → Skip rows (useful for pagination)  

These three clauses are essential for making large datasets manageable and for building features like **"Top 10" lists** or **"Page 2"** of results.

---

## 🧠 Practice Questions  

### 1️⃣ Display the first 5 patients from the patients table  

```sql
SELECT *
FROM patients
LIMIT 5; ```

### 2️⃣ Show patients 11–20 using OFFSET

This query skips the first 10 rows (OFFSET 10) and then takes the next 10 rows (LIMIT 10), which correspond to records 11–20.
```
SELECT *
FROM patients
LIMIT 10
OFFSET 10;```

### 3️⃣ Get the 10 most recent patient admissions based on arrival_date

To get the most recent, sort by arrival_date in descending order (DESC) and then take the top 10.
```
SELECT *
FROM patients
ORDER BY arrival_date DESC
LIMIT 10;```

## 💪 Daily Challenge

### Question:
Find the 3rd to 7th highest patient satisfaction scores from the patients table, showing patient_id, name, service, and satisfaction.
Display only these 5 records.

### Solution:

Steps:
```
Sort by satisfaction DESC

Skip the top 2 (using OFFSET 2)

Take the next 5 (using LIMIT 5)

SELECT
  patient_id,
  name,
  service,
  satisfaction
FROM
  patients
ORDER BY
  satisfaction DESC
LIMIT 5     -- Take 5 records
OFFSET 2;   -- After skipping the top 2
```
## 🧩 Day 4 Review Quiz
### 1️⃣ Which query correctly fetches the 3rd and 4th most expensive products?

✅ Answer:
```
SELECT * 
FROM Products 
ORDER BY Price DESC 
LIMIT 2 OFFSET 2;
```

Rationale:
Sort by price (highest first), skip top 2 (OFFSET 2), then take next 2 (LIMIT 2) → gives 3rd and 4th.

### 2️⃣ What is the primary purpose of using OFFSET in an SQL query?
```
✅ Answer:
To skip a specified number of rows before returning results.
```
Rationale:
It's mainly used for pagination.

### 3️⃣ In which order are WHERE, ORDER BY, and LIMIT logically processed?
```
✅ Answer:

WHERE

ORDER BY

LIMIT```

## Rationale:
### Filter → Sort → Limit.
