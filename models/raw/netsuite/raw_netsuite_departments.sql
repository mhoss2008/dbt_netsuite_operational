
with DEPARTMENT as (
   /* {#
   select * from {{source('netsuite_tables','DEPARTMENT') }}
   #} */
    select * from {{ref('demo_seed_netsuite_departments') }}
    

)
select * from DEPARTMENT
