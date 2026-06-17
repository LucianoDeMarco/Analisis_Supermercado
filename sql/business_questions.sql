-- =========================================
-- 1. Ventas por categoría
-- =========================================

SELECT p.category
       ROUND(SUM(od.sales),2) AS total_sales
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC

-- =========================================
-- 2. Ventas por categoría
-- =========================================