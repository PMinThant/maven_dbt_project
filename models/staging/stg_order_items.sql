SELECT
    order_item_id,
    order_id,
    product_id,
    quantity
FROM {{ ref('order_items') }}
WHERE quantity > 0              -- a negative or zero quantity is a data error, not a