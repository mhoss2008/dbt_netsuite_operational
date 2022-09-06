with BUDGETSMACHINE as (
    select * from {{source('netsuite_tables_v2','BUDGETSMACHINE') }}
)
select * from BUDGETSMACHINE