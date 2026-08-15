-- ============================================================================
-- 10_ALERTS_NOTIFICATIONS.SQL — Alerts for Production Capacity Planning
-- ============================================================================
USE DATABASE SEMICONDUCTOR_CAPACITY;
USE SCHEMA APP;

-- Notification integration (email)
CREATE OR REPLACE NOTIFICATION INTEGRATION aws_malaysia_semiconductor_capacity_EMAIL_INT
  TYPE = EMAIL
  ENABLED = TRUE
  ALLOWED_RECIPIENTS = ('jonathan.asvestis@snowflake.com');

-- Alert: CAPACITY_CEILING_ALERT
CREATE OR REPLACE ALERT APP.CAPACITY_CEILING_ALERT
  WAREHOUSE = SEMI_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'Fab utilization approaching capacity ceiling'
IF (EXISTS (
  SELECT 1 FROM CURATED.DEMAND_VS_CAPACITY
  WHERE 1=1 -- Condition: UTILIZATION_PCT > 95 for any fab
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_malaysia_semiconductor_capacity_EMAIL_INT',
    'jonathan.asvestis@snowflake.com',
    '[ALERT] Production Capacity Planning: Fab utilization approaching capacity ceiling',
    'Fab utilization approaching capacity ceiling'
  );

ALTER ALERT APP.CAPACITY_CEILING_ALERT RESUME;

-- Alert: DEMAND_EXCEED_CAPACITY_ALERT
CREATE OR REPLACE ALERT APP.DEMAND_EXCEED_CAPACITY_ALERT
  WAREHOUSE = SEMI_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'Forecasted demand exceeds available capacity'
IF (EXISTS (
  SELECT 1 FROM CURATED.DEMAND_VS_CAPACITY
  WHERE 1=1 -- Condition: DEMAND_GAP_WAFERS > 5000 for any fab-month
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_malaysia_semiconductor_capacity_EMAIL_INT',
    'jonathan.asvestis@snowflake.com',
    '[ALERT] Production Capacity Planning: Forecasted demand exceeds available capacity',
    'Forecasted demand exceeds available capacity'
  );

ALTER ALERT APP.DEMAND_EXCEED_CAPACITY_ALERT RESUME;

