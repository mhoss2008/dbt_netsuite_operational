
with EMPLOYEE as (
    select * from {{source('netsuite_tables_v2','EMPLOYEE') }}
)
select * from EMPLOYEE
