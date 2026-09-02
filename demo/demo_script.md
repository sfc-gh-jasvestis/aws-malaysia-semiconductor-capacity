# Production Capacity Planning

**Malaysia - Semiconductor & Electronics Manufacturing**
Use case: Capacity Planning

> Forecast semiconductor fab capacity across 12 facilities — ML.FORECAST projects wafer starts, Dynamic Tables optimize loading, and Cortex Agent answers planning queries in natural language.

## Why Snowflake

Snowflake forecasts capacity and demand natively — no Spark jobs, no external forecasting tools, just SQL-based ML that updates every 5 minutes via Dynamic Tables

- **ML.FORECAST for demand vs capacity** - Only demo using native SQL ML to forecast semiconductor fab utilization — no Spark or SageMaker
- **ML.TOP_INSIGHTS for bottleneck drivers** - Automatically identifies which process steps, tools, and fabs are the binding constraints
- **5-minute Dynamic Table refresh** - Capacity planning updates in near real-time as production schedule changes flow in
- **Revenue-at-risk calculation** - Connects capacity constraints directly to customer order revenue impact in MYR
- **80 planning documents searchable via Cortex Search** - CapEx proposals, allocation policies, and planning guidelines instantly queryable
- **Malaysian semiconductor capacity context** - 12 fabs, 470K wafers/month with realistic node mix (5nm, 7nm, 28nm, 65nm)

## What is deployed

| | |
|---|---|
| Database | `MY_SEMICONDUCTOR_CAPACITY` |
| Service | `MY_SEMICONDUCTOR_CAPACITY_APP` |
| Compute pool | `SEA_DEMOS_MALAYSIA_POOL` |
| Dimension table | `RAW.FAB_CAPACITY` (20 rows) |
| Fact table | `RAW.PRODUCTION_SCHEDULE` (250,000 rows, 90 days) |
| Curated layer | `CURATED.PERFORMANCE_SUMMARY`, `CURATED.TREND_ANALYSIS`, `CURATED.KPI_SUMMARY` |
| Currency | MYR (RM) |

Regions in play: Selangor, Johor, Penang, Sabah, Sarawak
Segments: Wire Bond, Flip Chip, Wafer Level, Test and Burn-In

Dynamic tables are created suspended and refreshed on demand:

```bash
./refresh_demo_data.sh MY_SEMICONDUCTOR_CAPACITY
```

## KPI cards

Every card below is served live from `CURATED.KPI_SUMMARY`. The app keeps the
original literal as a fallback, so it still renders if Snowflake is unreachable.

| Card | Value | Backed by |
|---|---|---|
| Fab Utilization | `92%` | average per event |
| WIP (Wafers) | `124K` | total across Fab Capacity |
| Cycle Time (Avg) | `42 days` | average per event |
| Output (MTD) | `38K wafers` | total across Fab Capacity |
| Queue Time | `8.4 hrs` | average per event |
| Hot Lots | `12` | average per event |
| Bottleneck Tool | `Litho-3` | fixed label (not numeric) |

## Demo flow

1. Capacity Overview
2. Demand vs Capacity
3. Bottleneck Analysis
4. Ask AI
5. Architecture & Data

## Talking points

- **12 fabs** - 470K wafers/month total capacity across Penang/Kulim
- **87% utilization** - average across all fabs (target: 90%)
- **3 fabs** - approaching 95% capacity ceiling
- **RM 2.1B** - quarterly revenue at risk from capacity constraints
- **8,200 wafers** - demand-capacity gap at FAB-003 next quarter
- **80 planning docs** - indexed and searchable via Cortex Search

## Business impact

- Malaysia semiconductor exports reached RM 450B (US$98B) in 2023, representing 18.4% of GDP (MIDA)
- Semiconductor capacity constraints cost the automotive industry alone $210B in 2021-2022 (McKinsey Semiconductors)
- AI-driven capacity planning improves forecast accuracy by 20-30% vs traditional methods (Gartner Supply Chain)
- Yamaha Motor achieved real-time manufacturing intelligence on Snowflake (Snowflake Customers)

---
Generated from `generator/demo_specs/aws-malaysia-semiconductor-capacity.json`. Do not hand-edit: run
`python3 generator/gen_repo_docs.py aws-malaysia-semiconductor-capacity` instead.
