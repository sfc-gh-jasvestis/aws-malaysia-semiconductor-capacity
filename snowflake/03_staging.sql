-- ============================================================================
-- 03_STAGING.SQL — Generate synthetic data for Production Capacity Planning
-- Country: MALAYSIA | Currency: MYR
-- ============================================================================
USE DATABASE SEMICONDUCTOR_CAPACITY;
USE SCHEMA RAW;

-- Data generation scripts are demo-specific.
-- See the handcrafted SQL in the aws-malaysia-semiconductor-yield demo for
-- the full pattern: GENERATOR + UNIFORM + LATERAL for distribution,
-- Cortex Complete for text generation, engineered key demo numbers.

-- Target row counts:
-- FAB_CAPACITY: 12 rows — Fabrication facility capacity (wafer starts/month, technology nodes, tool count)
-- DEMAND_FORECASTS: 1,000 rows — Customer demand forecasts by product, node, and month (rolling 12 months)
-- PRODUCTION_SCHEDULE: 8,000 rows — Wafer lot scheduling with start dates, completion targets, and priority
-- CAPACITY_CONSTRAINTS: 200 rows — Bottleneck constraints by process step, tool type, and fab
-- PLANNING_DOCS: 80 rows — Capacity planning guidelines, allocation policies, CapEx proposals
-- CUSTOMER_ORDERS: 1,500 rows — Confirmed customer orders with revenue and delivery commitments
