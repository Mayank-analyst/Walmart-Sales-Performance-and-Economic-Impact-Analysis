# 📊 Walmart Sales Performance & Economic Impact Analysis

## 📌 Project Overview

This project analyzes Walmart store sales data (2010–2012) to uncover:

- Overall sales performance
- Store-level revenue trends
- Holiday vs Non-holiday sales impact
- Sales distribution across stores
- Economic drivers such as CPI, Fuel Price, and Temperature
- Correlation between sales and external economic factors

The objective is to simulate a real-world retail analytics case study using Excel, SQL, and Power BI.

---

## 🧠 Business Problem

Retail companies need to understand:

- Which stores generate the most revenue?
- How do holidays impact weekly sales?
- What external economic factors affect sales?
- Are fuel prices and inflation influencing performance?
- How do stores compare in terms of consistency and volatility?

This dashboard provides actionable insights for strategic decision-making.

---

## 🛠 Tools Used

### 1️⃣ Microsoft Excel – Data Cleaning & Preprocessing

Excel was used for:

- Removing duplicates  
- Handling missing values  
- Formatting date columns  
- Creating Month and Year columns  
- Data validation and consistency checks  

Key Transformations:
- Converted Date column to proper format  
- Created Month column for trend analysis  
- Verified Holiday_Flag consistency  
- Ensured numeric formatting for CPI, Fuel_Price, Temperature  

---

### 2️⃣ SQL – Data Analysis & Business Queries

SQL was used to perform analytical queries before visualization.

#### Key Queries Performed:

- Total sales by store  
- Average weekly sales  
- Maximum and minimum weekly sales  
- Holiday vs Non-holiday sales comparison  
- Top 10 stores by revenue  
- Monthly sales trend  
- Store-wise sales ranking  

Business Questions Solved:

- Which store generated the highest total revenue?
- What is the average weekly sales per store?
- How much do holidays increase sales?
- Which month records peak performance?

---

### 3️⃣ Power BI – Data Modeling & Dashboard Development

Power BI was used for:

#### 🔹 Data Modeling
- Built relationships between tables
- Created calculated columns (Month, Year)
- Designed star-schema friendly structure

#### 🔹 DAX Measures Created

- Total Sales  
- Average Weekly Sales  
- Max Weekly Sales  
- Min Weekly Sales  
- Total Stores  
- Holiday Sales  
- Non-Holiday Sales  
- Correlation Measure (Sales vs CPI)

---

## 📊 Dashboard Structure

---

### 🟦 Page 1: Sales Performance Overview

**KPIs:**
- Total Sales: $6.74bn
- Average Weekly Sales: $1.05M
- Total Stores: 45
- Max Weekly Sales: $3.82M

**Visuals:**
- Holiday vs Non-Holiday Sales (Pie Chart)
- Weekly Sales Trend Over Months (Line Chart)
- Top 10 Stores by Revenue (Bar Chart)

---

### 🟦 Page 2: Store Performance Analysis

**KPIs:**
- Total Sales
- Average Weekly Sales
- Min Weekly Sales
- Max Weekly Sales

**Visuals:**
- Weekly Sales Distribution by Store
- Holiday vs Non-Holiday Sales by Stores
- Store Revenue Ranking

---

### 🟦 Page 3: Sales Drivers & Economic Impact Analysis

**Focus:** Understanding external factors affecting sales.

**Visuals:**
- Sales vs CPI Trend (Dual Axis Line Chart)
- Fuel Price Impact (Binned Analysis)
- Temperature Impact Analysis
- Waterfall Chart (Sales Contribution Breakdown)
- Correlation KPI

---

## 📈 Key Business Insights

1. A small group of stores drives a large portion of total revenue.
2. Holiday impact is positive but contributes a smaller share overall.
3. Mid-year months show stronger sales trends.
4. Economic indicators like CPI and fuel price influence performance.
5. Sales volatility differs across stores.

---

## 🎯 Business Recommendations

- Focus marketing efforts on high-performing stores.
- Investigate underperforming stores for inefficiencies.
- Prepare inventory strategically around seasonal peaks.
- Monitor economic indicators for predictive sales planning.
- Develop region-specific strategies based on temperature impact.

---

## 🚀 Skills Demonstrated

- Data Cleaning & Transformation
- SQL Analytical Query Writing
- Data Modeling in Power BI
- DAX Measure Creation
- Interactive Dashboard Design
- Business Insight Interpretation

---

## 📁 Project Workflow

1. Data Cleaning (Excel)
2. Data Analysis (SQL)
3. Data Modeling & Visualization (Power BI)
4. Insight Extraction & Reporting
