{{ config(
  materialized = 'table',
  schema = 'dw_oliver'
) }}

select
  employee_id,
  parse_json(certification_json):certification_name::string        as certification_name,
  parse_json(certification_json):certification_cost::number(10,2)  as certification_cost,
  parse_json(certification_json):certification_awarded_date::date   as certification_awarded_date
from {{ source('oliver_landing', 'employee_certifications') }}
