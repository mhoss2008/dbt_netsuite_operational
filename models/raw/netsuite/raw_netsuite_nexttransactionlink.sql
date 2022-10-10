with NEXTTRANSACTIONLINK as (
   /* {#
   select * from {{source('netsuite_tables','NEXTTRANSACTIONLINK') }}
   #} */
    select * from {{ref('demo_seed_netsuite_nexttransactionlink') }}
    
)
select * from NEXTTRANSACTIONLINK
