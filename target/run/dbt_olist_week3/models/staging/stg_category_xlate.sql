
  create or replace   view ANALYTICS_DEV.STG.stg_category_xlate
  
  
  
  
  as (
    with src as (
  select * from RAW.PUBLIC.product_category_name_translation
)

select
  C1 as product_category_name,
  C2 as product_category_name_english
from src
  );

