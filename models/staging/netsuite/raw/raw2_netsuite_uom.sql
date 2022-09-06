

with UNITSTYPEUOM as (
    select * from {{source('netsuite_tables_v2','UNITSTYPEUOM') }}
)
select * from UNITSTYPEUOM

