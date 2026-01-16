select orderid
from {{ ref('orders_fact') }}
where REVENUE < 0