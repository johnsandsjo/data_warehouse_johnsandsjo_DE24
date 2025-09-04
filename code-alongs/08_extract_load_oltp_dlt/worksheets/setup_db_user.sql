USE WAREHOUSE dev_wh;
CREATE DATABASE amazon;
CREATE SCHEMA IF NOT EXISTS staging;
CREATE ROLE amazon_dlt_role;
USE ROLE SECURITYADMIN;
GRANT USAGE ON WAREHOUSE dev_wh TO ROLE amazon_dlt_role;
GRANT USAGE ON DATABASE amazon TO ROLE amazon_dlt_role;
GRANT USAGE ON SCHEMA amazon.staging TO ROLE amazon_dlt_role;

GRANT CREATE TABLE ON SCHEMA amazon.staging TO ROLE amazon_dlt_role;
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA amazon.staging TO ROLE amazon_dlt_role;
GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA amazon.staging TO ROLE amazon_dlt_role;

SHOW GRANTS TO ROLE amazon_dlt_role;
GRANT ROLE amazon_dlt_role TO USER johnsandsjostud;
GRANT ROLE amazon_dlt_role TO USER extract_loader;
USE ROLE amazon_dlt_role;
