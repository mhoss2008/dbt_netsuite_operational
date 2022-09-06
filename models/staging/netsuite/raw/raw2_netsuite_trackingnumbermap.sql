

with TRACKINGNUMBERMAP as (
    select * from {{source('netsuite_tables_v2','TRACKINGNUMBERMAP') }}
)
select * from TRACKINGNUMBERMAP
