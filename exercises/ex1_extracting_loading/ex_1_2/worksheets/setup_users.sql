--Create a user called extract_loader and setup its credentials.

USE ROLE USERADMIN;
CREATE USER extract_loader
    PASSWORD = 'abc987'
    DEFAULT_WAREHOUSE = MARKETING_WH;

--Create a role marketing_dlt_role and grant it access to staging.
CREATE ROLE marketing_dlt_role;

USE ROLE SECURITYADMIN;
GRANT USAGE ON WAREHOUSE marketing_wh TO ROLE marketing_dlt_role;
GRANT USAGE ON DATABASE ifood TO ROLE marketing_dlt_role;
GRANT USAGE ON SCHEMA ifood.staging TO ROLE marketing_dlt_role;

GRANT CREATE TABLE ON SCHEMA ifood.staging TO ROLE marketing_dlt_role;
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;
GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;

SHOW GRANTS TO ROLE marketing_dlt_role;

--Assign marketing_dlt_role to extract_loader user.
GRANT ROLE marketing_dlt_role TO USER extract_loader;

--
USE ROLE useradmin;
CREATE ROLE IF NOT EXISTS ifood_reader;
USE ROLE securityadmin;
GRANT USAGE ON WAREHOUSE marketing_wh TO ROLE ifood_reader;
GRANT USAGE ON DATABASE ifood TO ROLE ifood_reader;
GRANT USAGE ON SCHEMA ifood.staging TO ROLE ifood_reader;

GRANT SELECT ON ALL TABLES IN SCHEMA ifood.staging TO ROLE ifood_reader;
GRANT SELECT ON FUTURE TABLES IN DATABASE ifood TO ROLE ifood_reader;

GRANT ROLE ifood_reader TO USER johnsandsjostud;

SHOW GRANTS TO ROLE ifood_reader;