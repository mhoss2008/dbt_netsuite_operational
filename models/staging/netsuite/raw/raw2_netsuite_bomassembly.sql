with BOMASSEMBLY as (
    select * from {{source('netsuite_tables_v2','BOMASSEMBLY') }}
)
select * from BOMASSEMBLY
