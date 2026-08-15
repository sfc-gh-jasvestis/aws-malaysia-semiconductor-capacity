-- ============================================================================
-- 05_SEARCH.SQL — Cortex Search for Production Capacity Planning
-- ============================================================================
USE DATABASE SEMICONDUCTOR_CAPACITY;
USE SCHEMA SEARCH;

CREATE OR REPLACE CORTEX SEARCH SERVICE SEARCH.PLANNING_DOCS_SEARCH
  ON CONTENT
  ATTRIBUTES DOC_TYPE, FAB_ID, DECISION_TYPE
  WAREHOUSE = SEMI_WH
  TARGET_LAG = '1 hour'
AS (
  SELECT * FROM RAW.PLANNING_DOCS
);
