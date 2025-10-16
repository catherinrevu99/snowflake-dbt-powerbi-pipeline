
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select revenue
from ANALYTICS_DEV.STG_MART.fact_orders
where revenue is null



  
  
      
    ) dbt_internal_test