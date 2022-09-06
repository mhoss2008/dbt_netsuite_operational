with BOMREVISIONCOMPONENT as (
    select * from {{source('netsuite_tables_v2','BOMREVISIONCOMPONENT') }}
)
select * from BOMREVISIONCOMPONENT