
# 📂 Data Preparation & Audit Stage

## 📌 Project Overview

This stage focuses on ensuring the **integrity** and **reliability** of the Maven CRM dataset. Using **PostgreSQL**, I performed a multi-stage audit to resolve naming inconsistencies, handle logical gaps, and rectify structural anomalies within the CRM infrastructure.

## 🛠️ Objectives

  * **Data Reconciliation:** Synchronizing Master Data with Transaction Data.
  * **Anomaly Detection:** Identifying chronological paradoxes and naming inconsistencies.
  * **Non-Destructive Cleansing:** Implementing a transformation layer using **SQL Views** to preserve raw data lineage.

-----

## 🔍 Key Findings & Insights

### 1️⃣ Sales Personnel Reconciliation

> **Status:** ⚠️ 5 Inactive Agents Identified

  * **Master List:** 35 Registered Agents.
  * **Active Pipeline:** 30 Active Agents.
  * **Business Insight:** The 5 agents with zero transactions are flagged as potential new hires or personnel in the onboarding phase. This is critical for accurate **Sales Capacity Planning**.

### 2️⃣ Funnel Logic & Blank Accounts

> **Status:** ✅ Logically Verified

  * **Observation:** 1,425 records have blank `account` names.
  * **Analysis:** These are exclusively concentrated in **'Prospecting'** and **'Engaging'** stages.
  * **Business Insight:** Since there is no `created_date`, the `engage_date` serves as the initial lead point. These blanks represent "Unregistered Leads" that haven't been converted into official Accounts yet.

### 3️⃣ Data Quality & Integrity

  * **Product Naming:** Standardized `GTXPro` to `GTX Pro`.
  * **Sector Master Data:** Rectified typo in accounts table (`technolgy` → `Technology`).
  * **Timeline Check:** Verified 0 cases of deals closing before the engagement date.

-----

## 📊 Data Dictionary

Table 1: Sales Pipeline (Transactions)

| Field | Description |
| :--- | :--- |
| `opportunity_id` | Unique identifier for each sales deal. |
| `sales_agent` | The agent responsible for the deal. |
| `product` | The specific product being pitched. |
| `account` | Company name (Blank if still in early stages). |
| `deal_stage` | Sales pipeline stage (**Prospecting \> Engaging \> Won / Lost**). |
| `engage_date` | Date in which the "Engaging" stage was initiated (First Contact). |
| `close_date` | Date in which the deal was officially "Won" or "Lost". |
| `close_value` | Revenue generated from the deal. |




Table 2: Accounts (Master Data)

| Field | Description |
| :--- | :--- |
| `account` | Unique company name (Primary Key). |
| `sector` | Industry category. |
| `year_established` | The year the company was founded. |
| `revenue` | Annual revenue (in millions of USD). |
| `employees` | Total headcount of the company. |
| `office_location` | Headquarters location. |
| `subsidiary_of` | Parent company (if applicable). |



-----

## 🏗️ Technical Implementation: The "Clean View" Approach

Instead of executing permanent `UPDATE` commands, I developed dynamic **SQL Views** to act as a standardized "Clean Layer":

```sql
-- Example: Standardizing Product Names & Handling NULLs
CREATE OR REPLACE VIEW v_sales_pipeline_clean AS
SELECT 
    opportunity_id,
    CASE WHEN product = 'GTXPro' THEN 'GTX Pro' ELSE product END AS product_name,
    COALESCE(account, 'Unregistered Lead') AS account_display,
    deal_stage,
    engage_date
FROM sales_pipeline;
```



