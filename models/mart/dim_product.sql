SELECT

    md5('product_id') AS product_sk, -- create surrogate key
    product_id,
    product_name,
    category,
    unit_price
FROM {{ ref('stg_products') }}