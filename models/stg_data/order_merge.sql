{{ config(
materialized="incremental",
unique_key ="id || '-' ||USER_ID",
incremental_strategy= "merge"
) }}
select * from {{source('datafeed_shared_schema','STG_ORDERS')}} 