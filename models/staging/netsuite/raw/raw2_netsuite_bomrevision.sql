with BOMREVISION as (
    select * from {{source('netsuite_tables_v2','BOMREVISION') }}
)
select * from BOMREVISION