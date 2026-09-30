CREATE OR REPLACE VIEW
`retail-bi-portfolio-510117.retail_bi.vw_country_performance` AS

SELECT
    country,

    COUNT(DISTINCT order_id) AS orders,

    COUNT(DISTINCT user_id) AS active_customers,

    COUNT(order_item_id) AS units_sold,

    SUM(sale_price) AS revenue,

    SUM(gross_profit) AS gross_profit,

    SAFE_DIVIDE(
        SUM(gross_profit),
        SUM(sale_price)
    ) AS gross_margin_pct

FROM
    `YOUR_PROJECT_ID.retail_bi.vw_fact_sales`

GROUP BY
    country;