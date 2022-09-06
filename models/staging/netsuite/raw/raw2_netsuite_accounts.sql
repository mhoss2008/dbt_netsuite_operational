
with ACCOUNT as (
    select * from {{source('netsuite_tables_v2','ACCOUNT') }}
)
select * from ACCOUNT
