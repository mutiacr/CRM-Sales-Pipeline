/* ===============================================================================
PROJECT: CRM Sales Pipeline - End-to-End Data Preparation & Audit
DATABASE: PostgreSQL
===============================================================================
*/

-------------------------------------------------------------------------------
-- PART 1: DATA RECONCILIATION & CARDINALITY (Counting & Discrepancies)
-------------------------------------------------------------------------------

-- 1.1 Overall Column Count Validation
-- Result: 8,800 opportunities confirmed. Ensuring no data loss during ingestion.
SELECT 
    (SELECT COUNT(DISTINCT opportunity_id) FROM sales_pipeline) AS total_opportunities,
    (SELECT COUNT(DISTINCT sales_agent) FROM sales_pipeline) AS active_agents,
    (SELECT COUNT(DISTINCT account) FROM accounts) AS total_registered_accounts,
    (SELECT COUNT(DISTINCT product) FROM products) AS total_products_offered;

-- 1.2 Sales Agent Data Integrity 
-- Cross-referencing 'sales_teams' and 'sales_pipeline' tables to identify agent participation and data alignment
-- Finding: Identifying the 5 agents who exist in 'sales_teams' but have 0 activity.
SELECT 
    st.sales_agent, 
    st.manager, 
    st.regional_office
FROM sales_teams AS st
LEFT JOIN (SELECT DISTINCT sales_agent FROM sales_pipeline) AS sp 
    ON st.sales_agent = sp.sales_agent
WHERE sp.sales_agent IS NULL;
-- Insight: These 5 agents are likely new hires or personnel still in onboarding.

-------------------------------------------------------------------------------
-- PART 2: ANOMALY DETECTION & BUSINESS INSIGHTS
-------------------------------------------------------------------------------

-- 2.1 Deep Dive: Missing Account Values (The 1,425 Blank Records)
-- Finding: Significant amount of NULL values in the 'account' column.
SELECT 
    deal_stage, 
    COUNT(opportunity_id) as count_data
FROM sales_pipeline
WHERE account IS NULL OR account = ''
GROUP BY deal_stage;

/* 💡 BUSINESS INSIGHT:
   1,425 blank accounts are exclusively found in 'Engaging' and 'Prospecting' stages.
   Since there is no 'Created Date' in this dataset, 'Engage Date' serves as the 
   first point of contact. At this early stage, leads haven't been converted 
   into official Accounts in the master database.
*/

-- 2.2 Duplication Audit
SELECT opportunity_id, COUNT(*) as count_opp 
FROM sales_pipeline
GROUP BY opportunity_id
HAVING COUNT(*) > 1;

-- 2.3 Timeline & Value Paradox
-- Logic Check: Closing date cannot be earlier than Engage Date (First Contact).
SELECT * FROM sales_pipeline WHERE close_date < engage_date;

-- Logic Check: 'Won' deals must not have negative revenue.
SELECT * FROM sales_pipeline WHERE close_value < 0 AND deal_stage = 'Won';

-- 2.4 Historical Integrity (Transaction Year vs. Company Foundation Year)
SELECT 
    p.opportunity_id, p.account, a.year_established, p.close_date,
    EXTRACT(YEAR FROM p.close_date) as year_of_closing
FROM sales_pipeline p
JOIN accounts a ON p.account = a.account
WHERE EXTRACT(YEAR FROM p.close_date) < a.year_established;

-------------------------------------------------------------------------------
-- PART 3: DYNAMIC DATA CLEANSING (Non-Destructive Solution)
-------------------------------------------------------------------------------

CREATE OR REPLACE VIEW v_sales_pipeline_clean AS
SELECT 
    opportunity_id,
    sales_agent,
    -- Standardization: Fixing Product Typos ('GTXPro' -> 'GTX Pro')
    CASE 
        WHEN product = 'GTXPro' THEN 'GTX Pro' 
        ELSE product 
    END AS product_name,
    -- Mapping blanks as 'Unregistered Lead' to maintain funnel visibility
    COALESCE(account, 'Unregistered Lead') AS account_display,
    deal_stage,
    engage_date,
    close_date,
    close_value
FROM sales_pipeline;

-- Standardizing Master Data (Accounts Table)
CREATE OR REPLACE VIEW v_accounts_clean AS
SELECT 
    account,
    CASE 
        WHEN sector = 'technolgy' THEN 'Technology' 
        ELSE sector 
    END AS sector_clean,
    year_established,
    revenue,
    employees
FROM accounts;

-------------------------------------------------------------------------------
-- FINAL AUDIT CONCLUSION
-- 1. Data Integrity: 100% verified (8,800 records).
-- 2. Sales Capacity: 5 inactive agents flagged (35 total agents vs 30 active).
-- 3. Funnel Analysis: 1,425 blank accounts confirmed as valid early-stage prospects 
--    (Prospecting & Engaging) using Engage Date as initial lead point.
-- 4. Cleansing: Typos resolved via Dynamic Views to preserve raw data lineage.
-------------------------------------------------------------------------------
