
drop table if exists dbo.patients

-- Hospital-A Tables

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

-- clonning the hospital DB new DB hospital_B DB

-- create database [projecthospital_hospital_b]
-- as copy of [projecthospital]


-- dropping the tables from hospital_B DB after cloning

drop TABLE dbo.ADF_Load_Metadata

drop TABLE dbo.patients


-- creating departments for hospital-A

create table dbo.departments(
    DeptID NVARCHAR(50) not null,
    Name nvarchar(50) not null,
    constraint PK_departments PRIMARY KEY (DeptID)

);


-- encounters table hospital-A

CREATE TABLE dbo.encounters (
    EncounterID nvarchar(50) NOT NULL,
    PatientID nvarchar(50) NOT NULL,
    EncounterDate date NOT NULL,
    EncounterType nvarchar(50) NOT NULL,
    ProviderID nvarchar(50) NOT NULL,
    DepartmentID nvarchar(50) NOT NULL,
    ProcedureCode int NOT NULL,
    InsertedDate date NOT NULL,
    ModifiedDate date NOT NULL,
    CONSTRAINT PK_enocunters PRIMARY KEY(EncounterID)
);


-- providers table hospital-A

CREATE TABLE dbo.providers (
    ProviderID nvarchar(50) NOT NULL,
    FirstName nvarchar(50) NOT NULL,
    LastName nvarchar(50) NOT NULL,
    Specialization nvarchar(50) NOT NULL,
    DeptID nvarchar(50) NOT NULL,
    NPI bigint NOT NULL,
    CONSTRAINT PK_provider PRIMARY KEY(ProviderID)
);

-- trancsactions table Hopital-A

CREATE TABLE dbo.transactions (
    TransactionID nvarchar(50) NOT NULL,
    EncounterID nvarchar(50) NOT NULL,
    PatientID nvarchar(50) NOT NULL,
    ProviderID nvarchar(50) NOT NULL,
    DeptID nvarchar(50) NOT NULL,
    VisitDate date NOT NULL,
    ServiceDate date NOT NULL,
    PaidDate date NOT NULL,
    VisitType nvarchar(50) NOT NULL,
    Amount float NOT NULL,
    AmountType nvarchar(50) NOT NULL,
    PaidAmount float NOT NULL,
    ClaimID nvarchar(50) NOT NULL,
    PayorID nvarchar(50) NOT NULL,
    ProcedureCode int NOT NULL,
    ICDCode nvarchar(50) NOT NULL,
    LineOfBusiness nvarchar(50) NOT NULL,
    MedicaidID nvarchar(50) NOT NULL,
    MedicareID nvarchar(50) NOT NULL,
    InsertDate date NOT NULL,
    ModifiedDate date NOT NULL,
    CONSTRAINT PK_transactions PRIMARY KEY(TransactionID)
);


-- Creating tables for DB hopital-B


-- droping an existing table, please double chekc the DB you are connected to always

DROP table if EXISTS dbo.departments;

-- departments table hopital-B

CREATE TABLE dbo.departments (
    DeptID nvarchar(50) NOT NULL,
    Name nvarchar(50) NOT NULL,
    CONSTRAINT PK_deparments PRIMARY KEY(DeptID)
);


-- encounters table hospital-B

CREATE TABLE dbo.encounters (
    EncounterID nvarchar(50) NOT NULL,
    PatientID nvarchar(50) NOT NULL,
    EncounterDate date NOT NULL,
    EncounterType nvarchar(50) NOT NULL,
    ProviderID nvarchar(50) NOT NULL,
    DepartmentID nvarchar(50) NOT NULL,
    ProcedureCode int NOT NULL,
    InsertedDate date NOT NULL,
    ModifiedDate date NOT NULL,
    CONSTRAINT PK_encounters PRIMARY KEY (EncounterID)
);


-- patients table hospital-B

CREATE TABLE dbo.patients (
    ID nvarchar(50) NOT NULL,
    F_Name nvarchar(50) NOT NULL,
    L_Name nvarchar(50) NOT NULL,
    M_Name nvarchar(50) NOT NULL,
    SSN nvarchar(50) NOT NULL,
    PhoneNumber nvarchar(50) NOT NULL,
    Gender nvarchar(50) NOT NULL,
    DOB date NOT NULL,
    Address nvarchar(100) NOT NULL,
    Updated_Date date NOT NULL,
    CONSTRAINT PK_patients PRIMARY KEY (ID)
);


