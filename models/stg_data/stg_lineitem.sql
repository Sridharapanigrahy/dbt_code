{{config(materialized='table')}}

with tb1 as(
    select 
    concat(L_ORDERKEY,'---',L_LINENUMBER) as line_key,
    L_ORDERKEY as order_key,
    L_QUANTITY as line_quantity,
    from {{source('datafeed_shared_schema_dev','RAW_LINEITEM')}}
)

select * from tb1