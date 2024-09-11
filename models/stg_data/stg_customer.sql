{{config(materialized='table')}}

with tb1 as (
    select 
    C_CUSTKEY as customer_key,
    C_NAME as customer_name,
    C_NATIONKEY as nation_key

    from {{source('datafeed_shared_schema_dev','RAW_CUSTOMER')}}
)
SELECT * FROM tb1