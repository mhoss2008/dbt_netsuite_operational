with Location as (
    select * from {{source('netsuite_tables_v2','LOCATION') }}
)
select * from Location
