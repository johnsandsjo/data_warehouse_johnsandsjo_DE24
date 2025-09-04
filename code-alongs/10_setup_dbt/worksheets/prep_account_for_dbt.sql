SHOW TABLES IN SCHEMA job_ads.staging;
USE DATABASE job_ads;
CREATE SCHEMA IF NOT EXISTS warehouse;
SHOW SCHEMAS IN job_ads;
CREATE ROLE job_ads_dbt_role;


USE ROLE SECURITYADMIN;
GRANT ROLE job_ads_dlt_role TO USER transformer;
USE ROLE SECURITYADMIN;
SHOW GRANTS ON DATABASE job_ads;
GRANT ROLE job_ads_dlt_role TO ROLE job_ads_dbt_role;
GRANT USAGE, CREATE TABLE, CREATE VIEW ON SCHEMA job_ads.warehouse TO ROLE job_ads_dbt_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA job_ads.warehouse TO ROLE job_ads_dbt_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA job_ads.warehouse TO ROLE job_ads_dbt_role;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA job_ads.warehouse TO ROLE job_ads_dbt_role;
GRANT ROLE job_ads_dbt_role TO USER johnsandsjostud;
GRANT ROLE job_ads_dbt_role TO USER transformer;
USE ROLE job_ads_dbt_role;
SELECT * FROM job_ads.staging.data_field_job_ads LIMIT 10;