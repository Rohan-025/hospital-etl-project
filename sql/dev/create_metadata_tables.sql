

-- creating the metadata TABLE

create table dbo.ADF_Load_Metadata (
    SourceName NVARCHAR(128),
    FilePath          NVARCHAR(400),  -- ADLS path or wildcard, e.g., 'raw/hospital/patient/*.csv'
    FileFormat        NVARCHAR(10),   -- 'csv' or 'parquet'
    TargetSchema      NVARCHAR(64),   -- 'dbo'
    TargetTable       NVARCHAR(128),  -- 'Patient'
    StagingTable      NVARCHAR(128),  -- 'Patient_stg'
    LoadType          NVARCHAR(20),   -- 'Full' or 'Incremental'
    WatermarkColumn   NVARCHAR(64),   -- e.g., 'UpdatedAt'
    BusinessKey       NVARCHAR(128),  -- e.g., 'PatientId'
    -- add more columns as needed (column mapping, delimiter, etc.)
    Active            BIT             -- enables/disables the mapping
);

INSERT into dbo.ADF_Load_Metadata(

    SourceName,
    FilePath,
    FileFormat,
    TargetSchema,
    TargetTable,
    StagingTable,
    LoadType,
    WatermarkColumn,
    BusinessKey,
    Active
)
values(
    'Patient',
    'raw/hospital/patient/*.csv',
    'csv',
    'dbo',
    'patients',
    'patients_stg',
    'Full',
    'ModifiedDate',
    'patient_id',
    1
)
