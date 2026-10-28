SELECT
    customer_id,
    customer_name AS full_name,
    LOWER(TRIM(email)) AS email,        -- clean up casing and stray whitespace
    CAST(signup_date AS DATE) AS signup_date   -- seed loads this as text, we want a real date
                                                -- password_hash intentionally excluded
FROM {{ ref('customers') }}
