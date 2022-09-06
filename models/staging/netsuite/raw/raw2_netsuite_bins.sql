with bin as (
    select * from {{source('netsuite_tables_v2','BIN') }}
)
select * from bin
