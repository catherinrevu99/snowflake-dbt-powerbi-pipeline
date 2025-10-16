with src as (
  select * from {{ source('raw','olist_orders_dataset') }}
)

select
  order_id,
  customer_id,
  order_status,
  order_purchase_timestamp as order_purchase_ts,
  order_approved_at as order_approved_ts,
  order_delivered_carrier_date as delivered_carrier_ts,
  order_delivered_customer_date as delivered_customer_ts,
  order_estimated_delivery_date as estimated_delivery_ts
from src