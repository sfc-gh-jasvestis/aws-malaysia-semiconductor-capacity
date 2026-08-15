-- ============================================================================
-- 11_TASK_PIPELINE.SQL — Task DAG for Production Capacity Planning
-- ============================================================================
USE DATABASE SEMICONDUCTOR_CAPACITY;
USE SCHEMA APP;

CREATE OR REPLACE TASK APP.TASK_REFRESH_FORECASTS
  WAREHOUSE = SEMI_WH
  SCHEDULE = 'USING CRON */5 * * * * UTC'
  COMMENT = 'Refresh demand vs capacity forecast every 5 minutes'
AS
  SELECT 1; -- Replace with actual refresh logic

CREATE OR REPLACE TASK APP.TASK_RETRAIN_MODELS
  WAREHOUSE = SEMI_WH
  SCHEDULE = 'USING CRON 0 */6 * * * UTC'
  COMMENT = 'Retrain capacity demand forecast and bottleneck models'
AS
  SELECT 1; -- Replace with actual refresh logic

CREATE OR REPLACE TASK APP.TASK_REFRESH_AI
  WAREHOUSE = SEMI_WH
  AFTER APP.TASK_RETRAIN_MODELS
  COMMENT = 'Refresh planning document classifications and recommendations'
AS
  SELECT 1; -- Replace with actual refresh logic

ALTER TASK APP.TASK_REFRESH_AI RESUME;
ALTER TASK APP.TASK_RETRAIN_MODELS RESUME;
ALTER TASK APP.TASK_REFRESH_FORECASTS RESUME;
