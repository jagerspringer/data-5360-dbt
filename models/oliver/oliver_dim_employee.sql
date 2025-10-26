{{ config(
    materialized='table', 
    schema='dw_oliver') 
}}

select
  employee_id as employee_key,
  employee_id,
  first_name   as firstname,
  last_name    as lastname,
  email,
  phone_number as phonenumber,
  hire_date,
  position
from {{ source('oliver_landing','employee') }}
