{% snapshot transaction_lines_snapshot %}

{{
    config(
      target_database='PC_DBT_DB',
      target_schema='snapshots',
      unique_key='id',

      strategy='timestamp',
      updated_at='DATE_LAST_MODIFIED_GMT',
    )
}}


select
    transaction_id || '-' || transaction_line_id as id,
    *
from {{ source('netsuite_tables', 'TRANSACTION_LINES') }}


{% endsnapshot %}