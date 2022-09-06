

with TRANSACTION as (
    select * from {{source('netsuite_tables_v2','TRANSACTION') }}
)
select * from TRANSACTION
