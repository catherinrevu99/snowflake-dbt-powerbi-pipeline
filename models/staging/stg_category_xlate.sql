with src as (
  select * from {{ source('raw','product_category_name_translation') }}
)

select
  C1 as product_category_name,
  C2 as product_category_name_english
from src