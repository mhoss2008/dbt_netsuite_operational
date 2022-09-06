with BININVENTORYBALANCE as (
    select * from {{source('netsuite_tables_v2','BININVENTORYBALANCE') }}
)
select * from BININVENTORYBALANCE
