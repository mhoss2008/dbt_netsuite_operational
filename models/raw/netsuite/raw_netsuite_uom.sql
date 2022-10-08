with UNITSTYPEUOM as (
   /* {#
   select * from {{source('netsuite_tables','UNITSTYPEUOM') }}
   #} */
    select * from {{ref('demo_seed_netsuite_unitstypeuom') }}
    
)
select * from UNITSTYPEUOM
