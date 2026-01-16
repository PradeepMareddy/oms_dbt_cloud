SELECT
    OS.StoreID,
    SUM(OFACT.Revenue) AS TotalRevenue
FROM
    {{ ref('orders_stg') }} OS
JOIN
    {{ ref('orders_fact') }} OFACT ON OS.ORDERID = OFACT.ORDERID
GROUP BY 1