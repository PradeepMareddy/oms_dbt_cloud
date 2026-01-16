{{ config(
    materialized="incremental",
    unique_key="OrderID",
    incremental_strategy="merge"
) }}

SELECT 
OrderID,
OrderDate,
CustomerID,
EmployeeID,
StoreID,
Status as StatusCD,
CASE WHEN Status = '01' THEN 'In Progress'
     WHEN Status = '02' THEN 'Completed'
     WHEN Status = '03' THEN 'Cancelled'
     ELSE 'NULL'
END AS StatusDesc,
Updated_at,
current_timestamp() AS dbt_updated_at
FROM L1_LANDING.ORDERS

{% if is_incremental() %}
    WHERE Updated_at > (SELECT MAX(Updated_at) FROM {{ this }})
{% endif %}