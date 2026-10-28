SELECT
    md5('customer_id') AS customer_sk, -- create surrogate key
    customer_id,
    full_name,
    email,
    signup_date,
    CASE
        WHEN signup_date >= dateadd('month', -6, current_date) THEN 'New'
        WHEN signup_date >= dateadd('year', -2, current_date) THEN 'Regular'
        ELSE 'Loyal'
    END AS customer_segment -- business logic for customer segments
FROM {{ ref('stg_customers') }}