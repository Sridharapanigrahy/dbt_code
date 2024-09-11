{{ config(
     materialized="table",
     pre_hook="TRUNCATE TABLE {{ this }}",
     post_hook="TRUNCATE TABLE {{ref('suppliers_data')}}"
) }}

WITH tb1 as(
     select 
     *
     from {{ref("suppliers_data")}})
select * from tb1
