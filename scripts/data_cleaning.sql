--Check if the company name is repeated
SELECT 
*
FROM(
        SELECT 
            TRIM(company) as company,
            count(*) over(PARTITION BY company) as  flag,
            [valuation]
           ,[date_joined]
           ,[country]
           ,[city]
           ,[industry]
           ,[investors]
        FROM dbo.unicorn_companies
        )t
WHERE flag > 1
