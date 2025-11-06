-- ===============================================
-- DESCRIPTION: This script sets up the database, creates the
--              table, and loads the data from csv file.

-- ===============================================
-- PHASE 1: DATABASE INITILAIZATION
-- ===============================================
PRINT '>> Database Creation (UnicornDB)...';
-- 1. Check if the database exists and drop it 
IF DB_ID('UnicornDB') IS NOT NULL
    DROP DATABASE UnicornDB;
GO

--2. Create the new database
CREATE DATABASE UnicornDB;
GO

--3. Switch context to the new database
USE UnicornDB;
GO
-- ===============================================
-- PHASE 2: TABLE CREATION
-- ===============================================
PRINT '>> Define the table structure (dbo.unicorn_companies)...';

-- 4. Drop the  table if it exists
IF OBJECT_ID('dbo.unicorn_companies', 'U') IS NOT NULL
    DROP TABLE dbo.unicorn_companies;
GO
-- 5. Define the table structure 
 CREATE TABLE dbo.unicorn_companies (
    company       VARCHAR(255) NOT NULL,
    valuation     VARCHAR(100),
    date_joined   DATE,
    country       VARCHAR(100),
    city          VARCHAR(100),
    industry      VARCHAR(100),
    investors     TEXT
);
GO
  

-- ===============================================
-- PHASE 3: DATA LOADING AND CLEANING (ETL)
-- ===============================================

-- 6. Bulk Insert Data into the 'dbo.unicorn_companies' table
PRINT '>> Inserting Data via BULK INSERT into (dbo.unicorn_companies) table...';
BULK INSERT dbo.unicorn_companies
FROM 'D:\DataSets\unicorns till sep 2022.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
PRINT '>>Data successfully loaded into (dbo.unicorn_companies) Table.';
GO
