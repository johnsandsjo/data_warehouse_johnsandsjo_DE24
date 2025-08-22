USE ROLE SYSADMIN;

--setup database and staging layer
CREATE DATABASE IF NOT EXISTS movies;
CREATE SCHEMA IF NOT EXISTS movies.staging;
USE SCHEMA movies.staging;