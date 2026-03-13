SECTION 1: Basic Business Metrics (Foundation)

1. Total Overall Sales

SELECT SUM(Weekly_sales) AS total_revenue
FROM "walmart-sales-cleaned";

2. Average Weekly Sales

SELECT AVG(weekly_sales) AS avg_weekly_sales
FROM "walmart-sales-cleaned";

3. Total Number of Stores

SELECT COUNT(DISTINCT store) AS total_stores
FROM "walmart-sales-cleaned";


SECTION 2: Store Performance Analysis

4. Total Sales per Store

SELECT store,
       SUM(weekly_sales) AS total_sales
FROM "walmart-sales-cleaned"
GROUP BY store
ORDER BY total_sales DESC;


5. Top 5 Stores by Total Sales

SELECT store,
       SUM(weekly_sales) AS total_sales
FROM "walmart-sales-cleaned"
GROUP BY store
ORDER BY total_sales DESC
LIMIT 5;

6. Average Weekly Sales per Store

SELECT store,
       AVG(weekly_sales) AS avg_weekly_sales
FROM "walmart-sales-cleaned"
GROUP BY store
ORDER BY avg_weekly_sales DESC;


7. Worst 5 Performing Stores

SELECT store,
       SUM(weekly_sales) AS total_sales
FROM "walmart-sales-cleaned"
GROUP BY store
ORDER BY total_sales ASC
LIMIT 5;


8. Rank Stores by Revenue

SELECT store,
       SUM(weekly_sales) AS total_sales,
       RANK() OVER (ORDER BY SUM(weekly_sales) DESC) AS store_rank
FROM "walmart-sales-cleaned"
GROUP BY store;


SECTION 3: Time-Based Analysis
 
9. Monthly Sales Trend

SELECT 
    strftime('%Y-%m',formatted_date ) AS month,
    SUM(weekly_sales) AS total_sales
FROM "walmart-sales-cleaned"
GROUP BY month
ORDER BY month;


10. Yearly Sales Trend

SELECT strftime('%Y', formatted_date) AS year,
       SUM(weekly_sales) AS total_sales
FROM "walmart-sales-cleaned"
GROUP BY year
ORDER BY year;


11. Highest Sales Week

SELECT date,
       store,
       weekly_sales
FROM "walmart-sales-cleaned"
ORDER BY weekly_sales DESC
LIMIT 1;


12. Holiday vs Non-Holiday Sales

SELECT holiday_flag,
       AVG(weekly_sales) AS avg_sales,
       SUM(weekly_sales) AS total_sales
FROM "walmart-sales-cleaned"
GROUP BY holiday_flag;


13. Monthly Sales by Store

SELECT store,
       strftime('%Y-%m', formatted_date) AS month,
       SUM(weekly_sales) AS total_sales
FROM "walmart-sales-cleaned"
GROUP BY store, month
ORDER BY store, month;


SECTION 4: Economic & Holiday Impact Analysis

14. Holiday vs Non-Holiday Sales(Proper)

SELECT 
    holiday_flag,
    COUNT(*) AS total_weeks,
    AVG(weekly_sales) AS avg_sales,
    SUM(weekly_sales) AS total_sales
FROM "walmart-sales-cleaned"
GROUP BY holiday_flag;


15. Holiday Sales Percentage Impact

SELECT 
    holiday_flag,
    ROUND(
        (SUM(weekly_sales) * 100.0) / 
        (SELECT SUM(weekly_sales) FROM "walmart-sales-cleaned"),
    2) AS revenue_percentage
FROM "walmart-sales-cleaned"
GROUP BY holiday_flag;


16. Average Sales by Temperature Range

SELECT 
    CASE 
        WHEN temperature < 40 THEN 'Cold'
        WHEN temperature BETWEEN 40 AND 70 THEN 'Moderate'
        ELSE 'Hot'
    END AS temp_category,
    AVG(weekly_sales) AS avg_sales
FROM "walmart-sales-cleaned"
GROUP BY temp_category;


17. Sales by Fuel Price Range

SELECT 
    CASE 
        WHEN fuel_price < 3 THEN 'Low Fuel Price'
        WHEN fuel_price BETWEEN 3 AND 4 THEN 'Medium Fuel Price'
        ELSE 'High Fuel Price'
    END AS fuel_category,
    AVG(weekly_sales) AS avg_sales
FROM "walmart-sales-cleaned"
GROUP BY fuel_category;


18. Sales by Unemployment Range

SELECT 
    CASE 
        WHEN unemployment < 6 THEN 'Low Unemployment'
        WHEN unemployment BETWEEN 6 AND 8 THEN 'Moderate'
        ELSE 'High Unemployment'
    END AS unemployment_category,
    AVG(weekly_sales) AS avg_sales
FROM "walmart-sales-cleaned"
GROUP BY unemployment_category;


19. Running Total of Sales (Cumulative Revenue Over Time)

SELECT 
    formatted_date,
    SUM(weekly_sales) AS daily_sales,
    SUM(SUM(weekly_sales)) OVER (
        ORDER BY formatted_date
    ) AS running_total
FROM "walmart-sales-cleaned"
GROUP BY formatted_date
ORDER BY formatted_date;


20. 3-Week Moving Average

SELECT 
    formatted_date,
    SUM(weekly_sales) AS weekly_total,
    AVG(SUM(weekly_sales)) OVER (
        ORDER BY formatted_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_3weeks
FROM "walmart-sales-cleaned"
GROUP BY formatted_date
ORDER BY formatted_date;


21. Rank Stores by Total Sales

SELECT 
    store,
    SUM(weekly_sales) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(weekly_sales) DESC
    ) AS store_rank
FROM "walmart-sales-cleaned"
GROUP BY store;


22. Rank Stores Within Each Year

SELECT 
    strftime('%Y', formatted_date) AS year,
    store,
    SUM(weekly_sales) AS total_sales,
    RANK() OVER (
        PARTITION BY strftime('%Y', formatted_date)
        ORDER BY SUM(weekly_sales) DESC
    ) AS rank_in_year
FROM "walmart-sales-cleaned"
GROUP BY year, store;


23.Best Performing Store Each Year

SELECT *
FROM (
    SELECT 
        strftime('%Y', formatted_date) AS year,
        store,
        SUM(weekly_sales) AS total_sales,
        RANK() OVER (
            PARTITION BY strftime('%Y', formatted_date)
            ORDER BY SUM(weekly_sales) DESC
        ) AS rank_in_year
    FROM "walmart-sales-cleaned"
    GROUP BY year, store
)
WHERE rank_in_year = 1;


24. Store Performance Category (CASE Statement)

SELECT 
    store,
    SUM(weekly_sales) AS total_sales,
    CASE 
        WHEN SUM(weekly_sales) > 10000000 THEN 'High Performer'
        WHEN SUM(weekly_sales) BETWEEN 5000000 AND 10000000 THEN 'Medium Performer'
        ELSE 'Low Performer'
    END AS performance_category
FROM "walmart-sales-cleaned"
GROUP BY store;


25. Month-over-Month Sales Growth

SELECT 
    month,
    total_sales,
    total_sales - LAG(total_sales) OVER (ORDER BY month) AS sales_growth
FROM (
    SELECT 
        strftime('%Y-%m', formatted_date) AS month,
        SUM(weekly_sales) AS total_sales
    FROM "walmart-sales-cleaned"
    GROUP BY month
);
