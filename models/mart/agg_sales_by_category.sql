SELECT
    products.CATEGORY,
    count(distinct sales.order_id)  as total_orders,        -- total orders by category
    sum(sales.quantity)             as total_units_sold,    -- total units sold by category
    sum(sales.revenue)              as total_revenue        -- total revenue by category

FROM {{ ref('fct_sales') }} AS sales


INNER JOIN {{ ref('dim_product') }} AS products
    ON sales.product_sk = products.product_sk

group by products.CATEGORY
having sum(sales.quantity) > 0