{{ config(
    materialized='table') 
    }}

WITH tb1 as(
select
   *
    from {{ref("snap_orders_checks")}} )
    select 
     id,
    order_date,
    user_id,
    status
     from tb1 where DBT_VALID_TO IS NOT NULL