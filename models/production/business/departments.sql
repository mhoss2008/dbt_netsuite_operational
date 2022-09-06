

with DEPARTMENTS as (
    select * from {{ref('stg2_netsuite_departments') }}
) 
 
select * from DEPARTMENTS