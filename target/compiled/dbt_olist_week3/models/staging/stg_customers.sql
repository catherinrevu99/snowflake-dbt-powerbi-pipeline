with src as (
  select * from RAW.PUBLIC.olist_customers_dataset
)
select
  customer_id,
  customer_unique_id,
  customer_zip_code_prefix,
  customer_city,
  customer_state
from src