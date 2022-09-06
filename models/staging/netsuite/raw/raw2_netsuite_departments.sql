
with DEPARTMENT as (
    select * from {{source('netsuite_tables_v2','DEPARTMENT') }}
)
select * from DEPARTMENT
