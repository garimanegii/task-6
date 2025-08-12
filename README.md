# 📊 Task 6 – Sales Trend Analysis (Data Analyst Internship)

## 📌 Objective
Analyze **monthly revenue** and **order volume** from the Kaggle *Sample Sales Data* dataset using SQL aggregation functions in PostgreSQL.

---

## 🛠 Tools Used
- PostgreSQL (pgAdmin 4)
- CSV dataset from Kaggle – *Sample Sales Data*
- SQL aggregation functions

---

## 📂 Dataset
The original dataset (`sales_data_sample.csv`) contains:
- **ORDERNUMBER** – Unique order ID
- **SALES** – Total sales amount for the order
- **YEAR_ID** – Order year
- **MONTH_ID** – Order month (1–12)
- Additional columns: product details, customer info, address, contact, etc.

For this analysis, we focused on:
- `ORDERNUMBER`
- `SALES`
- `YEAR_ID`
- `MONTH_ID`

---

## 📊 Steps Performed
1. Created a new database in PostgreSQL and a table `sales_task6` with the required structure:
```sql
CREATE TABLE sales_task6 (
    ORDERNUMBER INT,
    SALES DECIMAL(12,2),
    YEAR_ID INT,
    MONTH_ID INT
);

2. Monthly Revenue & Order Volume
SELECT
    YEAR_ID AS year,
    MONTH_ID AS month,
    SUM(SALES) AS monthly_revenue,
    COUNT(DISTINCT ORDERNUMBER) AS monthly_orders
FROM
    sales_task6
GROUP BY
    YEAR_ID, MONTH_ID
ORDER BY
    year, month;

3. Top 3 Months by Revenue
SELECT
    YEAR_ID AS year,
    MONTH_ID AS month,
    SUM(SALES) AS monthly_revenue
FROM
    sales_task6
GROUP BY
    YEAR_ID, MONTH_ID
ORDER BY
    monthly_revenue DESC
LIMIT 3;

4. Count vs Count(DISTINCT)
-- Count all rows
SELECT COUNT(*) AS total_rows FROM sales_task6;

-- Count unique orders
SELECT COUNT(DISTINCT ORDERNUMBER) AS unique_orders FROM sales_task6;


5. Handling NULL Values
SELECT
    YEAR_ID AS year,
    MONTH_ID AS month,
    SUM(COALESCE(SALES, 0)) AS monthly_revenue
FROM
    sales_task6
GROUP BY
    YEAR_ID, MONTH_ID
ORDER BY
    year, month;

6. Average Order Value per Month
SELECT
    YEAR_ID AS year,
    MONTH_ID AS month,
    ROUND(SUM(SALES) / COUNT(DISTINCT ORDERNUMBER), 2) AS avg_order_value
FROM
    sales_task6
GROUP BY
    YEAR_ID, MONTH_ID
ORDER BY
    year, month;

---

## 📈 Insights

- Highest revenue months: December 2004, November 2004, October 2004.
- Significant seasonal spike in Q4.

---
