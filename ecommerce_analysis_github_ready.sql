-- ============================================================
-- E-Commerce Sales & Customer Intelligence
-- SQL Analysis
-- Tools: PostgreSQL
-- ============================================================

SELECT
    COALESCE(ct.product_category_name_english, 'Unknown') AS category,
    COUNT(*) AS items_sold
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
LEFT JOIN category_translation ct
    ON p.product_category_name = ct.product_category_name
GROUP BY category
ORDER BY items_sold DESC
LIMIT 10;
SELECT
    COALESCE(ct.product_category_name_english, 'Unknown') AS category,
    ROUND(SUM(oi.price)::numeric, 2) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
LEFT JOIN category_translation ct
    ON p.product_category_name = ct.product_category_name
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 10;
SELECT
    COALESCE(ct.product_category_name_english, 'Unknown') AS category,
    ROUND(SUM(oi.price)::numeric / 100000, 2) AS revenue_lakhs
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
LEFT JOIN category_translation ct
    ON p.product_category_name = ct.product_category_name
GROUP BY category
ORDER BY revenue_lakhs DESC
LIMIT 10;
SELECT
    ROUND(SUM(oi.price)::numeric / COUNT(DISTINCT o.order_id), 2) AS average_order_value
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id;

SELECT
    p.payment_type,
    ROUND(SUM(p.payment_value)::numeric / 100000, 2) AS revenue_lakhs
FROM payments p
GROUP BY p.payment_type
ORDER BY revenue_lakhs DESC;
SELECT
    COUNT(*) AS repeat_customers
FROM (
    SELECT
        customer_unique_id
    FROM customers
    GROUP BY customer_unique_id
    HAVING COUNT(*) > 1
) AS repeat;


SELECT
    ROUND(
        100.0 * 2997 / COUNT(DISTINCT customer_unique_id),
        2
    ) AS repeat_customer_rate
FROM customers;

SELECT
    review_score,
    COUNT(*) AS review_count
FROM reviews
GROUP BY review_score
ORDER BY review_score;

SELECT
    ROUND(
        AVG(
            EXTRACT(EPOCH FROM (
                o.order_delivered_customer_date -
                o.order_purchase_timestamp
            )) / 86400
        )::numeric,
        2
    ) AS avg_delivery_days
FROM orders o
WHERE o.order_delivered_customer_date IS NOT NULL;

SELECT
    COUNT(*) AS late_orders
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
  AND order_delivered_customer_date > order_estimated_delivery_date;


SELECT
    ROUND(
        100.0 * 7827 /
        COUNT(*),
        2
    ) AS late_delivery_rate
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

SELECT
    CASE
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date
        THEN 'Late'
        ELSE 'On Time'
    END AS delivery_status,
    ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM orders o
JOIN reviews r
    ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY delivery_status
ORDER BY avg_review_score;

SELECT
    oi.seller_id,
    COUNT(*) AS items_sold,
    ROUND(SUM(oi.price)::numeric / 100000, 2) AS revenue_lakhs
FROM order_items oi
GROUP BY oi.seller_id
ORDER BY revenue_lakhs DESC
LIMIT 10;


SELECT
    c.customer_state,
    ROUND(SUM(oi.price)::numeric / 100000, 2) AS revenue_lakhs
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY revenue_lakhs DESC
LIMIT 10;

SELECT
    oi.product_id,
    COUNT(*) AS items_sold,
    ROUND(SUM(oi.price)::numeric / 100000, 2) AS revenue_lakhs
FROM order_items oi
GROUP BY oi.product_id
ORDER BY revenue_lakhs DESC
LIMIT 10;

CREATE OR REPLACE VIEW ecommerce_analysis AS
SELECT
    o.order_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,

    c.customer_unique_id,
    c.customer_city,
    c.customer_state,

    oi.product_id,
    oi.seller_id,
    oi.price,
    oi.freight_value,

    p.product_category_name,

    pay.payment_type,
    pay.payment_value,

    r.review_score

FROM orders o

LEFT JOIN customers c
    ON o.customer_id = c.customer_id

LEFT JOIN order_items oi
    ON o.order_id = oi.order_id

LEFT JOIN products p
    ON oi.product_id = p.product_id

LEFT JOIN payments pay
    ON o.order_id = pay.order_id

LEFT JOIN reviews r
    ON o.order_id = r.order_id;

SELECT *
FROM ecommerce_analysis
LIMIT 5;
