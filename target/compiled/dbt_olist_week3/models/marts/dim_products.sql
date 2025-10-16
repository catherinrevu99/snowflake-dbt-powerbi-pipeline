-- models/marts/dim_products.sql

with src as (
    select
        product_id,
        product_category_name,
        lower(regexp_replace(trim(product_category_name), '\\s+', ' ')) as normalized_category,
        product_name_length,
        product_description_length,
        product_photos_qty,
        product_weight_g,
        product_length_cm,
        product_height_cm,
        product_width_cm
    from ANALYTICS_DEV.STG.stg_products
),

xlate as (
    select
        product_category_name,
        product_category_name_english,
        lower(regexp_replace(trim(product_category_name), '\\s+', ' ')) as normalized_category
    from ANALYTICS_DEV.STG.stg_category_xlate
)

select
    p.product_id,
    p.product_category_name,
    coalesce(
        x.product_category_name_english,
        p.product_category_name,
        'unknown'
    ) as product_category,
    p.product_name_length,
    p.product_description_length,
    p.product_photos_qty,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm

from src p
left join xlate x
    on p.normalized_category = x.normalized_category