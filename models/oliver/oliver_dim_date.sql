{{ config(
    materialized='table', 
    schema='dw_oliver') 
}}

with cte_date as (
  {{ dbt_date.get_date_dimension("2015-01-01","2035-12-31") }}
)
select
  date_day        as date_key,
  date_day        as date_id,
  day_of_week     as dayofweek,
  month_of_year   as month,
  quarter_of_year as quarter,
  year_number     as year
from cte_date
