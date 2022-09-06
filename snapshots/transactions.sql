{% snapshot transactions_snapshot %}

{{
    config(
      target_database='PC_DBT_DB',
      target_schema='snapshots',
      unique_key='transaction_id',

      strategy='timestamp',
      updated_at='DATE_LAST_MODIFIED',
    )
}}

select
    *
from {{ source('netsuite_tables', 'TRANSACTIONS') }}


{% endsnapshot %}