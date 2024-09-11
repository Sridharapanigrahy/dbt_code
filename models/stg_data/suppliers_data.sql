{{ config(materialized='table') }}

WITH tb1 as(
     select 
      *
       from {{source('datafeed_shared_schema','stg_suppliers_data')}})
select * from tb1
