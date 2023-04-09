{% snapshot subscriptions_snapshot %}

    {{
        config(
          target_schema='snapshots',
          strategy='check',
          unique_key='customer_id',
          check_cols=['customer_id', 'status'],
        )
    }}

    select * from {{ source('nutrisense', 'subscriptions') }}

{% endsnapshot %}