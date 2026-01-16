SELECT
    OS.STOREID,
    SUM(OFACT.REVENUE) AS ActualSales,
    SUM(ST.SALESTARGET) AS TargetSales
FROM
    {{ ref('orders_stg') }} OS
JOIN
    {{ ref('orders_fact') }} OFACT ON OS.ORDERID = OFACT.ORDERID
JOIN
    {{ ref('salestarget') }} ST ON ST.STOREID = OS.STOREID
GROUP BY 1