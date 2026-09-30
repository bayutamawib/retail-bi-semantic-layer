CREATE OR REPLACE VIEW
`retail-bi-portfolio-510117.retail_bi.vw_monthly_sales` AS

SELECT
    order_month,

    COUNT(DISTINCT order_id) AS orders,

    COUNT(DISTINCT user_id) AS active_customers,

    COUNT(order_item_id) AS units_sold,

    SUM(sale_price) AS revenue,

    SUM(gross_profit) AS gross_profit,

    SAFE_DIVIDE(
        SUM(gross_profit),
        SUM(sale_price)
    ) AS gross_margin_pct,

    SAFE_DIVIDE(
        SUM(sale_price),
        COUNT(DISTINCT order_id)
    ) AS average_order_value

FROM
    `YOUR_PROJECT_ID.retail_bi.vw_fact_sales`

GROUP BY
    order_month
ORDER BY
    order_month;