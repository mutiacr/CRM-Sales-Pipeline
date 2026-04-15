
--1. Team Performance Comparison
SELECT 
    st.manager,
    st.regional_office,
    COUNT(sp.opportunity_id) AS total_opportunities,
    SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END) AS won_deals,
    ROUND(AVG(CASE WHEN sp.deal_stage = 'Won' THEN 1.0 ELSE 0.0 END) * 100, 2) AS win_rate_pct,
    SUM(sp.close_value) AS total_revenue,
    RANK() OVER (ORDER BY SUM(sp.close_value) DESC) AS revenue_rank
FROM public.sales_pipeline sp
JOIN public.sales_teams st ON sp.sales_agent = st.sales_agent
GROUP BY st.manager, st.regional_office
ORDER BY revenue_rank;

--2.Deep Dive Lagging Agents
WITH AgentWonStats AS (
   --Step 1: Calculate Won Deals and Revenue statistics per agent
    SELECT 
        sp.sales_agent,
        st.manager,
        COUNT(CASE WHEN sp.deal_stage = 'Won' THEN 1 END) AS total_won_deals,
        SUM(CASE WHEN sp.deal_stage = 'Won' THEN sp.close_value ELSE 0 END) AS total_revenue
    FROM public.sales_pipeline sp
    JOIN public.sales_teams st ON sp.sales_agent = st.sales_agent
    GROUP BY sp.sales_agent, st.manager
),
GlobalBenchmarks AS (
    --Step 2: Calculate the overall average benchmark
    SELECT 
        AVG(total_won_deals) AS avg_won_deals_global,
        AVG(total_revenue) AS avg_revenue_global
    FROM AgentWonStats
)
SELECT 
    a.sales_agent,
    a.manager,
    a.total_won_deals,
    a.total_revenue,
    -- Identify performance using labels
    CASE 
        WHEN a.total_won_deals < b.avg_won_deals_global 
          OR a.total_revenue < b.avg_revenue_global THEN 'Lagging'
        ELSE 'Top Performer'
    END AS performance_status,
    -- Add gap information for analytical context
    ROUND(a.total_revenue - b.avg_revenue_global, 2) AS revenue_gap
FROM AgentWonStats a, GlobalBenchmarks b
ORDER BY performance_status DESC, a.total_revenue ASC;

--3. QoQ Trend
WITH QuarterlySales AS (
    SELECT 
        DATE_TRUNC('quarter', close_date) AS quarter,
        SUM(close_value) AS revenue
    FROM public.sales_pipeline
    WHERE deal_stage = 'Won'
    GROUP BY 1
),
CalculatedGrowth AS (
    SELECT 
        quarter,
        revenue,
        LAG(revenue) OVER (ORDER BY quarter) AS prev_revenue
    FROM QuarterlySales
)
SELECT 
    quarter,
    revenue AS current_revenue,
    -- Logika: (Baru - Lama) / Lama. Jika Baru < Lama, hasilnya otomatis negatif.
    ROUND(
        ((revenue - prev_revenue) * 100.0 / NULLIF(prev_revenue, 0)), 
        2
    ) AS growth_pct
FROM CalculatedGrowth
ORDER BY quarter;

--4. Product Win Rates
SELECT 
    p.product_name,
    p.series,
    p.sales_price,
    COUNT(sp.opportunity_id) AS total_opportunities,
	SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END) AS total_won,
    ROUND(AVG(CASE WHEN sp.deal_stage = 'Won' THEN 1.0 ELSE 0.0 END) * 100, 2) AS win_rate_pct,
    SUM(sp.close_value) AS total_actual_revenue
FROM sales_pipeline sp
JOIN products p ON sp.product = p.product_name
GROUP BY p.product_name, p.series, p.sales_price
ORDER BY win_rate_pct DESC;

-- Market Penetration: New vs. Existing Accounts
SELECT 
    CASE 
        WHEN a.year_established = 2017 THEN 'New Account'
        ELSE 'Existing Account'
    END AS account_type,
    COUNT(sp.opportunity_id) AS total_deals,
    SUM(sp.close_value) AS total_revenue
FROM sales_pipeline sp
JOIN accounts a ON sp.account = a.account
WHERE sp.deal_stage = 'Won'
GROUP BY 1;

---Lost Deals Analysis
SELECT 
    p.product_name,
    COUNT(CASE WHEN sp.deal_stage = 'Lost' THEN 1 END) AS total_lost,
    -- Menghitung rata-rata umur deal yang kalah
    ROUND(AVG(CASE WHEN sp.deal_stage = 'Lost' THEN (sp.close_date - sp.engage_date) END), 0) AS avg_days_to_fail
FROM public.sales_pipeline sp
JOIN public.products p ON sp.product = p.product_name
GROUP BY 1
ORDER BY total_lost DESC;

--TOP 5 Account
SELECT 
    p.account,
    -- Fixing typo 'Technolgy' to 'Technology'
    CASE 
        WHEN a.sector = 'technolgy' THEN 'technology'
        ELSE a.sector 
    END AS sector_cleaned,
    SUM(p.close_value) AS total_revenue,
    COUNT(p.opportunity_id) AS total_deals,
    ROUND(AVG(p.close_value), 2) AS avg_deal_size
FROM sales_pipeline AS p
LEFT JOIN accounts AS a ON p.account = a.account
WHERE p.deal_stage = 'Won'
GROUP BY p.account, sector_cleaned
ORDER BY total_revenue DESC
LIMIT 5;
