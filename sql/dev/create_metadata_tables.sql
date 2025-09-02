

-- creating the metadata TABLE

drop table if EXISTS dbo.ADF_Load_Metadata;

create table dbo.ADF_Load_Metadata (
    FilePath NVARCHAR(400),
    File_Name NVARCHAR(100),
    Table_Name NVARCHAR(50),
    Active BIT
)


INSERT into dbo.ADF_Load_Metadata(

    FilePath,
    File_Name,
    Table_Name,
    Active
)
values(
    'emr-data',
    'patients.csv',
    'dbo.Patients',
    1
)
