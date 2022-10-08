with ITEM as (
   /* {#
   select * from {{source('netsuite_tables','ITEM') }}
   #} */
    select * from {{ref('demo_seed_netsuite_items') }}
    
)
select * from ITEM
