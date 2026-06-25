{{  
    config(
        materialized='incremental',
        unique_key='LISTING_ID',
        on_schema_change='sync_all_columns'
    )
}}

SELECT
LISTING_ID,
HOST_ID,
PROPERTY_TYPE,
COUNTRY,
ACCOMMODATES,
BEDROOMS,
BATHROOMS,
PRICE_PER_NIGHT,
{{tag('PRICE_PER_NIGHT')}} AS PRICE_PER_NIGHT_TAG,
CREATED_AT

FROM {{ref("bronze_listings")}}

