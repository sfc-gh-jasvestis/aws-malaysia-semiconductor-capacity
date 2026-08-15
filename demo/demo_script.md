# Demo Script: Production Capacity Planning
## ~4-Minute Recorded Walkthrough
**Format**: Screen recording with voiceover
**Target**: Customer meeting / booth loop / social share
**Narrative**: "Snowflake forecasts capacity and demand natively — no Spark jobs, no external forecasting tools, just SQL-based ML that updates every 5 minutes via Dynamic Tables"
**Demo Mode**: Open app with `?demo=true` for presenter notes

---

## Two Personas

| Persona | Role | Tool | What they care about |
|---|---|---|---|
| **Dr. Ooi Kok Beng** | VP Planning | React App (SPCS) | Demand-capacity balance, revenue at risk, capital expenditure timing, customer allocation fairness |
| **Farah binti Hassan** | Capacity Planner | Amazon QuickSight | Wafer start scheduling, bottleneck identification, demand forecast accuracy, constraint resolution |

---

## What's Built

| Layer | Component | Detail |
|---|---|---|
| **RAW** | 6 tables | FAB_CAPACITY (12), DEMAND_FORECASTS (1000), PRODUCTION_SCHEDULE (8000), CAPACITY_CONSTRAINTS (200), PLANNING_DOCS (80), CUSTOMER_ORDERS (1500) |
| **CURATED** | 4 Dynamic Tables | DEMAND_VS_CAPACITY, UTILIZATION_TIMESERIES, BOTTLENECK_ANALYSIS, REVENUE_AT_RISK |
| **ML** | ML.FORECAST + ML.TOP_INSIGHTS | Forecasting + anomaly detection |
| **AI** | COMPLETE, AI_CLASSIFY, SUMMARIZE | Classification + extraction |
| **Search** | Cortex Search | 80 documents indexed |
| **Agent** | CAPACITY_PLANNING_AGENT | Semantic View + Search tools |


---

## The Story

Malaysia's 12 semiconductor fabs produce 470,000 wafers per month for Intel, Qualcomm, MediaTek, and Infineon. With 87% average utilization and 3 fabs approaching 95% ceiling, the VP Planning faces a RM 2.1 billion decision: which customers get capacity, which orders get deferred, and when to trigger RM 500M in CapEx expansion. Traditional capacity planning relies on weekly spreadsheet updates — by the time constraints are visible, customer commitments are already at risk.

---

## Script

### [0:00–0:45] CAPACITY OVERVIEW

**Show**: Capacity Overview tab

> "12 fabs producing 470,000 wafers per month across the Penang-Kulim corridor — 87% average utilization."

**Action**: Point at 470K wafers/month total capacity KPI

### [0:45–1:30] DEMAND VS CAPACITY

**Show**: Demand vs Capacity tab

> "FAB-003 running 5nm node — demand exceeds capacity by 8,200 wafers next quarter."

**Action**: Show demand vs capacity gap chart by fab

### [1:30–2:15] BOTTLENECK ANALYSIS

**Show**: Bottleneck Analysis tab

> "ML.TOP_INSIGHTS identifies lithography as the primary bottleneck driver in FAB-003 — 3 EUV tools at 98% loading."

**Action**: Show bottleneck ranking from TOP_INSIGHTS

### [2:15–3:00] ASK AI

**Show**: Ask AI tab

> "Dr. Ooi asks: 'What's the revenue impact if FAB-003 stays at current capacity for 2 more quarters?'"

**Action**: Type: 'Revenue impact if FAB-003 capacity unchanged for 2 quarters?'

### [3:00–3:45] ARCHITECTURE & DATA

**Show**: Architecture & Data tab

> "Dynamic Tables refresh every 5 minutes — demand vs capacity always current, no batch jobs."

**Action**: Walk through architecture diagram


---

## Key Demo Differentiators

1. **ML.FORECAST for demand vs capacity** — Only demo using native SQL ML to forecast semiconductor fab utilization — no Spark or SageMaker
2. **ML.TOP_INSIGHTS for bottleneck drivers** — Automatically identifies which process steps, tools, and fabs are the binding constraints
3. **5-minute Dynamic Table refresh** — Capacity planning updates in near real-time as production schedule changes flow in
4. **Revenue-at-risk calculation** — Connects capacity constraints directly to customer order revenue impact in MYR
5. **80 planning documents searchable via Cortex Search** — CapEx proposals, allocation policies, and planning guidelines instantly queryable
6. **Malaysian semiconductor capacity context** — 12 fabs, 470K wafers/month with realistic node mix (5nm, 7nm, 28nm, 65nm)


---

## Demo Prep Checklist

### Data Verification
- [ ] `SELECT COUNT(*) FROM SEMICONDUCTOR_CAPACITY.RAW.FAB_CAPACITY` → 12
- [ ] `SELECT COUNT(*) FROM SEMICONDUCTOR_CAPACITY.RAW.DEMAND_FORECASTS` → 1000
- [ ] `SELECT COUNT(*) FROM SEMICONDUCTOR_CAPACITY.RAW.PRODUCTION_SCHEDULE` → 8000
- [ ] `SELECT COUNT(*) FROM SEMICONDUCTOR_CAPACITY.CURATED.DEMAND_VS_CAPACITY WHERE UTILIZATION_PCT > 95` → 3

### ML Model Verification
- [ ] `SELECT COUNT(*) FROM SEMICONDUCTOR_CAPACITY.ML.CAPACITY_DEMAND_FORECAST_RESULTS` → >0

### AI/Agent Verification
- [ ] `SELECT COUNT(*) FROM SEMICONDUCTOR_CAPACITY.AI.DOC_CLASSIFICATION` → 80

