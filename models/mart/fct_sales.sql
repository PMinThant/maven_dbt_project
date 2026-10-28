SELECT
    md5('order_items.order_item_id') AS sale_sk, -- create surrogate key
    order_items.order_item_id,
    order_items.order_id,
    dim_customer.customer_sk,
    dim_product.product_sk,
    orders.order_date,
    date_part('year', orders.order_date) AS order_year, -- extract year out for year-over-year reporting
    order_items.quantity,
    order_items.quantity * dim_product.unit_price AS revenue -- calculate revenue using data from two tables

FROM {{ ref('stg_order_items') }} AS order_items

INNER JOIN {{ ref('stg_orders') }} AS orders
    ON order_items.order_id = orders.order_id
INNER JOIN {{ ref('dim_customer') }} AS dim_customer
    ON orders.customer_id = dim_customer.customer_id
INNER JOIN {{ ref('dim_product') }} AS dim_product
    ON order_items.product_id = dim_product.product_id