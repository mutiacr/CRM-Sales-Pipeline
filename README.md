# 📊 Maven Sales Pipeline CRM Analysis

## 1. Background and Overview
This project focuses on a comprehensive analysis of a B2B sales pipeline for a hardware company. The goal is to transform raw CRM data into actionable intelligence by identifying high-performing products, regions, and sales agents. This analysis bridges the gap between technical data modeling and operational excellence to drive sustainable business growth.

## 2. Data Structure Overview
The analysis utilizes a relational dataset processed through **SQL** and visualized in **Power BI**.
*   **Data Cleaning & EDA**: Conducted in MySQL, [View SQL Script here](https://github.com/mutiacr/CRM-Sales-Pipeline/blob/main/2.%20Exploratory%20Data%20Analysis/CRM-EDA.sql).
*   **Visual Strategy**: A four-page interactive dashboard providing a holistic view of the sales cycle.
*   **Key Metrics tracked**: Revenue, Success Rate, Average Sales Cycle Days (Calculated for Weekdays Only), and Opportunity Volume.

## 3. Executive Summary
The business generated **$10.01M in revenue** with a strong **38.91% growth** quarter-over-quarter.

![Executive Summary](3.%20Dataviz/CRM%20Maven-ExecutiveSummary.PNG)

*   **Sales Volume**: Total opportunities increased significantly by **86.20%**.
*   **Operational Health**: The average sales cycle currently stands at **37.71 days**.
*   **Success Rate**: Despite revenue growth, the overall win rate decreased by **25.18%**, highlighting a shift in pipeline quality.

## 4. Insights Deep Dive

### Sales Team & Agent Performance
*   **Team Comparison**: Regional performance is led by the **West ($3.57M)** and **Central ($3.35M)** offices, while the **East** office trails at **30.89%**. Top-performing teams are led by **Melvin Marxen ($2.25M)** and **Rocco Neubert ($1.96M)**.
*   **Lagging Agents**: While **Darcel Schlecht** is the top contributor (11.53%), the analysis identified **Violet Mclelland** and **Wilburn Farren** as lagging agents, contributing only **~1.2%** to total revenue. Additionally, **5 sales agents** were found to have no historical sales data.
*   **Efficiency Benchmark**: The most efficient agents close deals in approximately **35 days** (weekdays only) with success rates above **50%**.

![Sales Performance](3.%20Dataviz/CRM%20Maven-Sales%20Performance.PNG)

### Quarterly Trends & Product Success
*   **QoQ Trends**: Total revenue grew significantly by **38.91%** ($10.01M). However, while **Total Opportunities** spiked by **86.20%**, the **Success Rate** dropped by **25.18%**, suggesting a decline in lead quality despite the volume increase.
*   **Product Win Rates**: The **GTX Plus Pro** is the most efficient product with the highest win rate of **49.48%**. Although **GTX Pro** has a slightly lower win rate, it remains the primary revenue anchor at **$3.51M**.

![Product Analytics](3.%20Dataviz/CRM%20Maven-Product%20Analytics.PNG)

### Market Analytics & Account Segmentation
*   **Enterprise Dominance**: Accounts are categorized into **Small** (≤50), **Medium** (≤250), and **Enterprise** (>250). Revenue is heavily driven by the **Enterprise** segment.
*   **Strategic Focus**: Given the B2B context, prospecting accounts with `<250 employees` shows a lower return on investment, suggesting a need for stricter lead qualification.

![Market Analytics](3.%20Dataviz/CRM%20Maven-Market%20Analytics.PNG)

## 5. Recommendations & Area of Improvement

### Business Recommendations
*   **Refine Lead Qualification**: Implement a strict qualification process where sales agents prioritize **Enterprise accounts (>250 employees)** to improve ROI.
*   **Improve Success Rate**: Addressing the **25% drop in win rates** by narrowing focus to high-quality leads rather than high-volume prospects.
*   **Scale Top Performers**: Use the processes of top agents (e.g., Darcel Schlecht) as a **benchmark** for internal coaching.

### Technical Area of Improvement & Findings
*   **Custom Cycle Calculation**: To ensure business relevance, `Average Sales Cycle Days` was calculated using **weekdays only**, reflecting actual B2B operational time.
*   **Data Granularity**: Recommended inclusion of `Created Date` and `Prospect Date` to measure efficiency across the entire funnel, as the current data only provides `Engage` and `Close` dates.
*   **Data Audit**: Identified **5 sales agents** with no historical sales data, suggesting a need for a data entry audit or onboarding review.

*Data Source: Maven Analytics Sales Pipeline Challenge.*
