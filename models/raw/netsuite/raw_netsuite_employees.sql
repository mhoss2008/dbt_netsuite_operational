with EMPLOYEE as (
   /* {#
   select * from {{source('netsuite_tables','EMPLOYEE') }}
   #} */
    select * from {{ref('demo_seed_netsuite_employees') }}
    
)
select * from EMPLOYEE
