

with TRANSACTIONLINE as (
    select * from {{source('netsuite_tables_v2','TRANSACTIONLINE') }}
)
select * from TRANSACTIONLINE
