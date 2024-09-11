{{config(materialized='table')}}

with tb1 as
(
    select 
    o.order_key,
    o.order_status,
    order_total,
    n.customer_nation,
    c.customer_key,
    c.customer_name,
    l.order_total_quatity,
    l.order_unique_items

    from {{ref(('stg_orders'))}} as o  
    inner join {{ref(('order_lineitem'))}} as l
    on l.order_key=o.order_key
    inner join {{ref(("stg_customer"))}} as c  
    on c.customer_key=o.order_key
    inner join {{ref(("stg_nation"))}} as n 
    on c.nation_key=n.NATIONKEY
)

select * from tb1