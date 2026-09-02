-- Generated from generator/demo_specs/aws-malaysia-semiconductor-capacity.json
-- Regenerate with: python3 generator/gen_repo_docs.py aws-malaysia-semiconductor-capacity
-- This is the schema that is actually deployed for MY_SEMICONDUCTOR_CAPACITY.

-- MY_SEMICONDUCTOR_CAPACITY  (Production Capacity Planning)
-- generated from generator/demo_specs/aws-malaysia-semiconductor-capacity.json - do not hand-edit
CREATE DATABASE IF NOT EXISTS MY_SEMICONDUCTOR_CAPACITY;
CREATE SCHEMA IF NOT EXISTS MY_SEMICONDUCTOR_CAPACITY.RAW;
CREATE SCHEMA IF NOT EXISTS MY_SEMICONDUCTOR_CAPACITY.CURATED;
CREATE SCHEMA IF NOT EXISTS MY_SEMICONDUCTOR_CAPACITY.APP;
USE DATABASE MY_SEMICONDUCTOR_CAPACITY;

-- 5 real regions; entity names carry their region so the two always agree
