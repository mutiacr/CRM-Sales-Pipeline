# 📊 Maven Sales Pipeline CRM Analysis

## Project Overview
This project provides an end-to-end Business Intelligence solution analyzing a B2B sales pipeline for a hardware company. By combining **SQL** for deep-dive exploratory data analysis and **Power BI** for interactive visualization, this project transforms raw CRM data into strategic insights regarding sales efficiency, product performance, and revenue growth.

## 🛠️ Tech Stack
*   **Data Exploration:** SQL (MySQL) - [View SQL Script here](https://github.com/mutiacr/CRM-Sales-Pipeline/blob/main/2.%20Exploratory%20Data%20Analysis/CRM-EDA.sql).
*   **Data Visualization:** Power BI.
*   **Key Skills:** DAX, Data Modeling, ETL (Power Query), Sales Operations Analytics.

---

## 🎯 Business Questions
To drive data-driven decision-making, this analysis addresses the following key business questions:
1. How is each sales team performing compared to the rest?
2. Are any sales agents lagging behind in their performance?
3. What are the significant quarter-over-quarter (QoQ) trends in the pipeline?
4. Which products demonstrate the best win rates within the portfolio?

---

## 💡 Key Insights

### 1. Team & Regional Performance
*   **Top Leadership:** Sales teams managed by **Melvin Marxen ($2.25M)** and **Rocco Neubert ($1.96M)** are the primary revenue drivers.
*   **Regional Distribution:** The **West ($3.57M)** and **Central ($3.35M)** offices contribute the highest revenue shares, while the **East** office follows at **$3.09M (30.89%)**.

### 2. Sales Agent Analysis
*   **Individual Excellence:** Agent **Darcel Schlecht** leads the company with **$1.15M** in revenue and an **11.53%** contribution rate.
*   **Lagging Indicators:** Bottom-tier contributors such as **Violet Mclelland** and **Wilburn Farren** contribute only **~1.2%** of total revenue, highlighting areas for coaching.
*   **Cycle Efficiency:** Analysis of **Avg Cycle Days vs. Win Rate** identifies internal benchmarks for team closing efficiency.

### 3. Quarter-over-Quarter (QoQ) Trends
*   **Revenue Growth:** Total revenue experienced a strong increase of **38.91%** QoQ, reaching **$10.01M**.
*   **Pipeline Dynamics:** While **Total Opportunities** spiked by **86.20%**, the **Success Rate** declined by **25.18%**, suggesting a need for lead quality optimization.

### 4. Product Portfolio Efficiency
*   **Highest Success Rate:** The **GTX Plus Pro** is the most efficient product with a win rate of **49.48%**.
*   **Revenue Anchor:** **GTX Pro** remains the top revenue contributor at **$3.51M**, balancing high volume and healthy win rates.

---

## 🔍 Technical Highlights
*   **Advanced EDA:** Performed extensive data cleaning and analysis using SQL, including `percentile_disc` for accurate median calculations.
*   **Dynamic Dashboarding:** Developed specialized views: **Executive Summary**, **Product Analytics**, **Sales Performance**, and **Market Analytics**.

---


*Data Source: Maven Analytics Sales Pipeline Challenge.*
