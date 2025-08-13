

-- creating the metadata TABLE

drop table if EXISTS dbo.ADF_Load_Metadata;

create table dbo.ADF_Load_Metadata (
    SourceName        NVARCHAR(128) primary KEY,
    FilePath          NVARCHAR(400),  -- ADLS path or wildcard, e.g., 'raw/hospital/patient/*.csv'
    FileFormat        NVARCHAR(10),   -- 'csv' or 'parquet'
    TargetSchema      NVARCHAR(64),   -- 'dbo'
    TargetTable       NVARCHAR(128),  -- 'Patient'
    Active            BIT             -- enables/disables the mapping
);

INSERT into dbo.ADF_Load_Metadata(

    SourceName,
    FilePath,
    FileFormat,
    TargetSchema,
    TargetTable,
    Active
)
values(
    'patient',
    'raw/hospital/patient/*.csv',
    'csv',
    'dbo',
    'patients',
    1
)
