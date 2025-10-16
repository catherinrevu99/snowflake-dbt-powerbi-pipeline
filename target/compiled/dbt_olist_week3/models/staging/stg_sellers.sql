with src as (
  select * from RAW.PUBLIC.olist_sellers_dataset
)
select
  seller_id,
  seller_zip_code_prefix,
  seller_city,
  seller_state
from src