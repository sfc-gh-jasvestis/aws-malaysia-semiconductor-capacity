-- ============================================================================
-- 07_SEMANTIC_VIEW.SQL — Semantic View for Production Capacity Planning
-- ============================================================================
USE DATABASE SEMICONDUCTOR_CAPACITY;
USE SCHEMA APP;

CREATE OR REPLACE SEMANTIC VIEW APP.CAPACITY_PLANNING_ANALYTICS
  COMMENT = 'Semiconductor capacity planning, demand forecasting, and utilization analytics'
AS
  TABLES (
    CURATED.DEMAND_VS_CAPACITY AS demand_vs_capacity,CURATED.UTILIZATION_TIMESERIES AS utilization_timeseries,CURATED.BOTTLENECK_ANALYSIS AS bottleneck_analysis,CURATED.REVENUE_AT_RISK AS revenue_at_risk
  );
