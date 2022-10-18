with TRANLINK as (
    select nextdoc,previousdoc from {{ref('raw_netsuite_nexttransactionlink') }}
    where _FIVETRAN_DELETED = 'FALSE'
),
NEXTTRAN as (
    select * from {{ref('raw_netsuite_transactions') }}
    -- where _FIVETRAN_DELETED = 'FALSE'
),
renamed as (

select 
tranlink.previousdoc as nsid,
LISTAGG(distinct(NEXTTRAN.tranid),',') as all_next_tranid,
any_value(NEXTTRAN.tranid) as single_next_tranid,
count(NEXTTRAN.id) as count_next_tran,
concat('https://6200024.app.netsuite.com/app/accounting/transactions/vendbill.nl?id=',nsid) as nsid_link,
concat('https://6200024.app.netsuite.com/app/accounting/transactions/vendbill.nl?id=',single_next_tranid) as next_link
from TRANLINK
left join NEXTTRAN on TRANLINK.nextdoc = NEXTTRAN.id
group by nsid
)

select * from renamed

