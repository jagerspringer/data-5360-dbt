{{ config(
  materialized = 'table',
  schema = 'dw_oliver'
) }}

select
  d.date_key,
  e.employee_key,
  s.certification_name,
  s.certification_cost
from {{ ref('stg_employee_certifications') }} s
left join {{ ref('oliver_dim_employee') }} e
  on s.employee_id = e.employee_id
left join {{ ref('oliver_dim_date') }} d
  on s.certification_awarded_date = d.date_id   -- <-- was d.date_day
