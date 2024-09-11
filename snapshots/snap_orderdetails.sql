{%snapshot snap_orderdetails%}

{{config(
    strategy='check',
    unique_key='order_key',
    check_cols=['order_status','order_date','order_total','order_total_quatity','order_unique_items','customer_name','customer_nation',
    'customer_key'],
)}}

select * from {{ref(('dim_orders'))}}
{%endsnapshot%}