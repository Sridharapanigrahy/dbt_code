{{config(materialized='table')}}

select o.order_key,

count(1) as order_unique_items,
{{calculate_sum('line_quantity')}} as order_total_quatity

from {{ref('stg_orders')}} as o
inner join {{ref('stg_lineitem')}} as l

on l.order_key=o.order_key

group by o.order_key