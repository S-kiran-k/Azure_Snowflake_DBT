-- {%set incremental_flag = 1 %}
-- {% set incremental_col = 'CREATED_AT' %}
{{
    config(
        materialized='incremental'
    )
}}
SELECT * FROM {{source('staging','bookings')}}
{% if is_incremental() %}
    WHERE CREATED_AT > (SELECT COALESCE(MAX({{incremental_col}}), '1900-01-01' ) FROM {{this}})
{% endif %}