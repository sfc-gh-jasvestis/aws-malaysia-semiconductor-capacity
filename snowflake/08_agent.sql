-- ============================================================================
-- 08_AGENT.SQL — Cortex Agent for Production Capacity Planning
-- ============================================================================
USE DATABASE SEMICONDUCTOR_CAPACITY;
USE SCHEMA APP;

CREATE OR REPLACE CORTEX AGENT APP.CAPACITY_PLANNING_AGENT
  COMMENT = 'Production Capacity Planning AI Assistant'
  MODEL = 'claude-opus-4-8'
  TOOLS = (
    SEMANTIC_VIEW_TOOL(SEMANTIC_VIEW => 'SEMICONDUCTOR_CAPACITY.APP.CAPACITY_PLANNING_ANALYTICS'),    CORTEX_SEARCH_TOOL(CORTEX_SEARCH_SERVICE => 'SEMICONDUCTOR_CAPACITY.SEARCH.PLANNING_DOCS_SEARCH', TOOL_DESCRIPTION => 'Search documents for Semiconductor & Electronics Manufacturing information')
  )
  SYSTEM_PROMPT = 'You are the Capacity Planning Agent for 12 semiconductor fabs producing 470K wafers/month in the Penang/Kulim corridor, Malaysia.';
