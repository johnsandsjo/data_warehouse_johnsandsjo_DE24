  --Create a marketing virtual warehouse called marketing_wh 
  --with size xs, 1 min suspend time, it should autoresume, 
  --suspend initially and give it a suitable comment.

CREATE WAREHOUSE marketing_wh
WITH 
WAREHOUSE_SIZE = 'XSMALL'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE
COMMENT = 'Warehouse for exercise 1.1 and 1.2 called marketing_wh.';

--create a database called ifood, and add a staging layer by creating a schema called staging.
CREATE database ifood;
SHOW SCHEMAS in database ifood;
CREATE SCHEMA ifood.staging;

--Testing queries
USE DATABASE ifood;
USE SCHEMA STAGING;
USE WAREHOUSE marketing_wh;
USE ROLE SYSADMIN;
USE ROLE marketing_dlt_role;
SELECT * FROM staging.marketing_campaigns LIMIT 10;

SHOW TABLES IN SCHEMA staging;