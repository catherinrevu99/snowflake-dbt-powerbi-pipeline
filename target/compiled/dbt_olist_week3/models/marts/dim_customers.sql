with s as (
  select *
  from ANALYTICS_DEV.SNAPSHOTS.customers_snapshot
  where dbt_valid_to is null            -- current version only
)
select
  customer_id,
  customer_unique_id,
  customer_zip_code_prefix,
  customer_city,
  customer_state
from s