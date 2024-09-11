{{config(materialized='table')}}

with tb1 AS (
    SELECT N_NATIONKEY AS NATIONKEY,
    N_NAME AS customer_nation,
    N_REGIONKEY AS N_REGIONKEY
    FROM {{source('datafeed_shared_schema_dev','RAW_NATION')}}
)
select * from tb1