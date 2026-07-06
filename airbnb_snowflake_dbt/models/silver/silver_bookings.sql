{{  
    config(
    materialized='incremental',
    unique_key='BOOKING_ID',
    on_schema_change='append_new_columns'
    )
}}

SELECT 
    LISTING_ID,
    BOOKING_ID,
    BOOKING_DATE,
    {{multiply("NIGHTS_BOOKED","BOOKING_AMOUNT",2)}} + CLEANING_FEE + SERVICE_FEE AS TOTAL_AMOUNT,
    BOOKING_AMOUNT,
    BOOKING_STATUS,
    CREATED_AT
FROM 
    {{ref('bronze_bookings')}}
