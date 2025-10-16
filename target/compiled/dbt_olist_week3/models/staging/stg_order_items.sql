with src as (
  select * from RAW.PUBLIC.olist_order_items_dataset
)
select
  order_id,
  order_item_id,
  product_id,
  seller_id,
  shipping_limit_date::timestamp_ntz as shipping_limit_ts,
  price::float as price,
  freight_value::float as freight_value
from src