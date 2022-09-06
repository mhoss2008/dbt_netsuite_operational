

with TRACKINGNUMBER as (
    select * from {{source('netsuite_tables_v2','TRACKINGNUMBER') }}
)
select * from TRACKINGNUMBER
