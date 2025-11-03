# Day-1-SQL-Challenge-IDC
<p align="center">
<img src="https://placehold.co/100x100/10B981/ffffff?text=SQL" alt="Database Icon" />
</p>

# 🏥 Hospital Data Insights: Getting Started with PostgreSQL & pgAdmin

### **Level Up Achieved!** 🚀

This repository documents my first steps and key learnings in **PostgreSQL** using the **pgAdmin 4** Query Tool. The focus of this project is managing and analyzing data for a simulated hospital database (`Hospital_Data`).

---

## 🌟 Today's Key Learnings: Data Modeling & Distinct Queries

| **Topic** | **Description** | **PostgreSQL Command** | **Status** | 
| :--- | :--- | :--- | :--- |
| **Data Import** | Successfully loaded data into existing tables. | `\copy ... FROM ... WITH (HEADER)` | ✅ Done | 
| **Table Creation** | Defined schemas for patient and service tracking. | `CREATE TABLE ...` | ✅ Done | 
| **Basic Querying** | Retrieved all data from a table. | `SELECT * FROM table_name;` | ✅ Done | 
| **Filtering Duplicates** | Learned to extract only unique values from a column. | `SELECT DISTINCT column FROM table_name;` | 🆕 **NEW!** | 

### 1. Creating the Data Structure (The Foundation)

I defined two core tables to manage the hospital's operational and patient data. This is where I created the columns, their data types, and set the Primary Keys.

| **Table** | **Purpose** | **Key Columns** | 
| :--- | :--- | :--- | 
| `patient` | Individual patient records. | `patient_id` (PK), `name`, `age`, `arrival_date`, `departure_date`, `service`, `satisfaction` | 
| `services_weekly` | Weekly performance metrics for hospital departments. | `week`, `month`, `service`, `patients_admitted`, `staff_morale` | 

---

## 💡 Practice Corner: Basic SELECT Queries

Here are the basic retrieval queries I practiced today, focusing on the `patient` and `services_weekly` tables.

| **Question** | **SQL Code** | **Result Reference** | 
| :--- | :--- | :--- | 
| **Retrieve all columns from the patients table.** | ```sql\nSELECT *\nFROM patient;``` |  | 
| **Select only the patient_id, name, and age columns from the patients table.** | ```sql\nSELECT patient_id, name, age\nFROM patient;``` |  | 
| **Display the first 10 records from the services_weekly table.** | ```sql\nSELECT *\nFROM services_weekly\nLIMIT 10;``` |  | 

---

## 🔥 Daily Challenge: Solving for Uniqueness

### **Question:** List all unique hospital services available in the hospital.

### **Solution:**

This is where the **`DISTINCT`** keyword shines! By applying it to the `service` column, we eliminate duplicate entries and get a clean list of departments.

sql :
SELECT DISTINCT service
FROM services_weekly;

| **Result:** |
| service |
| :---: |
| general\_medicine |
| surgery |
| ICU |
| emergency |

---

## 🚀 Next-Level Querying: WHERE, ORDER BY, and LIMIT

I successfully solved the following questions by applying filtering, sorting, and limiting clauses to retrieve targeted insights from the database!

| **Q#** | **Question** | **Solution** | **Focus** | 
| :--- | :--- | :--- | :--- | 
| **Q1** | Retrieve the `name` and `service` of all patients who have an **age over 50**. | ```sql\nSELECT name, service\nFROM patient\nWHERE age > 50;``` | Simple **WHERE** filter | 
| **Q2** | Find all columns for patients whose **service is 'surgery'**. | ```sql\nSELECT *\nFROM patient\nWHERE service = 'surgery';``` | Filtering by **text** | 
| **Q3** | List patients' `name` and `satisfaction`, ordered from **highest satisfaction to lowest**. | ```sql\nSELECT name, satisfaction\nFROM patient\nORDER BY satisfaction DESC;``` | Simple **ORDER BY** | 
| **Q4** | Get the `patient_id` and `age` of the **5 oldest** patients admitted. | ```sql\nSELECT patient_id, age\nFROM patient\nORDER BY age DESC\nLIMIT 5;``` | **ORDER BY** & **LIMIT** | 
| **Q5** | Show the `patient_id` and `name` for all patients who arrived **before '2025-12-01'**. | ```sql\nSELECT patient_id, name\nFROM patient\nWHERE arrival_date < '2025-12-01';``` | Filtering by **Date** | 
| **Q6** | Find all records where `patients_admitted` > 20 **AND** `staff_morale` < 70. | ```sql\nSELECT *\nFROM services_weekly\nWHERE patients_admitted > 20\nAND staff_morale < 70;``` | Using **AND** | 
| **Q7** | List the `name` and `departure_date` of all patients, sorted by their **departure date (earliest first)**. | ```sql\nSELECT name, departure_date\nFROM patient\nORDER BY departure_date ASC;``` | **ORDER BY** Date | 
| **Q8** | Display records **11 through 20** from the `patient` table (10 records total). | ```sql\nSELECT *\nFROM patient\nLIMIT 10 OFFSET 10;``` | **LIMIT** & **OFFSET** | 

---

## ☁️ How to Upload Your pgAdmin Code to GitHub

The best practice is **not** to take screenshots of your code but to save the SQL queries as a **`.sql` file**. This makes the code readable, reusable, and easy to run on any database.

### 📝 Method: Saving Your Query Tool Code

1. **Open the Query Tool** in pgAdmin.

2. Write your desired SQL statements.

3. In the Query Tool toolbar, click the **Save** icon.

4. Save the file (e.g., `hospital_schema.sql`), and upload this `.sql` file directly to your GitHub repository!

### 📂 File Structure for this Project

/pgadmin-learning-project
├── README.md           
└── sql/
    └── hospital_schema.sql <- All my table creation and practice queries are saved here.

### **What's Next?** 💡

I plan to explore:

* **Aggregate functions** like `AVG()`, `COUNT()`, and `SUM()`.

* **Grouping data** using the `GROUP BY` clause.

Stay tuned for more SQL adventures! Happy coding! ✨
