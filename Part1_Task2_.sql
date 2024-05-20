USE data_scientist_project;

SELECT 
    purchase_id,
    student_id,
    plan_id,
    date_start,
    IF(date_refunded IS NULL,
        date_end,
        date_refunded) AS date_end
FROM
    (
        SELECT 
            purchase_id,
            student_id,
            plan_id,
            date_purchased AS date_start,
            CASE
                WHEN plan_id = 0 THEN DATE_ADD(date_purchased, INTERVAL 1 MONTH)
                WHEN plan_id = 1 THEN DATE_ADD(date_purchased, INTERVAL 3 MONTH)
                WHEN plan_id = 2 THEN DATE_ADD(date_purchased, INTERVAL 12 MONTH)
                WHEN plan_id = 3 THEN CURDATE()
            END AS date_end,
            date_refunded
    FROM
        student_purchases
    ) a;
