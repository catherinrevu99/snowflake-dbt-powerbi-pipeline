{{ config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key=['order_id','order_item_id']
) }}

with orders as (
  select * from {{ ref('stg_orders') }}
),
items as (
  select * from {{ ref('stg_order_items') }}
)

select
  i.order_id,
  i.order_item_id,
  o.customer_id,
  i.product_id,
  i.seller_id,
  o.order_purchase_ts::date as order_date,
  i.price,
  i.freight_value,
  (i.price + i.freight_value) as revenue
from items i
join orders o using (order_id)
{% if is_incremental() %}
where o.order_purchase_ts::date > (select coalesce(max(order_date),'1900-01-01') from {{ this }})
{% endif %}
