# hospital-etl-project
Metadata-driven ETL pipeline for hospital data using ADF and Azure SQL

# Solution Architecture

Medallion

Landing (hospital-data) >  Bronze  > Silver  > Gold

(these are the containers in the  ADLS)

Bronze     Silver          Gold

Parquet    Delta Tables    Delta Tables

Bronze- Parquet format source of truth
Silver- Data cleaning, enrich, CDM (Common data model), SCD2
Gold- Fact and dimension table

# Data

EMR - (Tables) Azure SQL server, there are 2 sql server instances containing data from 2 hospitals
Claims - (Flat files) in ADLS landing zone container

# storage account - rohannewaccount1

-- landing 
-- bronze
-- silver
-- bronze
-- config (for creating metadata deriven pipeline)
    -- emr data
            -- load_config.csv

## we will be creating a metadriven pipeline

-- IR

    -- LS
        ADLS
        Azure SQL server
        azure key vault
        delta lake


    -- datasets

        Delimited text - ADLS Gen 2 (file name/ filepath/ fileformat)
        Tables -         AZURE SQL (server databasename/ schemaname/ tablename)
        Parquet -        ADLS gen 2   
        Delta Table-     Azure delta table

-- now we are making a generic ls thus the db name is not defined at the ls level we will dynamically add it
-- pipeline
        data set
                ls  
    now this heirarchy is sor tof imp, cause we pass the value of the param at any lvl and it flows thorugh every level
    thus we will pass the param of db name in the pipeline or data set synamically not in the ls itself



## creating the metadata table

columns

SourceName	Unique ID for each data flow. Used as the pipeline parameter, links each run to its config row.

FilePath	Tells pipeline where in ADLS to look for files (supports wildcards/partitioning).

FileFormat	Tells pipeline how to read the file (csv or parquet). Different formats need different handling.

TargetSchema	Allows you to support multiple schemas/namespaces in SQL Server.

TargetTable	The main table to load data into.

Active	Lets you enable/disable configs without deleting them (easy rollback/versioning).


NVARCHAR vs VARCHAR in SQL Server
1. NVARCHAR (National Variable Character)

    Stores Unicode data (UTF-16).

    Can store any language: Hindi, Chinese, French, emoji, etc.

    Each character uses 2 bytes (more space).

    Syntax: NVARCHAR(128) (must use N'...' for literal values in T-SQL).

2. VARCHAR (Variable Character)

    Stores non-Unicode data (uses code page of database/server).

    Only supports English and the default server language (or whatever code page is set).

    Each character uses 1 byte (more compact, for pure ASCII).

    Syntax: VARCHAR(128).

Why Use NVARCHAR in a Metadata Table?

    Future-proof: If you ever get a file or table name, path, or business key with non-English characters, it just works—no data loss, no weird encoding bugs.

    International support: Hospitals might have patient names, doctor names, etc., in Hindi, Bengali, Tamil, Urdu, or even imported files with Chinese or French.

    Best practice: Modern SQL Server design almost always defaults to NVARCHAR for anything that could ever be international, especially in cloud or multi-tenant setups.

    Metadata table: Can store file paths or table names that include special characters, making it robust for all file systems and naming conventions.

When to use VARCHAR then?

    When you know 100% the data is and always will be plain English (ASCII), and you want to optimize storage.

    For log tables or internal technical-only fields with strict, short ASCII values.

But, in 2025, unless you are super sure about your scope, always prefer NVARCHAR for:

    File paths (may have unicode)

    Names (always use nvarchar for people/org names)

    Anything user-supplied

    Anything you want to be portable globally
