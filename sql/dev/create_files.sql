
drop table if exists dbo.patients

CREATE TABLE dbo.patients (
    patient_id VARCHAR(20) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    MiddleName VARCHAR(5),
    SSN VARCHAR(15),
    PhoneNumber VARCHAR(25),
    Gender VARCHAR(10),
    DOB DATE,
    Address VARCHAR(255),
    ModifiedDate DATE
);