SELECT
    year_id,
    month_id,
    SUM(sales) AS total_revenue,
    COUNT(DISTINCT ordernumber) AS total_orders
FROM online_sales
GROUP BY year_id, month_id
ORDER BY year_id, month_id;

SELECT
    month_id,
    SUM(sales) AS total_revenue,
    COUNT(DISTINCT ordernumber) AS total_orders
FROM online_sales
WHERE year_id = 2004
GROUP BY month_id
ORDER BY month_id;

SELECT
    year_id,
    month_id,
    SUM(sales) AS total_revenue
FROM online_sales
GROUP BY year_id, month_id
ORDER BY total_revenue DESC
LIMIT 3;

SELECT
    year_id,
    month_id,
    SUM(COALESCE(sales, 0)) AS total_revenue,
    COUNT(DISTINCT ordernumber) AS total_orders
FROM online_sales
GROUP BY year_id, month_id
ORDER BY year_id, month_id;


SELECT
    productline,
    year_id,
    month_id,
    SUM(sales) AS total_revenue
FROM online_sales
GROUP BY productline, year_id, month_id
ORDER BY year_id, month_id, productline;


SELECT
    year_id,
    month_id,
    SUM(sales) / COUNT(DISTINCT ordernumber) AS avg_order_value
FROM online_sales
GROUP BY year_id, month_id
ORDER BY year_id, month_id;


SELECT
    year_id,
    month_id,
    SUM(sales) AS total_revenue,
    COUNT(DISTINCT ordernumber) AS total_orders
FROM online_sales
WHERE orderdate BETWEEN '2003-01-01' AND '2003-06-30'
GROUP BY year_id, month_id
ORDER BY year_id, month_id;


