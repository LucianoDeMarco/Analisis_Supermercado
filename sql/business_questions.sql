-- =========================================
-- 1. Ventas por categoría
-- =========================================

SELECT p.category,
       ROUND(SUM(od.sales),2) AS total_sales
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

-- =========================================
-- 2. Top 10 clientes por ventas
-- =========================================

SELECT
    c.customer_name,
    ROUND(SUM(od.sales),2) AS total_sales
FROM order_details od
JOIN customers c
    ON od.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- =========================================
-- 3. Profit por mercado
-- =========================================

SELECT
    l.market,
    ROUND(SUM(od.profit),2) AS total_profit
FROM order_details od
JOIN locations l
    ON od.location_id = l.location_id
GROUP BY l.market
ORDER BY total_profit DESC;

-- =========================================
-- 4. Top 10 Productos por ventas
-- =========================================
SELECT
    p.product_name,
    ROUND(SUM(od.sales),2) AS total_sales
FROM order_details od
JOIN products p
    ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC
LIMIT 10;

-- =========================================
-- 5. Ventas por pais
-- =========================================

SELECT
    l.country,
    ROUND(SUM(od.sales),2) AS total_sales
FROM order_details od
JOIN locations l
    ON od.location_id = l.location_id
GROUP BY l.country
ORDER BY total_sales DESC
LIMIT 10;

-- =========================================
-- 6. Ventas por segmento de cliente
-- =========================================

SELECT
    c.segment,
    ROUND(SUM(od.sales),2) AS total_sales
FROM order_details od
JOIN customers c
    ON od.customer_id = c.customer_id
GROUP BY c.segment
ORDER BY total_sales DESC;

-- =========================================
-- 7. Profit por categoria
-- =========================================

SELECT
    p.category,
    ROUND(SUM(od.profit),2) AS total_profit
FROM order_details od
JOIN products p
    ON od.product_id = p.product_id
GROUP BY p.category
ORDER BY total_profit DESC;

-- =========================================
-- 8. Descuento promedio por categoria
-- =========================================

SELECT
    p.category,
    ROUND(AVG(od.discount),4) AS avg_discount
FROM order_details od
JOIN products p
    ON od.product_id = p.product_id
GROUP BY p.category
ORDER BY avg_discount DESC;

-- =========================================
-- 9. Productos mas rentables
-- =========================================

SELECT
    p.product_name,
    ROUND(SUM(od.profit),2) AS total_profit
FROM order_details od
JOIN products p
    ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_profit DESC
LIMIT 10;

-- =========================================
-- 10. Ventas por Año
-- =========================================

SELECT
    strftime('%Y', o.order_date) AS year,
    ROUND(SUM(od.sales),2) AS total_sales
FROM order_details od
JOIN orders o
    ON od.order_id = o.order_id
GROUP BY year
ORDER BY year;