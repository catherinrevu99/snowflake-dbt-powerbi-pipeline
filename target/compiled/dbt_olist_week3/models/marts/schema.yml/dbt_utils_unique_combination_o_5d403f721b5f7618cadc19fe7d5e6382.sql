





with validation_errors as (

    select
        order_id, order_item_id
    from ANALYTICS_DEV.STG_MART.fact_orders
    group by order_id, order_item_id
    having count(*) > 1

)

select *
from validation_errors


