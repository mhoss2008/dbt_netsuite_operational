with ITEM as (
    select * from {{source('netsuite_tables_v2','ITEM') }}
)
select * from ITEM
