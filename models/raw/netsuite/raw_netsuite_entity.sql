with ENTITY as (
   /* {#
   select * from {{source('netsuite_tables','ENTITY') }}
   #} */
    select * from {{ref('demo_seed_netsuite_entity') }}
    
)
select * from ENTITY


