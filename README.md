# 📊 Maven Sales Pipeline CRM Analysis

## 1. Background and Overview
This project focuses on a comprehensive analysis of a B2B sales pipeline for a hardware company. The goal is to transform raw CRM data into actionable intelligence by identifying high-performing products, regions, and sales agents. This analysis bridges the gap between technical data modeling and operational excellence to drive sustainable business growth.

## 2. Data Structure Overview
The analysis utilizes a relational dataset processed through **SQL** and visualized in **Power BI**.
*   **Data Cleaning & EDA**: Conducted in MySQL, featuring advanced techniques like `percentile_disc` for accurate median distribution.
*   **Visual Strategy**: A four-page interactive dashboard providing a holistic view of the sales cycle.
*   **Key Metrics tracked**: Revenue, Success Rate, Average Sales Cycle Days, and Opportunity Volume.

## 3. Executive Summary
The business generated **$10.01M in revenue** with a strong **38.91% growth** quarter-over-quarter.

![Executive Summary](3.%20Dataviz/CRM%20Maven-ExecutiveSummary.PNG)

*   **Sales Volume**: Total opportunities increased significantly by **86.20%**.
*   **Operational Health**: The average sales cycle currently stands at **37.71 days**.
*   **Success Rate**: Despite revenue growth, the overall win rate decreased by **25.18%**, highlighting a shift in pipeline kualitas.

## 4. Insights Deep Dive

### Sales Performance
![Sales Performance](3.%20Dataviz/CRM%20Maven-Sales%20Performance.PNG)

*   **Top Leadership**: Teams led by **Melvin Marxen ($2.25M)** and **Rocco Neubert ($1.96M)** are the primary revenue drivers.
*   **High-Impact Agents**: **Darcel Schlecht** leads the organization with **$1.15M** in revenue, contributing **11.53%** of total company earnings.
*   **Speed vs. Success**: Analysis identifies that the most efficient agents close deals in approximately **35 days** with success rates above **50%**.

### Product Analytics
![Product Analytics](3.%20Dataviz/CRM%20Maven-Product%20Analytics.PNG)

*   **Most Efficient Product**: **GTX Plus Pro** boasts the highest success rate at **49.48%**.
*   **Revenue Anchor**: **GTX Pro** is the top-selling product, contributing **$3.51M**.

### Market Analytics
![Market Analytics](3.%20Dataviz/CRM%20Maven-Market%20Analytics.PNG)

*   **Top Sectors**: The **Retail** and **Technology** sectors are the highest contributors to total revenue.
*   **Regional Dominance**: The **West** and **Central** regional offices currently lead in overall market share.

## 5. Recommendations & Area of Improvement

### Business Recommendations
*   **Improve Lead Quality**: Address the **25% drop in success rates** by implementing stricter lead qualification criteria.
*   **Scale Top Performers**: Use the processes of top agents (e.g., Darcel Schlecht) as a **benchmark** for internal coaching programs.
*   **Regional Scaling**: Focus on improving the **East office** performance to match the high-revenue benchmarks set by other regions.

### Technical Area of Improvement
*   **Data Granularity**: Currently, the dataset only provides `Engage Date` and `Close Date`. To accurately measure sales efficiency across the entire pipeline, it is highly recommended to include timestamps for `Created Date` and `Prospect Date`. This would allow for a more granular analysis of bottlenecks in the early stages of the sales funnel.
*   **Data Integrity**: The analysis identified **5 sales agents** with no historical sales data. A data audit is recommended to determine if these are new hires or if there are gaps in the data entry process.

*Data Source: Maven Analytics Sales Pipeline Challenge.*
