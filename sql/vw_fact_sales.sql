CREATE OR REPLACE VIEW
`retail-bi-portfolio-510117.retail_bi.vw_fact_sales` AS

SELECT
    oi.id AS order_item_id,
    oi.order_id,
    oi.user_id,
    oi.product_id,

    DATE(o.created_at) AS order_date,
    DATE_TRUNC(DATE(o.created_at), MONTH) AS order_month,

    o.status AS order_status,
    oi.status AS item_status,

    u.country,
    u.state,
    u.gender,
    u.traffic_source,

    p.category,
    p.department,
    p.brand,
    p.name AS product_name,

    p.cost AS unit_cost,
    oi.sale_price AS sale_price,

    oi.sale_price - p.cost AS gross_profit

FROM
    `bigquery-public-data.thelook_ecommerce.order_items` oi

INNER JOIN
    `bigquery-public-data.thelook_ecommerce.orders` o
    ON oi.order_id = o.order_id

LEFT JOIN
    `bigquery-public-data.thelook_ecommerce.users` u
    ON oi.user_id = u.id

LEFT JOIN
    `bigquery-public-data.thelook_ecommerce.products` p
    ON oi.product_id = p.id

WHERE
    o.status = 'Complete';