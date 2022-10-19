

with TRANSACTIONLINE_PURREQ as (
    select
    *,
    transaction as transaction_temp
    from {{ref('demo_seed_netsuite_entity') }}
    limit 100
),

TRANSACTIONLINE_PO as (

    select 
    *,
    left(transaction,2) || '3' || right(transaction,4) as transaction_temp
    from {{ref('demo_seed_netsuite_entity') }}
    
),

TRANSACTIONLINE_PO as (

    select 
    *,
    left(transaction,2) || '3' || right(transaction,4) as transaction_temp
    from {{ref('demo_seed_netsuite_entity') }}
    
),

TRANSACTIONLINE_PO as (

    select 
    *,
    left(transaction,2) || '3' || right(transaction,4) as transaction_temp
    from {{ref('demo_seed_netsuite_entity') }}
    
)


select 
TRANSACTIONLINE_PURREQ.*,
left(Transaction)
PURREQ_PO_LINK.nextdoc

from TRANSACTIONLINE_PURREQ
left join PURREQ_PO_LINK on PURREQ_PO_LINK.PREVIOUSDOC = TRANSACTIONLINE_PURREQ.Transaction
left join 
