-- ============================================================================
-- 04_DYNAMIC_TABLES.SQL — Curated layer for Production Capacity Planning
-- ============================================================================
USE DATABASE SEMICONDUCTOR_CAPACITY;
USE SCHEMA CURATED;

-- DEMAND_VS_CAPACITY: Real-time demand-capacity gap analysis by fab and technology node
-- Source: FAB_CAPACITY, DEMAND_FORECASTS
CREATE OR REPLACE DYNAMIC TABLE CURATED.DEMAND_VS_CAPACITY
  TARGET_LAG = '5 minutes'
  WAREHOUSE = SEMI_WH
AS
SELECT * FROM RAW.FAB_CAPACITY;
-- TODO: Replace with actual join/aggregation logic per demo

-- UTILIZATION_TIMESERIES: Daily fab utilization percentage for ML.FORECAST input
-- Source: FAB_CAPACITY, PRODUCTION_SCHEDULE
CREATE OR REPLACE DYNAMIC TABLE CURATED.UTILIZATION_TIMESERIES
  TARGET_LAG = '5 minutes'
  WAREHOUSE = SEMI_WH
AS
SELECT * FROM RAW.FAB_CAPACITY;
-- TODO: Replace with actual join/aggregation logic per demo

-- BOTTLENECK_ANALYSIS: Process step bottleneck identification with constraint severity scoring
-- Source: CAPACITY_CONSTRAINTS, PRODUCTION_SCHEDULE
CREATE OR REPLACE DYNAMIC TABLE CURATED.BOTTLENECK_ANALYSIS
  TARGET_LAG = '5 minutes'
  WAREHOUSE = SEMI_WH
AS
SELECT * FROM RAW.CAPACITY_CONSTRAINTS;
-- TODO: Replace with actual join/aggregation logic per demo

-- REVENUE_AT_RISK: Revenue impact calculation from capacity-constrained customer orders
-- Source: CUSTOMER_ORDERS, DEMAND_FORECASTS, FAB_CAPACITY
CREATE OR REPLACE DYNAMIC TABLE CURATED.REVENUE_AT_RISK
  TARGET_LAG = '5 minutes'
  WAREHOUSE = SEMI_WH
AS
SELECT * FROM RAW.CUSTOMER_ORDERS;
-- TODO: Replace with actual join/aggregation logic per demo

