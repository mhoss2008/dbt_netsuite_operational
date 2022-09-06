

with VENDOR as (
    select * from {{source('netsuite_tables_v2','VENDOR') }}
)
select * from VENDOR
