

with ENTITY as (
    select * from {{source('netsuite_tables_v2','ENTITY') }}
)
select * from ENTITY
