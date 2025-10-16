{% snapshot customers_snapshot %}
{{
  config(
    target_schema='SNAPSHOTS',
    unique_key='customer_id',
    strategy='check',
    check_cols=['customer_zip_code_prefix','customer_city','customer_state'],
    invalidate_hard_deletes=True
  )
}}
select * from {{ ref('stg_customers') }}
{% endsnapshot %}
