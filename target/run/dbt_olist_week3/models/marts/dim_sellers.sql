
  create or replace   view ANALYTICS_DEV.STG_MART.dim_sellers
  
  
  
  
  as (
    select
  seller_id,
  seller_zip_code_prefix,
  seller_city,
  seller_state
from ANALYTICS_DEV.STG.stg_sellers
  );

