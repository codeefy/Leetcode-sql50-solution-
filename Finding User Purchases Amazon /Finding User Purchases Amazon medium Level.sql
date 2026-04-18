WITH first_purchase AS (
    SELECT 
        user_id,
        MIN(DATE(created_at)) AS first_date
    FROM amazon_transactions
    GROUP BY user_id
),

second_purchase AS (
    SELECT 
        f.user_id,
        f.first_date,
        MIN(DATE(t.created_at)) AS second_date
    FROM first_purchase f
    JOIN amazon_transactions t
        ON f.user_id = t.user_id
       AND DATE(t.created_at) > f.first_date
    GROUP BY f.user_id, f.first_date
)

SELECT user_id
FROM second_purchase
WHERE DATEDIFF(second_date, first_date) BETWEEN 1 AND 7;
