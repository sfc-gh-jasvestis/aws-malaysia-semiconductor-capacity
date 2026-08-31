'use client';

import { useEffect, useState } from 'react';
import { AppLayout } from '@/components/AppLayout';
import { KPICard } from '@/components/KPICard';
import { Chart } from '@/components/Chart';
import { DataTable } from '@/components/DataTable';
import { AskAI } from '@/components/AskAI';
import { ActionMemo } from '@/components/ActionMemo';
import { GeoMap } from '@/components/GeoMap';
import { ArchitectureDiagram } from '@/components/ArchitectureDiagram';

interface DemoNarrative {
  title: string;
  duration: string;
  thesis: string;
  tabs: any[];
}

export default function HomePage() {
  const [narrative, setNarrative] = useState<DemoNarrative | null>(null);
  const [data, setData] = useState<any>(null);

  useEffect(() => {
    fetch('/demo_narrative.json')
      .then((r) => r.json())
      .then(setNarrative)
      .catch(() => {});
    fetch('/api/data')
      .then((r) => r.json())
      .then(setData)
      .catch(() => {});
  }, []);

  const title = narrative?.title || 'SEA AWS Demo';

  const executiveCockpit = (
    <div className="space-y-6">
      <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <KPICard title="Fab Utilization" value="92%" status="neutral" />
        <KPICard title="WIP (Wafers)" value="124K" status="neutral" />
        <KPICard title="Cycle Time (Avg)" value="42 days" status="neutral" />
        <KPICard title="Output (MTD)" value="38K wafers" status="neutral" />
      </div>
      <div className="grid grid-cols-1 gap-4 lg:grid-cols-2">
        <div className="lg:col-span-1">
          <GeoMap
            country="malaysia"
            markers={[{"label": "Penang", "value": "Fab: util 92%", "color": "green", "size": "lg"}, {"label": "Kulim", "value": "Assembly: yield 94%", "color": "green", "size": "lg"}, {"label": "Kuala Lumpur", "value": "HQ & design center", "color": "blue", "size": "md"}, {"label": "Johor Bahru", "value": "Test facility", "color": "green", "size": "md"}]}
            routes={[{"from": "Penang", "to": "Kulim", "color": "#29B5E8"}]}
            title="Geographic Overview"
            height={400}
          />
        </div>
        <div className="lg:col-span-1 grid grid-cols-1 gap-4">
      <div className="grid grid-cols-1 gap-4 grid-cols-1">
        <Chart
          data={data?.timeseries || [{ period: 'Loading', value: 0 }]}
          type="line"
          xKey="period"
          yKeys={[{ key: 'value', name: 'Utilization %' }]}
          title="Fab Utilization (Weekly)"
        />
        <Chart
          data={data?.categories || [{ category: 'Loading', count: 0 }]}
          type="bar"
          xKey="category"
          yKeys={[{ key: 'count', name: 'Wafers (K)' }]}
          title="WIP by Product Family"
        />
      </div>
        </div>
      </div>
      <DataTable
        columns={[
          { key: 'id', header: 'Line' },
          { key: 'name', header: 'Product' },
          { key: 'status', header: 'Utilization' },
          { key: 'value', header: 'Output/Week' },
        ]}
        data={data?.entities || []}
        title="Production Line Status"
      />
    </div>
  );

  const domainTab1 = (
    <div className="space-y-6">
      <div className="grid grid-cols-1 gap-4 sm:grid-cols-3">
        <KPICard title="Bottleneck Tool" value="Litho-3" />
        <KPICard title="Queue Time" value="8.4 hrs" />
        <KPICard title="Hot Lots" value="12" />
      </div>
      <Chart
        data={data?.detail || [{ x: 'Loading', y: 0 }]}
        type="area"
        xKey="x"
        yKeys={[{ key: 'y', name: 'Wafer Starts (K)' }]}
        title="Capacity vs Demand (13-week)"
        height={400}
      />
    </div>
  );

  const domainTab2 = (
    <div className="space-y-6">
      <div className="grid grid-cols-1 gap-4 lg:grid-cols-2">
        <Chart
          data={data?.breakdown || [{ label: 'A', value: 30 }, { label: 'B', value: 70 }]}
          type="pie"
          xKey="label"
          yKeys={[{ key: 'value', name: '%' }]}
          title="Tool Utilization by Area"
        />
        <ActionMemo
          persona={{ name: 'Ahmad Razali', role: 'Fab Operations Director' }}
          context={{}}
          onGenerate={async () => ({
            subject: 'Action Required',
            body: 'AI-generated recommendation based on current data patterns and predicted trends.',
            urgency: 'HIGH',
            actions: ['Add 3rd shift for photolithography (bottleneck)', 'Prioritize automotive customer lots (contractual penalty)', 'Schedule Etch-7 maintenance during low-demand window'],
          })}
        />
      </div>
    </div>
  );

  const askAiTab = (
    <div className="h-[600px]">
      <AskAI
        title="Ask AI"
        sampleQuestions={[
          'Which tools are the current bottleneck?',
          'Show cycle time trend for priority vs standard lots',
          'What is the capacity allocation for Q4 demand forecast?',
        ]}
        mode="sql"
        onSubmit={async (question, mode) => {
          return {
            answer: `[Demo Mode] Response to: "${question}" (${mode} mode). Connect to Snowflake for live data.`,
            sql: mode === 'sql' ? 'SELECT * FROM CURATED.SUMMARY LIMIT 10;' : undefined,
          };
        }}
      />
    </div>
  );

  const architectureTab = (
    <ArchitectureDiagram
      snowflakeFeatures={['Dynamic Tables (5-min refresh)', 'ML Functions (Forecast + Anomaly)', 'Cortex Search + Agent', 'Semantic View + Intelligence', 'Alerts + Notifications']}
      awsServices={[{ name: 'Amazon S3', role: 'Strategy Docs' }, { name: 'Amazon S3 + Kinesis', role: 'Integration' }, { name: 'Amazon SNS', role: 'Integration' }, { name: 'Amazon QuickSight + Q', role: 'Integration' }]}
    />
  );

  const tabs = [
    { id: 'executive-cockpit', label: 'Executive Cockpit', icon: '📊', content: executiveCockpit },
    { id: 'domain-1', label: 'Capacity Planning', icon: '📈', content: domainTab1 },
    { id: 'domain-2', label: 'Dispatch & Scheduling', icon: '⚡', content: domainTab2 },
    { id: 'ask-ai', label: 'Ask AI', icon: '🤖', content: askAiTab },
    { id: 'architecture', label: 'Architecture & Data', icon: '🏗️', content: architectureTab },
  ];

  return (
    <AppLayout
      title={title}
      tabs={tabs}
      narrative={narrative}
    />
  );
}
