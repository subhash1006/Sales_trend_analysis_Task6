create database sales_analysis;
use sales_analysis;
CREATE TABLE orders (
    order_id TEXT,
    amount INTEGER,
    profit INTEGER,
    quantity INTEGER,
    category TEXT,
    sub_category TEXT,
    payment_mode TEXT,
    order_date DATE,
    year INTEGER,
    month INTEGER
);
-- MONTHLY REVENUE AND ORDER VOLUME
SELECT
  year, month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY year, month
ORDER BY year, month;

-- REVENUE BY CATEGORY PER MONTH
SELECT
  category,year,month,
  SUM(amount) AS revenue,
  COUNT(DISTINCT order_id) AS order_count
FROM orders
GROUP BY category, year, month
ORDER BY year, month, category;

-- MONTHLY PROFIT TREND
SELECT
  year,month,
  SUM(profit) AS total_profit
FROM orders
GROUP BY year, month
ORDER BY year, month;

-- TOP 5 MONTHS BY REVENUE
SELECT
  year,month,
  SUM(amount) AS total_revenue
FROM orders
GROUP BY year, month
ORDER BY total_revenue DESC
LIMIT 5;

-- MOST USED PAYMENT MODES
SELECT
  payment_mode,
  COUNT(*) AS order_count
FROM orders
GROUP BY payment_mode
ORDER BY order_count DESC;

-- SPECIFIC DATE RANGE FILTERING
SELECT *
FROM orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31';