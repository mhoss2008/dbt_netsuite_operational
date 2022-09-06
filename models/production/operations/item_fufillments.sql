with TRANSACTION as (
 
    select * from {{ref('stg2_netsuite_transactions') }}
    where transaction_type = 'ItemShip'
) ,
TRACKING as (
 
    select 

        transaction,
        listagg(trackingnumber, ', ') as trackingnumbers

     from {{ref('stg2_netsuite_tracking_numbers') }}
     group by 
        transaction
), 

renamed as (
    select
TRANSACTION.transaction_id,
TRANSACTION.tranid as po_number,
TRANSACTION.status_id,
TRANSACTION.status as status,
TRANSACTION.entity_name as vendor_name,
TRANSACTION.entity_email as vendor_email,
TRANSACTION.CREATEDDATE as date_created, 
TRANSACTION.LASTMODIFIEDDATE as date_lastmodified,
TRANSACTION.memo,
TRANSACTION.number,
TRANSACTION.transaction_date,
TRANSACTION.transactionnumber,
TRANSACTION.typebaseddocumentnumber,
TRANSACTION.trandisplayname,
TRANSACTION.trandate_month as date_tran_month,
TRANSACTION.trandate_year_month as date_tran_year_month,
TRACKING.trackingnumbers
from TRANSACTION
left join TRACKING on TRACKING.transaction = TRANSACTION.transaction_id

)
 
select * from renamed

