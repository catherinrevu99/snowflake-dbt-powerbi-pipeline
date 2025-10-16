with src as (
  select * from RAW.PUBLIC.olist_order_reviews_dataset
)

select
  review_id,
  order_id,
  review_score,
  review_creation_date as review_creation_ts,
  review_answer_timestamp as review_answer_ts
from src