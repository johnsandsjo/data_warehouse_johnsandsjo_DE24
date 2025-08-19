SHOW DATABASES;
USE DATABASE CRUNCHBASE_BASIC_COMPANY_DATA;
SHOW SCHEMAS;
USE SCHEMA PUBLIC;
SHOW TABLES;
SHOW VIEwS;
SELECT * FROM organization_summary LIMIT 10;
DESC VIEW organization_summary;
SELECT COUNT(*) AS number_rows FROM organization_summary;
SELECT DISTINCT TYPE FROM organization_summary;

SELECT COUNT(DISTINCT name) AS number_unique_names FROM organization_summary;
SELECT COUNT(DISTINCT country_code) AS number_unique_countries FROM organization_summary;
SELECT country_code, COUNT(*) AS number_organizations
FROM organization_summary
GROUP BY country_code
ORDER BY number_organizations DESC;
SELECT country_code, COUNT(*) AS number_organizations
FROM organization_summary
GROUP BY country_code
HAVING country_code IN ('SWE', 'NOR', 'FIN', 'DNK', 'ISL')
ORDER BY number_organizations DESC;
SELECT country_code, region, COUNT(*) AS number_organizations
FROM organization_summary
GROUP BY country_code, region
HAVING country_code IN ('SWE', 'NOR', 'FIN', 'DNK', 'ISL')
ORDER BY number_organizations DESC;

SELECT * FROM organization_summary WHERE country_code = 'SWE';