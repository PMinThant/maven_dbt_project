SELECT
    order_id,
    customer_id,
    CAST(order_date AS DATE) AS order_date      -- seed loads this as text, we want a real date

FROM {{ ref('orders') }}

WHERE order_date IS NOT NULL                    -- drop orders with no date