-- providers table hospital-B

CREATE TABLE dbo.providers (
    ProviderID nvarchar(50) NOT NULL,
    FirstName nvarchar(50) NOT NULL,
    LastName nvarchar(50) NOT NULL,
    Specialization nvarchar(50) NOT NULL,
    DeptID nvarchar(50) NOT NULL,
    NPI bigint NOT NULL,
    CONSTRAINT PK_providers PRIMARY KEY (ProviderID)
);


-- transanctions table hospital-B


CREATE TABLE dbo.transactions (
    TransactionID nvarchar(50) NOT NULL,
    EncounterID nvarchar(50) NOT NULL,
    PatientID nvarchar(50) NOT NULL,
    ProviderID nvarchar(50) NOT NULL,
    DeptID nvarchar(50) NOT NULL,
    VisitDate date NOT NULL,
    ServiceDate date NOT NULL,
    PaidDate date NOT NULL,
    VisitType nvarchar(50) NOT NULL,
    Amount float NOT NULL,
    AmountType nvarchar(50) NOT NULL,
    PaidAmount float NOT NULL,
    ClaimID nvarchar(50) NOT NULL,
    PayorID nvarchar(50) NOT NULL,
    ProcedureCode int NOT NULL,
    ICDCode nvarchar(50) NOT NULL,
    LineOfBusiness nvarchar(50) NOT NULL,
    MedicaidID nvarchar(50) NOT NULL,
    MedicareID nvarchar(50) NOT NULL,
    InsertDate date NOT NULL,
    ModifiedDate date NOT NULL,
    CONSTRAINT PK_transactions PRIMARY KEY (TransactionID)
);

-- updating the value of active for patients table db hospital_B

UPDATE dbo.ADF_Load_Metadata
set active= 0
where table_name = 'patients'

-- also adding the database name to the patient table for hospital-A database

insert into dbo.ADF_Load_Metadata(

    DatabaseName
)
values(

    'project1hospital'
)



-- Inserting values to metadata table for hopital-A

-- patients table, alredy done thus active is 0

INSERT into dbo.ADF_Load_Metadata(

    Id,
    File_Path,
    File_Name,
    Table_Name,
    Database_Name,
    Active
)
values(

    '1',
    'emr-data',
    'patients.csv',
    'dbo.Patients',
    'project1hospital',
    0
)

-- inserting for encounters

INSERT into dbo.ADF_Load_Metadata(

    Id,
    File_Path,
    File_Name,
    Table_Name,
    Database_Name,
    Active
)
values(

    '2',
    'emr-data',
    'encounters.csv',
    'dbo.encounters',
    'project1hospital',
    1
)

-- inserting for departments

INSERT into dbo.ADF_Load_Metadata(

    Id,
    File_Path,
    File_Name,
    Table_Name,
    Database_Name,
    Active
)
values(

    '3',
    'emr-data',
    'departments.csv',
    'dbo.departments',
    'project1hospital',
    1
)

-- inserting for providers

INSERT into dbo.ADF_Load_Metadata(

    Id,
    File_Path,
    File_Name,
    Table_Name,
    Database_Name,
    Active
)
values(

    '4',
    'emr-data',
    'providers.csv',
    'dbo.providers',
    'project1hospital',
    1
)


-- inserting for transacitons

INSERT into dbo.ADF_Load_Metadata(

    Id,
    File_Path,
    File_Name,
    Table_Name,
    Database_Name,
    Active
)
values(

    '5',
    'emr-data',
    'transactions.csv',
    'dbo.transactions',
    'project1hospital',
    1
)



-- Inserting values for hospuital_B DB


INSERT INTO dbo.ADF_Load_Metadata (
    Id,
    File_Path,
    File_Name,
    Table_Name,
    Database_Name,
    Active
)
VALUES
    (1, 'emr-data hospital-b', 'patients.csv',      'dbo.patients',      'project1hospital_hospital_B', 1),
    (2, 'emr-data hospital-b', 'providers.csv',       'dbo.providers',       'project1hospital_hospital_B', 1),
    (3, 'emr-data hospital-b', 'transactions.csv',  'dbo.transactions',  'project1hospital_hospital_B', 1),
    (4, 'emr-data hospital-b', 'encounters.csv',   'dbo.encounters',   'project1hospital_hospital_B', 1),
    (5, 'emr-data hospital-b',  'departments.csv',      'dbo.departments',      'project1hospital_hospital_B', 1);
