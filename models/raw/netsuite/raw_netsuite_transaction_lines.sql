with TRANSACTIONLINE as (
   /* {#
   select * from {{source('netsuite_tables','TRANSACTIONLINE') }}
   #} */
    select * from {{ref('demo_seed_netsuite_transaction_lines') }}
    
)
select * from TRANSACTIONLINE
