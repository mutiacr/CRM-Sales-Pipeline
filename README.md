# 📊 Maven Sales Pipeline CRM Analysis

## 1. Background and Overview
This project focuses on a comprehensive analysis of a **B2B sales pipeline for a hardware company**. The goal is to transform raw CRM data into actionable insights by identifying high-performing products, regions, and sales agents. The analysis is built upon a **rigorous Exploratory Data Analysis (EDA)** using SQL to ensure data integrity and uncover early trends. This project transforms raw CRM data into strategic insights by focusing on three analytical pillars to bridge the gap between data modeling and operational growth:

  #### **1. Performance Monitoring**
  *Designed to track the pulse of the business and ensure targets are met:*
  * **How healthy is our sales growth?** Monitors overall pipeline health and **Quarter-over-Quarter (QoQ)** dynamics to detect seasonal trends and growth momentum.
  * **How is each sales team performing?** Benchmarks regional performance to ensure consistent strategy execution across all territories.

  #### **2. Diagnostic Analysis**
  *Focused on deep-diving into specific performance drivers:*
  * **Which products drive our competitive advantage?** Evaluates product-specific **win rates and sales cycles** to identify top revenue drivers and optimize the portfolio.
  * **Where are the performance gaps?** Compares individual sales agents to pinpoint those lagging behind and identify specific **productivity gaps** for targeted training.

  #### **3. Exploratory Deep-Dive**
  *Beyond answering core questions, this project proactively uncovers hidden risks and expansion opportunities:*
  * **Pipeline Bottleneck Identification:** Investigates stage velocity to identify where potential revenue is getting stuck.
  * **Market Potential Analysis:** Segments industry sectors to identify high-opportunity markets for the next strategic expansion.


## 2. Data Structure Overview
The analysis utilizes a relational dataset processed through **SQL**, **PowerQuery** and visualized in **Power BI**. In this project, I implemented a hybrid data transformation strategy to ensure both depth of analysis and dashboard performance

