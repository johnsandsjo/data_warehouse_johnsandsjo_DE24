USE ROLE job_ads_dlt_role;

USE WAREHOUSE dev_wh;
USE DATABASE job_ads;
SHOW SCHEMAS;

SHOW TABLES IN SCHEMA staging;

DESC table staging.DATA_FIELD_JOB_ADS;

SELECT headline, employer__workplace
FROM staging.data_field_job_ads;

SELECT *
FROM staging.data_field_job_ads;