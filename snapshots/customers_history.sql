{% snapshot customers_history %}

{{
    config(
      target_schema='l3_consumption',
      unique_key='CustomerID',
      strategy='timestamp',
      updated_at='Updated_at',
    )
}}


SELECT * FROM {{ source('landing', 'customers') }}

{% endsnapshot %}