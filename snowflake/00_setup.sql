-- ============================================================================
-- Production Capacity Planning
-- Forecast semiconductor fab capacity across 12 facilities — ML.FORECAST projects wafer starts, Dynamic Tables optimize loading, and Cortex Agent answers planning queries in natural language.
-- ============================================================================
USE ROLE ACCOUNTADMIN;
CREATE DATABASE IF NOT EXISTS SEMICONDUCTOR_CAPACITY;
CREATE WAREHOUSE IF NOT EXISTS SEMI_WH WAREHOUSE_SIZE = 'MEDIUM' AUTO_SUSPEND = 120 AUTO_RESUME = TRUE;
USE DATABASE SEMICONDUCTOR_CAPACITY;
CREATE SCHEMA IF NOT EXISTS RAW;
CREATE SCHEMA IF NOT EXISTS CURATED;
CREATE SCHEMA IF NOT EXISTS ML;
CREATE SCHEMA IF NOT EXISTS AI;
CREATE SCHEMA IF NOT EXISTS SEARCH;
CREATE SCHEMA IF NOT EXISTS APP;

USE WAREHOUSE SEMI_WH;
