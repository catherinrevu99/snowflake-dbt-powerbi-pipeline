with src as (
  select * from {{ source('raw','olist_sellers_dataset') }}
)
select
  seller_id,
  seller_zip_code_prefix,
  seller_city,
  seller_state
from src