*   **Data Architecture**: The analysis is powered by four relational tables, structured as shown in the **Entity Relationship Diagram (ERD)** representing the connections between the datasets
  ![Entity Relationship Diagram](https://raw.githubusercontent.com/mutiacr/CRM-Sales-Pipeline/main/CRM%20Project%20Sales%20Pipeline%20ERD.png)
*   **Exploratory Data Analysis (EDA)**:I leveraged **PostgreSQL** to conduct the initial EDA.This allowed me to perform deep-dive queries, validate early sales trends, and conduct rigorous data integrity checks to ensure the CRM data was accurate before visualization, View SQL Script [here](https://github.com/mutiacr/CRM-Sales-Pipeline/blob/main/2.%20Exploratory%20Data%20Analysis/CRM-EDA.sql).
*   **Data Cleansing & Transformation**: For the final reporting layer, I utilized **Power Query** to refine and restructure the dataset. This included advanced data cleansing such as handling missing values and optimizing the data schema to create a lightweight, high-performance data model specifically designed for a seamless **Power BI** experience
*   **Visual Strategy**: A four-page interactive dashboard providing a holistic view of the sales cycle. Dashboard can be downloaded [here](https://github.com/mutiacr/CRM-Sales-Pipeline/blob/7cf96b14d9e886b341cedba1ec35c461cc491f3a/CRM%20Maven%20Sales%20Pipeline%20Dashboard.pbix)


## 3. Executive Summary
![Executive Summary](3.%20Dataviz/CRM%20Maven-ExecutiveSummaryv2.PNG)

* **Pipeline & Growth:** Delivered a solid **$10.01M revenue** with a **48.16% success rate** and a consistent average deal size of **$2.4K**. However, the Ribbon Chart reveals a significant **bottleneck in the "Engage" stage** during Q2 and Q3. While market interest is high, this accumulation indicates a need for strategic intervention to accelerate conversion velocity and prevent the momentum loss observed in the year-end success rate.
* **Sales Performance:** The **37.7-day sales cycle** reflects high team efficiency. However, the **-25% QoQ success rate decline** at year-end identifies a productivity gap that requires targeted training to replicate early-year closing tactics.
* **Product Success:** **GTX Pro** is the core competitive advantage, driving **35% of total revenue**. This highlights its position as the primary growth engine and the benchmark for success across other product lines.
* **Market Potential:** Strategic expansion is highly viable due to an exceptionally **balanced regional distribution** (West 35.7%, Central 33.4%, East 30.9%). Future growth should prioritize the high-performing **Retail and Technology** sectors.
* **Conversion Strategy:** The Ribbon Chart highlights a significant volume of deals sitting in the **"Engage" stage**.
  
## 4. Insights Deep-Dive

### Sales Team & Agent Performance
* **Regional & Leadership Disparity:** Revenue leadership is heavily concentrated in the **West ($3.57M)** and **Central ($3.35M)** offices, while the **East** trails significantly at **30.89%** contribution. Success is tied to specific leadership: **Melvin Marxen ($2.25M)** and **Rocco Neubert ($1.96M)** drive the bulk of results, highlighting a high dependency on top-tier managers.
* **Sales Agents Performance**: While **Darcel Schlecht** is the top contributor (11.53%), the analysis identified **Violet Mclelland** and **Wilburn Farren** as lagging agents, contributing only **~1.2%** to total revenue. Additionally, **5 sales agents** were found to have no historical sales data.
* **Value-Volume Divergence:** There is a clear strategic gap between regions. The **West** region dominates in total revenue (*high-ticket focus*), yet trails **Central** in total deal quantity (*volume*). This high-stakes profile makes the West more susceptible to **Conversion Leakage**, evidenced by their high **Lost volume (459 deals)**.
* **The 42-Day "Dead Zone":** Data establishes an **Efficiency Benchmark** of **~35 weekdays** to maintain a win rate above 50%. Once the sales cycle exceeds the **42-day "Dead Zone"**, win probability collapses below 45% regardless of deal size. This momentum decay is most visible in lagging agents contributing only ~1.2%, contrasted against top performers like **Darcel Schlecht (11.53%)**.
* **Resource Prioritization Gap:** Small-revenue deals currently consume the same 35-40 day cycle as high-value accounts. This lack of effort differentiation, alongside an apparent imbalance in lead distribution across the team, dilutes bandwidth and contributes to the 25% overall win-rate decline


![Sales Performance](3.%20Dataviz/CRM%20Maven-Sales%20Performance.PNG)

### Product Success
*   **Product Win Rates**: The **GTX Plus Pro** is the most efficient product with the highest win rate of **49.48%**. Although **GTX Pro** has a slightly lower win rate, it remains the primary revenue anchor at **$3.51M**.
*   **Product Evaluation:** There is a significant disconnect between deal volume and revenue impact. **GTX Basic** and **MG Special** achieved the highest number of units won (over 1,700 deals combined), yet they contributed the least to the total revenue. Notably, MG Special maintained positive profitability (+0.35%) without heavy discounting, indicating strong organic demand.

![Product Analytics](3.%20Dataviz/CRM%20Maven-Product%20Analytics.PNG)

### Market Analytics & Account Segmentation
*   **Enterprise Dominance**: Accounts are categorized into **Small** (≤50), **Medium** (≤250), and **Enterprise** (>250). Revenue is heavily driven by the **Enterprise** segment.
*   **Strategic Focus**: Given the B2B context, prospecting accounts with `<250 employees` shows a lower return on investment, suggesting a need for stricter lead qualification.
*   **Market Potential Analysis:** While **Retail and Technology** are the primary revenue drivers, **Marketing and Software** emerge as the most efficient sectors with peak win rates (~60%), representing a high-ROI opportunity for strategic scaling and resource reallocation.

![Market Analytics](3.%20Dataviz/CRM%20Maven-Market%20Analytics.PNG)

## 5. Recommendations & Area of Improvement

### Business Recommendations
*   **Strategic Lead Qualification and Optimization**: Addressing the **25% drop in win rates**, it is recommended to establish a strategic framework that prioritizes leads based on **High-Value** and **High-Conversion** potential. This approach suggests focusing resources on strategic prioritization of **Enterprise accounts** (especially in the **West Region**) to secure high-ticket B2B contracts and accelerating engagement with **Software & Marketing** sectors to capitalize on their proven high win rates and faster sales cycles. Implementing these priorities aims to ensure that sales efforts are concentrated where they can generate the highest ROI, preventing resource dilution on low-impact leads
*   **Lead Conversion Strategy**: To mitigate conversion drops, it is highly recommended to implement targeted nurturing and sales automation specifically designed to shorten the lead-to-close velocity. This strategy should focus on resolving the identified bottlenecks from Q2 and Q3, ensuring a more fluid transition through the sales pipeline
*   **Pipeline Audit:** Conduct a rigorous review of lagging agents and inactive profiles. Reassign dormant leads to "Star" performers to maximize human capital ROI and aggressively close the **East region's** 30.89% revenue gap.
*   **Strategic Re-pricing or Scaling**: Management should re-evaluate the go-to-market strategy for these high-demand items. Recommendations include implementing a strategic price increase for MG Special to capitalize on its high win rate and brand strength, or pivoting toward an aggressive high-volume strategy for GTX Basic to improve economies of scale and total revenue contribution.
*  **Regional Growth Strategy**: Maximize revenue by aligning tactics with regional strengths: Increase **Average Deal Value** in the **Central** region through upselling to leverage their high closing efficiency, scale **Lead Generation** in the **West** to capitalize on their high-ticket profile and execute aggressive **Market Penetration** in the **East** to expand their currently under-penetrated pipeline volume.

### Technical Area of Improvement & Findings
*   **Custom Cycle Calculation**: To ensure business relevance, `Average Sales Cycle Days` was calculated using **weekdays only**, reflecting actual B2B operational time.
*   **Data Granularity**: Recommended inclusion of `Created Date` and `Prospect Date` to measure efficiency across the entire funnel, as the current data only provides `Engage` and `Close` dates.
*   **Root Cause Analysis (Lost Reason):** Implementation of a mandatory **"Lost Reason"** field is essential. Capturing qualitative data (Price, Competitor, Product Fit) will identify patterns behind the West region's leakage and refine product-market fit.
* **Data Integrity Audit:** A status audit is required for agents with zero historical records to clarify if the gap is due to **onboarding**, **technical CRM logging errors**, or **performance issues**, ensuring a reliable "Single Source of Truth."

  
*Data Source: Maven Analytics Sales Pipeline Challenge.*
