with TRANLINK as (
select nextdoc,previousdoc from {{ref('raw_netsuite_nexttransactionlink') }}
    where _FIVETRAN_DELETED = 'FALSE'
),
LASTTRAN as (
    select * from {{ref('raw_netsuite_nexttransactionlink') }}
        where _FIVETRAN_DELETED = 'FALSE'
),
renamed as (

select 
tranlink.nextdoc as nsid,
LISTAGG(distinct(LASTTRAN.tranid),',') as all_last_tranid,
any_value(LASTTRAN.tranid) as single_last_tranid,
count(LASTTRAN.id) as count_last_tran,
concat('https://6200024.app.netsuite.com/app/accounting/transactions/vendbill.nl?id=',nsid) as nsid_link,
concat('https://6200024.app.netsuite.com/app/accounting/transactions/vendbill.nl?id=',single_last_tranid) as previous_link
from TRANLINK
left join LASTTRAN on TRANLINK.previousdoc = LASTTRAN.id
group by nsid
)

select * from renamed

