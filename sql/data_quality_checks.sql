-- 1. Duplicate order item IDs
SELECT
    order_item_id,
    COUNT(*) AS row_count
FROM `YOUR_PROJECT_ID.retail_bi.vw_fact_sales`
GROUP BY order_item_id
HAVING COUNT(*) > 1;

-- 2. Missing product
SELECT
    COUNT(*) AS missing_product
FROM `YOUR_PROJECT_ID.retail_bi.vw_fact_sales`
WHERE product_id IS NULL;

-- 3. Missing country
SELECT
    COUNT(*) AS missing_country
FROM `YOUR_PROJECT_ID.retail_bi.vw_fact_sales`
WHERE country IS NULL;

-- 4. Negative gross profit
SELECT
    COUNT(*) AS negative_margin_rows
FROM `YOUR_PROJECT_ID.retail_bi.vw_fact_sales`
WHERE gross_profit < 0;