
with ACCOUNTINGPERIOD as (
    select * from {{source('netsuite_tables_v2','ACCOUNTINGPERIOD') }}
)
select * from ACCOUNTINGPERIOD
