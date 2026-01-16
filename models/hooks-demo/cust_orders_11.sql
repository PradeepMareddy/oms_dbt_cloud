SELECT
    orderid,
    customerid,
    revenue,
    CASE WHEN revenue > 1000 THEN 'High' ELSE 'Normal' END AS order_category
FROM {{ref('orders_fact')}}