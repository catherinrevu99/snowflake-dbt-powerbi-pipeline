

with orders as (
  select * from ANALYTICS_DEV.STG.stg_orders
),
items as (
  select * from ANALYTICS_DEV.STG.stg_order_items
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

where o.order_purchase_ts::date > (select coalesce(max(order_date),'1900-01-01') from ANALYTICS_DEV.STG_MART.fact_orders)
