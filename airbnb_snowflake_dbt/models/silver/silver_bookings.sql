{{  
    config(
    materialized='incremental',
    unique_key='BOOKING_ID'
    )
}}

SELECT 
    LISTING_ID,
    BOOKING_ID,
    BOOKING_DATE,
    {{multiply("NIGHTS_BOOKED","BOOKING_AMOUNT",2)}} + CLEANING_FEE + SERVICE_FEE AS TOTAL_AMOUNT,
    BOOKING_AMOUNT,
    CREATED_AT
FROM 
    {{ref('bronze_bookings')}}
