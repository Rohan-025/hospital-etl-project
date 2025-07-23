CREATE TABLE dbo.patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    admitted_on DATETIME
);