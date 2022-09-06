with BUDGETS as (
    select * from {{source('netsuite_tables_v2','BUDGETS') }}
)
select * from BUDGETS