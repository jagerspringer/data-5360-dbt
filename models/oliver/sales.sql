{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

select
  c.firstname  as customer_first_name,
  c.lastname   as customer_last_name,
  d.date_id    as date_day,     -- was d.date_day (doesn't exist); use date_id
  s.store_name,
  p.product_name,
  e.firstname  as employee_first_name,
  e.lastname   as employee_last_name,
  f.quantity,
  f.dollars_sold,
  f.unit_price
from {{ ref('fact_sales') }} f

left join {{ ref('oliver_dim_customer') }}  c on f.cust_key     = c.cust_key
left join {{ ref('oliver_dim_employee') }}  e on f.employee_key = e.employee_key
left join {{ ref('oliver_dim_product') }}   p on f.product_key  = p.product_key
left join {{ ref('oliver_dim_store') }}     s on f.store_key    = s.store_key
left join {{ ref('oliver_dim_date') }}      d on f.date_key     = d.date_key