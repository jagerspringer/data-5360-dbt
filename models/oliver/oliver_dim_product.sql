{{ config(
    materialized='table', 
    schema='dw_oliver') 
}}

select
  product_id as product_key,
  product_id,
  product_name,
  description
from {{ source('oliver_landing','product') }}