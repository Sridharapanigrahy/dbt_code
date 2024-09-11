{{ config(materialized='table') }}

WITH tb1 as(
    select 
    o_orderkey as order_key,	
    o_totalprice as order_total,
    case 
        when o_orderstatus = 'O' then 'Open'
        when o_orderstatus = 'F' then 'Filled'
        when o_orderstatus = 'P' then 'Processing'
        end as order_status

    from {{source('datafeed_shared_schema_dev','RAW_ORDER')}})
select * from tb1