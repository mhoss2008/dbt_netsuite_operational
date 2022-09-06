
with BUDGET as (
 
    select * from {{ref('stg2_netsuite_budget') }}
) 
 
select * from BUDGET
