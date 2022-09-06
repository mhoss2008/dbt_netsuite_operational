with BUDGETCATEGORY as (
    select * from {{source('netsuite_tables_v2','BUDGETCATEGORY') }}
)
select * from BUDGETCATEGORY