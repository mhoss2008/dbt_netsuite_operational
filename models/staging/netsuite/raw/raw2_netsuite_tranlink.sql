with TRANLINK as (
    select * from {{source('netsuite_tables_v2','NEXTTRANSACTIONLINK') }}
)
select * from TRANLINK
