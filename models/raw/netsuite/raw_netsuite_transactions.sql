with TRANSACTION as (
   /* {#
   select * from {{source('netsuite_tables','TRANSACTION') }}
   #} */
    select * from {{ref('demo_seed_netsuite_transactions') }}
    
)
select * from TRANSACTION
