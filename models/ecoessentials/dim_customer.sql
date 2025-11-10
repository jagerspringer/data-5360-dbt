{{ config(
    materialized = 'table',
    schema = 'dw_group6'
    )
}}

SELECT
    customer_id AS customer_key,
    customer_id,
    first_name,
    last_name,
    phone,
    email,
    address,
    city,
    state,
    zip,
    country
FROM {{ source('group6_landing', 'customers') }}

